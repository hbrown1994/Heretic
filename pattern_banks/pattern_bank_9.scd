////////////////////////////////////////////////////////////////////////
//SYNTHS: 9 -> Bombastic Formings

~pattern_bank_9.add(\0-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1, sus_env_2, sus_env_1;
		var dur_high_1 = 0.05, dur_low_1 = 0.6, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 1.0, dur_low_2 = 3.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var atk_high_1=0.005, atk_low_1=0.005, atk_med_1 = [atk_high_1, atk_low_1].mean;
		var atk_high_2=0.005, atk_low_2=2.0, atk_med_2 = [atk_high_2, atk_low_2].mean;
		var rel_high_1=0.005, rel_low_1=0.5, rel_med_1 = [rel_high_1, rel_low_1].mean;
		var rel_high_2=0.005, rel_low_2=1.0, rel_med_2 = [rel_high_2, rel_low_2].mean;
		var sus_high_1=0.3, sus_low_1=2.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2=2.5, sus_low_2=5.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var filter_high_1=21000, filter_low_1=500.0, filter_med_1 = [filter_high_1, filter_low_1].mean;
		var rate_high_1 = 0.8, rate_low_1 = 0.3, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 4.0, rate_low_2 = 1.0, rate_med_2 = [rate_high_2, rate_low_2].mean;
		var set_onset=~onset_9, set_continuation=~set_continuation.next(\9), set_termination=~terminate_9;
		var onset_time=~onset_time_9, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_9;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		atk_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, atk_low_1, atk_med_1,atk_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, atk_low_1, atk_med_1, atk_high_1);

		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);

		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);

		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);


		s.sync;

		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		atk_env_2=atk_env_1.replace(atk_high_1, atk_high_2);
		atk_env_2=atk_env_2.replace(atk_med_1, atk_med_2);
		atk_env_2=atk_env_2.replace(atk_low_1, atk_low_2);

		rel_env_2=rel_env_1.replace(rel_high_1, rel_high_2);
		rel_env_2=rel_env_2.replace(rel_med_1, rel_med_2);
		rel_env_2=rel_env_2.replace(rel_low_1, rel_low_2);

		sus_env_2=sus_env_1.replace(sus_high_1, sus_high_2);
		sus_env_2=sus_env_2.replace(sus_med_1, sus_med_2);
		sus_env_2=sus_env_2.replace(sus_low_1, sus_low_2);

		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);

		dur_env_1.postln;

		s.sync;

		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\bomb_0,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pexprand(Env(dur_env_1, [onset_time, continuation_time, termination_time], \sin), Env(dur_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\atk, Pexprand(Env(atk_env_1, [onset_time, continuation_time, termination_time], \sin), Env(atk_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\rel, Pwhite(Env(rel_env_1, [onset_time, continuation_time, termination_time], \sin), Env(rel_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\sus, Pwhite(Env(sus_env_1, [onset_time, continuation_time, termination_time], \sin), Env(sus_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\c1, Prand([1, 2, 3, 4, 5, 6, 7, 8], inf),
				\c2, Prand([-1, -2, -3, -4, -5, -6, -7, -8], inf),
				\buf, m[\drums][0],
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], \sin), Env(rate_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\spos, Pwhite(0, s.sampleRate*120.0),
				\amp, -3,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, Env(filter_env_1, [onset_time, continuation_time, termination_time], \sin),
				\high_pass_mix, 0,
				\high_pass_freq, 40.0,
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);

});


~pattern_bank_9.add(\1-> {
	//normalize moog and no input samples
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1, sus_env_2, sus_env_1;
		var dur_high_1 = 0.005, dur_low_1 = 0.4, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 0.07, dur_low_2 = 2.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var atk_high_1=0.005, atk_low_1=0.005, atk_med_1 = [atk_high_1, atk_low_1].mean;
		var atk_high_2=0.005, atk_low_2=2.0, atk_med_2 = [atk_high_2, atk_low_2].mean;
		var rel_high_1=0.005, rel_low_1=0.5, rel_med_1 = [rel_high_1, rel_low_1].mean;
		var rel_high_2=0.5, rel_low_2=1.0, rel_med_2 = [rel_high_2, rel_low_2].mean;
		var sus_high_1=0.005, sus_low_1=2.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2=0.2, sus_low_2=5.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var filter_high_1=30.0, filter_low_1=4000.0, filter_med_1 = [filter_high_1, filter_low_1].mean;
		var rate_high_1 = 0.8, rate_low_1 = 0.1, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 4.0, rate_low_2 = 0.4, rate_med_2 = [rate_high_2, rate_low_2].mean;
		var set_onset=~onset_9, set_continuation=~set_continuation.next(\9), set_termination=~terminate_9;
		var onset_time=~onset_time_9, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_9;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		atk_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, atk_low_1, atk_med_1,atk_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, atk_low_1, atk_med_1, atk_high_1);

		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);

		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);

		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);


		s.sync;

		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		atk_env_2=atk_env_1.replace(atk_high_1, atk_high_2);
		atk_env_2=atk_env_2.replace(atk_med_1, atk_med_2);
		atk_env_2=atk_env_2.replace(atk_low_1, atk_low_2);

		rel_env_2=rel_env_1.replace(rel_high_1, rel_high_2);
		rel_env_2=rel_env_2.replace(rel_med_1, rel_med_2);
		rel_env_2=rel_env_2.replace(rel_low_1, rel_low_2);

		sus_env_2=sus_env_1.replace(sus_high_1, sus_high_2);
		sus_env_2=sus_env_2.replace(sus_med_1, sus_med_2);
		sus_env_2=sus_env_2.replace(sus_low_1, sus_low_2);

		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);

		dur_env_1.postln;
		atk_env_1.postln;
		rel_env_1.postln;
		sus_env_1.postln;
		filter_env_1.postln;


		s.sync;

		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\bomb_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pexprand(Env(dur_env_1, [onset_time, continuation_time, termination_time], \sin), Env(dur_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\atk, Pexprand(Env(atk_env_1, [onset_time, continuation_time, termination_time], \sin), Env(atk_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\rel, Pwhite(Env(rel_env_1, [onset_time, continuation_time, termination_time], \sin), Env(rel_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\sus, Pwhite(Env(sus_env_1, [onset_time, continuation_time, termination_time], \sin), Env(sus_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\c1, Prand([1, 2, 3, 4, 5, 6, 7, 8], inf),
				\c2, Prand([-1, -2, -3, -4, -5, -6, -7, -8], inf),
				\buf,  Pxrand(m[\bombastic][(0..(m[\bombastic].size-1))]++m[\memory_moog_bombastic_formings][(0..(m[\memory_moog_bombastic_formings].size-1))]++m[\memory_moog_transgressive_formings][(0..(m[\memory_moog_transgressive_formings].size-1))], inf),
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], \sin), Env(rate_env_2, [onset_time,  continuation_time, termination_time], \sin)),
				\spos, Pwhite(0, s.sampleRate*m[\plastics][0].duration),
				\amp, -3,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 21000,
				\high_pass_mix, 1,
				\high_pass_freq, Env(filter_env_1, [onset_time, continuation_time, termination_time], \sin),
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);
});


~pattern_bank_9.add(\2-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, spread_1_env, spread_2_env, wait_1_env, wait_2_env, rel_env_1;
		var spread_1_high = 0.005, spread_1_low = 0.1, spread_1_med = [spread_1_high, spread_1_low].mean;
		var spread_2_high = 0.1, spread_2_low = 1.0, spread_2_med = [spread_2_high, spread_2_low].mean;
		var wait_1_high = 0.5, wait_1_low = 4.0, wait_1_med = [wait_1_high, wait_1_low].mean;
		var wait_2_high = 4.0, wait_2_low = 7.0, wait_2_med = [wait_2_high, wait_2_low].mean;
		var rel_high_1=0.7, rel_low_1=0.3, rel_med_1 = [rel_high_1, rel_low_1].mean;

		var set_onset=~onset_9, set_continuation=~set_continuation.next(\9), set_termination=~terminate_9;
		var onset_time=~onset_time_9, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_9;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		spread_1_env = SmalleyPatternOnset.setPatternOnset(set_onset, spread_1_low, spread_1_med, spread_1_high)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, spread_1_low, spread_1_med, spread_1_high)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, spread_1_low, spread_1_med, spread_1_high);

		spread_2_env = SmalleyPatternOnset.setPatternOnset(set_onset, spread_2_low, spread_2_med, spread_2_high)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, spread_2_low, spread_2_med, spread_2_high)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, spread_2_low, spread_2_med, spread_2_high);

		wait_1_env = SmalleyPatternOnset.setPatternOnset(set_onset, wait_1_low, wait_1_med, wait_1_high)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, wait_1_low, wait_1_med, wait_1_high)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, wait_1_low, wait_1_med, wait_1_high);

		wait_2_env = SmalleyPatternOnset.setPatternOnset(set_onset, wait_2_low, wait_2_med, wait_2_high)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, wait_2_low, wait_2_med, wait_2_high)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, wait_2_low, wait_2_med, wait_2_high);

		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);

		s.sync;

		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\bomb_2,
			Pbind(
				\instrument, \WeaklyNonlinear,
				\spread_1, Env(spread_1_env, [onset_time, continuation_time, termination_time], [\lin, \sin].choose),
				\spread_2, Env(spread_2_env, [onset_time, continuation_time, termination_time], [\lin, \sin].choose),

				\wait_1, Env(wait_1_env, [onset_time, continuation_time, termination_time], [\lin, \sin].choose),
				\wait_2, Env(wait_2_env, [onset_time, continuation_time, termination_time], [\lin, \sin].choose),

				\dur, Pseq([Pwhite(Pkey(\spread_1), Pkey(\spread_2), 40), Pexprand(Pkey(\wait_1), Pkey(\wait_2), 1)], inf),
				\atk, 0.0005,
				\rel, Pexprand(Env(rel_env_1, [onset_time, continuation_time, termination_time], [\lin, \sin].choose), 0.001),
				\sus, Pkey(\dur),
				\sig1_osc_freq_1, Pwhite(30.0,2000.0),
				\sig1_osc_freq_2, Pwhite(30.0,2000.0),
				\sig2_osc_freq_1, Pwhite(0.1,2000.0),
				\sig2_osc_freq_2, Pwhite(0.1,2000.0),
				\sig3_osc_freq_1, Pwhite(30.0,2000.0),
				\sig3_osc_freq_2, Pwhite(30.0,2000.0),
				\sig4_osc_freq_1, Pwhite(30.0,8080.0),
				\sig4_osc_freq_1, Pwhite(0.0,1.0),
				\sig3_noise_freq, Pwhite(0.1,10.0),
				\lag_1, Pkey(\dur),
				\lag_2, Pkey(\dur),
				\lag_3, Pkey(\dur),
				\lag_4, Pkey(\dur),
				\mix_1, Pwhite(0.0,1.0),
				\mix_2, Pwhite(0.0,1.0),
				\mix_3, Pwhite(0.0,1.0),
				\pan_pos, Pwhite(-1.0,1.0),
				\amp, -9,
				\group, ~pattern_node,
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
			);
		).play(TempoClock);
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);
});

