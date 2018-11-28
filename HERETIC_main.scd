//to do:
//pedal for instant shifts
//fix markovs to recude repeats: keep rweaking
/*

ERROR: Message 'choose' not understood.
RECEIVER:
   nil
ARGS:
PATH: /Users/hunterbrown/Desktop/Music_Tech_03-10-2018/HERETIC/triggers/trigger_12.scd

*/

(
/*______________________________________________ 1. Server Configuration ______________________________________________*/
s = Server.local;
s.newBusAllocators;
s.latency = 0.05;
ServerBoot.removeAll;
ServerTree.removeAll;
ServerQuit.removeAll;
Server.local.options.numOutputBusChannels = 17;
Server.local.options.numInputBusChannels = 7;
o=s.options;
o.memSize;
o.numBuffers = 1024 * 16;
o.memSize = 2.pow(20);

/*______________________________________________ 2. initialize Global Variables/Arrays ______________________________________________*/
~solo_weight = 1;
~unison_weight = 1;
~complement_weight = 1;
~juxtaposition_weight = 1;
~silence_weight = 1;
~recall_weight = 1;
~new_record_time_value=0;
~record_dtw_time_value=0;
~new_dtw_record_time_value=0;
~silence_counter = 0;

~outbus_count = 0;
~build_count = 0;

~build_array = Array.new(20);

~end_wait = Array.series(20, 0.5, 0.5);

// Audio Channel Assignments
~oh_left_in = 0;
~oh_right_in = 1;
~hat_in = 2;
~snare_in = 3;
~kick_in = 4;
~rack_in = 5;
~floor_in = 6;
~synth_counter=0;
~wek = [];
~mono_or_stereo = 1; //0 for Mono | 1 for Stereo
~recall_wait_counter = 0;

// Address to Wekinator
~toWekinator_velocity = NetAddr("127.0.0.1", port: 6448);
~toWekinator_nn = NetAddr("127.0.0.1", port: 6449);
~toWekinator_input = NetAddr("127.0.0.1", port: 6447);

// File Paths
~buffer_path = PathName(thisProcess.nowExecutingPath).parentPath++"buffers/";
~file_path = PathName(thisProcess.nowExecutingPath).parentPath++"modules/";
~synth_def_path = PathName(thisProcess.nowExecutingPath).parentPath++"synth_defs/";
~init_path = PathName(thisProcess.nowExecutingPath).parentPath++"init/";
~wek_path = PathName(thisProcess.nowExecutingPath).parentPath++"wekinator_communication/";
~macro_path = PathName(thisProcess.nowExecutingPath).parentPath++"macro_utilities/";
~markovs_and_banks_path = PathName(thisProcess.nowExecutingPath).parentPath++"markovs_and_banks/";
~presetFile = (PathName(thisProcess.nowExecutingPath).pathOnly++"presets/"++ "soundPresetExample.sctxar").standardizePath;
~unison_file_path = PathName(thisProcess.nowExecutingPath).parentPath++"unison_banks/";
~synth_file_path = PathName(thisProcess.nowExecutingPath).parentPath++"synth_banks/";
~pattern_file_path = PathName(thisProcess.nowExecutingPath).parentPath++"pattern_banks/";
~trigger_file_path = PathName(thisProcess.nowExecutingPath).parentPath++"triggers/";

//Make Arrays
thisProcess.interpreter.executeFile(~init_path++"make_arrays.scd");
e = Dictionary.new;

/*______________________________________________ 3. Make Buffers _____________________________________________________________*/
~makeBuffers = {
thisProcess.interpreter.executeFile(~init_path++"make_buffers.scd");
};

/*______________________________________________ 4. Make Nodes _____________________________________________________________*/
~makeNodes = {
thisProcess.interpreter.executeFile(~init_path++"make_nodes.scd");
};

/*______________________________________________ 5. Make MIDI  _____________________________________________________________*/
~makeMIDI = {
thisProcess.interpreter.executeFile(~init_path++"make_midi.scd");
};

/*______________________________________________ 6. Make Events/Arrays/Dictionaries  _____________________________________________________________*/
~makeEvents = {

//Make Dictionaries
thisProcess.interpreter.executeFile(~init_path++"make_dictionaries.scd");

//Make Sequence Dictionaries
thisProcess.interpreter.executeFile(~synth_file_path++"sequencing.scd");

/*______________________________________________ 7. Init/Start/Stop/Reset Modules  _____________________________________________________________*/
e.add(\start -> {
thisProcess.interpreter.executeFile(~macro_path++"start.scd");
});

e.add(\end -> {
thisProcess.interpreter.executeFile(~macro_path++"end.scd");
});

e.add(\stop_reset -> {
thisProcess.interpreter.executeFile(~macro_path++"stop_reset.scd");
});

e.add(\init -> {
thisProcess.interpreter.executeFile(~init_path++"init.scd");
});

/*______________________________________________ 8. Wekinator Modules  _____________________________________________________________*/
e.add(\language_record-> {
thisProcess.interpreter.executeFile(~wek_path++"langauge_record.scd");
});

e.add(\stop_language_record-> {
thisProcess.interpreter.executeFile(~wek_path++"stop_langauge_record.scd");
});

e.add(\train_silence-> {
thisProcess.interpreter.executeFile(~wek_path++"silence_train.scd");
});

e.add(\language_train-> {
thisProcess.interpreter.executeFile(~wek_path++"language_train.scd");
});

/*______________________________________________ 9. Audio Utilities  _____________________________________________________________*/
e.add(\self_listen -> {
    ~features_self = Synth(\features, [\input, ~self], target: ~features_node);
});

e.add(\mono-> {
thisProcess.interpreter.executeFile(~macro_path++"mono.scd");
});

e.add(\test_audio -> {
thisProcess.interpreter.executeFile(~macro_path++"test_audio.scd");
});

e.add(\test_audio_off -> {
thisProcess.interpreter.executeFile(~macro_path++"test_audio_off.scd");
});

/*______________________________________________ 10. Markov Chain Functionality  _____________________________________________________________*/
e.add(\reset_posture_matrix-> {
~next_posture = MorrisMarkov.new(~solo_weight,~unison_weight, ~complement_weight, ~juxtaposition_weight, ~silence_weight, ~recall_weight);
});

e.add(\next_posture -> {
thisProcess.interpreter.executeFile(~markovs_and_banks_path++"build.scd");
});


e.add(\next_posture -> {
thisProcess.interpreter.executeFile(~markovs_and_banks_path++"next_posture.scd");
});

e.add(\random_postures -> {
~postures = MorrisMarkov.randPosture;
});


e.add(\get_language -> {
~language_type_routine = Routine({
	loop{
	if(~incoming_language_type_from_nn.asInteger == 0, {~incoming_language_type = \0}, {nil}); //\silence
	if(~incoming_language_type_from_nn.asInteger == 1, {~incoming_language_type = \1}, {nil}); //\sparse
	if(~incoming_language_type_from_nn.asInteger == 2, {~incoming_language_type = \2}, {nil}); //\drone
	if(~incoming_language_type_from_nn.asInteger == 3, {~incoming_language_type = \3}, {nil}); //\graular
	if(~incoming_language_type_from_nn.asInteger == 4, {~incoming_language_type = \4}, {nil}); //\melodic
	if(~incoming_language_type_from_nn.asInteger == 5, {~incoming_language_type = \5}, {nil}); //\pulse
	if(~incoming_language_type_from_nn.asInteger == 6, {~incoming_language_type = \6}, {nil}); //\poly
	if(~incoming_language_type_from_nn.asInteger == 7, {~incoming_language_type = \7}, {nil}); //\sprodic
	if(~incoming_language_type_from_nn.asInteger == 8, {~incoming_language_type = \8}, {nil}); //\transgressive
	if(~incoming_language_type_from_nn.asInteger == 9, {~incoming_language_type = \9}, {nil}); //\bombastic
	(~incoming_language_type.asString++" "++~current_posture.asString).postln;
	0.1.wait;
	};
}).play;
});
};



/*______________________________________________ 11. Make GUI  _____________________________________________________________*/
~makeGui = {
thisProcess.interpreter.executeFile(~init_path++"gui.scd");
};

/*______________________________________________ 12. Server Cleanup  _____________________________________________________________*/
~cleanup = { // kills all processes on server quit
	s.newBusAllocators;
	Ndef.clear;
	ServerBoot.removeAll;
	ServerTree.removeAll;
	ServerQuit.removeAll;
};

/*______________________________________________ 13. ~makeGui | ~makeBuffers | ~cleanup _____________________________________________________________*/
ServerBoot.add(~makeGui);
ServerBoot.add(~makeBuffers); // "ServerBoot" happens when server boots.
ServerQuit.add(~cleanup); // "ServerQuit" happens when server is Quit.

/*______________________________________________ 14. Make Busses | Load SynthDefs ________________________________________________________________________*/

s.waitForBoot({ // Wait to boot server once contained functions have been evaluated.

	s.sync;

	thisProcess.interpreter.executeFile(~init_path++"make_busses.scd");

	s.sync; // Server syncs to language

    PathName(~synth_def_path).entries.size.do{

		arg count=0;

		thisProcess.interpreter.executeFile(~synth_def_path++PathName(~synth_def_path).entries.at(count).fileName.asString);

		count = count + 1;
	};

	s.sync;

	//TreeAdds

    ServerTree.add(~makeNodes);
	ServerTree.add(~makeMIDI);
	ServerTree.add(~makeEvents);
	s.freeAll; // Frees verver of any nodes. Then inits all instances on ServerTree (above).
	s.sync;
	s.meter;
	"done".postln;

});
)