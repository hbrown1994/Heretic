SynthDef(\gendy_bass, {
	arg out=0, amp=0, del=0, atk=0.05, rel=0.05, gate=1, bias=0;
	var sig, env;

	sig = Gendy1.ar(1, 1, 1.0, 1.0, 30, 100, 0.3, 0.05, 5);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, -8], bias), gate, doneAction: 2)!2;


	sig = sig * env * amp.dbamp;

	Out.ar(out, sig)


}).add;
