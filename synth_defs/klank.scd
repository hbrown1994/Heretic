SynthDef(\klank, {
	arg out=0, bufnum, input, amp=0, atk=0.05,sus=1,rel=0.05, c1=4, c2=(-4), gate=1, grain_speed=1, grain_dur=0.1, amp_input, del, prolongation, bias=0, input_onsets;
	var sig, env, in, ring_mod, temp, sum,onsets, silence;

	in = In.ar(input);

	onsets = In.kr(~kick_onset_send);

	sum=0;

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2)!2;

	temp = SinOsc.ar(TRand.kr({Rand(60, 300)}, {Rand(2001, 10000)}, onsets).lag({Rand(0, 2)}), {Rand(0, 2pi)}, 0.5);

	8.do{

		temp = SinOsc.ar(TRand.kr({Rand(60, 300)}, {Rand(2001, 10000)}, onsets).lag({Rand(0, 2)}), {Rand(0, 2pi)}, 0.5);
		sum = sum + temp;
	};

	sig = in * sum;

	sig = sig * amp.dbamp.lag(0.1) * env;

	Out.ar(out, sig);

}).add;
