~unison_bank_8.add(\0-> {
	Synth(\fric, [\amp, -6, \input, ~sum_out_send, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1, \out, ~outbus_count], target: ~live_processing_node).register;
});

~unison_bank_8.add(\1-> {
	Synth(\fbMod, [\amp, -6, \inputbus, ~sum_out_send, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1, \out, ~outbus_count], target: ~live_processing_node).register;
});





