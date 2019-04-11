SynthDef(\delay_sparse_1, {

	arg size, pitch_low, pitch_high, pitchDispersion, timeDispersion, audio_in, out, bufnum, trig_speed, trig_dev, onset_time=1, contin_time=1, term_time=1, pitch_low_gate=0, pitch_low_low= 1.0, pitch_low_med=0.75, pitch_low_high=0.5, 	pitch_high_low=1.0, pitch_high_med=2.0, pitch_high_high=3.0,  pitch_high_gate=1, 	pitchDispersion_low=0.0, pitchDispersion_med=0.1, pitchDispersion_high=0.5, pitchDispersion_gate=1, timeDispersion_low=0.0, timeDispersion_med=0.1, timeDispersion_high=0.5, timeDispersion_gate, atk, dec, sus, rel, gate, amp;
	var sig, in, rec, lag_choose, timer, env, lag_env, silence, rate_low_env, rate_high_env, end_low_env, end_high_env, timesArray, levelsArray, onsets, delay_onsets, sig_1,trig, pitch_low_array, times, pitch_low_env, pitch_high_array, pitch_high_env, pitchDispersion_array, pitchDispersion_env, timeDispersion_env, timeDispersion_array;

	bufnum = Buffer.alloc(s, s.sampleRate*5.0, 1);
	in = In.ar(audio_in);

	timesArray = Array.rand(2, 2.1, 6.0);

	levelsArray = Array.rand(2, 0.8, 1.0);

	times = [onset_time, contin_time, term_time];

	env  = EnvGen.kr(Env.adsr(atk, dec, sus, rel, sustainLevel: 1.0), gate, doneAction:2);


	pitch_low_array = SmalleyPatternOnset.setPatternOnset(\emergence, pitch_low_low, pitch_low_med, pitch_low_high)++SmalleyPatternContinuation.setPatternContinuation(~continuation_12, \emergence, pitch_low_low, pitch_low_med, pitch_low_high)++SmalleyPatternTerminate.setPatterntermination(\dissappearance, ~continuation_12, pitch_low_low, pitch_low_med, pitch_low_high);


	pitch_high_array = SmalleyPatternOnset.setPatternOnset(\emergence, pitch_high_low, pitch_high_med, pitch_high_high)++SmalleyPatternContinuation.setPatternContinuation(~continuation_12, \emergence, pitch_high_low, pitch_high_med, pitch_high_high)++SmalleyPatternTerminate.setPatterntermination(\dissappearance, ~continuation_12, pitch_high_low, pitch_high_med, pitch_high_high);

	pitchDispersion_array = SmalleyPatternOnset.setPatternOnset(\emergence, pitchDispersion_low, pitchDispersion_med, pitchDispersion_high)++SmalleyPatternContinuation.setPatternContinuation(~continuation_12, \emergence, pitchDispersion_low, pitchDispersion_med, pitchDispersion_high)++SmalleyPatternTerminate.setPatterntermination(\dissappearance, ~continuation_12, pitchDispersion_low, pitchDispersion_med, pitchDispersion_high);

	timeDispersion_array = SmalleyPatternOnset.setPatternOnset(\emergence, timeDispersion_low, timeDispersion_med, timeDispersion_high)++SmalleyPatternContinuation.setPatternContinuation(~continuation_12, \emergence, timeDispersion_low, timeDispersion_med, timeDispersion_high)++SmalleyPatternTerminate.setPatterntermination(\dissappearance, ~continuation_12, timeDispersion_low, timeDispersion_med, timeDispersion_high);

	pitch_low_env = EnvGen.kr(Env(pitch_low_array, times, [\lin, \sin].choose), pitch_low_gate, doneAction:0);
	pitch_high_env = EnvGen.kr(Env(pitch_high_array, times, [\lin, \sin].choose), pitch_high_gate, doneAction:0);
	pitchDispersion_env = EnvGen.kr(Env(pitchDispersion_array, times, [\lin, \sin].choose), pitchDispersion_gate, doneAction:0);
	timeDispersion_env = EnvGen.kr(Env(timeDispersion_array, times, [\lin, \sin].choose), timeDispersion_gate, doneAction:0);

	trig = GaussTrig.kr(trig_speed, trig_dev);

	sig = MultiTap.ar(`timesArray, `levelsArray, in: in, mul: 1, add: 0, bufnum: bufnum);

	delay_onsets = Coyote.kr(sig, fastMul: 0.6, thresh: 0.05);

	sig = PitchShift.ar(sig, size, pitchRatio: TRand.kr(pitch_low_env, pitch_high_env, delay_onsets), pitchDispersion: pitchDispersion_env, timeDispersion: timeDispersion_env);

	sig = Pan2.ar(sig, TRand.kr(-1.0, 1.0, trig));

	sig = sig * env * amp.dbamp;
	Out.ar(out, sig);
}).add;
