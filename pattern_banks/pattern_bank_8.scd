////////////////////////////////////////////////////////////////////////
//SYNTHS: 8 -> transgressive Formings

~pattern_bank_8.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\trans_1,//fast
			Pbind(
				\instrument, \pattern_buf,
				\dur, Prand(Array.rand(30, 0.1, 2), inf),
				\atk, 0.005,
				\rel, Prand(Array.rand(20, 3, 6)++Array.series(3, 0.005, 0.01), inf),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Prand(m[\trans][(0..(m[\trans].size-1))], inf),
				\rate, Pwrand(Array.rand(10, 0.8, 2.1),  Array.rand(10, 4, 7).normalizeSum, inf),
				\spos, 0,
				\amp, -3,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 20000,
				\high_pass_mix, 0,
				\high_pass_freq, 30,
				\out, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++~synth_counter.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol))

	}).play(SystemClock);

});


~pattern_bank_8.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\trans_2, //slow
			Pbind(
				\instrument, \pattern_buf,
				\dur, Prand(Array.rand(30, 5, 10), inf),
				\atk,Prand(Array.rand(20, 10, 20), inf),
				\rel, Prand(Array.rand(20, 10, 20), inf),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Prand(m[\trans][(0..(m[\trans].size-1))], inf),
				\rate, Pwrand(Array.rand(10, 0.8, 1.5),  Array.rand(10, 4, 7).normalizeSum, inf),
				\spos, 0,
				\amp, -3,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 20000,
				\high_pass_mix, 0,
				\high_pass_freq, 30,
				\out, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++~synth_counter.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol))

	}).play(SystemClock);

});







