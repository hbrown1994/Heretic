//drone_formings
~unison_bank_2.add(\0-> {
   Synth(\verb, [\amp, -3,

	\time, 20.0, \damp, 0.0, \size, 3.0,  \earlyDiff, 0.707,
	\modDepth, 1.0, \modFreq, 5,
	\low, 0.6,  \mid,0.9, \high, 0.9, \lowcut, 200, \highcut, 15000,
	\hpf_freq, 200,

	\in, ~sum_out_send, \out,  ~outbus_processing,
	\atk, ~onset_time_12, \rel, ~terminate_time_12,  ~prolongation_12,
	\gate, 1

], target: ~live_processing_node).register;
});


~unison_bank_2.add(\1-> {
	Synth(\greyhole_1, [\amp, -3, \size, 1, \fb, 0.4, \damping, 0.7, \in, ~sum_out_send, \out,  ~outbus_processing, \atk, ~onset_time_12, \rel, ~terminate_time_12,  ~prolongation_12, \gate, 1, \hpf_freq, 500], target: ~live_processing_node).register;
});







