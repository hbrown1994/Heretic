~unison_bank_7.add(\0-> {

	Synth(\concat, [\input, ~sum_out_send, \out, ~outbus_count, \bufnum, b[\bombastic][0].duration, \zcr, 0.2, \lms, 0.4, \sc, 1, \st, 0, \matchlength, 0.05, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1, \amp, -6 ], target: ~live_processing_node).register;

});

~unison_bank_7.add(\1-> {

	Synth(\long_delay, [\bufnum, ~long_delay_buffer_1, \input, ~sum_out_send, \out, ~outbus_count, \thresh, 0.2, \amp, -12, \atk, ~onset_12, \rel, ~terminate_12, \delay, ~delay_12, \prolongation, ~prolongation_12, \gate, 1], target:~live_processing_node).register;

});
