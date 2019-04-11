SynthDef(\bomb_mix_2, {
	arg atk,sus,rel,c1, c2, amp=0, out=0 , sig1_impulse, sig1_rate, sig1_noise_freq_1, sig1_noise_freq_2, sig2_freq, sig2_fb, sig3_rate_1, sig3_rate_2, sig3_rate_3, sig3_rate_4, sig4_rate_1, sig4_rate_2, pan_pos_speed, mix_1, mix_2, mix_3, freeze_rate;
	var sig1, sig2, sig3, sig4, sig5, sig6, sig7, env, chain;

	env = EnvGen.kr(Env([0.0,1.0,1.0,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);

	sig1 = 0.05*GravityGrid.ar(Impulse.kr(sig1_impulse),sig1_rate,LFNoise0.kr(sig1_noise_freq_1,0.8),LFNoise0.kr(sig1_noise_freq_2,0.8));

	sig2 = SinOscFB.ar(sig2_freq, sig2_fb);

	sig3 = Fhn2DN.ar(40, 22050, sig3_rate_1, sig3_rate_2, sig3_rate_3, sig3_rate_4, mul:0.1);

	sig4 = (HPF.ar(SpruceBudworm.ar(Impulse.kr(sig4_rate_1),0.1,sig4_rate_2,0.5,initx:0.6)[0]-1.0, 20));

	sig5 = XFade2.ar(sig1, sig2, (mix_1*2-1));

	sig6 = XFade2.ar(sig3, sig4, (mix_2*2-1));

	sig7 = XFade2.ar(sig5, sig6, (mix_3*2-1));

	sig7 = Compander.ar(sig7, sig7,
        thresh: 0.1,
        slopeBelow: 1,
        slopeAbove: 0.5,
        clampTime:  0.01,
        relaxTime:  0.01
    );

	sig7 = sig7 * env * amp.dbamp;

	sig7 = Pan2.ar(sig7, LFNoise1.kr(pan_pos_speed));

	Out.ar(out, sig7)

}).add;