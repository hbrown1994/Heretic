////////////////////////////////////////////////////////////////////////
//SYNTHS: 6 -> Polyrythmic Formings

~synth_bank_6.add(\0-> {

	Synth(\pattern_mixer, [\amp, -12, \atk, if(~onset_6 == \downbeat, {0.01}, {if(~onset_6 == \departue, {0.01}, {~onset_time_6});}); , \rel, ~terminate_time_6, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_6[\0].value}, {nil})}).register;

});

~synth_bank_6.add(\1-> {

	Synth(\pattern_mixer, [\amp, -12,\atk, if(~onset_6 == \downbeat, {0.01}, {if(~onset_6 == \departue, {0.01}, {~onset_time_6});}); , \rel, ~terminate_time_6, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_6[\1].value}, {nil})}).register;

});

/*
~synth_bank_6.add(\2-> {


Synth(\vosim,
	[
		\trig_dev_array, SmalleyPatternOnset.setPatternOnset(~onset_6, 0.0, 0.4, 0.7)++SmalleyPatternContinuation.setPatternContinuation(~continuation_6, ~onset_6,0.0, 0.4, 0.7)++SmalleyPatternTerminate.setPatterntermination(~terminate_6, ~continuation_6,0.0, 0.4, 0.7),
		\times_array, [~onset_time_6, currentEnvironment.at(("synth_duration_"++~synth_counter.asString).asSymbol),~terminate_time_6],
		\trig_speed_array, SmalleyPatternOnset.setPatternOnset(~onset_6, 0.7, 1.2, 2.7)++SmalleyPatternContinuation.setPatternContinuation(~continuation_6, ~onset_6, 0.7, 1.2, 2.7)++SmalleyPatternTerminate.setPatterntermination(~terminate_6, ~continuation_6, 0.7, 1.2, 2.7),
		\noise_speed, 9.0,
		\delaytime, 5.0,
		\delay_factor_array, SmalleyPatternOnset.setPatternOnset(~onset_6, 0.2, 0.6, 0.95)++SmalleyPatternContinuation.setPatternContinuation(~continuation_6, ~onset_6, 0.2, 0.6, 0.95)++SmalleyPatternTerminate.setPatterntermination(~terminate_6, ~continuation_6, 0.2, 0.6, 0.95),
			\strong_env_array,SmalleyPatternOnset.setPatternOnset(~onset_6, 0.0, 0.1, 0.4)++SmalleyPatternContinuation.setPatternContinuation(~continuation_6, ~onset_6, 0.0, 0.1, 0.4)++SmalleyPatternTerminate.setPatterntermination(~terminate_6, ~continuation_6, 0.0, 0.1, 0.4),
		\amp, -20,
		\partials, 2, \ratio, 2 ,
		\atk, 0.1, \env_rel, ~terminate_time_6,
		\out,  ~outbus_patterns
	], ~pattern_mixer_node).register;

});*/


