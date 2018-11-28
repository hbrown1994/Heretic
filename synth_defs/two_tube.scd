SynthDef(\ntube_1, {

	arg amp=1, atk=0.01, sus=1, rel=0.01, gate=1, out, in, k, loss, length_1, length_2, del, prolongation, bias=0;
	var input, env, sig, rms;

	input = In.ar(in, 1);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);

	rms = RMS.kr(input);

	sig = TwoTube.ar(input: input, k: Clip.kr(rms.linlin(0.0, 0.2, 0.5, 1), 0.5, 1), loss: loss, d1length: Clip.kr(rms.linlin(0.0, 0.2, 100, 300), 100, 300), d2length: Clip.kr(rms.linlin(0.0, 0.2, 200, 500), 200, 500), mul: 1, add: 0)!2;

	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig);
}).add;