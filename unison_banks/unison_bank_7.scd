~unison_bank_7.add(\0-> {

	//, [b[\bombastic][3], b[\contin][0]].choose
	// SLIGHTLY DELAY AND USING COMPELLING SAAMPLES
	Synth(\concat_delay, [\input, ~sum_out_send, \out, 0, \bufnum, b[\contin][0], \zcr, 0, \lms, 0, \sc, 1, \st, 0, \matchlength, 0.05, \atk, ~onset_time_12, \rel, ~terminate_time_12, \gate, 1, \amp, -12 ], target: ~live_processing_node).register;

});

~unison_bank_7.add(\1-> {

	Synth(\long_delay, [\bufnum, ~long_delay_buffer_1, \input, ~sum_out_send, \out,  ~outbus_processing, \thresh, 0.2, \amp, -12, \atk, ~onset_time_12, \rel, ~terminate_time_12, \gate, 1], target: ~live_processing_node).register;

});


~unison_bank_7.add(\2-> {

	Synth(\delay_sporadic_1, [
		\gate, 1,
		\audio_in, ~sum_out_send, \out, ~outbus_processing,
		\pitchDispersion, 1.0,  \timeDispersion, 1.0, \size, 1.0,
		\pitch_low, 1.0, \pitch_high, 4.0,
		\trig_speed, 3, \trig_dev, 1.0,
		\onset_time, ~onset_time_12, \contin_time, currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol),
		\term_time, ~terminate_time_12,

		\pitch_low_gate, 1,
		\pitch_low_low, 1.0, \pitch_low_med, 0.9, \pitch_low_high, 0.8,

		\pitch_high_gate, 1,
		\pitch_high_low, 1.0, \pitch_high_med, 2.0, \pitch_high_high, 2.0,

		\timeDispersion_gate, 1,
		\timeDispersion_low, 0.0, \timeDispersion_med, 0.005, \timeDispersion_high, 0.01,

		\pitchDispersion_gate, 1,
		\pitchDispersion_low, 0.0,  \pitchDispersion_med, 0.005, \pitchDispersion_high, 0.01


	], ~live_processing_node).register;
});


~unison_bank_7.add(\3-> {
//??
	Synth(\loop_glitch_1,
		[\gate, 1,

			//looping
			\startPos, 1, \startLoop, 1,
			\prelevel, 0.0,

			//rate
			\rate_low_gate, 1, \rate_low_time,currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \rate_low_1, 0.8 ,\rate_low_2, 1.0,
			\rate_high_gate, 1, \rate_high_time, currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \rate_high_1, 1.2, \rate_high_2, 3.0,

			//end
			\end_low_gate, 1, \end_low_time,  currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \end_low_1, 0.5 ,\end_low_2, 0.02,
			\end_high_gate, 1, \end_high_time,  currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \end_high_1, 4.0, \end_high_2, 0.6,


			//routing
			\onsets_in, ~onset_sends, \audio_in, ~sum_out_send, \out, ~outbus_processing,

			//silence
			\silence_weight_low, 0.0, \silence_weight_high, 1.0,

			//lag
			\lag_env_gate, 1, \lag_weight_low, 3, \lag_weight_high, 7,
			\lag_low, 6.0, \lag_high, 2.0, \lag_env_time,  currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol),
			//silence
			\silence_wait, 4.0,
			\atk, 0.01,  \rel,  0.01,

		],
		~pattern_mixer_node).register;

});