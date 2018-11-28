SynthDef(\long_delay, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, thresh, del, prolongation, bias=0;
	var source,timer,grains, timer_trig,trig_grains, capture, sig, amplitude, rand_delay, rand_strech, chain, sig_out, freeze, chain_1, rand_delay_1, rand_delay_2, rand_delay_3, delay_amp, freeze_trig, sig_1, env;

	source= In.ar(input);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	amplitude = Amplitude.kr(source);

	rand_delay_1 = TRand.kr(lo: 1, hi: 10, trig: amplitude > thresh);
	rand_delay_2 = TRand.kr(lo: 1, hi: 10, trig: amplitude > thresh);
	rand_delay_3 = TRand.kr(lo: 1, hi: 10, trig: amplitude > thresh);


	sig = MultiTap.ar([rand_delay_1, rand_delay_2, rand_delay_3], [1, 1, 1], in: source, mul: 1, add: 0, bufnum: bufnum);

	delay_amp= Amplitude.kr(sig);

	freeze_trig = TIRand.kr(0, 1, delay_amp > thresh);

	timer = Sweep.kr(trig: freeze_trig, rate: 1);

	grains = GrainIn.ar(1, Dust.kr(5), 0.2, sig);

	timer_trig = Select.kr(timer > 2, [freeze_trig, 0]);

	chain = FFT(LocalBuf(2048), sig);
	chain = PV_MagFreeze(chain, timer_trig);
	chain = PV_BinScramble(chain, wipe: TRand.kr(0, 0.2, timer_trig), width: 1, trig: timer_trig);
	chain = PV_BinShift(chain, stretch: TRand.kr(0.6, 2, GaussTrig.kr(10, 1)), shift: 0, interp: 0);
	sig_out = IFFT(chain);

	sig_out = SelectX.ar(TIRand.kr(0, 1, freeze_trig).lag(0.1), [grains, sig_out])!2;

	sig_out = sig_out * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig_out);
}).add;