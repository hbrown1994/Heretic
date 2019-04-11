~unison_bank_6.add(\0-> {

	//THIS SOUNDS COOL BY WHY SPRED OVER 2 CHANE;S?
	Synth(\pulse_1, [\amp, -6, \input, ~sum_out_send, \out,  ~outbus_processing, \atk, ~onset_time_12, \rel, ~terminate_time_12,  ~prolongation_12, \gate, 1], target: ~live_processing_node).register;
});
