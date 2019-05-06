
~unison_bank_4.add(\0-> {
	//GOOD -> have freq setting change with each kick onset
	Synth(\klank, [\amp, -6, \input_onsets, ~onset_sends, \input, ~sum_out_send, \out,  ~outbus_processing, \atk, ~onset_time_12, \rel, ~terminate_time_12,  ~prolongation_12, \gate, 1], target: ~live_processing_node).register;
});


~unison_bank_4.add(\1-> {
	Synth(\loop_glitch_mel,
		[\gate, 1,

			//looping
			\startPos, 0, \startLoop, 0,
			\prelevel, 0.0,
			\damping, 0.1, \fb, 0.2, \size,0.6, \delay_high, 0.8,

			//rate
			\rate_low_gate, 1, \rate_low_time,currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \rate_low_1, 2.0 ,\rate_low_2, 4.0,
			\rate_high_gate, 1, \rate_high_time, currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \rate_high_1, 5.0, \rate_high_2, 10.0,

			//end
			\end_low_gate, 1, \end_low_time,  currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \end_low_1, 0.02 ,\end_low_2, 0.05,
			\end_high_gate, 1, \end_high_time,  currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), \end_high_1, 0.09, \end_high_2, 0.003,


			//routing
			\onsets_in, ~onset_sends, \audio_in, ~sum_out_send, \out, ~outbus_processing,

			//silence
			\silence_weight_low, 0.0, \silence_weight_high, 1.0,
			\silence_low_low, 1.0, \silence_low_high, 0.3,
			\silence_high_low, 0.0, \silence_high_high, 0.7,
			\trig_env_rel, 2.0, \freq_shift, -500,

			//lag
			\lag_env_gate, 1, \lag_weight_low, 0, \lag_weight_high, 0,
			\lag_low, 0, \lag_high, 0, \lag_env_time,  0.1,
			//silence
			\silence_wait, 4.0, \amp, -12,
			\wet_num, 0,

		],
		~pattern_mixer_node).register;
});