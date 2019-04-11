////////////////////////////////////////////////////////////////////////
//SYNTHS: 6 -> Polyrhythmic Formings

~pattern_bank_6.add(\0-> {
	Routine({
		var this_synth = ~synth_counter, dur_env_1, dur_env_2, sus_env_1, sus_env_2, rate_env_1, rate_env_2;
		var dur_high_1 = 3.0, dur_low_1 = 15.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 0.2, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var sus_high_1 = 1.0, sus_low_1 = 12.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2 = 12.0, sus_low_2 = 22.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var rate_high_1 = 2.0, rate_low_1 = 0.7, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 0.5, rate_low_2 = 0.2, rate_med_2 = [rate_high_2, rate_low_2].mean;

		var set_onset=~onset_6, set_continuation=~set_continuation.next(\6), set_termination=~terminate_6;
		var onset_time=~onset_time_6, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_6;
		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		dur_env_2 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_2, dur_med_2, dur_high_2)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_2, dur_med_2, dur_high_2)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_2, dur_med_2, dur_high_2);

		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);

		sus_env_2 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_2, sus_med_2, sus_high_2)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_2, sus_med_2, sus_high_2)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_2, sus_med_2, sus_high_2);


		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);

		rate_env_2 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_2, rate_med_2, rate_high_2)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_2, rate_med_2, rate_high_2)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_2, rate_med_2, rate_high_2);

		dur_env_1.postln;


		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\poly_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pexprand(Env(dur_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin), Env(dur_env_2, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin)),
				\atk, 0.005,
				\rel, 0.005,
				\sus, Pwhite(Env(sus_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin), Env(sus_env_2, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin)),
				\c1, 4,
				\c2, -4,
				\buf, Pwrand(m[\BassDrum][(0..(m[\BassDrum].size-1))]++m[\hats][(0..(m[\hats].size-1))]++m[\snare][(0..(m[\snare].size-1))]++m[\Cymbal][(0..(m[\Cymbal].size-1))], (Array.rand(m[\BassDrum].size, 1, 3)++Array.rand(m[\hats].size, 5, 8)++Array.rand(m[\snare].size, 5, 7)++Array.rand(m[\Cymbal].size, 2, 4)).normalizeSum, inf),
				\rate, Pwhite(Env(rate_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin), Env(rate_env_2, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin)),
				\spos, 0,
				\amp, 1,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
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



~pattern_bank_6.add(\1-> {

	Routine({
		var this_synth = ~synth_counter, dur_env_1, dur_env_2, sus_env_1, sus_env_2, rate_env_1, rate_env_2, filter_env_1;
		var dur_high_1 = 2.0, dur_low_1 = 5.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 5.0, dur_low_2 = 10.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var sus_high_1 = 5.0, sus_low_1 = 10.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2 = 15.0, sus_low_2 = 20.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var rate_high_1 = 2.0, rate_low_1 = 0.7, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var filter_high_1 = 30.0, filter_low_1 = 1000.0, filter_med_1 = [filter_high_1, filter_low_1].mean;
		var rate_high_2 = 0.5, rate_low_2 = 0.2, rate_med_2 = [rate_high_2, rate_low_2].mean;

		var set_onset=~onset_6, set_continuation=~set_continuation.next(\6), set_termination=~terminate_6;
		var onset_time=~onset_time_6, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_6;
		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		dur_env_2 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_2, dur_med_2, dur_high_2)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_2, dur_med_2, dur_high_2)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_2, dur_med_2, dur_high_2);

		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);

		sus_env_2 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_2, sus_med_2, sus_high_2)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_2, sus_med_2, sus_high_2)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_2, sus_med_2, sus_high_2);

		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);

		rate_env_2 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_2, rate_med_2, rate_high_2)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_2, rate_med_2, rate_high_2)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_2, rate_med_2, rate_high_2);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);

		dur_env_1.postln;

		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\poly_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pexprand(Env(dur_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin), Env(dur_env_2, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin)),
				\atk, 0.005,
				\rel, Pexprand(6.0, 0.005),
				\sus, Pwhite(Env(sus_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin), Env(sus_env_2, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin)),
				\c1, 4,
				\c2, (-4),
				\buf, Prand(m[\poly][(0..(m[\poly].size-1))], inf),
				\rate, Pwrand([1]++Array.rand(9, 0.8, 1.1),  ([10]++Array.rand(9, 4, 7)).normalizeSum, inf),
				\spos, 0,
				\amp, 1,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 20000,
				\high_pass_mix, 1,
				\high_pass_freq, Env(filter_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \sin),
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);
		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);

});







