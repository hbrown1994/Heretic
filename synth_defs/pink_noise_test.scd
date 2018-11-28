SynthDef(\pink_noise_test, {

	// Amplitude, Envelope, and Buffer Assignments
	arg amp=0, gate=1, rel=0.1, atk=0.005, sus=1, dec=0.1, out=~live_processing_out;

	// Variables
	var env, sig;

	// Buffers
	sig = PinkNoise.ar!2;

	// Envelope & Mono Sum
	env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, sustainLevel: 1.0), gate, doneAction:2);

	sig = sig * env;

	Out.ar(out, sig);

}).add;