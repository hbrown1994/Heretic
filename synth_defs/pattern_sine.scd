SynthDef(\pattern_sine, {
	arg atk=1, sus=1, rel=1, freq=400, gate=1, del=0, bias=0, prolongation=(-8);
	var sig, env;
	sig = SinOsc.ar({Rand(800, 3000)})!2;
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	sig = sig * env;
	Out.ar(0, sig);
}).add;