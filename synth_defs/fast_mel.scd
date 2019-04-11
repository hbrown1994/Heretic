SynthDef(\fast_mel, {
	arg del, atk, rel=5, env_rel, trig1_speed, trig2_speed, trig3_speed, trig4_speed, trig5_speed, trig6_speed, trig1_dev, trig2_dev, trig3_dev, trig4_dev, trig5_dev, trig6_dev, dist=0.0, gate=1, amp=(0), out, rel_low=5.0, rel_high=8.0, trig_speed_low, trig_speed_high, freq_array_choose=0, onset_time = ~onset_time_4, continuation_time = currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), termination_time=~terminate_time_4, set_onset=~onset_4, set_continuation= ~continuation_4, set_termination=~terminate_4, freq_env_array=#[0, 1, 2, 3], freq_env_times = #[1, 1, 1], trig_speed_med, trig_low_env_array = #[1, 1, 1], trig_high_env_array= #[1, 1, 1], trig_dev_env_array=#[1, 1, 1], freqs= #[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], freqs_weight=#[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], dist_env_array=#[1, 1, 1], wet_env_array=#[1, 1, 1], delaytime_env_array=#[1, 1, 1], delayfactor_env_array=#[1, 1, 1], delaytime, bend_env_array=#[1, 1, 1];
	var ctls, mods, chans, trig1, trig2, trig3, trig4, trig5, trig6, freqs_minus, env,rel_weight, select, freq_env, env_plot, trig_env_low, trig_env_high, trig_env_dev, dist_env, wet_env, delaytime_env, delayfactor_env, bend_env;

	rel_weight=Array.linrand(30, 0.3, 1.0).normalizeSum;

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, env_rel, 1, \lin), gate, doneAction: 2);

	trig_env_low = EnvGen.kr(Env(trig_low_env_array, freq_env_times, {[\lin, \sin].choose}), 1);
	trig_env_high= EnvGen.kr(Env(trig_high_env_array, freq_env_times, {[\lin, \sin].choose}), 1);
	trig_env_dev = EnvGen.kr(Env(trig_dev_env_array, freq_env_times, {[\lin, \sin].choose}), 1);

	trig1= GaussTrig.kr(LFBrownNoise1.kr(0.1).range(trig_env_low, trig_env_high), (trig_env_dev - {0.1.rand}));
	trig2= GaussTrig.kr(LFBrownNoise1.kr(0.1).range(trig_env_low, trig_env_high), (trig_env_dev + {0.1.rand}));
	trig3= GaussTrig.kr(LFBrownNoise1.kr(0.1).range(trig_env_low, trig_env_high), (trig_env_dev - {0.2.rand}));
	trig4= GaussTrig.kr(LFBrownNoise1.kr(0.1).range(trig_env_low, trig_env_high), (trig_env_dev + {0.2.rand}));
	trig5= GaussTrig.kr(LFBrownNoise1.kr(0.1).range(trig_env_low, trig_env_high), (trig_env_dev - {0.3.rand}));
	trig6= GaussTrig.kr(LFBrownNoise1.kr(0.1).range(trig_env_low, trig_env_high), (trig_env_dev + {0.3.rand}));

	freq_env = EnvGen.kr(Env(freq_env_array, freq_env_times, {[\lin, \sin].choose}), 1);
	select = SelectX.kr(freq_env, [freqs.slice((0..3)), freqs.slice((0..4)), freqs.slice((0..6)), freqs.slice((0..8)), freqs.slice((0..11)), freqs.slice((0..13)), freqs.slice((0..15)), freqs.slice((0..17))]);

	dist_env = EnvGen.kr(Env(dist_env_array, freq_env_times, {[\lin, \sin].choose}), 1);

	bend_env = EnvGen.kr(Env(bend_env_array, freq_env_times, {[\lin, \sin].choose}), 1);


	ctls = [
		// freq, phase, amp
		[
			TWChoose.kr(trig1, select, select.normalizeSum)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 0.5), rel), trig1).linlin(0.0, 1.0, LFBrownNoise1.kr(0.2).range(1.0, 12), 0.0),
			{2pi.rand},
			EnvGen.kr(Env.perc(0.01, TWChoose.kr(trig1, Array.interpolation(30, rel_low, rel_high), rel_weight)), trig1)],

		[TWChoose.kr(trig2, select, select.normalizeSum) - EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 0.5), rel_high), trig2).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env), 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  TWChoose.kr(trig2, Array.interpolation(30, rel_low, rel_high), rel_weight)), trig2)],
		[TWChoose.kr(trig3, select, select.normalizeSum)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 0.5), rel_high), trig3).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env), 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  TWChoose.kr(trig3, Array.interpolation(30, rel_low, rel_high), rel_weight)), trig3)],
		[TWChoose.kr(trig4, select, select.normalizeSum)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 0.5), rel_high), trig4).linlin(0.0, 1.0, LFBrownNoise1.kr(0.2).range(1.0, bend_env), 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  TWChoose.kr(trig4, Array.interpolation(30, rel_low, rel_high), rel_weight)), trig4)],
		[TWChoose.kr(trig5, select, select.normalizeSum)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 0.5), rel_high), trig5).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env), 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  TWChoose.kr(trig5, Array.interpolation(30, rel_low, rel_high), rel_weight)), trig5)],
		[TWChoose.kr(trig6, select, select.normalizeSum)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 0.5), rel_high), trig6).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env), 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  TWChoose.kr(trig6, Array.interpolation(30, rel_low, rel_high), rel_weight)), trig6)]
	];
	mods = [
		{ EnvGen.kr(Env.perc(0.01, rel_high), trig1).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel_high), trig2).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel_high), trig3).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel_high), trig4).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel_high), trig5).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel_high), trig6).linlin(0.0, 1.0, 0.0, dist) } ! 6
	];
	chans = Splay.ar(FM7.ar(ctls, mods)) * -12.dbamp;

	wet_env = EnvGen.kr(Env(wet_env_array, freq_env_times, {[\lin, \sin].choose}), 1);
	delaytime_env = EnvGen.kr(Env(delaytime_env_array, freq_env_times, {[\lin, \sin].choose}), 1);
	delayfactor_env = EnvGen.kr(Env(delayfactor_env_array, freq_env_times, {[\lin, \sin].choose}), 1);

	chans = SwitchDelay.ar(chans, 1, wet_env, delaytime: delaytime, delayfactor: delayfactor_env);

	chans = chans * env * amp.dbamp;

	Out.ar(out, chans)

}).load;