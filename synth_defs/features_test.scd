SynthDef(\features_test, {
	arg thresh=0.37, out=0;

	var in, fft_mfcc, fft_onset, array, mfcc, rms, features, onsets, onsetanalysis, features_1, rms_1, centroid, mfcc_in, trig, follow_env, crest, slopeanalysis, detect;

	// Mono Audio from \mic_in
	in = In.ar(~sum_out_send, 1);

	fft_onset = FFT(LocalBuf(512), in, 0.75, 1);  // for sampling rates 44100 and 48000

	// Onsets
	onsets = Onsets.kr(fft_onset, thresh, odftype: \rcomplex, relaxtime: 0.1, floor: 0.08, mingap: 5, medianspan: 11, whtype: 1, rawodf: 0);

	detect = PinkNoise.ar(Decay.kr(onsets, 0.2));

	Out.ar(out, detect);

}).add;
