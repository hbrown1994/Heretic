SynthDef(\vosim, {
	arg out, trig_dev_array=#[1, 1, 1, 1], times_array=#[1, 1, 1], trig_speed_array=#[1, 1, 1, 1], amp=(-6), del, atk, rel, noise_speed, gate=1, delaytime1, delay_factor1, delaytime2, delay_factor2, delaytime3, delay_factor3, delay_mix_array=#[1, 1, 1, 1], delaytime, delay_factor_array=#[1, 1, 1, 1], strong_env_array=#[1, 1, 1, 1], partials, ratio;
	var pulse,trig,freq,cycles,decay,amps,pan_pos,freq_mod,decay_mod,freq_mul,decay_mul, sig, markov, markov_trig, lag_trig, trig_dev, trig_speed, env, delay_mix, delay_factor_env, chain, strong_env;

	trig_dev = EnvGen.kr(Env(trig_dev_array, times_array, {[\lin, \sin].choose}), 1);
	trig_speed = EnvGen.kr(Env(trig_speed_array, times_array, {[\lin, \sin].choose}), 1);

	delay_factor_env = EnvGen.kr(Env(delay_factor_array, times_array, {[\lin, \sin].choose}), 1);

	strong_env = EnvGen.kr(Env(strong_env_array, times_array, {[\lin, \sin].choose}), 1);

	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, \lin), gate, doneAction: 2);

	trig = GaussTrig.ar(trig_speed, trig_dev);
	freq = TRand.ar([40.0,120.0,220.0],[440.0,990.0,880.0],trig);
	cycles = TRand.ar(4.0,[8.0, 16.0, 32.0],trig);
	decay = TRand.ar([0.2,0.4,0.6],[0.4, 0.6, 0.8],trig);
	amps = TRand.ar(0.0,[0.2, 0.6, 0.8],trig);
	pan_pos = TRand.ar(-1.0,1.0,trig);
	noise_speed = 9.0;

	lag_trig = TWChoose.ar(trig, [TRand.ar(0.0, 0.0, trig), TRand.ar(2.0, 10.0, trig)], [0.6, 0.4]);
	freq_mod =  TRand.ar(0.01,2.0, trig).lag(lag_trig);
	decay_mod = TRand.ar(0.952783,1.5, trig).lag(lag_trig);

	freq_mul = freq_mod * LFNoise2.ar(noise_speed).range(0.25,2.0);
	decay_mul = decay_mod * LFNoise2.ar(noise_speed).range(0.25,2.0);

	sig = Mix.ar(VOSIM.ar(trig, freq*freq_mul, cycles, decay*decay_mul) * amps);

	chain = FFT(LocalBuf(2048, 2), sig);
	chain = PV_SpectralEnhance(chain, partials, ratio, strong_env);
	sig = IFFT(chain);

	sig =  Pan2.ar(sig, pan_pos, 1);

	sig = SwitchDelay.ar(sig, 1, 1, delaytime, delay_factor_env, delaytime);

	sig = Limiter.ar(sig, 0.8);

	sig = sig * env * amp.dbamp;

	Out.ar(out,sig);

}).add;
