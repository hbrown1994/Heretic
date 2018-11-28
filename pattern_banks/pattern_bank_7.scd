////////////////////////////////////////////////////////////////////////
//SYNTHS: 7 -> Sporadic Formings

~pattern_bank_7.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\sproadic_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pseq([Prand(Array.rand(10, 0.005, 0.01), 20), Prand(Array.series(25, 6, 0.5), 1)], inf),
				\atk, 0.005,
				\rel, Pseq([Prand(Array.rand(10, 1, 5), 20), Prand(Array.series(10, 0.005, 0.01), 1)], inf),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Pseq([Prand(m[\poly][(0..(m[\poly].size-1))]++m[\trans][(0..(m[\trans].size-1))]++m[\megaphone][(0..(m[\megaphone].size-1))]++m[\no_input_glitch][(0..(m[\no_input_glitch].size-1))]++m[\cringle][(0..(m[\cringle].size-1))], 20), m[\silence][0]], inf),
				\rate, Pwrand(Array.rand(10, 0.8, 5.1),  Array.rand(10, 4, 7).normalizeSum, inf),
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


~pattern_bank_7.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\sproadic_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pseq([Prand(Array.rand(10, 0.001, 0.03), 100), Prand(Array.series(20, 7, 0.5), 1)], inf),
				\atk, 0.005,
				\rel, Pseq([Prand(Array.rand(10, 2, 5), 100), Prand(Array.series(10, 0.005, 0.01), 1)], inf),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Pseq([Prand(m[\BassDrum][(0..(m[\BassDrum].size-1))]++m[\hats][(0..(m[\hats].size-1))]++m[\snare][(0..(m[\snare].size-1))]++m[\Cymbal][(0..(m[\Cymbal].size-1))], 100), m[\silence][0]], inf),
				\rate, Pwrand(Array.series(30, 0.4, 0.1),  Array.rand(30, 4, 7).normalizeSum, inf),
				\spos, 0,
				\amp, -3,
				\loop, Pwrand([0, 1],  [9, 1].normalizeSum, inf),
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







