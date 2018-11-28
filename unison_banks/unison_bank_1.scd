~unison_bank_1.add(\0-> {
	Synth(\long_delay, [\bufnum, ~long_delay_buffer_1, \input, ~sum_out_send, \out, ~outbus_count, \thresh, 0.2, \amp, -12, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1], target:~live_processing_node).register;
});


~unison_bank_1.add(\1-> {
	Synth(\concat_delay, [\input, ~sum_out_send, \out, ~outbus_count, \bufnum, b[\concat][0], \zcr, 0, \lms, 0, \sc, 1, \st, 0, \matchlength, 0.05, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1, \amp, -6 ], target: ~live_processing_node).register;
});