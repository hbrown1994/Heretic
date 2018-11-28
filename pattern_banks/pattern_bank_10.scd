////////////////////////////////////////////////////////////////////////
//SYNTHS: 10 -> SOLO Formings


~pattern_bank_10.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\solo_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand([0.05, 0.04, 0.01, 0.008, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 1, 1.5, 2], (Array.rand(11, 9, 10)++Array.rand(3, 1, 3)).normalizeSum, inf),
				\atk, Pwrand([0.005, 0.5, 1, 2, 3, 5, 7, 11], Array.rand(8, 3, 9).normalizeSum, inf),
				\rel, Pwrand([0.005, 0.1, 0.5, 1, 2, 4, 8], [9, 8, 2, 2, 1, 3, 2].normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, Prand(m[\tb_cym][(0..(m[\tb_cym].size-1))]++m[\scrape][(0..(m[\scrape].size-1))]++m[\no_input_rhythm][(0..(m[\no_input_rhythm].size-1))]++m[\megaphone][(0..(m[\megaphone].size-1))]++m[\struck][(0..(m[\struck].size-1))]++m[\no_input_high][(0..(m[\no_input_high].size-1))]++m[\no_input_gesture][(0..(m[\no_input_gesture].size-1))]++m[\bag][(0..(m[\bag].size-1))]++m[\rod][(0..(m[\rod].size-1))]++m[\no_input_unstable_drone][(0..(m[\no_input_unstable_drone].size-1))]++m[\gong][(0..(m[\gong].size-1))], inf),
				\rate, Pwrand(Array.series(50, -10, 0.2)++Array.series(50, 0.2, 0.2),  (Array.rand(100, 3, 9)).normalizeSum, inf),
				\spos, Pwhite(0, s.sampleRate*240),
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 20000,
				\high_pass_mix, 1,
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


~pattern_bank_10.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\solo_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand([0.05, 0.04, 0.01, 0.008, 0.1, 0.2, 0.3, 0.4, 0.5], (Array.rand(9, 1, 10)).normalizeSum, inf),
				\atk, Pwrand([0.005, 0.5, 1, 2, 3, 5], Array.rand(6, 3, 9).normalizeSum, inf),
				\rel, Pwrand([0.005, 0.1, 0.5], [9, 8, 7].normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, Prand(m[\grit][(0..(m[\grit].size-1))], inf),
				\rate, Pwrand(Array.series(50, -20, 0.2)++Array.series(50, 0.2, 0.2),  (Array.rand(100, 1, 10)).normalizeSum, inf),
				\spos, Pwhite(0, s.sampleRate*17*60),
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 20000,
				\high_pass_mix, 1,
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



