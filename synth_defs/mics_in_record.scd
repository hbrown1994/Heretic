SynthDef(\mic_in_record, {

	// Amplitude, Envelope, and Buffer Assignments
	arg amp =(-6), gate=1, rel=0.1, atk=0.005, sus=1, dec=0.1, oh_left_amp, oh_right_amp, hat_amp, snare_amp, kick_amp, rack_amp, floor_amp, loop=1, start_pos, master_amp, oh_left_pan, oh_right_pan, hat_pan, snare_pan, kick_pan, rack_pan, floor_pan, thresh=0.1;

	// Variables
	var env, sig, sig_dry, oh_left, oh_right, snare, rack, floor, kick, hat, sum_sig, oh_left_dry, oh_right_dry, hat_dry, snare_dry, kick_dry, rack_dry, floor_dry, onsets;

	// Buffers
	oh_left = SoundIn.ar(~oh_left_in);
	oh_right = SoundIn.ar(~oh_right_in);
	hat = SoundIn.ar(~hat_in);
	snare = SoundIn.ar(~snare_in);
	kick = SoundIn.ar(~kick_in);
	rack = SoundIn.ar(~rack_in);
	floor = SoundIn.ar(~floor_in);

	// Dry Outs
	oh_left = oh_left * oh_left_amp.dbamp.lag(0.1);
	oh_right = oh_right * oh_right_amp.dbamp.lag(0.1);
	hat = hat * hat_amp.dbamp.lag(0.1);
	snare = snare * snare_amp.dbamp.lag(0.1);
	kick = kick * kick_amp.dbamp.lag(0.1);
	rack = rack * rack_amp.dbamp.lag(0.1);
	floor = floor * floor_amp.dbamp.lag(0.1);

	// Envelope & Mono Sum
	env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, sustainLevel: 1.0), gate, doneAction:2);
	sum_sig = Mix.new([oh_left, oh_right, hat, snare, kick, rack, floor]);

	onsets = Coyote.kr(sum_sig, fastMul: 0.6,  thresh: 0.01);

	// Extratction sends (summed channels)
	Out.ar(~sum_out_send, sum_sig);
	Out.kr(~onset_sends, onsets);


	// Dry Outs
	Out.ar(10, Pan2.ar(oh_left * oh_left_amp.dbamp.lag(0.1), oh_left_pan));
	Out.ar(11, Pan2.ar(oh_right * oh_right_amp.dbamp.lag(0.1), oh_right_pan));
	Out.ar(12, Pan2.ar(hat * hat_amp.dbamp.lag(0.1), hat_pan));
	Out.ar(13, Pan2.ar(snare * snare_amp.dbamp.lag(0.1), snare_pan));
	Out.ar(14, Pan2.ar(kick * kick_amp.dbamp.lag(0.1), kick_pan));
	Out.ar(15, Pan2.ar(rack * rack_amp.dbamp.lag(0.1), rack_pan));
	Out.ar(16, Pan2.ar(floor * floor_amp.dbamp.lag(0.1), floor_pan));

}).add;