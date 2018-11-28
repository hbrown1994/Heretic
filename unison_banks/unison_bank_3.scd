~unison_bank_3.add(\0-> {
	Synth(\delay_3, [\input, ~sum_out_send, \out, ~outbus_count, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1, \amp, -9 ], target: ~live_processing_node).register;
});


~unison_bank_3.add(\1-> {
	Synth(\grain_delay, [\speed, 5, \size, 0.2, \input, ~sum_out_send, \out, ~outbus_count, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1, \amp, -9 ], target: ~live_processing_node).register;
});