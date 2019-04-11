////////////////////////////////////////////////////////////////////////
//SYNTHS: 10 -> SOLO Formings

~pattern_bank_10.add(\0-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1, sus_env_2, sus_env_1;
		var dur_high_1 = 0.05, dur_low_1 = 3.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 1.0, dur_low_2 = 6.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var rate_high_1 = 0.8, rate_low_1 = 0.1, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 10.0, rate_low_2 = 0.8, rate_med_2 = [rate_high_2, rate_low_2].mean;
		var atk_high_1=0.005, atk_low_1=0.5, atk_med_1 = [atk_high_1, atk_low_1].mean;
		var atk_high_2=0.5, atk_low_2=6.0, atk_med_2 = [atk_high_2, atk_low_2].mean;
		var rel_high_1=0.005, rel_low_1=5.0, rel_med_1 = [rel_high_1, rel_low_1].mean;
		var rel_high_2=0.5, rel_low_2=12.0, rel_med_2 = [rel_high_2, rel_low_2].mean;
		var sus_high_1=3.0, sus_low_1=8.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2=6.0, sus_low_2=12.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var filter_high_1=21000, filter_low_1=2000, filter_med_1 = [filter_high_1, filter_low_1].mean;

		var set_onset=~onset_10, set_continuation=~set_continuation.next(\10), set_termination=~terminate_10;
		var onset_time=~onset_time_10, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_10;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		atk_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, atk_low_1, atk_med_1,atk_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, atk_low_1, atk_med_1, atk_high_1);
		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);
		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);
		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);

		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);


		sus_env_2=sus_env_1.replace(sus_high_1, sus_high_2);
		sus_env_2=sus_env_2.replace(sus_med_1, sus_med_2);
		sus_env_2=sus_env_2.replace(sus_low_1, sus_low_2);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		atk_env_2=atk_env_1.replace(atk_high_1, atk_high_2);
		atk_env_2=atk_env_2.replace(atk_med_1, atk_med_2);
		atk_env_2=atk_env_2.replace(atk_low_1, atk_low_2);

		rel_env_2=rel_env_1.replace(rel_high_1, rel_high_2);
		rel_env_2=rel_env_2.replace(rel_med_1, rel_med_2);
		rel_env_2=rel_env_2.replace(rel_low_1, rel_low_2);

		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);

		dur_env_1.postln;


		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\solo_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pexprand(Env(atk_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(atk_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\rel, Pexprand(Env(rel_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(rel_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\sus, Pexprand(Env(sus_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(sus_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, m[\grit][0],
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(rate_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\spos, Pwhite(0, s.sampleRate*m[\grit][0].duration),
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, [0, 1].choose,
				\low_pass_freq,  Env(filter_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose),
				\high_pass_mix, 0,
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


~pattern_bank_10.add(\1-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1, sus_env_2, sus_env_1;
		var dur_high_1 = 0.05, dur_low_1 = 3.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 1.0, dur_low_2 = 6.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var rate_high_1 = 0.8, rate_low_1 = 0.1, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 4.0, rate_low_2 = 0.8, rate_med_2 = [rate_high_2, rate_low_2].mean;
		var atk_high_1=0.005, atk_low_1=0.5, atk_med_1 = [atk_high_1, atk_low_1].mean;
		var atk_high_2=0.5, atk_low_2=6.0, atk_med_2 = [atk_high_2, atk_low_2].mean;
		var rel_high_1=0.005, rel_low_1=5.0, rel_med_1 = [rel_high_1, rel_low_1].mean;
		var rel_high_2=0.5, rel_low_2=12.0, rel_med_2 = [rel_high_2, rel_low_2].mean;
		var sus_high_1=3.0, sus_low_1=8.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2=6.0, sus_low_2=12.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var filter_high_1=30.0, filter_low_1=5000.0, filter_med_1 = [filter_high_1, filter_low_1].mean;

		var set_onset=~onset_10, set_continuation=~set_continuation.next(\10), set_termination=~terminate_10;
		var onset_time=~onset_time_10, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_10;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		atk_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, atk_low_1, atk_med_1,atk_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, atk_low_1, atk_med_1, atk_high_1);
		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);
		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);
		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);

		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);


		sus_env_2=sus_env_1.replace(sus_high_1, sus_high_2);
		sus_env_2=sus_env_2.replace(sus_med_1, sus_med_2);
		sus_env_2=sus_env_2.replace(sus_low_1, sus_low_2);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		atk_env_2=atk_env_1.replace(atk_high_1, atk_high_2);
		atk_env_2=atk_env_2.replace(atk_med_1, atk_med_2);
		atk_env_2=atk_env_2.replace(atk_low_1, atk_low_2);

		rel_env_2=rel_env_1.replace(rel_high_1, rel_high_2);
		rel_env_2=rel_env_2.replace(rel_med_1, rel_med_2);
		rel_env_2=rel_env_2.replace(rel_low_1, rel_low_2);

		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);

		dur_env_1.postln;
		sus_env_1.postln;



		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\solo_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pexprand(Env(atk_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(atk_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\rel, Pexprand(Env(rel_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(rel_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\sus, Pexprand(Env(sus_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(sus_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, m[\string_quartet][0],
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(rate_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\spos, Pwhite(0, s.sampleRate*m[\string_quartet][0].duration),
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, [0, 1].choose,
				\low_pass_freq,  Env(filter_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose),
				\high_pass_mix, 0,
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



~pattern_bank_10.add(\2-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1, sus_env_2, sus_env_1;
		var dur_high_1 = 0.05, dur_low_1 = 3.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 1.0, dur_low_2 = 6.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var rate_high_1 = 0.8, rate_low_1 = 0.1, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 4.0, rate_low_2 = 0.8, rate_med_2 = [rate_high_2, rate_low_2].mean;
		var atk_high_1=0.005, atk_low_1=0.5, atk_med_1 = [atk_high_1, atk_low_1].mean;
		var atk_high_2=0.5, atk_low_2=6.0, atk_med_2 = [atk_high_2, atk_low_2].mean;
		var rel_high_1=0.005, rel_low_1=5.0, rel_med_1 = [rel_high_1, rel_low_1].mean;
		var rel_high_2=0.5, rel_low_2=12.0, rel_med_2 = [rel_high_2, rel_low_2].mean;
		var sus_high_1=3.0, sus_low_1=8.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2=6.0, sus_low_2=12.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var filter_high_1=30.0, filter_low_1=5000.0, filter_med_1 = [filter_high_1, filter_low_1].mean;

		var set_onset=~onset_10, set_continuation=~set_continuation.next(\10), set_termination=~terminate_10;
		var onset_time=~onset_time_10, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_10;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		atk_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, atk_low_1, atk_med_1,atk_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, atk_low_1, atk_med_1, atk_high_1);

		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);

		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);

		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);


		sus_env_2=sus_env_1.replace(sus_high_1, sus_high_2);
		sus_env_2=sus_env_2.replace(sus_med_1, sus_med_2);
		sus_env_2=sus_env_2.replace(sus_low_1, sus_low_2);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		atk_env_2=atk_env_1.replace(atk_high_1, atk_high_2);
		atk_env_2=atk_env_2.replace(atk_med_1, atk_med_2);
		atk_env_2=atk_env_2.replace(atk_low_1, atk_low_2);

		rel_env_2=rel_env_1.replace(rel_high_1, rel_high_2);
		rel_env_2=rel_env_2.replace(rel_med_1, rel_med_2);
		rel_env_2=rel_env_2.replace(rel_low_1, rel_low_2);

		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);

		dur_env_1.postln;
		dur_env_2.postln;
		rel_env_1.postln;
		rel_env_2.postln;
		sus_env_1.postln;
		sus_env_2.postln;


		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\solo_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pexprand(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pexprand(Env(atk_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(atk_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\rel, Pexprand(Env(rel_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(rel_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\sus, Pexprand(Env(sus_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(sus_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, m[\falter_cleanse][0],
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(rate_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\spos, Pwhite(0, s.sampleRate*m[\falter_cleanse][0].duration),
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 21000,
				\high_pass_mix, 1,
				\high_pass_freq,  Env(filter_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose),
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);


});


~pattern_bank_10.add(\3-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1, sus_env_2, sus_env_1;
		var dur_high_1 = 0.05, dur_low_1 = 3.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 1.0, dur_low_2 = 6.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var rate_high_1 = 0.8, rate_low_1 = 0.1, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 4.0, rate_low_2 = 0.8, rate_med_2 = [rate_high_2, rate_low_2].mean;
		var atk_high_1=0.005, atk_low_1=0.5, atk_med_1 = [atk_high_1, atk_low_1].mean;
		var atk_high_2=0.5, atk_low_2=6.0, atk_med_2 = [atk_high_2, atk_low_2].mean;
		var rel_high_1=0.005, rel_low_1=5.0, rel_med_1 = [rel_high_1, rel_low_1].mean;
		var rel_high_2=0.5, rel_low_2=12.0, rel_med_2 = [rel_high_2, rel_low_2].mean;
		var sus_high_1=3.0, sus_low_1=8.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2=6.0, sus_low_2=12.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var filter_high_1=21000, filter_low_1=2000, filter_med_1 = [filter_high_1, filter_low_1].mean;

		var set_onset=~onset_10, set_continuation=~set_continuation.next(\10), set_termination=~terminate_10;
		var onset_time=~onset_time_10, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_10;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		atk_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, atk_low_1, atk_med_1, atk_high_1);
		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);

		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);

		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);


		sus_env_2=sus_env_1.replace(sus_high_1, sus_high_2);
		sus_env_2=sus_env_2.replace(sus_med_1, sus_med_2);
		sus_env_2=sus_env_2.replace(sus_low_1, sus_low_2);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		atk_env_2=atk_env_1.replace(atk_high_1, atk_high_2);
		atk_env_2=atk_env_2.replace(atk_med_1, atk_med_2);
		atk_env_2=atk_env_2.replace(atk_low_1, atk_low_2);

		rel_env_2=rel_env_1.replace(rel_high_1, rel_high_2);
		rel_env_2=rel_env_2.replace(rel_med_1, rel_med_2);
		rel_env_2=rel_env_2.replace(rel_low_1, rel_low_2);

		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);

		dur_env_1.postln;


		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\solo_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pexprand(Env(atk_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(atk_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\rel, Pexprand(Env(rel_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(rel_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\sus, Pexprand(Env(sus_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(sus_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, m[\contin][0],
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose), Env(rate_env_2, [onset_time,  continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose)),
				\spos, Pwhite(0, s.sampleRate*m[\contin][0].duration),
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, [0, 1].choose,
				\low_pass_freq,  Env(filter_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin, \wel, \sqr, \cub].choose),
				\high_pass_mix, 0,
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



