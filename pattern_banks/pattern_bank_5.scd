////////////////////////////////////////////////////////////////////////
//SYNTHS: 5 -> pulse Formings

~pattern_bank_5.add(\0-> {
	Routine({
	var this_synth = ~synth_counter;
	currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
	s.sync;
	currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
		\pulse_0,
		Pbind(
			\instrument, \pattern_buf,
			\dur_mult_low, Pwrand([20.0, 0.05], [7, 3].normalizeSum, inf),
			\dur_mult_high, Pwrand([60.0, 0.3], [7, 3].normalizeSum, inf),
			\dur, Pexprand(Pkey(\dur_mult_low), Pkey(\dur_mult_high)),
			\atk, 0.005,
			\rel_mult_low, Pwrand([0.005, 20.0], [6, 4].normalizeSum, inf),
			\rel_mult_high, Pwrand([0.1, 10.0], [6, 4].normalizeSum, inf),
			\sus, Pkey(\dur) * Pwrand([1, 1.3], [7, 3].normalizeSum, inf),
			\rel, Pwhite(Pkey(\rel_mult_low), Pkey(\rel_mult_high)),
			\c1, 4,
			\c2, Pexprand(-1, -8), //negantive
			\buf, Pxrand(m[\pulse][(0..(m[\pulse].size-1))], inf),
			\rate, Pstep([Pwhite(0.7, 1.0), Pwhite(0.5, 1.3)], [Pkey(\dur)/8 ,Pkey(\dur)/8], inf),
			\spos, 0,
			\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
			\loop, 1,
			\low_pass_mix, 0,
			\low_pass_freq, 20000,
			\high_pass_mix, 0,
			\high_pass_freq, 30,
			\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
			\group, ~pattern_node,
		);
	).play;
	);

	s.sync;

	currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol));

}).play(SystemClock);

});


