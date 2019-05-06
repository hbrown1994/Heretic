SynthDef(\features, {
	arg thresh=0.37;

	var in, fft_mfcc, fft_onset, array, mfcc, rms, features, onsets, onsetanalysis, features_1, rms_1, centroid, mfcc_in, trig, follow_env, crest, slopeanalysis;

	// Mono Audio from \mic_in
	in = In.ar(~sum_out_send, 1);

	//MFCCs in from WEK

	//FFT
	fft_mfcc = FFT(LocalBuf(1024), in, 0.75, 1);
	fft_onset = FFT(LocalBuf(512), in, 0.75, 1);  // for sampling rates 44100 and 48000

	// Onsets
	onsets = Onsets.kr(fft_onset, thresh, odftype: \rcomplex, relaxtime: 0.1, floor: 0.08, mingap: 5, medianspan: 11, whtype: 1, rawodf: 0);

	onsetanalysis = OnsetStatistics.kr(onsets, 2); // 3 outs

	mfcc = MFCC.kr(fft_mfcc);

	rms = WAmp.kr(in: in, winSize: 2);

	follow_env = EnvFollow.kr(in, 0.9);

	slopeanalysis = AttackSlope.kr(in,peakpicksize:20,sumthreshold:10);

	// Complile feature array to be sent to wekinator

	features = mfcc[1..12] ++ slopeanalysis[4].linlin(0, 50, 0.0, 1.0)  ++ follow_env.linlin(0.0, 0.6, 0.0, 1.0) ++ rms.linlin(0.0, 0.2, 0.0, 1.0) ++ onsetanalysis[0].linlin(0, 24, 0.0, 1.0);

	Out.kr(~feature_bus, features);// control bus out


}).add;