// conat loder
//extend seqence wait time depending on lnaguage type? longer for sprase? etc?
//s.record(numChannels: 6);
NetAddr("localhost", 57120);
NetAddr.langPort;
~end=0;

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

~trigger_1_count = 0;
~trigger_2_count = 0;
~trigger_3_count = 0;
~trigger_4_count = 0;
~trigger_5_count = 0;
~trigger_6_count = 0;
~trigger_7_count = 0;
~trigger_8_count = 0;
~trigger_9_count = 0;
~trigger_10_count = 0;

~unison_trigger_0_count = 0;
~unison_trigger_1_count = 0;
~unison_trigger_2_count = 0;
~unison_trigger_3_count = 0;
~unison_trigger_4_count = 0;
~unison_trigger_5_count = 0;
~unison_trigger_6_count = 0;
~unison_trigger_7_count = 0;
~unison_trigger_8_count = 0;
~unison_trigger_9_count = 0;
~unison_trigger_10_count = 0;




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

~outbus_processing = 2;
~outbus_patterns = 4;
~dry_out = 0;


~outbus_samples = 4;

~build_count = 0;

~build_array = Array.new(20);


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

e = Dictionary.new;

/*______________________________________________ 3. Make Buffers _____________________________________________________________*/
~makeBuffers = {
	thisProcess.interpreter.executeFile(~init_path++"make_buffers.scd");
};

~makeBusses = {
	thisProcess.interpreter.executeFile(~init_path++"make_busses.scd");
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

	thisProcess.interpreter.executeFile(~markovs_and_banks_path++"load_banks.scd");

	thisProcess.interpreter.executeFile(~markovs_and_banks_path++"load_markovs.scd");


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

	e.add(\drum_onset_test -> {
		thisProcess.interpreter.executeFile(~init_path++"drum_onset_test.scd");
	});

	e.add(\drum_onset_test_off -> {
		thisProcess.interpreter.executeFile(~init_path++"drum_onset_test_off.scd");
	});

	e.add(\feature_onset_test -> {
		thisProcess.interpreter.executeFile(~init_path++"feature_onset_test.scd");
	});

	e.add(\feature_onset_test_off -> {
		thisProcess.interpreter.executeFile(~init_path++"feature_onset_test_off.scd");
	});

	e.add(\pedal -> {
		thisProcess.interpreter.executeFile(~macro_path++"foot_pedal.scd");
	});


	e.add(\escape_synth -> {
		thisProcess.interpreter.executeFile(~trigger_file_path++"escape_synth.scd");
	});

	e.add(\escape_synth_1 -> {
		thisProcess.interpreter.executeFile(~trigger_file_path++"escape_synth_1.scd");
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
		~current_posture=~postures[1];
		~previous_posture=~postures[0];
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
ServerBoot.add(~makeBusses);
ServerBoot.add(~makeBuffers); // "ServerBoot" happens when server boots.
ServerQuit.add(~cleanup); // "ServerQuit" happens when server is Quit.

/*______________________________________________ 14. Make Busses | Load SynthDefs ________________________________________________________________________*/

s.waitForBoot({ // Wait to boot server once contained functions have been evaluated.


	s.sync; // Server syncs to language

	PathName(~synth_def_path).entries.size.do{

		arg count=0;

		thisProcess.interpreter.executeFile(~synth_def_path++PathName(~synth_def_path).entries.at(count).fileName.asString);

		count = count + 1;
	};

	s.sync;

	//TreeAdds

	ServerTree.add(~makeNodes);
	//ServerTree.add(~makeMIDI);
	ServerTree.add(~makeEvents);
	s.freeAll;

	s.sync;

	// Frees verver of any nodes. Then inits all instances on ServerTree (above).
	s.sync;
	s.meter;
	s.plotTree;
	"done".postln;

});
)