~pattern_bank_5.add(\1-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dev_env_1, pitch_env_1, fast_env_1, low_env_1, mid_env_1;
		var dev_high_1 = 0.1, dev_low_1 = 0.0, dev_med_1 = [dev_high_1, dev_low_1].mean;
		var pitch_high_1 = 0.1, pitch_low_1 = 0.007, pitch_med_1 = [pitch_high_1, pitch_low_1].mean;
		var fast_high_1 = 1.0, fast_low_1 = 0.0, fast_med_1 = [fast_high_1, fast_low_1].mean;
		var mid_high_1 = 2.0, mid_low_1 = 0.5, mid_med_1 = [mid_high_1, mid_low_1].mean;
		var low_high_1 = 1.0, low_low_1 = 0.0, low_med_1 = [low_high_1, low_low_1].mean;

		var set_onset=~onset_5, set_continuation=~set_continuation.next(\5), set_termination=~terminate_5;
		var onset_time=~onset_time_5, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_5;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;

		dev_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dev_low_1, dev_med_1, dev_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dev_low_1, dev_med_1, dev_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dev_low_1, dev_med_1, dev_high_1);

		pitch_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, pitch_low_1, pitch_med_1, pitch_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, pitch_low_1, pitch_med_1, pitch_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, pitch_low_1, pitch_med_1, pitch_high_1);

		fast_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, fast_low_1, fast_med_1, fast_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, fast_low_1, fast_med_1, fast_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, fast_low_1, fast_med_1, fast_high_1);

		mid_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, mid_low_1, mid_med_1, mid_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, mid_low_1, mid_med_1, mid_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, mid_low_1, mid_med_1, mid_high_1);

		low_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, low_low_1, low_med_1, low_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, low_low_1, low_med_1, low_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, low_low_1, low_med_1, low_high_1);


		dev_env_1.postln;


		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\pulse1,
			Pbind(
				\instrument, \drum_pulse,
				\trig_speed, 3.0 + 3.0.rand,
				\half, 3,
				\quarter, 10,
				\quarter_trip, Env(low_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\quarter_quin, Env(low_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\eighth, Env(mid_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\trip, Env(mid_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\sixteenth, Env(fast_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\quin, Env(fast_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\trig_dev, Env(dev_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\pitch_high, Env(pitch_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\dur, 8/Pkey(\trig_speed),
				\atk, 0.0005,
				\rel, 0.0005,
				\sus, Pkey(\dur),
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play(TempoClock);
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);
});



~pattern_bank_5.add(\2-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dev_env_1, max_mean_env_1, filter_env_1, fast_env_1, low_env_1, mid_env_1, num_points_env_1, max_env_1;
		var dev_high_1 = 0.5, dev_low_1 = 0.0, dev_med_1 = [dev_high_1, dev_low_1].mean;
		var max_mean_high_1 = 20.0, max_mean_low_1 = 0.0, max_mean_med_1 = [max_mean_high_1, max_mean_low_1].mean;
		var num_points_high_1 = 100.0, num_points_low_1 = 1.0, num_points_med_1 = [num_points_high_1, num_points_low_1].mean;
		var filter_high_1 = 21000, filter_low_1 = 200, filter_med_1 = [filter_high_1, filter_low_1].mean;
		var max_high_1 = 4.0, max_low_1 = 2.0, max_med_1 = [max_high_1, max_low_1].mean;

		var set_onset=~onset_5, set_continuation=~set_continuation.next(\5), set_termination=~terminate_5;
		var onset_time=~onset_time_5, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_5;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;

		dev_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dev_low_1, dev_med_1, dev_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dev_low_1, dev_med_1, dev_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dev_low_1, dev_med_1, dev_high_1);

		num_points_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, num_points_low_1, num_points_med_1, num_points_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, num_points_low_1, num_points_med_1, num_points_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, num_points_low_1, num_points_med_1, num_points_high_1);

		max_mean_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, max_mean_low_1, max_mean_med_1, max_mean_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, max_mean_low_1, max_mean_med_1, max_mean_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, max_mean_low_1, max_mean_med_1, max_mean_high_1);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);

		max_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, max_low_1, max_med_1, max_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, max_low_1, max_med_1, max_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, max_low_1, max_med_1, max_high_1);

		dev_env_1.postln;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\pulse3,
			Pbind(
				\instrument, \chord_pulse,
				\chord_speed, 2.0 + 4.0.rand,
				\dur, 1/Pkey(\chord_speed),
				\atk, 0.0005,
				\rel, 0.0005,
				\sus, Pkey(\dur),
				\new_dev, Env(dev_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\chord_dev, Env(dev_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\soft_speed, 0.1,
				\root, Pstep([Pwhite(80, 100), Pwhite(80, 100)], [Pkey(\dur)*Pwhite(100, 200), Pkey(\dur)*Pwhite(100, 200)], inf),
				\harmonic_1, 1,
				\harmonic_2, Pstep([Pwhite(1.1, 6.0), Pwhite(1.1, 6.0)], [Pkey(\dur)*Pwhite(100, 200), Pkey(\dur)*Pwhite(10, 200)], inf),
				\harmonic_3, Pstep([Pwhite(1.1, 6.0), Pwhite(1.1, 6.0)], [Pkey(\dur)*Pwhite(100, 200), Pkey(\dur)*Pwhite(100, 200)], inf),
				\harmonic_4, Pstep([Pwhite(1.1, 6.0), Pwhite(1.1, 6.0)], [Pkey(\dur)*Pwhite(100, 200), Pkey(\dur)*Pwhite(100, 200)], inf),
				\numdatapoints, Env(num_points_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\max, Env(max_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\means, Env(max_mean_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\amp, 0,
				\low_pass_mix, 1,
				\low_pass_freq, Env(filter_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \sin),
				\new_data_speed, Pkey(\chord_speed),
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);
});


~pattern_bank_5.add(\3-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dev_env_1, max_mean_env_1, filter_env_1, fast_env_1, low_env_1, mid_env_1, num_points_env_1, max_env_1;
		var dev_high_1 = 0.5, dev_low_1 = 0.0, dev_med_1 = [dev_high_1, dev_low_1].mean;
		var max_mean_high_1 = 20.0, max_mean_low_1 = 0.0, max_mean_med_1 = [max_mean_high_1, max_mean_low_1].mean;
		var num_points_high_1 = 100.0, num_points_low_1 = 1.0, num_points_med_1 = [num_points_high_1, num_points_low_1].mean;
		var filter_high_1 = 30, filter_low_1 = 10000, filter_med_1 = [filter_high_1, filter_low_1].mean;
		var max_high_1 = 4.0, max_low_1 = 2.0, max_med_1 = [max_high_1, max_low_1].mean;

		var set_onset=~onset_5, set_continuation=~set_continuation.next(\5), set_termination=~terminate_5;
		var onset_time=~onset_time_5, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_5;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;

		dev_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dev_low_1, dev_med_1, dev_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dev_low_1, dev_med_1, dev_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dev_low_1, dev_med_1, dev_high_1);

		num_points_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, num_points_low_1, num_points_med_1, num_points_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, num_points_low_1, num_points_med_1, num_points_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, num_points_low_1, num_points_med_1, num_points_high_1);

		max_mean_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, max_mean_low_1, max_mean_med_1, max_mean_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, max_mean_low_1, max_mean_med_1, max_mean_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, max_mean_low_1, max_mean_med_1, max_mean_high_1);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);

		max_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, max_low_1, max_med_1, max_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, max_low_1, max_med_1, max_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, max_low_1, max_med_1, max_high_1);

		dev_env_1.postln;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\pulse4,
			Pbind(
				\instrument, \chord_pulse,
				\chord_speed, 5.0 + 2.0.rand,
				\dur, 1/Pkey(\chord_speed),
				\atk, 0.0005,
				\rel, 0.0005,
				\sus, Pkey(\dur),
				\new_dev, Env(dev_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\chord_dev, Env(dev_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\soft_speed, 0.1,
				\root, Pstep([Pwhite(200, 1000), Pwhite(200, 1000)], [Pkey(\dur)*Pwhite(100, 200), Pkey(\dur)*Pwhite(100, 200)], inf),
				\harmonic_1, 1,
				\harmonic_2, Pstep([Pwhite(1.1, 6.0), Pwhite(1.1, 6.0)], [Pkey(\dur)*Pwhite(100, 200), Pkey(\dur)*Pwhite(10, 200)], inf),
				\harmonic_3, Pstep([Pwhite(1.1, 6.0), Pwhite(1.1, 6.0)], [Pkey(\dur)*Pwhite(100, 200), Pkey(\dur)*Pwhite(100, 200)], inf),
				\harmonic_4, Pstep([Pwhite(1.1, 6.0), Pwhite(1.1, 6.0)], [Pkey(\dur)*Pwhite(100, 200), Pkey(\dur)*Pwhite(100, 200)], inf),
				\numdatapoints, Env(num_points_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\max, Env(max_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\means, Env(max_mean_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
				\amp, 0,
				\high_pass_mix, 1,
				\high_pass_freq, Env(filter_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \sin),
				\new_data_speed, Pkey(\chord_speed),
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);
});