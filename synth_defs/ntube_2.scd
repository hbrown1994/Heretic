SynthDef(\ntube_2, {

	arg amp=1, atk=0.01, sus=1, rel=0.01, gate=1, out, in, k, loss, length_1, length_2, del, prolongation, bias, length_1_low, length_1_high, length_2_low, length_2_high, speed;
	var input, env, sig, rms;

	input = In.ar(in, 1);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);

	rms = RMS.kr(input);

	sig = TwoTube.ar(input: input, k: LFBrownNoise1.kr(speed).linlin(0.0, 1.0, 0.5, 1), loss: loss, d1length: LFBrownNoise1.kr(speed).linlin(0.0, 1.0, length_1_low, length_1_high), d2length: LFBrownNoise1.kr(speed).linlin(0.0, 1.0, length_2_low, length_2_high), mul: 1, add: 0)!2;

	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig);
}).add;

