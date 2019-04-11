~unison_bank_9.add(\0-> {

	Synth(\ntube_9, [\amp, -6, \mix_low, -1.0, \mix_high, -1.0, \input_bus, ~sum_out_send, \atk, ~onset_time_12, \rel, ~terminate_time_12,  ~prolongation_12, \gate, 1, \out,  ~outbus_processing], target: ~live_processing_node).register;

});

~unison_bank_9.add(\1-> {

	Synth(\loop_glitch,
		[\gate, 1,

			//looping
			\startPos, 0, \startLoop, 0,
			\prelevel, 0.0,

			//rate
			\rate_low_gate, 1, \rate_low_time,currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \rate_low_1, 1.0 ,\rate_low_2, 0.5,
			\rate_high_gate, 1, \rate_high_time, currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \rate_high_1, 3.0, \rate_high_2, 1.5,

			//end
			\end_low_gate, 1, \end_low_time,  currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \end_low_1, 0.02 ,\end_low_2, 0.5,
			\end_high_gate, 1, \end_high_time,  currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \end_high_1, 0.6, \end_high_2, 2.0,


			//routing
			\onsets_in, ~onset_sends, \audio_in, ~sum_out_send, \out, ~outbus_processing,

			//silence
			\silence_weight_low, 0.0, \silence_weight_high, 1.0,
			\silence_low_low, 1.0, \silence_low_high, 0.3,
			\silence_high_low, 0.0, \silence_high_high, 0.7,

			//lag
			\lag_env_gate, 1, \lag_weight_low, 3, \lag_weight_high, 7,
			\lag_low, 1.0, \lag_high, 5.0, \lag_env_time,  currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol),
			//silence
			\silence_wait, 4.0

		],
		~pattern_mixer_node).register;

});

~unison_bank_9.add(\3-> {

	Synth(\loop_glitch,
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
			\silence_wait, 4.0

		],
		~pattern_mixer_node).register;

});


