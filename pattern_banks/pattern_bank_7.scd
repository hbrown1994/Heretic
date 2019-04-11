////////////////////////////////////////////////////////////////////////
//SYNTHS: 7 -> Sporadic Formings

~pattern_bank_7.add(\0-> {
	Routine({
		var this_synth = ~synth_counter;
		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\sporadic_0,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pseq([Prand(Array.rand(10, 0.005, 0.01), 10), Prand(Array.series(25, 6, 0.5), 1)], inf),
				\atk, 0.005,
				\rel, Pwhite(0.005, 2.0),
				\sus, Pseq([Prand(Array.rand(10, 1, 5), 20), Prand(Array.series(10, 0.005, 0.01), 1)], inf),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Pseq([Prand(m[\poly][(0..(m[\poly].size-1))]++m[\trans][(0..(m[\trans].size-1))]++m[\megaphone][(0..(m[\megaphone].size-1))]++m[\no_input_glitch][(0..(m[\no_input_glitch].size-1))]++m[\cringle][(0..(m[\cringle].size-1))], 20), m[\silence][0]], inf),
				\rate, Pwrand(Array.rand(10, 0.8, 5.1),  Array.rand(10, 4, 7).normalizeSum, inf),
				\spos, 0,
				\amp, -3,
				\loop, 1,
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


~pattern_bank_7.add(\1-> {
	Routine({
		var this_synth = ~synth_counter;
		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\sporadic_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pseq([Prand(Array.rand(10, 0.001, 0.03), 100), Prand(Array.series(20, 7, 0.5), 1)], inf),
				\atk, 0.005,
				\rel, Pseq([Prand(Array.rand(10, 2, 5), 100), Prand(Array.series(10, 0.005, 0.01), 1)], inf),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Pseq([Prand(m[\BassDrum][(0..(m[\BassDrum].size-1))]++m[\hats][(0..(m[\hats].size-1))]++m[\snare][(0..(m[\snare].size-1))]++m[\Cymbal][(0..(m[\Cymbal].size-1))], 100), m[\silence][0]], inf),
				\rate, Pwrand(Array.series(30, 0.4, 0.1),  Array.rand(30, 4, 7).normalizeSum, inf),
				\spos, 0,
				\amp, -3,
				\loop, Pwrand([0, 1],  [9, 1].normalizeSum, inf),
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


~pattern_bank_7.add(\2-> {


	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2, rate_env_2, rate_env_1,wait_env_2,wait_env_1, spread_env_1;


		var rate_high_1 = 0.1, rate_low_1 = 0.5, rate_med_1 = [rate_high_1, rate_low_1].mean;
		var rate_high_2 = 4.0, rate_low_2 = 1.2, rate_med_2 = [rate_high_2, rate_low_2].mean;


		var spread_high_1 = 2.0, spread_low_1 = 1.0, spread_med_1 = [spread_high_1, spread_low_1].mean;
		var wait_high_1 = 8.0, wait_low_1 = 15.0, wait_med_1 = [wait_high_1, wait_low_1].mean;

		var set_onset=~onset_7, set_continuation=~set_continuation.next(\7), set_termination=~terminate_7;
		var onset_time=~onset_time_7, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_7;

		rate_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, rate_low_1, rate_med_1, rate_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, rate_low_1, rate_med_1, rate_high_1);


		rate_env_2=rate_env_1.replace(rate_high_1, rate_high_2);
		rate_env_2=rate_env_2.replace(rate_med_1, rate_med_2);
		rate_env_2=rate_env_2.replace(rate_low_1, rate_low_2);


		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));


		s.sync;

		spread_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, spread_high_1, spread_med_1, spread_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, spread_low_1, spread_med_1, spread_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, spread_low_1, spread_med_1, spread_high_1);
		wait_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, wait_high_1, wait_med_1, wait_low_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, wait_low_1, wait_med_1, wait_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, wait_low_1, wait_med_1, wait_high_1);

		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\sporadic_2,
			Pbind(
				\instrument, \pattern_buf_stereo,
				\spread, Env(spread_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),

				\wait, Env(wait_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),

				\dur, Pseq([Pexprand(0.05, Pkey(\spread), 20), Pwhite(4.0, Pkey(\wait), 1)], inf),

				\atk, 0.005,
				\sus, (Pkey(\dur) * Pwhite(1.0, 2.0)),
				\rel, 0.005,
				\c1, Prand([1, 2, 3, 4, 5, 6, 7, 8], inf),
				\c2, Prand([-1, -2, -3, -4, -5, -6, -7, -8], inf),
				\buf, Pwrand([Prand(b[\trans_loops_high][(0..(b[\trans_loops_high].size-1))]++b[\no_input_glitch][(0..(b[\no_input_glitch].size-1))]++b[\trans_loops][(0..(b[\trans_loops].size-1))]++b[\no_input_glitch][(0..(b[\no_input_glitch].size-1))], inf), b[\silence][0]], [8, 2].normalizeSum, inf),
				\rate, Pwhite(Env(rate_env_1, [onset_time, continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(rate_env_2, [onset_time,  continuation_time, termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\spos, Pwhite(0.0, s.sampleRate*120),
				\amp, Pseq([Pwhite(-3.0, -6, 20), -120], inf),
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


~pattern_bank_7.add(\3-> {
Routine({
	var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dev_env_1, pitch_env_1, fast_env_1, low_env_1, mid_env_1;
	var dev_high_1 = 1.0, dev_low_1 = 0.2, dev_med_1 = [dev_high_1, dev_low_1].mean;
	var pitch_high_1 = 0.1, pitch_low_1 = 0.07, pitch_med_1 = [pitch_high_1, pitch_low_1].mean;
	var fast_high_1 = 3.0 + 3.0.rand, fast_low_1 = 1.0 + 1.0.rand, fast_med_1 = [fast_high_1, fast_low_1].mean;
	var mid_high_1 = 3.0 + 3.0.rand, mid_low_1 = 1.0 + 1.0.rand, mid_med_1 = [mid_high_1, mid_low_1].mean;
	var low_high_1 = 3.0 + 3.0.rand, low_low_1 = 1.0 + 1.0.rand, low_med_1 = [low_high_1, low_low_1].mean;

	var set_onset=~onset_7, set_continuation=~set_continuation.next(\9), set_termination=~terminate_7;
	var onset_time=~onset_time_7, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_7;

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
		\sporadic_3,
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
			\dur, Pseq([Pwhite(8/Pkey(\trig_speed), 8/Pkey(\trig_speed), 7), Pwhite(5.0, 10.0, 1)], inf),
			\mul, 0.6,
			\atk, 0.005,
			\freeze_speed, Pwrand([0.0, 1.0], [6, 4].normalizeSum, inf),
			\fft_stretch, Pif(Pkey(\freeze_speed) > 0.9, Pwhite(1.0, 5.0), 1.0),
			\amp, Pseq([Pwhite(-3, -9, 7), -120], inf),
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




