//Sequencng synths and patterns

e.add(\synths_sequence_choose-> {

	Routine({
		thisProcess.interpreter.executeFile(~markovs_and_banks_path++"next_posture.scd"); //choose posture

		s.sync;

		switch (~current_posture,
			\Solo,   {e[\solo_sequence].value},
			\Unison, {e[\unison_sequence].value},
			\Complement, { e[\complement_sequence].value },
			\Juxtaposition, { e[\juxtaposition_sequence].value },
			\Silence, {e[\silence_sequence].value},
			\Recall,   { e[\recall_sequence].value}
		);

	}).play(SystemClock);
});

//silence sequence
e.add(\silence_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter;
			thisProcess.interpreter.executeFile(~synth_file_path++"synths_off.scd");
			[e[\silence_follow].value, e[\silence_wait].value].choose;
		}).play(SystemClock);
	);
});

e.add(\silence_follow-> {
	currentEnvironment.put(("silence_loop_wait_"++~silence_counter.asString).asSymbol,
		Routine({
			var this_langauge_type = ~incoming_language_type;
			loop{
				if(~incoming_language_type != this_langauge_type,
					{
						Routine({
							e[\synths_sequence_choose].value;
							s.sync;
							~silence_counter = ~silence_counter + 1;
							s.sync;
							currentEnvironment.at(("silence_loop_wait_"++(~silence_counter-1).asString).asSymbol).stop;
						}).play(SystemClock);

				}, {nil});
				0.5.wait;
			};
		}).play(SystemClock);
	);
});

e.add(\silence_wait-> {
	Routine({
		~choose_solo_wait.choose.wait;
		e[\synths_sequence_choose].value;
	}).play(SystemClock)
});


//solo sequence
e.add(\solo_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter;
			~synth_trig[\10].value;
			~choose_solo_wait.choose.wait;
			currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
			s.sync;
			e[\synths_sequence_choose].value
		}).play(SystemClock);
	);
});

//unison sequence
e.add(\unison_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter, this_langauge_type = ~incoming_language_type;
			~synth_trig[\12].value;
			loop{
				if(~incoming_language_type != this_langauge_type,
					{
						Routine({
							currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
							e[\synths_sequence_choose].value;
							s.sync;
							currentEnvironment.at(("synth_routine_"++synth_num.asString).asSymbol).stop;
						}).play(SystemClock);

				}, {nil});

				0.5.wait;
			};
		}).play(SystemClock);
	);
});


//complement sequence
e.add(\complement_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter, this_langauge_type = ~incoming_language_type;
			~synth_trig[BraxtonMorrisChoose.setLanguageType(~incoming_language_type, ~current_posture)].value;
			loop{
				if(~incoming_language_type != this_langauge_type,
					{
						Routine({
							currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
							e[\synths_sequence_choose].value;
							s.sync;
							currentEnvironment.at(("synth_routine_"++synth_num.asString).asSymbol).stop;
						}).play(SystemClock);

				}, {nil});

				0.5.wait;
			};
		}).play(SystemClock);
	);
});

//Juxtaposition sequence
e.add(\juxtaposition_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter;
			~synth_trig[BraxtonMorrisChoose.setLanguageType(~incoming_language_type, ~current_posture)].value;
			~choose_solo_wait.choose.wait;
			currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
			s.sync;
			e[\synths_sequence_choose].value
		}).play(SystemClock);
	);
});

//recall sequence
e.add(\recall_sequence-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter;
			~synth_trig[\11].value;
			~choose_solo_wait.choose.wait;
			currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
			s.sync;
			e[\synths_sequence_choose].value
		}).play(SystemClock);
	);
});

//recall sequence
e.add(\build-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter;
			s.sync;
			if(~build_count < 1 ,{~onset_13 = ~dissappearance_time.choose}, {~onset_13 = ~anacrusis_time.choose});
			~synth_trig[\13].value;
			s.sync;
		    ~build_count = ~build_count + 1;
		}).play(SystemClock);
	);
});

e.add(\release-> {
	currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
		Routine({
			var synth_num = ~synth_counter;
			~build_count = 0;
			~synth_trig[\14].value;
			[1, 2].choose.wait;
			currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
		}).play(SystemClock);
	);
});


