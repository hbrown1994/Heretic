SynthDef(\pattern_mixer, {
	arg amp, input_bus, out=0, del, atk=30, rel=30, gate=1, prolongation=(-8), bias=0, pattern=1;
	var in, env, sig;
	in = In.ar(input_bus, 2);
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	sig = in * env * amp.dbamp;
	Out.ar(out, sig);
}).add;
