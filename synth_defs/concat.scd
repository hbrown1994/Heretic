SynthDef(\concat, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, grain_speed=1, grain_dur=0.1, amp_input, zcr, lms, sc, st, matchlength, del, prolongation, bias=0;
	var sig, env, chain, in, amp_trig, trig, grain_trig, amp_in, concat, kernel;

	in = In.ar(input);
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);

	concat=PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), loop:1);

	sig = Concat2.ar(in, concat, storesize: 63.394263038549, seektime: 63.394263038549, seekdur: 63.394263038549, matchlength: matchlength, freezestore: 0, zcr: zcr, lms: lms, sc: sc, st: st, randscore: 0, threshold: 0.01, mul: 1, add: 0);

	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig);

}).add;