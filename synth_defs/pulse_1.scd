SynthDef(\pulse_1, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, grain_speed=1, grain_dur=0.1, amp_input, del, prolongation, bias=0, delayfactor=0.8;
	var sig, env, in, grain_trig, sig_1, sig_2, amp_in;

	in = In.ar(input);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2)!2;

	sig = SwitchDelay.ar(in, 0, 1, Select.kr( Stepper.kr(Impulse.kr(1), 0, 0, 4), [Array.rand(4, 0.2, 1.5)]), delayfactor);

	sig = Splay.ar(sig);

	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig);

}).add;


