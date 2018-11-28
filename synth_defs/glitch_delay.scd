SynthDef(\glitch_delay, {
	arg trig_freq_low, trig_freq_high, grain_dev, trig_fft_low, trig_fft_high, fft_dev, trig_freeze_low, trig_freeze_high, freeze_dev, grain_size_low, grain_size_high, gate, amp, in_bus, morph_amount=1.0, atk, dec, sus, rel, curve=(-8), out, del, prolongation, bias=0;
	var pan, env, in, sig, buf, temp, sig1, chain, sig2, fft_mix=0, trig, sig3, trig1, trig2, chainA, chainB;

	in = In.ar(in_bus);
	sig3=0;
	sig1 =0;
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	trig = GaussTrig.kr(RMS.ar(in).linlin(0.0, 0.1, trig_freq_low, trig_freq_high), grain_dev);
	trig1 = GaussTrig.kr(RMS.ar(in).linlin(0.0, 0.1, trig_fft_low, trig_fft_high), fft_dev);
	trig2 = GaussTrig.kr(RMS.ar(in).linlin(0.0, 0.1, trig_freeze_low, trig_freeze_high), freeze_dev);

	10.do{
		temp = DelayN.ar(in, 3.0, {Rand(0.1, 3.0)});
		temp = GrainIn.ar(1,
			GaussTrig.kr(RMS.ar(in).linlin(0.0, 0.1, {Rand(1, 3)}, {Rand(10, 30)}),
				grain_dev), TRand.kr(grain_size_low, grain_size_high, trig), temp);
		sig1 = sig1 + temp;
	};

	chainA = FFT(LocalBuf(1024), sig1);
	chainB = FFT(LocalBuf(1024), sig1);
	chainA = PV_BinScramble(chainA, RMS.ar(in).linlin(0.0, 0.1, 0.0, 0.3), 0.5, trig);
	chainA = PV_Freeze(chainA, ToggleFF.kr(trig2));
	chainB = PV_MagSmooth(chainB, 1 - RMS.ar(in).linlin(0.0, 0.1, 0.00001, 0.5));
	chainB = PV_MagSmear(chainB, RMS.ar(in).linlin(0.0, 0.1, 0.00001, 100));
	chainB = PV_BinShift(chainB, RMS.ar(in).linlin(0.0, 0.1, 0.25, 0.5));

	chain = PV_Morph(chainB, chainA, RMS.ar(in).linlin(0.0, 0.1, 0.0, morph_amount));
	sig3 = IFFT(chain);
	sig3 = Limiter.ar(sig3, 1.0);
	sig3 = sig3 * env * amp.dbamp.lag(0.1);
	Out.ar(out, Pan2.ar(sig3, LFNoise1.kr(Clip.kr(RMS.ar(in).linlin(0.0, 0.1, 2.0, 20.0), 2.0, 20.0))));

}).add;