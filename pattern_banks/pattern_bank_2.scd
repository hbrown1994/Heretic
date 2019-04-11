////////////////////////////////////////////////////////////////////////
//SYNTHS: 2 -> DRONE Formings


~pattern_bank_2.add(\0-> {
	Routine({
		 var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2;
		    var dur_high_1 = 0.5, dur_low_1 = 5.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
            var dur_high_2 = 2.0, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		    var filter_high_1=5000, filter_low_1=100, filter_med_1 = [filter_high_1, filter_low_1].mean;
		    var set_onset=~onset_2, set_continuation=~set_continuation.next(\2), set_termination=~terminate_2;
		    var onset_time=~onset_time_2, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_2;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);

		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\metal1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Env(dur_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pwhite(10.0, 20.0),
				\rel, Pwhite(10.0, 30.0),
				\buf, Prand(m[\tb_cym][(0..(m[\tb_cym].size-1))], inf),
				\rate, Prand([Pexprand(-0.1, -0.6), Pwhite(0.1, 0.6)], inf),
				\spos, Pwhite(0, s.sampleRate*240),
				\amp, 0,
				\loop, 0,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, Env(filter_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),
				\high_pass_mix, 1,
				\high_pass_freq, 20,
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol));

	}).play(SystemClock);

});


~pattern_bank_2.add(\1-> {
	Routine({
		 var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2;
		    var dur_high_1 = 0.5, dur_low_1 = 5.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
            var dur_high_2 = 2.0, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		    var filter_high_1=5000, filter_low_1=400, filter_med_1 = [filter_high_1, filter_low_1].mean;
		    var set_onset=~onset_2, set_continuation=~set_continuation.next(\2), set_termination=~terminate_2;
		    var onset_time=~onset_time_2, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_2;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\metal2,
			Pbind(
				\instrument, \pattern_buf,
				 \dur, Pwhite(Env(dur_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pwhite(10.0, 20.0),
				\rel, Pwhite(10.0, 30.0),
				\buf, Prand(m[\bowed_cymbal][(0..(m[\bowed_cymbal].size-1))], inf),
				\rate, Prand([Pexprand(-0.1, -0.6), Pwhite(0.1, 0.6)], inf),
				\spos, Pwhite(0, 2000),
				\amp, 0,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq,  Env(filter_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),
				\high_pass_mix, 1,
				\high_pass_freq, 30,
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol));

	}).play(SystemClock);

});


~pattern_bank_2.add(\2-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2;
		    var dur_high_1 = 0.5, dur_low_1 = 5.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
            var dur_high_2 = 2.0, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		    var filter_high_1=5000, filter_low_1=400, filter_med_1 = [filter_high_1, filter_low_1].mean;
		    var set_onset=~onset_2, set_continuation=~set_continuation.next(\2), set_termination=~terminate_2;
		    var onset_time=~onset_time_2, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_2;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\metal3,
			Pbind(
				\instrument, \pattern_buf,
				 \dur,  Pwhite(Env(dur_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pwhite(10.0, 20.0),
				\rel, Pwhite(10.0, 30.0),
				\buf, Prand(m[\gong][(0..(m[\gong].size-1))], inf),
				\rate, Prand([Pexprand(-0.6, -1.2), Pwhite(0.6, 1.2)], inf),
				\spos, Pwhite(0, s.sampleRate*201),
				\amp, 0,
				\loop, 0,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, Env(filter_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),
				\high_pass_mix, 1,
				\high_pass_freq, 30,
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol));

	}).play(SystemClock);

});


~pattern_bank_2.add(\3-> {
	Routine({
		var this_synth = ~synth_counter, dur_continuant_1=0, dur_continuant_2=0, continuant, dur_env_1, atk_env_1, rel_env_1, filter_env_1, dur_env_2, atk_env_2, rel_env_2, filter_env_2;
		    var dur_high_1 = 0.5, dur_low_1 = 5.0, dur_med_1 = [dur_high_1, dur_low_1].mean;
            var dur_high_2 = 2.0, dur_low_2 = 8.0, dur_med_2 = [dur_high_2, dur_low_2].mean;
		    var filter_high_1=5000, filter_low_1=100, filter_med_1 = [filter_high_1, filter_low_1].mean;
		    var set_onset=~onset_2, set_continuation=~set_continuation.next(\2), set_termination=~terminate_2;
		    var onset_time=~onset_time_2, continuation_time=currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time=~terminate_time_2;

		currentEnvironment.put(("pattern_bus_"++this_synth.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		dur_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, dur_low_1, dur_med_1, dur_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, dur_low_1, dur_med_1, dur_high_1);
		filter_env_1 = SmalleyPatternOnset.setPatternOnset(set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternContinuation.setPatternContinuation(set_continuation, set_onset, filter_low_1, filter_med_1, filter_high_1)++SmalleyPatternTerminate.setPatterntermination(set_termination, set_continuation, filter_low_1, filter_med_1, filter_high_1);


		dur_env_2=dur_env_1.replace(dur_high_1, dur_high_2);
		dur_env_2=dur_env_2.replace(dur_med_1, dur_med_2);
		dur_env_2=dur_env_2.replace(dur_low_1, dur_low_2);

		s.sync;
		currentEnvironment.put(("pattern_instance_"++this_synth.asString).asSymbol, Pdef(
			\metal4,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(Env(dur_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose), Env(dur_env_2, [onset_time,  currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose)),
				\atk, Pwhite(10.0, 20.0),
				\rel, Pwhite(10.0, 30.0),
				\buf, Pxrand(m[\superball][(0..(m[\superball].size-1))], inf),
				\rate, Pxrand([Pexprand(-0.3, -0.8), Pwhite(0.3, 0.8)], inf),
				\spos, Pwhite(0, s.sampleRate*11),
				\amp, 0,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, Env(filter_env_1, [onset_time, currentEnvironment.at(("synth_duration_"++this_synth.asString).asSymbol), termination_time], [\lin, \exp, \sin, \wel, \sqr, \cub].choose),
				\high_pass_mix, 1,
				\high_pass_freq, 30,
				\out, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++this_synth.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++this_synth.asString).asSymbol));

	}).play(SystemClock);

});



