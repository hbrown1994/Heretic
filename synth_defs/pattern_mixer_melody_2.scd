SynthDef(\pattern_mixer_melody_2, {
	arg input_bus, out=0, del=0, atk=0.5, rel=0.5, gate=1, prolongation=(-8), bias=0, pattern=1, strength, freq=100, rq=0.005, stretch=1, bend_speed=0.2, bend_low=1.5, bend_high=3;
	var in, env, sig, chain, pitch;
	in = In.ar(input_bus, 2);
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	sig = PitchShift.ar(in, 0.2, LFNoise2.kr(bend_speed).linlin(-1, 1, bend_low, bend_high));
	sig = sig * env;
	Out.ar(out, sig);
}).add;