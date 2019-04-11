////////////////////////////////////////////////////////////////////////
//SYNTHS: 3 -> granular Formings

~pattern_bank_3.add(\0-> {
	Routine({
		    var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2;
		    var dur_high_1 = 0.005, dur_low_1 = 1.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
            var dur_high_2 = 0.1, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		    var atk_high_1=0.005, atk_low_1=0.5, atk_med_1 = [atk_high_1, atk_low_1].mean;
		    var atk_high_2=0.006, atk_low_2=1.2, atk_med_2 = [atk_high_2, atk_low_2].mean;
		    var rel_high_1=0.05, rel_low_1=0.5, rel_med_1 = [rel_high_1, rel_low_1].mean;
		    var rel_high_2=0.3, rel_low_2=1.0, rel_med_2 = [rel_high_2, rel_low_2].mean;
		    var filter_high_1=30, filter_low_1=8000, filter_med_1 = [filter_high_1, filter_low_1].mean;
		    var filter_high_2=31, filter_low_2=9000, filter_med_2 = [filter_high_2, filter_low_2].mean;
		    var set_onset=~onset_3, set_continuation=~set_continuation.next(\3), set_termination=~terminate_3;
		    var onset_time=~onset_time_3, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_3;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		atk_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, atk_low_1, atk_med_1, atk_high_1);
		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);
		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		atk_env_2=atk_env_1.replace(atk_high_1, atk_high_2);
		atk_env_2=atk_env_2.replace(atk_med_1, atk_med_2);
		atk_env_2=atk_env_2.replace(atk_low_1, atk_low_2);

		rel_env_2=rel_env_1.replace(rel_high_1, rel_high_2);
		rel_env_2=rel_env_2.replace(rel_med_1, rel_med_2);
		rel_env_2=rel_env_2.replace(rel_low_1, rel_low_2);

		filter_env_2=filter_env_1.replace(filter_high_1, filter_high_2);
		filter_env_2=filter_env_2.replace(filter_med_1, filter_med_2);
		filter_env_2=filter_env_2.replace(filter_low_1, filter_low_2);

		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\granular_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
                \atk, Pwhite(Env(atk_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(atk_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
                \rel, Pwhite(Env(rel_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(rel_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\c1, 4,
				\c2, -4,
				\buf, Pwrand([m[\bag][(0..(m[\bag].size-1))], m[\silence][(0..(m[\silence].size-1))]], [9, 1].normalizeSum, inf),
				\rate, Pwrand(Array.series(50, -20, 0.2)++Array.series(50, 0.2, 0.2),  (Array.rand(100, 7, 10)).normalizeSum, inf),
				\spos, Pwhite(0, s.sampleRate*1),
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 20000,
				\high_pass_mix, [0, 1].wchoose([1, 9].normalizeSum),
				\high_pass_freq, Pwhite(Env(filter_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(filter_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);

});

~pattern_bank_3.add(\1-> {
	Routine({
			var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2;
		    var dur_high_1 = 0.005, dur_low_1 = 1.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
            var dur_high_2 = 0.1, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		     var set_onset=~onset_3, set_continuation=~set_continuation.next(\3), set_termination=~terminate_3;
		    var onset_time=~onset_time_3, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_3;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		s.sync;

		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		s.sync;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\granular_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pwrand(Array.rand(10, 0.005, 0.01), Array.rand(10, 3, 9).normalizeSum, inf),
				\rel, Pwrand([0.005, 0.008, 0.01, 0.05, 0.07, 0.1, 0.2, 0.3, 0.4, 0.5], (Array.rand(5, 7, 10)++Array.rand(5, 1, 2)).normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, Pwrand([m[\brushes][(0..(m[\brushes].size-1))], m[\glass][(0..(m[\glass].size-1))], m[\megaphone][(0..(m[\megaphone].size-1))], m[\asmr][(0..(m[\asmr].size-1))]], Array.rand(4, 4, 6).normalizeSum, inf),
				\rate, Pwrand(Array.series(100, -20, 0.2)++Array.series(50, 0.2, 0.1),  (Array.rand(150, 1, 10)).normalizeSum, inf),
				\spos, Pwhite(0, s.sampleRate*1),
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 20000,
				\high_pass_mix, 1,
				\high_pass_freq, 30,
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);

});


~pattern_bank_3.add(\2-> {
	Routine({
	var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2;
	var dur_high_1 = 0.005, dur_low_1 = 0.5, dur_med_1 = [dur_high_1, dur_low_1].mean;
	var dur_high_2 = 0.05, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
	var set_onset=~onset_3, set_continuation=~set_continuation.next(\3), set_termination=~terminate_3;
	var onset_time=~onset_time_3, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_3;

	currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

	s.sync;

	dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

	s.sync;

	dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
	dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
	dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

	s.sync;

	currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

	currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
		\granular_2,
		Pbind(
			\instrument, \pattern_buf,
			\dur, Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
			\atk, Pwhite(0.005, 0.2),
			\rel, Pwrand([0.005, 0.008, 0.01, 0.05, 0.07, 0.1, 0.2, 0.3, 0.4, 0.5], (Array.rand(5, 7, 10)++Array.rand(5, 1, 2)).normalizeSum, inf),
			\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
			\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
			\buf, Pxrand([m[\melodic_one_shots][(0..(m[\melodic_one_shots].size-1))]++m[\memory_moog_granular_formings][(0..(m[\memory_moog_granular_formings].size-1))]++m[\memory_moog_pulse_formings][(0..(m[\memory_moog_pulse_formings].size-1))]], inf),
			\rate, Pwrand(Array.series(100, -20, 0.2)++Array.series(50, 0.2, 0.1),  (Array.rand(150, 1, 10)).normalizeSum, inf),
			\spos, Pwhite(0, s.sampleRate*1),
			\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
			\loop, 1,
			\pan_pos, Pwhite(-1.0, 1.0),
			\low_pass_mix, 1,
			\low_pass_freq, 20000,
			\high_pass_mix, 1,
			\high_pass_freq, 30,
			\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
			\group, ~pattern_node,
		);
	).play;
	);

	s.sync;

	currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

}).play(SystemClock);

});


~pattern_bank_3.add(\3-> {
	Routine({
	var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2;
	var dur_high_1 = 0.005, dur_low_1 = 0.5, dur_med_1 = [dur_high_1, dur_low_1].mean;
	var dur_high_2 = 0.05, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
	var set_onset=~onset_3, set_continuation=~set_continuation.next(\3), set_termination=~terminate_3;
	var onset_time=~onset_time_3, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_3;

	currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

	s.sync;

	dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

	s.sync;

	dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
	dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
	dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

	s.sync;

	currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

	currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
		\granular_2,
		Pbind(
			\instrument, \pattern_buf,
			\dur, Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
			\atk, Pwhite(0.005, 0.2),
			\rel, Pwrand([0.005, 0.008, 0.01, 0.05, 0.07, 0.1, 0.2, 0.3, 0.4, 0.5], (Array.rand(5, 7, 10)++Array.rand(5, 1, 2)).normalizeSum, inf),
			\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
			\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
			\buf, Pwrand([m[\poly][(0..(m[\poly].size-1))], m[\no_input_glitch][(0..(m[\no_input_glitch].size-1))], m[\hats][(0..(m[\hats].size-1))], m[\dx7_clang][(0..(m[\dx7_clang].size-1))], m[\dx7_log][(0..(m[\dx7_log].size-1))]], [8, 8, 5,3 ,3].normalizeSum, inf),
			\rate, Pwrand(Array.series(100, -20, 0.2)++Array.series(50, 0.2, 0.1),  (Array.rand(150, 1, 10)).normalizeSum, inf),
			\spos, Pwhite(0, s.sampleRate*1),
			\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
			\loop, 1,
			\pan_pos, Pwhite(-1.0, 1.0),
			\low_pass_mix, 1,
			\low_pass_freq, 20000,
			\high_pass_mix, 1,
			\high_pass_freq, 30,
			\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
			\group, ~pattern_node,
		);
	).play;
	);

	s.sync;

	currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

}).play(SystemClock);
});




