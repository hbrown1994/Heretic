SynthDef(\slow_mel, {
	arg del, atk, rel=5, env_rel, trig1_speed, trig2_speed, trig3_speed, trig4_speed, trig5_speed, trig6_speed, trig1_dev, trig2_dev, trig3_dev, trig4_dev, trig5_dev, trig6_dev, dist=0.0, gate=1, amp=(-6), out, freqs=#[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], freqs_weight=#[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], rel_env_low_array=#[1, 1, 1, 1], rel_env_high_array=#[1, 1, 1, 1], times=#[1, 1, 1], trig_dev_env_array=#[1, 1, 1, 1], bend_env_array=#[1, 1, 1, 1];
	var ctls, mods, chans, trig1, trig2, trig3, trig4, trig5, trig6, freqs_minus, env,rel_env_low, rel_env_high, trig_env_dev, bend_env;

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, env_rel, 1, \lin), gate, doneAction: 2);

    trig_env_dev = EnvGen.kr(Env(trig_dev_env_array, times, {[\lin, \sin].choose}), 1);

	trig1= GaussTrig.kr(trig1_speed, trig_env_dev);
	trig2= GaussTrig.kr(trig2_speed, trig_env_dev);
	trig3= GaussTrig.kr(trig3_speed, trig_env_dev);
	trig4= GaussTrig.kr(trig4_speed, trig_env_dev);
	trig5= GaussTrig.kr(trig5_speed, trig_env_dev);
	trig6= GaussTrig.kr(trig6_speed, trig_env_dev);

	rel_env_low = EnvGen.kr(Env(rel_env_low_array, times, {[\lin, \sin].choose}), 1);
	rel_env_high = EnvGen.kr(Env(rel_env_high_array, times, {[\lin, \sin].choose}), 1);

	bend_env = EnvGen.kr(Env(bend_env_array, times, {[\lin, \sin].choose}), 1);


	ctls = [
		// freq, phase, amp
		[TWChoose.kr(trig1, freqs, freqs_weight)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 1.0), rel), trig1).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env) , 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  LFBrownNoise1.kr(0.2).range(rel_env_low, rel_env_high)), trig1)],


		[TWChoose.kr(trig2, freqs, freqs_weight)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 1.0), rel), trig2).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env) , 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  LFBrownNoise1.kr(0.2).range(rel_env_low, rel_env_high)), trig2)],
		[TWChoose.kr(trig3, freqs, freqs_weight)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 1.0), rel), trig3).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env) , 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  LFBrownNoise1.kr(0.2).range(rel_env_low, rel_env_high)), trig3)],
		[TWChoose.kr(trig4, freqs, freqs_weight)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 1.0), rel), trig4).linlin(0.0, 1.0, LFBrownNoise1.kr(0.2).range(1.0, bend_env) , 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  LFBrownNoise1.kr(0.2).range(rel_env_low, rel_env_high)), trig4)],
		[TWChoose.kr(trig5, freqs, freqs_weight)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 1.0), rel), trig5).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env) , 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  LFBrownNoise1.kr(0.2).range(rel_env_low, rel_env_high)), trig5)],
		[TWChoose.kr(trig6, freqs, freqs_weight)- EnvGen.kr(Env.perc(LFBrownNoise1.kr(0.2).range(0.01, 1.0), rel), trig6).linlin(0.0, 1.0,  LFBrownNoise1.kr(0.2).range(1.0, bend_env) , 0.0), {2pi.rand}, EnvGen.kr(Env.perc(0.01,  LFBrownNoise1.kr(0.2).range(rel_env_low, rel_env_high)), trig6)]
	];
	mods = [
		{ EnvGen.kr(Env.perc(0.01, rel), trig1).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel), trig2).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel), trig3).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel), trig4).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel), trig5).linlin(0.0, 1.0, 0.0, dist) } ! 6,
		{ EnvGen.kr(Env.perc(0.01, rel), trig6).linlin(0.0, 1.0, 0.0, dist) } ! 6
	];
	chans = Splay.ar(FM7.ar(ctls, mods)) * -12.dbamp;

	chans = chans * env * amp.dbamp;

	Out.ar(out, chans)

}).load;