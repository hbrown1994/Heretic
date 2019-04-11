SynthDef(\mel_1, {
	arg  trig_speed_array=#[1.0, 1.0, 1.0, 1.0], freq_low=80, freq_high=150, out, del, atk, rel, amp=(-12), gate, half_array=#[1.0, 1.0, 1.0, 1.0], quarter_array=#[1.0, 1.0, 1.0, 1.0], quarter_quin_array=#[1.0, 1.0, 1.0, 1.0], quarter_trip_array=#[1.0, 1.0, 1.0, 1.0], eighth_array=#[1.0, 1.0, 1.0, 1.0], trip_array=#[1.0, 1.0, 1.0, 1.0], sixteenth_array=#[1.0, 1.0, 1.0, 1.0], quin_array=#[1.0, 1.0, 1.0, 1.0], trig_dev_array=#[1.0, 1.0, 1.0, 1.0], pitch_array=#[1, 2, 2, 2, 2, 2, 2, 2, 2], pitch_weights=#[1, 2, 2, 2, 2, 2, 2, 2, 2], noise_speed_array=#[1.0, 1.0, 1.0, 1.0], times_array=#[1, 1, 1];
	var ctls, mods, chans, freq, freq1, trig, trig1, sig, env, half, quarter, quarter_quin, quarter_trip, eighth, trip, sixteenth, quin, trig_dev, noise_speed, mult_trig_1, mult_trig, trig_speed;

	half = EnvGen.kr(Env(half_array, times_array, {[\lin, \sin].choose}), 1);
	quarter = EnvGen.kr(Env(quarter_array, times_array, {[\lin, \sin].choose}), 1);
	quarter_quin = EnvGen.kr(Env(quarter_quin_array, times_array, {[\lin, \sin].choose}), 1);
	quarter_trip = EnvGen.kr(Env(quarter_trip_array, times_array, {[\lin, \sin].choose}), 1);
	eighth = EnvGen.kr(Env(eighth_array, times_array, {[\lin, \sin].choose}), 1);
	trip = EnvGen.kr(Env(trip_array, times_array, {[\lin, \sin].choose}), 1);
	sixteenth = EnvGen.kr(Env(sixteenth_array, times_array, {[\lin, \sin].choose}), 1);
	quin = EnvGen.kr(Env(quin_array, times_array, {[\lin, \sin].choose}), 1);

	trig_dev = EnvGen.kr(Env(trig_dev_array, times_array, {[\lin, \sin].choose}), 1);

	trig_speed = EnvGen.kr(Env(trig_speed_array, times_array, {[\lin, \sin].choose}), 1);

	mult_trig = TWChoose.kr(Impulse.kr(trig_speed/2), [0.5, 1, 1.25, 3/2, 2, 3, 4, 5], [half, quarter, quarter_quin, quarter_trip, eighth, trip, sixteenth, quin], 1);

	mult_trig_1 = TWChoose.kr(Impulse.kr(trig_speed/2), [0.5, 1, 1.25, 3/2, 2, 3, 4, 5], [half, quarter, quarter_quin, quarter_trip, eighth, trip, sixteenth, quin], 1);

	trig = GaussTrig.kr(trig_speed*mult_trig, trig_dev);

	trig1 = GaussTrig.kr(trig_speed*mult_trig_1, trig_dev);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, \lin), gate, doneAction: 2);

	freq = TWChoose.kr(trig, pitch_array, pitch_weights.normalizeSum).lag(TExpRand.kr(2.0, 0.0, trig));
	freq1 = TChoose.kr(trig1, pitch_array, pitch_weights.normalizeSum).lag(TExpRand.kr(2.0, 0.0, trig1));

	noise_speed = EnvGen.kr(Env(noise_speed_array, times_array, {[\lin, \sin].choose}), 1);

	ctls = [
		// freq, phase, amp
		[freq, 0, 1],
		[freq1, 0, 1],
		[SinOsc.kr(noise_speed, 2pi.rand).exprange(0.1, 50), 0, 1],
		[LFTri.kr(noise_speed).exprange(3, 80), 0, 1],
		[SinOsc.kr(noise_speed, 2pi.rand).exprange(0.1, 50), 0, 1],
		[LFTri.kr(noise_speed).exprange(0.3, 10), 0, 1]
	];
	mods = [
		{ LFNoise1.kr(noise_speed).max(0) } ! 6 * LFBrownNoise1.kr(noise_speed).linlin(-1.0, 1.0, 1.74792, 0.0),
		{ LFNoise1.kr(noise_speed).max(0) } ! 6 * LFBrownNoise1.kr(noise_speed).linlin(-1.0, 1.0, 2.27001, 0.0),
		{ LFNoise1.kr(noise_speed-(0.3.rand)).max(0) } ! 6 * LFBrownNoise1.kr(noise_speed-(0.3.rand)).linlin(-1.0, 1.0, 2.27001, 0.0),
		{ LFNoise1.kr(noise_speed-(0.3.rand)).max(0) } ! 6 * LFBrownNoise1.kr(noise_speed-(0.3.rand)).linlin(-1.0, 1.0, 1.74792, 0.0),
		{ LFNoise1.kr(noise_speed-(0.5.rand)).max(0) } ! 6 * LFBrownNoise1.kr(noise_speed-(0.5.rand)).linlin(-1.0, 1.0, 2.27001, 0.0),
		{ LFNoise1.kr(noise_speed-(0.5.rand)).max(0) } ! 6 * LFBrownNoise1.kr(noise_speed-(0.5.rand)).linlin(-1.0, 1.0, 2.27001, 0.0)
	];

	sig = FM7.ar(ctls, mods).slice([0, 1]) * EnvGen.kr(Env.linen(2, 0.01, 5), XFade2.kr(trig, trig1), 2).linlin(0.0, 1.0, 0.7, 1.0);

	sig = sig * env * amp.dbamp;

	Out.ar(out, sig);

}).add;
