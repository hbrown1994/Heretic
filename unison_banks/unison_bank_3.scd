~unison_bank_3.add(\0-> {

	Synth(\delay_3, [\input_bus, ~sum_out_send, \out,  ~outbus_processing, \atk, ~onset_time_12, \rel, ~terminate_time_12, \gate, 1, \amp, -9 ], target: ~live_processing_node).register;
});


~unison_bank_3.add(\1-> {
	// ALSO DOES NOT WORK
	Synth(\grain_delay, [\speed, 5, \size, 0.02, \input, ~sum_out_send, \out,  ~outbus_processing, \atk, ~onset_time_12, \rel, ~terminate_time_12, \gate, 1, \amp, -6 ], target: ~live_processing_node).register;
});


~unison_bank_3.add(\2-> {
	Synth(\glitch_delay, [
		\grain_size_low, 0.005, \grain_size_high, 0.2,
		\amp, 0, \mix_low, -1.0, \mix_high, -1.0,
		\in_bus, ~sum_out_send, \atk, ~onset_time_12, \rel, ~terminate_time_12,
		\gate, 1, \out,  ~outbus_processing], target: ~live_processing_node).register;

});