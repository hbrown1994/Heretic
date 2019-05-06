////////////////////////////////////////////////////////////////////////
//SYNTHS: 8 -> transgressive Formings

~pattern_bank_8.add(\0-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, sus_env_2,sus_env_1;
		var dur_high_1 = 5.0, dur_low_1 = 10.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 2.0, dur_low_2 = 5.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var atk_high_1=2.0, atk_low_1=20.0, atk_med_1 = [atk_high_1, atk_low_1].mean;
		var atk_high_2=0.005, atk_low_2=10.0, atk_med_2 = [atk_high_2, atk_low_2].mean;
		var rel_high_1=1.0, rel_low_1=20.0, rel_med_1 = [rel_high_1, rel_low_1].mean;
		var rel_high_2=0.005, rel_low_2=10.0, rel_med_2 = [rel_high_2, rel_low_2].mean;
		var sus_high_1=10.0, sus_low_1=20.0, sus_med_1 = [sus_high_1, sus_low_1].mean;
		var sus_high_2=5.0, sus_low_2=10.0, sus_med_2 = [sus_high_2, sus_low_2].mean;
		var filter_high_1=20000, filter_low_1=500, filter_med_1 = [filter_high_1, filter_low_1].mean;
		var set_onset=~onset_8, set_continuation=~set_continuation.next(\8), set_termination=~terminate_8;
		var onset_time=~onset_time_8, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_8;
		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		atk_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, atk_low_1, atk_med_1, atk_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, atk_low_1, atk_med_1, atk_high_1);
		rel_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rel_low_1, rel_med_1, rel_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rel_low_1, rel_med_1, rel_high_1);
		sus_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, sus_high_1, sus_med_1, sus_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, sus_low_1, sus_med_1, sus_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, sus_low_1, sus_med_1, sus_high_1);
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

		sus_env_2=sus_env_1.replace(sus_high_1, sus_high_2);
		sus_env_2=sus_env_2.replace(sus_med_1, sus_med_2);
		sus_env_2=sus_env_2.replace(sus_low_1, sus_low_2);

		s.sync;

		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\trans_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pwhite(Env(atk_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(atk_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\rel, Pexprand(Env(rel_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(rel_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\sus, Pexprand(Env(sus_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(sus_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\c1, Prand([1, 2, 3, 4, 5, 6, 7, 8], inf),
				\c2, Prand([-1, -2, -3, -4, -5, -6, -7, -8], inf),
				\buf, Prand(m[\trans][(0..(m[\trans].size-1))], inf),
				\rate, Prand([Pwhite(0.8, 1.5), Pwhite(-0.8, -1.5)], inf),
				\spos, Pwhite(0, s.sampleRate*60),
				\amp, -3,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, Env(filter_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),
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

~pattern_bank_8.add(\1-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1,wait_env_2,wait_env_1;
		var dur_high_1 = 0.5, dur_low_1 = 9.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 0.005, dur_low_2 = 3.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		var filter_high_1=20000, filter_low_1=3000, filter_med_1 = [filter_high_1, filter_low_1].mean;
		var rate_high_1 = 0.1, rate_low_1 = 0.5, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 4.0, rate_low_2 = 1.2, rate_med_2 = [rate_high_2, rate_low_2].mean;

		var set_onset=~onset_8, set_continuation=~set_continuation.next(\8), set_termination=~terminate_8;
		var onset_time=~onset_time_8, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_8;

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);

		s.sync;

		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\trans_2,
			Pbind(
				\instrument, \pattern_buf_stereo,
				\dur, Pexprand(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\atk, 0.005,
				\sus, Pkey(\dur),
				\rel, 0.005,
				\c1, Prand([1, 2, 3, 4, 5, 6, 7, 8], inf),
				\c2, Prand([-1, -2, -3, -4, -5, -6, -7, -8], inf),
				\buf, Pwrand([Prand(b[\trans_loops][(0..(b[\trans_loops].size-1))]++b[\no_input_glitch][(0..(b[\no_input_glitch].size-1))], inf), b[\silence][0]], [8, 2].normalizeSum, inf),
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(rate_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\spos, Pwhite(0.0, s.sampleRate*120),
				\amp, -3,
				\loop, 1,
				\low_pass_mix, 1,
				\low_pass_freq, Env(filter_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),
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


~pattern_bank_8.add(\2-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1,wait_env_2,wait_env_1;
		var dur_high_1 = 0.5, dur_low_1 = 9.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
		var dur_high_2 = 0.005, dur_low_2 = 3.0, dur_med_2 = [dur_high_2, dur_low_2].mean;

		var rate_high_1 = 0.1, rate_low_1 = 0.5, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 4.0, rate_low_2 = 1.2, rate_med_2 = [rate_high_2, rate_low_2].mean;

		var set_onset=~onset_8, set_continuation=~set_continuation.next(\8), set_termination=~terminate_8;
		var onset_time=~onset_time_8, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_8;

		s.sync;

		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);

		s.sync;

		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\trans_2,
			Pbind(
				\instrument, \pattern_buf_stereo,
				\dur, Pexprand(Env(dur_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\atk, 0.005,
				\sus, Pkey(\dur),
				\rel, 0.005,
				\c1, Prand([1, 2, 3, 4, 5, 6, 7, 8], inf),
				\c2, Prand([-1, -2, -3, -4, -5, -6, -7, -8], inf),
				\buf, Pwrand([Prand(b[\trans_loops_high][(0..(b[\trans_loops_high].size-1))]++b[\no_input_glitch][(0..(b[\no_input_glitch].size-1))], inf), b[\silence][0]], [8, 2].normalizeSum, inf),
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(rate_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\spos, Pwhite(0.0, s.sampleRate*120),
				\amp, -3,
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

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol))

	}).play(SystemClock);
});





