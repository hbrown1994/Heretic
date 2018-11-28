SynthDef(\pattern_mixer_melody_1, {
	arg input_bus, out=0, del=0, atk=0.5, rel=0.5, gate=1, prolongation=(-8), bias=0, pattern=1, strength;
	var in, env, sig, chain;
	in = In.ar(input_bus, 2);
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	chain = FFT(LocalBuf(2048, 2), in);
	chain = PV_MaxMagN(chain, 6);
	chain = PV_SpectralEnhance(chain, 20, 1, 0.1);
	sig = IFFT(chain).dup;
	sig = sig * env;
	Out.ar(out, sig);
}).add;