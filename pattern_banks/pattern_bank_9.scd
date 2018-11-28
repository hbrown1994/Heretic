////////////////////////////////////////////////////////////////////////
//SYNTHS: 9 -> Bombastic Formings

~pattern_bank_9.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\bomb_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand([0.05, 0.04, 0.01, 0.008, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.8, 1, 1.5, 2], (Array.rand(11, 9, 10)++Array.rand(3, 1, 3)).normalizeSum, inf),
				\atk, Pwrand([0.005, 0.5, 1, 2, 3, 5, 7, 11], Array.rand(8, 3, 9).normalizeSum, inf),
				\rel, Pwrand([0.005, 0.1, 0.5, 1, 2, 4, 8], [9, 8, 2, 2, 1, 3, 2].normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, Prand(m[\bombastic][(0..(m[\bombastic].size-1))]++m[\drums][(0..(m[\drums].size-1))], inf),
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


~pattern_bank_9.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\bomb_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand([0.05, 0.04, 0.01, 0.008], (Array.rand(4, 5, 10)).normalizeSum, inf),
				\atk, Pwrand([0.005, 0.5, 1, 2], Array.rand(4, 7, 9).normalizeSum, inf),
				\rel, Pwrand([0.005, 0.1, 0.5, 1], [9, 8, 2, 2].normalizeSum, inf),
				\c1, Pwrand([-100, 4], [9, 2].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 2].normalizeSum, inf),
				\buf, Pwrand(m[\bombastic][(0..(m[\bombastic].size-1))]++m[\BassDrum][(0..(m[\BassDrum].size-1))]++m[\hats][(0..(m[\hats].size-1))]++m[\snare][(0..(m[\snare].size-1))]++m[\Cymbal][(0..(m[\Cymbal].size-1))], (Array.rand(m[\bombastic].size, 8, 10)++Array.rand(m[\BassDrum].size, 1, 2)++Array.rand(m[\hats].size, 2, 3)++Array.rand(m[\snare].size, 2, 4)++Array.rand(m[\Cymbal].size, 2, 3)).normalizeSum ,inf),
				\rate, Pwrand(Array.series(15, -3, 0.2)++Array.series(15, 0.2, 0.2),  (Array.rand(15, 3, 5)++Array.rand(15, 7, 10)).normalizeSum, inf),
				\spos, 0,
				\amp, Pwrand([Array.interpolation(3, -6, -9), Array.interpolation(3, -9, -12), Array.interpolation(3, -12, -16)], [7, 6, 6, 5, 4, 3, 3, 2, 1], inf),
				\loop, Pwrand([0, 1],  [9, 3].normalizeSum, inf),
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







