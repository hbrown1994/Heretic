SynthDef(\loop_glitch_2, {
	arg bufnum=0, rate=1, gate=1, startPos=0, startLoop=0, endLoop=2000, interp=2, buf, thresh, loopEnd_low=0.02, loopEnd_high =0.2, lag=5, onsets_in, audio_in, out, lag_weight_low=3,  lag_weight_high=7, atk=0.5, dec=0.1, sus=1.0, rel=0.5, amp=(-3), lag_env_time, lag_low, lag_high, lag_env_gate=0, silence_wait,prelevel=0, rate_low_gate=0, rate_low_time, rate_low_1, rate_low_2, rate_high_gate=0, rate_high_time, rate_high_1, rate_high_2, end_low_gate=0, end_low_time, end_low_1, end_low_2, end_high_gate=0, end_high_time, end_high_1, end_high_2, silence_low_low, silence_low_high, silence_high_low, silence_high_high, silence_weight_low, silence_weight_high;
	var sig, in, rec, trig, lag_choose, timer, env, lag_env, silence, rate_high_env, end_low_env, atk_choose, sus_choose, rel_choose, rate_low, rate_high, rate_env_high_1, end_env_high_1, rate_env_low_1, end_env_low_1, rate_env_high_2, rate_env_low_2, end_env_high_2, end_env_low_2, env_choose, rate_env, end_env;
	buf = Buffer.alloc(s, s.sampleRate * 4.0, 1);

	in = In.ar(audio_in);

	silence = DetectSilence.ar(in, 0.01).linlin(0, 1, 1, 0);

	timer = Sweep.kr(silence);

	trig = In.kr(onsets_in);

	rec  = RecordBuf.ar(in, bufnum: buf, offset: 0, recLevel: 1, preLevel: prelevel, run: 1, loop: 0, trigger: trig, doneAction: 0);


	env  = EnvGen.kr(Env.adsr(atk, dec, sus, rel, sustainLevel: 1.0), gate, doneAction:2);

	atk_choose = 0.01;

	sus_choose = 0.01;

	rel_choose = TRand.kr(0.1, 5.0, trig);


	rate_env_high_1 = EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linexp(0.0, 1.0, TRand.kr(0.2, 0.5, trig), TRand.kr(4.0, 2.0, trig));

	rate_env_low_1 = EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linexp(0.0, 1.0, TRand.kr(4.0, 2.0, trig), TRand.kr(0.2, 0.5, trig));

	rate_env_high_2 = EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linexp(0.0, 1.0, TRand.kr(4.0, 2.0, trig), TRand.kr(0.2, 0.5, trig));

	rate_env_low_2 = EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linexp(0.0, 1.0, TRand.kr(0.2, 0.5, trig), TRand.kr(4.0, 2.0, trig));


	end_env_low_1= EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linexp(0.0, 1.0, s.sampleRate*TRand.kr(0.002, 0.05, trig), s.sampleRate*TRand.kr(1.0, 2.0, trig));

	 end_env_high_1= EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linexp(0.0, 1.0, s.sampleRate*TRand.kr(1.0, 2.0, trig), s.sampleRate*TRand.kr(0.002, 0.05, trig));

	end_env_high_2 = EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linexp(0.0, 1.0, s.sampleRate*TRand.kr(1.0, 2.0, trig), s.sampleRate*TRand.kr(0.002, 0.05, trig));

	end_env_low_2 = EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linexp(0.0, 1.0, s.sampleRate*TRand.kr(0.002, 0.05, trig), s.sampleRate*TRand.kr(1.0, 2.0, trig));

	env_choose = TChoose.kr(trig, [0, 1, 2, 3]);

	rate_env = SelectX.kr(env_choose, [rate_env_high_1, rate_env_low_1, rate_env_high_2, rate_env_low_2]);

	end_env = SelectX.kr(env_choose, [end_env_high_1, end_env_low_1, end_env_high_2, end_env_low_2]);

	sig = LoopBuf.ar(1, bufnum: buf, rate: rate_env, gate: gate, startPos: startPos, startLoop: startLoop, endLoop: end_env, interpolation: interp);

	sig = sig * (timer < TRand.kr(2.0, 6.0, silence).lag(0.1));
	sig = Pan2.ar(sig,
		Select.kr(TChoose.kr(trig, [0, 1]),
			[EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linlin(0.0, 1.0, -0.9, 0.9), EnvGen.kr(Env.linen(attackTime: atk_choose, sustainTime: sus_choose, releaseTime: rel_choose, level: 1, curve: \lin), trig, doneAction:0 ).linlin(0.0, 1.0, -0.9, 0.9)]));

	sig = sig * env * amp.dbamp;
	Out.ar(out, sig);
}).add;