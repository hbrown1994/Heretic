////////////////////////////////////////////////////////////////////////
//SYNTHS: 1 -> Sparse Formings
~pattern_bank_1.add(\0-> {
Routine({
	var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, spread_1_env, spread_2_env, wait_1_env, wait_2_env, rel_env_1;
	var spread_1_high = 5.0, spread_1_low = 1.0, spread_1_med = [spread_1_high, spread_1_low].mean;
	var spread_2_high = 8.0, spread_2_low = 3.0, spread_2_med = [spread_2_high, spread_2_low].mean;
	var wait_1_high = 3.0, wait_1_low = 8.0, wait_1_med = [wait_1_high, wait_1_low].mean;
	var wait_2_high = 10.0, wait_2_low = 15.0, wait_2_med = [wait_2_high, wait_2_low].mean;

	var set_onset=~onset_1, set_continuation=~set_continuation.next(\1), set_termination=~terminate_1;
	var onset_time=~onset_time_1, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_1;

	currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

	s.sync;

	spread_1_env = SmalleyPatternOnset.setPatternOnset(set_onset, spread_1_low, spread_1_med, spread_1_high)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, spread_1_low, spread_1_med, spread_1_high)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, spread_1_low, spread_1_med, spread_1_high);

	spread_2_env = SmalleyPatternOnset.setPatternOnset(set_onset, spread_2_low, spread_2_med, spread_2_high)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, spread_2_low, spread_2_med, spread_2_high)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, spread_2_low, spread_2_med, spread_2_high);

	wait_1_env = SmalleyPatternOnset.setPatternOnset(set_onset, wait_1_low, wait_1_med, wait_1_high)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, wait_1_low, wait_1_med, wait_1_high)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, wait_1_low, wait_1_med, wait_1_high);

	wait_2_env = SmalleyPatternOnset.setPatternOnset(set_onset, wait_2_low, wait_2_med, wait_2_high)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, wait_2_low, wait_2_med, wait_2_high)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, wait_2_low, wait_2_med, wait_2_high);


	s.sync;

	spread_1_env.postln;

	currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
		\bomb_3,
		Pbind(
			\instrument, \bomb_mix_2,
			\spread_1, Env(spread_1_env, [onset_time, continuation_time, termination_time], [\lin, \sin].choose),
			\spread_2, Env(spread_2_env, [onset_time, continuation_time, termination_time], [\lin, \sin].choose),

			\wait_1, Env(wait_1_env, [onset_time, continuation_time, termination_time], [\lin, \sin].choose),
			\wait_2, Env(wait_2_env, [onset_time, continuation_time, termination_time], [\lin, \sin].choose),

			\dur, Pseq([Pwhite(Pkey(\spread_1), Pkey(\spread_2), 1), Pexprand(Pkey(\wait_1), Pkey(\wait_2), 1)], inf),
			\atk, 0.005,
			\rel, 0.005,
			\sus, Pkey(\dur),

			\sig1_impulse, Pwhite(0.1, 5.0),
			\sig1_rate, Pwhite(0.1, 10.0),
			\sig1_noise_freq_1, Pwhite(0.1, 4.0),
			\sig1_noise_freq_1, Pwhite(0.1, 4.0),

			\sig2_freq, Pwhite(35, 50),
			\sig2_fb, Pexprand(1.5, 0.0),

			\sig3_rate_1, Pwhite(0.001, 0.2),
			\sig3_rate_2, Pwhite(0.001, 0.2),
			\sig3_rate_3, Pwhite(0.1, 0.4),
			\sig3_rate_3, Pwhite(0.1, 1.9),

			\sig4_rate_1, Pwhite(1.0, 200.0),
			\sig4_rate_2, Pwhite(19.0, 28.0),

			\mix_1, 1.0,
			\mix_2, Pxrand([0.0, 1.0], inf),
			\mix_3, Pwrand([0.0, 1.0], [2, 8].normalizeSum, inf),
			\pan_pos_speed, Pwhite(0.1, 2.0),
			\amp, Pseq([-3, -120], inf),
			\group, ~pattern_node,
			\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
		);
	).play(TempoClock);
	);

	s.sync;

	currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol));

}).play(SystemClock);

});


~pattern_bank_1.add(\1-> {
	Routine({
		var this_synth = ~synth_counter, spread_env_1, wait_env_1;
		var spread_high_1 = 0.2, spread_low_1 = 0.007, spread_med_1 = [spread_high_1, spread_low_1].mean;
		var wait_high_1 = 7.0, wait_low_1 = 12.0, wait_med_1 = [wait_high_1, wait_low_1].mean;
		var set_onset=~onset_1, set_continuation=~set_continuation.next(\1), set_termination=~terminate_1;
		var onset_time=~onset_time_1, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_1;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		spread_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, spread_high_1, spread_med_1, spread_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, spread_low_1, spread_med_1, spread_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, spread_low_1, spread_med_1, spread_high_1);
		wait_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, wait_high_1, wait_med_1, wait_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, wait_low_1, wait_med_1, wait_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, wait_low_1, wait_med_1, wait_high_1);
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\sparse1,
			Pbind(
				\instrument, \pattern_buf,
				\spread, Env(spread_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),

				\wait, Env(wait_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),

				\dur, Pseq([Pwhite(0.005, Pkey(\spread), 20), Pwhite(4.0, Pkey(\wait), 1)], inf),
				\atk, 0.005,
				\sus, Pexprand(0.005, 4.0),
				\rel, Pwhite(0.005, 0.5),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Pxrand(m[\struck][(0..(m[\struck].size-1))]++m[\rod][(0..(m[\rod].size-1))], inf),
				\rate, Pwhite(0.4, 5.0),
				\spos, 0,
				\c1, Pwhite(1, 8),
				\c2, Pwhite(-1, -8),
				\amp, Pexprand(-6, -18),
				\loop, Pif(Pkey(\dur) > 1.0, 1, 0),
				\pan_pos, Pwhite(-1.0, 1.0),
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

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);

});


