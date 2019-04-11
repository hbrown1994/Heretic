~unison_bank_5.add(\0-> {
	//GOOD ADD MORE VARIATIONS -> TRY DIFFERENT DELAYDS
	Synth(\pulse_2, [\amp, -6, \input, ~sum_out_send, \out,  ~outbus_processing, \atk, ~onset_time_12, \rel, ~terminate_time_12,  ~prolongation_12, \gate, 1], target: ~live_processing_node).register;
});
