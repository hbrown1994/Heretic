SynthDef(\klank, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, grain_speed=1, grain_dur=0.1, amp_input, del, prolongation, bias=0;
	var sig, env, in, grain_trig, sig_1, sig_2, amp_in;

	in = In.ar(input);
	amp_in = Dust.kr(2);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2)!2;

	sig = DynKlank.ar(`[

		[
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 200, 300),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 300, 400),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 400, 500),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 500, 600),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 600, 700),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 700, 800),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 800, 900),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 900, 1000),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 1000, 1100),
			LFBrownNoise1.kr({Rand(0.2, 0.5)}).linlin(-1, 1, 1100, 1200),
		],
		nil,
		Array.rand(10, 5, 10)],
	in);

	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig);

}).add;