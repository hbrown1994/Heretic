////////////////////////////////////////////////////////////////////////
//SYNTHS: 5 -> pulse Formings

~pattern_bank_5.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\granular_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand([2, 6, 8, 9, 10, 11, 12, 13], ([3]++Array.rand(7, 7, 10)).normalizeSum, inf),
				\atk, Pwrand([0.5, 1, 2, 3, 5, 6, 7, 8, 10, 12, 15, 20], [3, 3, 4, 5, 5, 6, 7, 7, 7, 6, 8, 6], inf),
				\rel, Pwrand([20, 22, 24, 26, 27, 28, 30], Array.rand(7, 6, 8).normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), Array.rand(8, 6, 8).normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), Array.rand(8, 6, 8).normalizeSum, inf), //negantive
				\buf, Prand(m[\pulse][(0..(m[\pulse].size-1))], inf),
				\rate, Pwhite(0.6, 1.1),
				\spos, 0,
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], Array.rand(9, 1, 10), inf),
				\loop, 1,
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




