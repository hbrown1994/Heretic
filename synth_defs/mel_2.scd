SynthDef(\mel_2, {
	arg freq=440, wait_time=0.2, tableSize=2, amp_init=(0.5 + 0.5.rand), delaytime, delayfactor, del, atk, gate=1, rel, amp=(-6);
	var sig, sine, timer, onsets, amp_sel, chain, rec_sel, temp, sum, env;
	temp = 0;
	sum = 0;


	timer = Sweep.kr();

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, \lin), gate, doneAction: 2);

	amp_sel = Select.kr(timer > 10, [amp_init, 1.0]);

	rec_sel = Select.kr(timer > 10, [1, TWChoose.kr(Dust.kr(1), [0, 1], [3, 7].normalizeSum)]);

	sine = SinOsc.ar(freq) * Select.ar(timer > 10, [SinOsc.ar(0.01, pi/2).range(0.0, amp_sel),LFNoise1.ar(1).range(0.0, 1.0)]);

	sig = MarkovSynth.ar(sine, rec_sel, wait_time, tableSize);

	onsets = Coyote.kr(in: sig, trackFall: 0.2, slowLag: 0.2, fastLag: 0.01, fastMul: 0.5, thresh: 0.0001 , minDur: 0.01);

	sig = HPF.ar(sig, 100);

	sig = Limiter.ar(sig, 0.9);

	4.do{
		temp = CombC.ar(FreqShift.ar(sig, {LFBrownNoise0.kr({Rand(0.5, 3)}, dist: {IRand(0, 5)}).linlin(-1.0, 1.0, -1000, 500)}, 2pi.rand),
			maxdelaytime: 20.0, delaytime: {Rand(5.0, 20.0)},
			decaytime: {Rand(3.0, 10.0)},
			mul: 0.2,
			add: 0 );
		sum = sum + temp;
	};

	sig = Pan2.ar(Mix([sig, sum]), TChoose.kr(onsets, [-1, 0, 1]).lag(0.1)) * env * amp.dbamp;

	Out.ar(0, Pan2.ar(Mix([sig, sum]), TChoose.kr(onsets, [-1, 0, 1]).lag(0.1)));

}).add;
