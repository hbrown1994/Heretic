e.add(\synths_sequence_choose-> {
	thisProcess.interpreter.executeFile(~markovs_and_banks_path++"next_posture.scd"); //choose posture
	switch (~current_posture,
		\Solo,   {e[\solo_sequence].value},
		\Unison, {e[\unison_sequence].value},
		\Complement, { e[\complement_sequence].value },
		\Juxtaposition, { e[\juxtaposition_sequence].value },
		\Silence, {e[\silence_sequence].value},
		\Recall,   { e[\recall_sequence].value}
	);
});

//silence sequence
e.add(\silence_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter;
			~incoming_language_type.postln;
			~current_posture.postln;
			thisProcess.interpreter.executeFile(~synth_file_path++"synths_off.scd");
			[e[\silence_follow].value, e[\silence_wait].value].choose;
		}).play(SystemClock);
	);
});

e.add(\silence_follow-> {
	currentEnvironment.put(("silence_loop_wait_"++~silence_counter.asString).asSymbol,
		Routine({
			var this_langauge_type = ~incoming_language_type, hold=0.5, current_posture=~current_posture, this_silence=~silence_counter, previous_posture=~previous_posture;
			var sub_routine = Routine({
				e[\synths_sequence_choose].value;
				currentEnvironment.at(("silence_loop_wait_"++this_silence.asString).asSymbol).stop;
				"done".postln;
			});
			"siilence_follow".postln;
			if(current_posture==\Complement,  {10.wait;}, {if(previous_posture==\Complement,  {10.wait;}, {s.sync;});});
			if(current_posture==\Unison,  {10.wait;}, {if(previous_posture==\Unison,  {10.wait;}, {s.sync;});});

			loop{

				s.sync;
				if(~incoming_language_type==\0, {sub_routine.play; hold=s;}, {nil});
				hold.wait;
			};
		}).play(SystemClock);
	);
});

e.add(\silence_wait-> {
	Routine({
		"silence_wait".postln;
		~incoming_language_type.postln;
		~current_posture.postln;
		~set_LanguageTypeDuration.next(\0).choose.wait;
		e[\synths_sequence_choose].value;
	}).play(SystemClock)
});

//solo sequence
e.add(\solo_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({

			var synth_num = ~synth_counter;
			"solo".postln;
			currentEnvironment.put(("synth_duration_"++synth_num.asString).asSymbol, ~set_LanguageTypeDuration.next(\10).choose);
			s.sync;
			~synth_trig[\10].value;
			synth_num.postln;
			currentEnvironment.at(("synth_duration_"++synth_num.asString).asSymbol).wait;
			e[\synths_sequence_choose].value;
			~over_lap_wait[[0, 1, 2, 3, 4].wchoose([0.05, 0.1, 0.2, 0.9, 0.5].normalizeSum)].choose.wait;
			currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
			if(currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).isPlaying,
				{currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).stop}, {nil});

			s.sync;
			currentEnvironment.at(("synth_routine_"++synth_num.asString).asSymbol).stop;
		}).play(SystemClock);
	);
});

//unison sequence
e.add(\unison_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var hold=1, synth_num = ~synth_counter, this_langauge_type = ~incoming_language_type, this_synth_langauge_type = 0, current_posture=~current_posture, previous_posture=~previous_posture;
			var loop_done = Condition(false);
			var sub_routine;


			currentEnvironment.put(("synth_duration_"++synth_num.asString).asSymbol, ~over_lap_wait[[0, 1, 2, 3, 4].wchoose([0.1, 0.2, 0.4, 0.8, 0.0].normalizeSum)].choose);

			s.sync;

			sub_routine= Routine({
				e[\synths_sequence_choose].value;

				currentEnvironment.at(("synth_duration_"++synth_num.asString).asSymbol).wait;
				currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
				if(currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).isPlaying,
					{currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).stop}, {nil});
				currentEnvironment.at(("synth_routine_"++synth_num.asString).asSymbol).stop;
				"done".postln;

			});

			s.sync;

			"unison_sequence".postln;

			~synth_trig[\12].value;
			synth_num.postln;
			s.sync;

			if(current_posture==\Complement,  {10.wait;}, {if(previous_posture==\Complement,  {10.wait;}, {s.sync;});});
			if(current_posture==\Unison,  {10.wait;}, {if(previous_posture==\Unison,  {10.wait;}, {s.sync;});});

			loop{

				s.sync;
				if(~incoming_language_type==\0, {sub_routine.play; hold=s;}, {nil});
				hold.wait;
			};

		}).play(SystemClock);
	);
});

