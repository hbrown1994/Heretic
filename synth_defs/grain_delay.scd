SynthDef(\grain_delay, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, thresh, del, prolongation, bias=0,  speed, size;
	var source,timer,grains, timer_trig,trig_grains, capture, sig, amplitude, rand_delay, rand_strech, chain, sig_out, freeze, chain_1, rand_delay_1, rand_delay_2, rand_delay_3, delay_amp, freeze_trig, sig_1, env, trig;

	source= In.ar(input);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	amplitude = Amplitude.kr(source);

	rand_delay_1 = TRand.kr(lo: 1, hi: 10, trig: amplitude > thresh);
	rand_delay_2 = TRand.kr(lo: 1, hi: 10, trig: amplitude > thresh);
	rand_delay_3 = TRand.kr(lo: 1, hi: 10, trig: amplitude > thresh);

	sig = MultiTap.ar([rand_delay_1, rand_delay_2, rand_delay_3], [1, 1, 1], in: source, mul: 1, add: 0, bufnum: bufnum);

	trig =  Dust.kr(speed);

	grains = GrainIn.ar(2, trig, size, sig, TRand.kr(-1.0, 1.0, Delay1.kr(trig)));

	sig_out = PitchShift.ar(grains, 0.2, TRand.kr(0.5, 3, Delay2.kr(trig)), 0.5, 0.5);

	sig_out = sig_out * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig_out);
}).add;