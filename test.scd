
currentEnvironment.put(("synth_routine_"++~synth_counter.asString).asSymbol,
	Routine({

		var synth_num = ~synth_counter;

		currentEnvironment.put(("synth_duration_"++synth_num.asString).asSymbol, ~set_LanguageTypeDuration.next(\10).choose);
		s.sync;
		~synth_trig[\10].value;

		currentEnvironment.at(("synth_duration_"++synth_num.asString).asSymbol).wait;

		currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
		if(currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).isPlaying,
			{currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).stop}, {nil});

		s.sync;
		currentEnvironment.at(("synth_routine_"++synth_num.asString).asSymbol).stop;
	}).play(SystemClock);
);


