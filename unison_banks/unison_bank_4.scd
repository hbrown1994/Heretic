~unison_bank_4.add(\0-> {
	Synth(\klank, [\amp, -12, \in, ~sum_out_send, \out, ~outbus_count, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1], target: ~live_processing_node).register;
});



s.plotTree;