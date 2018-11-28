//drone_formings

~unison_bank_2.add(\0-> {
	Synth(\ntube_1, [\amp, -20, \loss, 0.999, \in, ~sum_out_send, \out, ~outbus_count, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1], target: ~live_processing_node).register;
});

~unison_bank_2.add(\1-> {
	Synth(\greyhole_1, [\amp, -6, \size, 1, \fb, 0.8, \damping, 0.4, \in, ~sum_out_send, \out, ~outbus_count, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1], target: ~live_processing_node).register;
});


