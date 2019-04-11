SynthDef(\loop_glitch_mel, {
	arg bufnum=0, rate=1, gate=1, startPos=0, startLoop=0, endLoop=2000, interp=2, buf, thresh, loopEnd_low=0.02, loopEnd_high =0.2, lag=5, rate_low, rate_high, onsets_in, audio_in, out, lag_weight_low=3,  lag_weight_high=7, atk=0.5, dec=0.1, sus=1.0, rel=0.5, amp=(-3), lag_env_time, lag_low, lag_high, lag_env_gate=0, silence_wait,prelevel=0, rate_low_gate=0, rate_low_time, rate_low_1, rate_low_2, rate_high_gate=0, rate_high_time, rate_high_1, rate_high_2, end_low_gate=0, end_low_time, end_low_1, end_low_2, end_high_gate=0, end_high_time, end_high_1, end_high_2, silence_low_low, silence_low_high, silence_high_low, silence_high_high, silence_weight_low, silence_weight_high, trig_env_sus, trig_env_rel, freq_shift, damping=0.4, fb=0.2, size, delay_high, wet_num;

	var sig, in, rec, trig, lag_choose, timer, env, lag_env, silence, rate_low_env, rate_high_env, end_low_env, end_high_env, sig_wet;
	buf = Buffer.alloc(s, s.sampleRate * 4.0, 1);

	in = In.ar(audio_in);



	env  = EnvGen.kr(Env.adsr(atk, dec, sus, rel, sustainLevel: 1.0), gate, doneAction:2);
	lag_env = EnvGen.kr(Env([lag_low, lag_high], [lag_env_time], [\lin, \sin].choose), lag_env_gate, doneAction:0);

	rate_low_env = EnvGen.kr(Env([rate_low_1, rate_low_2], [rate_low_time], [\lin, \sin].choose), rate_low_gate, doneAction:0);
	rate_high_env = EnvGen.kr(Env([rate_high_1, rate_high_2], [rate_high_time], [\lin, \sin].choose), rate_high_gate, doneAction:0);

	end_low_env = EnvGen.kr(Env([end_low_1, end_low_2], [end_low_time], [\lin, \sin].choose), end_low_gate, doneAction:0);
	end_high_env = EnvGen.kr(Env([end_high_1, end_high_2], [end_high_time], [\lin, \sin].choose), end_high_gate, doneAction:0);


	trig = In.kr(onsets_in);

	timer = Sweep.kr(trig, 1.0);

	rec  = RecordBuf.ar(in, bufnum: buf, offset: 0, recLevel: 1, preLevel: prelevel, run: 1, loop: 0, trigger: trig, doneAction: 0);

	sig = LoopBuf.ar(1, bufnum: buf, rate: TRand.kr(rate_low_env, rate_high_env, trig), gate: gate, startPos: startPos, startLoop: startLoop, endLoop: TExpRand.kr( s.sampleRate*end_high_env, s.sampleRate*end_low_env,trig), interpolation: interp);

	sig = FreqShift.ar(sig, freq_shift);


	sig = sig * TWChoose.kr(trig, [0.0, 1.0], [silence_weight_low, silence_weight_high], 1).lag(0.1);
	sig = Pan2.ar(sig, TChoose.kr(trig, [-1, 0, 1]));

	sig = sig * EnvGen.kr(Env.perc(0.01, trig_env_rel), trig);

	sig = Mix([sig, in]);

	sig_wet = GreyholeRaw.ar(sig, sig, damping: damping, delaytime: SinOsc.kr(0.8, {Rand(0, 2pi)} ).linlin(-1, 1, 0.01, delay_high), diffusion: 1, feedback: fb, moddepth: SinOsc.kr(0.8, {Rand(0, 2pi)} ).linlin(-1, 1, 1, 49), modfreq: SinOsc.kr(0.8, {Rand(0, 2pi)} ).linlin(-1, 1, 1, 10)
		, size: size);


	sig = XFade2.ar(sig, sig_wet, wet_num);

	sig = sig * env * amp.dbamp;
	Out.ar(out, sig);
}).add;