~pattern_bank_1.add(\2-> {
	Routine({
		var this_synth = ~synth_counter, spread_env_1, wait_env_1;
		var spread_high_1 = 0.2, spread_low_1 = 0.007, spread_med_1 = [spread_high_1, spread_low_1].mean;
		var wait_high_1 = 7.0, wait_low_1 = 12.0, wait_med_1 = [wait_high_1, wait_low_1].mean;
		var set_onset=~onset_1, set_continuation=~set_continuation.next(\1), set_termination=~terminate_1;
		var onset_time=~onset_time_1, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_1;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		spread_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, spread_high_1, spread_med_1, spread_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, spread_low_1, spread_med_1, spread_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, spread_low_1, spread_med_1, spread_high_1);
		wait_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, wait_high_1, wait_med_1, wait_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, wait_low_1, wait_med_1, wait_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, wait_low_1, wait_med_1, wait_high_1);
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\sparse2,
			Pbind(
				\instrument, \pattern_buf,
				\spread, Env(spread_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),

				\wait, Env(wait_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),

				\dur, Pseq([Pwhite(0.005, Pkey(\spread), 40), Pwhite(4.0, Pkey(\wait), 1)], inf),
				\atk, 0.005,
				\rel, Pexprand(0.005, 4.0),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Pxrand(m[\BassDrum][(0..(m[\BassDrum].size-1))]++m[\snare][(0..(m[\snare].size-1))]++m[\hats][(0..(m[\hats].size-1))], inf),
				\rate, Pwrand(Array.series(50, 0.4, 0.1),  Array.rand(50, 4, 7).normalizeSum, inf),
				\spos, 0,
				\amp, Pexprand(-6, -18),
				\loop, Pif(Pkey(\dur) > 1.0, 1, 0),
				\pan_pos, Pwhite(-1.0, 1.0),
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

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);

});



~pattern_bank_1.add(\3-> {
	Routine({
		var this_synth = ~synth_counter, spread_env_1, wait_env_1, dur_env_2, dur_env_1, wait_env_2;
		var spread_high_1 = 0.2, spread_low_1 = 0.007, spread_med_1 = [spread_high_1, spread_low_1].mean;
		var dur_high_1 = 0.3, dur_low_1 = 3.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 0.8, dur_low_2 = 9.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var wait_high_1 = 0.2, wait_low_1 = 6.0, wait_med_1 = [wait_high_1, wait_low_1].mean;
		var wait_high_2 = 1.0, wait_low_2 = 10.0, wait_med_2 = [wait_high_2, wait_low_2].mean;
		var set_onset=~onset_1, set_continuation=~set_continuation.next(\1), set_termination=~terminate_1;
		var onset_time=~onset_time_1, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_1;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		spread_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, spread_high_1, spread_med_1, spread_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, spread_low_1, spread_med_1, spread_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, spread_low_1, spread_med_1, spread_high_1);
		wait_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, wait_high_1, wait_med_1, wait_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, wait_low_1, wait_med_1, wait_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, wait_low_1, wait_med_1, wait_high_1);
		s.sync;


		dur_env_1.postln;

		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);


		wait_env_2=wait_env_1.replace(wait_high_1, wait_high_2);
		wait_env_2=wait_env_2.replace(wait_med_1, wait_med_2);
		wait_env_2=wait_env_2.replace(wait_low_1, wait_low_2);


		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\sparse_3,
			Pbind(
				\instrument, \pattern_buf,
				\wait_high, Env(wait_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),
				\wait_low, Env(wait_env_2, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),
				\dur, Pseq([Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), 1), Pwhite(Pkey(\wait_low), Pkey(\wait_high), 1)], inf),
				\atk, 0.005,
				\sus, Pkey(\dur),
				\rel, Pwhite(0.005, 2.0),
				\c1, Pwhite(1, 8),
				\c2, Pwhite(-1, -8),
				\buf, Pxrand(m[\memory_moog_sparse_formings][(0..(m[\memory_moog_sparse_formings].size-1))], inf),
				\rate, Pwrand([Pwhite(0.6, 1.3), Pwhite(-0.6, -1.3)], [8, 2].normalizeSum, inf),
				\spos, Pif(Pkey(\rate) < 0, s.sampleRate*120, 0),
				\loop, 0,
				\amp, 0,
				\pan_pos, Pwhite(-1.0, 1.0),
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

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);

});


