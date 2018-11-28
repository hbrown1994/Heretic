////////////////////////////////////////////////////////////////////////
//SYNTHS: 3 -> granular Formings

~pattern_bank_3.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\granular_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand([0.01, 0.4, 0.5, 1, 2], (Array.rand(5, 8, 10)).normalizeSum, inf),
				\atk, Pwrand([0.005, 0.5, 1, 2, 3, 5], (Array.rand(2, 7, 10)++Array.rand(4, 1, 4)).normalizeSum, inf),
				\rel, Pwrand([2, 4, 6, 8, 10, 0.1, 0.2, 0.3, 0.6, 0.8, 0.005], (Array.rand(5, 6, 9)++Array.rand(5, 1, 4)++[9]).normalizeSum, inf),
				\c1, 4,
				\c2, -4,
				\buf, Pwrand([m[\bag][(0..(m[\bag].size-1))], m[\silence][(0..(m[\silence].size-1))]], [7, 5].normalizeSum, inf),
				\rate, Pwrand(Array.series(50, -20, 0.2)++Array.series(50, 0.2, 0.2),  (Array.rand(100, 1, 10)).normalizeSum, inf),
				\spos, Pwhite(0, s.sampleRate*1),
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


~pattern_bank_3.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\granular_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand(Array.rand(10, 0.005, 0.05)++Array.rand(10, 0.1, 1), (Array.rand(10, 7, 10)++Array.rand(10, 1, 4)).normalizeSum, inf),
				\atk, Pwrand(Array.rand(10, 0.005, 0.01), Array.rand(10, 3, 9).normalizeSum, inf),
				\rel, Pwrand([0.005, 0.008, 0.01, 0.05, 0.07, 0.1, 0.2, 0.3, 0.4, 0.5], (Array.rand(5, 7, 10)++Array.rand(5, 1, 2)).normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, Pwrand([m[\brushes][(0..(m[\brushes].size-1))], m[\glass][(0..(m[\glass].size-1))], m[\megaphone][(0..(m[\megaphone].size-1))], m[\asmr][(0..(m[\asmr].size-1))]], Array.rand(4, 4, 6).normalizeSum, inf),
				\rate, Pwrand(Array.series(100, -20, 0.2)++Array.series(50, 0.2, 0.1),  (Array.rand(150, 1, 10)).normalizeSum, inf),
				\spos, Pwhite(0, s.sampleRate*1),
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