~pattern_bank_9.add(\3-> {

Routine({
	var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dev_env_1, pitch_env_1, fast_env_1, low_env_1, mid_env_1;
	var dev_high_1 = 1.0, dev_low_1 = 0.2, dev_med_1 = [dev_high_1, dev_low_1].mean;
	var pitch_high_1 = 0.1, pitch_low_1 = 0.07, pitch_med_1 = [pitch_high_1, pitch_low_1].mean;
	var fast_high_1 = 3.0 + 3.0.rand, fast_low_1 = 1.0 + 1.0.rand, fast_med_1 = [fast_high_1, fast_low_1].mean;
	var mid_high_1 = 3.0 + 3.0.rand, mid_low_1 = 1.0 + 1.0.rand, mid_med_1 = [mid_high_1, mid_low_1].mean;
	var low_high_1 = 3.0 + 3.0.rand, low_low_1 = 1.0 + 1.0.rand, low_med_1 = [low_high_1, low_low_1].mean;

	var set_onset=~onset_9, set_continuation=~set_continuation.next(\9), set_termination=~terminate_9;
	var onset_time=~onset_time_9, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_9;

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
		\drum1,
		Pbind(
			\instrument, \drum_bomb,
			\trig_speed, Pwhite(5.0, 20.0),
			\half, Pwhite(1.0, 4.0),
			\quarter, Pwhite(6.0, 10.0),
			\freq, Pexprand(5000.0, 40.0),
			\quarter_trip, Env(low_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
			\quarter_quin, Env(low_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
			\eighth, Env(mid_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
			\trip, Env(mid_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
			\sixteenth, Env(fast_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
			\quin, Env(fast_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
			\trig_dev, Env(dev_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
			\pitch_high, Env(pitch_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], \lin),
			\dur, 8/Pkey(\trig_speed),
			\mul, 0.6,
			\atk, 0.005,
			\freeze_speed, Pwrand([0.0, 1.0], [8, 2].normalizeSum, inf),
			\fft_stretch, Pif(Pkey(\freeze_speed) == 1.0, Pwhite(1.0, 5.0), 1.0),
			\sus, Pif(Pkey(\freeze_speed) > 0.9, Pkey(\dur) * Pwhite(1.0, 1.5), Pkey(\dur)), //Pkey(\dur),
			\pan_pos, Pwhite(0.1, 10.0),
			\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
		);
	).play(TempoClock);
	);

	s.sync;

	currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

}).play(SystemClock);


});




