SynthDef(\ntube_delay_2, {
	arg amp=(-3), loss=0.99, atk=0.05, sus=1, rel=0.05, curve=(-10), gate=1, line_start=(-1), line_end=1, line_dur=10, mix_low=(-1.0), mix_high=(-1.0), input_bus, out, amp_input_bus, amp_input_bus_trig, del, prolongation, bias=0;
	var sig, in, freq, hasFreq, env, chain, fft_sig, sig_mix, lossarray, karray, delayarray, amp_in, amp_in_trig;
	lossarray =[ 0.84170231819153, 0.94297409057617, 0.85653557777405, 0.9596275806427, 0.9224214553833, 0.82305891513824, 0.97994046211243, 0.83652091026306, 0.80309219360352, 0.93469014167786, 0.92701959609985, 0.98909296989441, 0.98663191795349, 0.91383962631226, 0.81915123462677, 0.96901977062225, 0.94612686634064, 0.82331376075745, 0.90670688152313, 0.98065736293793 ];
	karray = [ 0.90479707717896, 0.92195267677307, 0.92996267080307, 0.92437303066254, 0.99244954586029, 0.94290665388107, 0.97665801048279, 0.96240893602371, 0.90467557907104, 0.90395483970642, 0.95048950910568, 0.91864706277847, 0.94882205724716, 0.9729239821434, 0.90734416246414, 0.95884075164795, 0.91900454759598, 0.91219396591187, 0.99262874126434, 0.90931832790375 ];
	delayarray = [ 0.022421363592148, 0.020732258558273, 0.063973298072815, 0.048794677257538, 0.014339470863342, 0.041041913032532, 0.061983206272125, 0.019500019550323, 0.059908345937729, 0.073623296022415, 0.091670110225677, 0.025563979148865, 0.07596363067627, 0.028674504756927, 0.088992739915848, 0.060037682056427, 0.067005438804626, 0.070808854103088, 0.076022703647614, 0.022791004180908 ];


	in  = In.ar(input_bus);
	amp_in = RMS.kr(in);
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	in = HPF.ar(in, 50);
	sig = NTube.ar(in, lossarray * amp_in.linlin(0.0, 0.2, 0.6, 0.1), karray * LFBrownNoise2.kr(amp_in.linlin(0.0, 0.2, 1, 20)).linlin(-1.0, 1.0, 0.190359, 0.998611),  delayarray * LFBrownNoise2.kr(amp_in.linlin(0.0, 0.2, 1, 20)).linlin(-1.0, 1.0, 0.413396, 0.00010434));
	sig = Limiter.ar(sig, 0.7);
	sig = sig * amp_in.linlin(0.0, 0.1, 0.0, 0.8).clip(0.0, 0.8).lag(0.1);
	sig = HPF.ar(sig, 100);

	//FFT//
	chain = FFT(LocalBuf(1024), sig);
	chain = PV_MagSmooth(chain, 1 - amp_in.linlin(0.0, 0.1, 0.00001, 0.5));
	chain = PV_MagSmear(chain, amp_in.linlin(0.0, 0.1, 0.001, 100));
	chain = PV_BinShift(chain, amp_in.linlin(0.0, 0.1, 0.5, 10));

	fft_sig = IFFT(chain);
	sig_mix = XFade2.ar(sig, fft_sig, amp_in.linlin(0.0, 0.1, mix_low, mix_high).clip(-1.0, 1.0)); /*fft_mix*/
	sig_mix = sig_mix * amp.dbamp.lag(0.1) * env;
	Out.ar(out, Pan2.ar(sig_mix, LFBrownNoise2.kr(amp_in.linlin(0.0, 0.1, 1, 10).lag(0.1))));
}).add;