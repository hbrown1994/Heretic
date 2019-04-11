SynthDef(\playbuf_mono, {
	arg bufnum, del, rate=1, trig, startPos=0, loop=1, amp=(-6), atk=0.05, dec=0.1, sus=1, rel=0.05, curve= (-2), gate=1, high_pass_freq=900, low_pass_freq=100, low_pass_mix=0, high_pass_mix=0, hpf_freq=20, lpf_freq=22000, out;
	var sig, env;
	sig = PlayBuf.ar(1, bufnum, rate, trig, startPos, loop)!2;
	env = EnvGen.kr(Env.dadsr(0, 30, 0.01, 1, 30, 1, [[\lin , \sin, \wel, \cub, \sqr].choose, [\lin , \sin, \wel, \cub, \sqr].choose, [\lin , \sin, \wel, \cub, \sqr].choose, [\lin , \sin, \wel, \cub, \sqr].choose], 0), gate, doneAction: 2);
	sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
	sig = sig * env * amp.dbamp;
	Out.ar(out, sig);
}).add;