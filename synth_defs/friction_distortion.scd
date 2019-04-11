SynthDef(\fric, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, grain_speed=1, grain_dur=0.1, amp_input;
	var sig, env, in, grain_trig, sig_1, sig_2, amp_in;

	in = In.ar(input)!2;
	amp_in = Dust.kr(2);//In.kr(amp_input);

	env = EnvGen.kr(Env.asr(atk, sus, rel, curve: [c1, c2]), gate, doneAction: 2);

	sig = Friction.ar(in, friction: TRand.kr(0.00625439,0.0177887, amp_in).lag(0.5), mass: TRand.kr(0.2, 0.8214,amp_in).lag(0.5));

	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig);

}).add;