//complement sequence
e.add(\complement_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var hold=0.5, synth_num = ~synth_counter, this_langauge_type = ~incoming_language_type, this_synth_langauge_type = 0, current_posture=~current_posture, previous_posture=~previous_posture;
			var loop_done = Condition(false);
			var sub_routine;


			currentEnvironment.put(("synth_duration_"++synth_num.asString).asSymbol, ~over_lap_wait[[0, 1, 2, 3, 4].wchoose([0.1, 0.2, 0.4, 0.8, 0.0].normalizeSum)].choose);

			s.sync;

			sub_routine = Routine({
				e[\synths_sequence_choose].value;

				currentEnvironment.at(("synth_duration_"++synth_num.asString).asSymbol).wait;
				currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
				if(currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).isPlaying,
					{currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).stop}, {nil});
				currentEnvironment.at(("synth_routine_"++synth_num.asString).asSymbol).stop;
				"done".postln;

			});

			"\complement_sequence".postln;
			this_synth_langauge_type = BraxtonMorrisChoose.setLanguageType(this_langauge_type, current_posture);
			s.sync;
			currentEnvironment.put(("synth_duration_"++synth_num.asString).asSymbol, ~set_LanguageTypeDuration.next(this_langauge_type).choose);

			s.sync;

			~synth_trig[this_synth_langauge_type].value;
			synth_num.postln;
			s.sync;


			if(current_posture==\Complement,  {10.wait;}, {if(previous_posture==\Complement,  {10.wait;}, {s.sync;});});
			if(current_posture==\Unison,  {10.wait;}, {if(previous_posture==\Unison,  {10.wait;}, {s.sync;});});

			loop{

				s.sync;
				if(~incoming_language_type==\0, {sub_routine.play; hold=s;}, {nil});
				hold.wait;
			};
		}).play(SystemClock);
	);
});

//Juxtaposition sequence
e.add(\juxtaposition_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter, this_langauge_type = ~incoming_language_type, this_synth_langauge_type = 0;
			"\\juxtaposition_sequence".postln;
			this_synth_langauge_type = BraxtonMorrisChoose.setLanguageType(~incoming_language_type, ~current_posture);
			currentEnvironment.put(("synth_duration_"++synth_num.asString).asSymbol, ~set_LanguageTypeDuration.next(this_langauge_type).choose;);
			~synth_trig[this_synth_langauge_type].value;
			currentEnvironment.at(("synth_duration_"++synth_num.asString).asSymbol).wait;
			e[\synths_sequence_choose].value;
			~over_lap_wait[[0, 1, 2, 3, 4].wchoose([0.1, 0.2, 0.4, 0.5, 0.2].normalizeSum)].choose.wait;
			currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
			if(currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).isPlaying,
				{currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).stop}, {nil});
		}).play(SystemClock);
	);
});

//recall sequence
e.add(\recall_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter;
			"recall_sequence".postln;
			currentEnvironment.put(("synth_duration_"++synth_num.asString).asSymbol, ~set_LanguageTypeDuration.next(\11).choose);
			~synth_trig[\11].value;
			currentEnvironment.at(("synth_duration_"++synth_num.asString).asSymbol).wait;
			e[\synths_sequence_choose].value;
			~over_lap_wait[[0, 1, 2, 3, 4].wchoose([0.1, 0.2, 0.4, 0.5, 0.2].normalizeSum)].choose.wait;
			currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
			if(currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).isPlaying,
				{currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).stop}, {nil});

		}).play(SystemClock);
	);
});


