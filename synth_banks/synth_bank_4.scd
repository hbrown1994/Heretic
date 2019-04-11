////////////////////////////////////////////////////////////////////////
//SYNTHS: 4 -> Melodic Formings

~synth_bank_4.add(\0-> {

	 Synth(\slow_mel, [\gate, 1,
		\trig1_speed, (0.05 + 0.2.rand), \trig2_speed, (0.05 + 0.2.rand),
		\trig3_speed, (0.05 + 0.2.rand), \trig4_speed, (0.05 + 0.2.rand),
		\trig5_speed, (0.05 + 0.2.rand), \trig6_speed, (0.05 + 0.2.rand),
		\trig_env_dev, SmalleyPatternOnset.setPatternOnset(~onset_4, 0.05, 0.1, 0.2)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.05, 0.1, 0.2)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4,0.05, 0.1, 0.2) ,
		\freqs, Array.rand(1, 50, 60)++Array.rand(9, 100, 300)++Array.rand(10, 300, 600)++Array.rand(10, 700, 1000),
		\freqs_weight, [0.2]++Array.linrand(30, 0.3, 1.0).normalizeSum,
		\times,[~onset_time_4, currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), ~terminate_time_4] ,
		\trig5_dev, (0.05 + 0.6.rand), \trig6_dev, 1,
		\rel_env_low_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 4, 6, 7)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 4, 6, 7)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 4, 6, 7),
	    \rel_env_high_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 9, 10, 12)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 9, 10, 12)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 9, 10, 12),
		\bend_env_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 12, 21, 36)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 12, 21, 36)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 12, 21, 36),
		\dist, 0.08, \amp, 0,
		\atk, if(~onset_4 == \downbeat, {0.01}, {if(~onset_4 == \departue, {0.01}, {~onset_time_4});}); , \env_rel, ~terminate_time_4,
		\out, ~outbus_patterns
	], ~pattern_mixer_node).register;


});


~synth_bank_4.add(\1-> {

	Synth(\mel_1, [\gate, 1,
		\half_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 7, 6, 6)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 7, 6, 6)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 7, 6, 6),
		\quarter_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 8, 7, 7)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 8, 7, 7)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 8, 7, 7),
		\quarter_quin_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 0, 1, 2)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0, 1, 2)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0, 1, 2),
		\quarter_trip_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 0, 1, 2)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0, 1, 2)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0, 1, 2),
		\eighth_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 1, 2, 4)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 1, 2, 3)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 1, 2, 3),
		\trip_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 1, 2, 4)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 1, 2, 3)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 1, 2, 3),
		\sixteenth_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 0, 1, 4)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0, 1, 3)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0, 1, 3),

		\quin_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 0, 1, 5)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0, 1, 3)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0, 1, 3),

		\trig_dev_array,SmalleyPatternOnset.setPatternOnset(~onset_4, 0.0, 0.2, 0.7)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.0, 0.2, 0.7)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.0, 0.2, 0.7),

		\noise_speed_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 0.1, 0.3, 0.7)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.1, 0.3, 0.7)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.1, 0.3, 0.7),

		\trig_speed_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 0.2, 1.2, 3.0)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.2, 1.2, 3.0)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.2, 1.2, 3.0),


		\pitch_array, Array.linrand(20, 60, 2000),
		\pitch_weights, Array.rand(20, 0.4, 1.0),


		\times_array, [~onset_time_4, currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), ~terminate_time_4],
		\atk, if(~onset_4 == \downbeat, {0.01}, {if(~onset_4 == \departue, {0.01}, {~onset_time_4});}); , \env_rel, ~terminate_time_4,
		\out, ~outbus_patterns

	], ~pattern_mixer_node).register;

});




~synth_bank_4.add(\2-> {

	Synth(\fast_mel, [
		\trig1_dev, 0.0, \trig2_dev, 0.0, \trig3_dev, 0.0,
		\trig4_dev, 0.0, \trig5_dev, 0.0, \trig6_dev, 0.0,
		\rel_low, 0.1, \rel_high, 2.0,
		\dist, 0.4,
		\trig_speed_low, 0.1, \trig_speed_high, 1.0,
		\onset_time, ~onset_time_4, \continuation_time, ~continuation_time_4, \termination_time, ~terminate_time_4,
		\freq_env_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 0, 3, 7)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0, 3, 7)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0, 3, 7),
		\freq_env_times, [~onset_time_4, currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol), ~terminate_time_4],

		\trig_low_env_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 0.1, 0.3, 0.6)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.1, 0.3, 0.6)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.1, 0.3, 0.6),

		\trig_high_env_array,  SmalleyPatternOnset.setPatternOnset(~onset_4, 0.2, 0.6, 1.5)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.2, 0.6, 1.5)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.2, 0.6, 1.5),

		\trig_dev_env_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 0.0, 0.3, 0.7)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.0, 0.3, 0.7)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.0, 0.3, 0.7),

		\freqs, Array.rand(1, 50, 60)++Array.rand(5, 200, 400)++Array.rand(6, 410, 600)++Array.rand(6, 600, 1200),
		\freqs_weight, [0.2]++Array.rand(17, 0.3, 1.0),

		\dist_env_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 0.0, 0.1, 0.3)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4,0.0, 0.1, 0.3)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.0, 0.1, 0.3),
		\wet_env_array,  SmalleyPatternOnset.setPatternOnset(~onset_4, 0.1, 0.2, 0.3)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.1, 0.2, 0.3)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.1, 0.2, 0.3),

		\delaytime, 3,

		\delayfactor_env_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 0.0, 0.05, 0.1)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 0.0, 0.05, 0.1)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 0.0, 0.05, 0.1),

		\bend_env_array, SmalleyPatternOnset.setPatternOnset(~onset_4, 10.0, 20.0, 30.0)++SmalleyPatternContinuation.setPatternContinuation(~continuation_4, ~onset_4, 10.0, 20.0, 30.0)++SmalleyPatternTerminate.setPatterntermination(~terminate_4, ~continuation_4, 10.0, 20.0, 30.0),
		\atk, if(~onset_4 == \downbeat, {0.01}, {if(~onset_4 == \departue, {0.01}, {~onset_time_4});}); , \env_rel, ~terminate_time_4,
		\out, ~outbus_patterns

	], ~pattern_mixer_node).register;

});

~synth_bank_4.add(\3-> {

	Synth(\mel_2, [\freq, 440, \wait_time, 0.2, \tableSize, 2, \amp_init, (0.5 + 0.5.rand), \delaytime, 1.0, \delayfactor, 0.0, \atk, if(~onset_4 == \downbeat, {0.01}, {if(~onset_4 == \departue, {0.01}, {~onset_time_4});}); , \rel, ~terminate_time_4, \out, ~outbus_patterns], ~pattern_mixer_node).register;


});

