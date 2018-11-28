~unison_bank_9.add(\0-> {

	Synth(\ntube_9, [\amp, -6, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~sum_out_send, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1, \out, ~outbus_count], target: ~live_processing_node).register;

});

~unison_bank_9.add(\1-> {

	Synth(\glitch_delay, [\amp, 0, \mix_low, -1.0, \mix_high, -1.0, \in_bus, ~sum_out_send, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1, \out, ~outbus_count], target: ~live_processing_node).register;

});

