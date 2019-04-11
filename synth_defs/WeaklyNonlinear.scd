SynthDef(\WeaklyNonlinear, {
	arg atk,sus,rel,c1, c2, amp=0, out=0, sig1_osc_freq_1, sig1_osc_freq_2, sig2_osc_freq_1, sig2_osc_freq_2,sig3_osc_freq_1, sig3_osc_freq_2, sig4_osc_freq_1, sig4_osc_freq_2, mix_1, mix_2,mix_3, lag_1, lag_2, lag_3, lag_4, sig3_noise_freq, pan_pos=0;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, env;

	env = EnvGen.kr(Env([0.0,1.0,1.0,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);

	sig1 = 0.1*WeaklyNonlinear.ar(SinOsc.ar(sig1_osc_freq_1.lag(lag_1),0,0.1),0,1,1,sig1_osc_freq_2.lag(lag_1));

	sig2 = 0.1*WeaklyNonlinear.ar(SinOsc.ar(sig2_osc_freq_1.lag(lag_2),0,0.1),0,1,1,sig2_osc_freq_2.lag(lag_2),0,0,-0.001,3,0,0);

	sig3 = 0.1*WeaklyNonlinear.ar(SinOsc.ar(sig3_osc_freq_1.lag(lag_3),0,0.1),Impulse.kr(sig3_noise_freq.lag(lag_3)),1,1,sig3_osc_freq_2.lag(lag_3), LFNoise0.kr(sig3_noise_freq.lag(lag_3),0.4,0.5),LFNoise0.kr(sig3_noise_freq.lag(lag_3),10.4,10.5));

	sig4 = 0.1*WeaklyNonlinear.ar(SinOsc.ar(0,0,0.1),0,1,1,sig4_osc_freq_1.lag(lag_4),0,0,sig4_osc_freq_2.lag(lag_4));


	sig5 = XFade2.ar(sig1, sig2, (mix_1*2-1));

	sig6 = XFade2.ar(sig3, sig4, (mix_2*2-1));

	sig7 = XFade2.ar(sig5, sig6, (mix_3*2-1));

	sig7 = sig7 * env * amp.dbamp;

	sig7 = Pan2.ar(sig7, LFNoise0.kr(sig3_noise_freq.lag(lag_3)));

	Out.ar(out, sig7)

}).add;