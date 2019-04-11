SynthDef(\chord_pulse, {
	arg root=100, harmonic_1= 1, harmonic_2=7/4, harmonic_3=4.5/2, harmonic_4=11/7, numdatapoints=100, chord_speed=4, soft_speed=1, max=4, means=4, mul=0.5, add=0.01, new_data_speed=0.2, new_dev=0.0, chord_dev=0.0,atk=0.005,sus=1.0,rel=0.005, c1=4, c2=(-4), low_pass_freq=21000, high_pass_freq=30, low_pass_mix=0, high_pass_mix=0, amp=0;
	var sig, env, trig;
	sig = KmeansToBPSet1.ar(root*[harmonic_1,harmonic_2,harmonic_3,harmonic_4],numdatapoints,max,means, GaussTrig.kr(new_data_speed, new_dev), GaussTrig.kr(chord_speed, chord_dev),soft_speed);

	env = EnvGen.kr(Env([0.0,1.0,1.0,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
	sig = sig * env * amp.dbamp;

	sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));

	sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));

	Out.ar(0, Pan2.ar(Splay.ar(0.1*sig), 0.0))

}).add;

