~unison_bank_8.add(\0-> {

	//FIX ADD HPF
	Synth(\fric, [\amp, -6, \input, ~sum_out_send, \atk, ~onset_time_12, \rel, ~terminate__time_12, \gate, 1, \out,  ~outbus_processing], target: ~live_processing_node).register;
});

~unison_bank_8.add(\1-> {


	//GOOD
	Synth(\fbMod, [\amp, -6, \inputbus, ~sum_out_send, \atk, ~onset_time_12, \rel, ~terminate__time_12, \gate, 1, \out,  ~outbus_processing], target: ~live_processing_node).register;
});


//TRY OTHER PHYSICALL MODELLING





/*{Decimator.ar(SoundIn.ar(0), rate: 100, bits: 32, mul: 1, add: 0)}.play;*/