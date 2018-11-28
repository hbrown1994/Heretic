////////////////////////////////////////////////////////////////////////
//SYNTHS: 4 -> melodic Formings

~pattern_bank_4.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\melody_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand(Array.series(10, 0.5, 0.5), Array.rand(10, 5, 7).normalizeSum, inf),
				\atk, Pwrand(Array.series(10, 0.5, 0.5), Array.rand(10, 5, 7).normalizeSum, inf),
				\rel, Pwrand(Array.series(20, 5, 0.5), Array.rand(20, 5, 7).normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, Prand(m[\melody][(0..(m[\melody].size-1))], inf),
				\rate, Pwrand(Array.series(21, -0.3, 0.01)++Array.series(21, 0.1, 0.01), Array.rand(42, 5, 7).normalizeSum, inf),
				\spos, Pwhite(0, s.sampleRate*60*6),
				\amp, Pwrand([Array.interpolation(3, -0, -6), Array.interpolation(3, -6, -12)], Array.rand(6, 5, 7), inf),
				\loop, 1,
				\strength, Pwhite(0.5, 0.99),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 10000,
				\high_pass_mix, 1,
				\high_pass_freq, 300,
				\out, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++~synth_counter.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol))

	}).play(SystemClock);

});


~pattern_bank_4.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\melody_2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand(Array.series(10, 0.5, 0.5), Array.rand(10, 5, 7).normalizeSum, inf),
				\atk, Pwrand(Array.series(10, 0.5, 0.5), Array.rand(10, 5, 7).normalizeSum, inf),
				\rel, Pwrand(Array.series(20, 5, 0.5), Array.rand(20, 5, 7).normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, Prand(m[\melody][(0..(m[\melody].size-1))], inf),
				\rate, Pwrand(Array.series(20, -0.4, 0.01), Array.rand(20, 5, 7).normalizeSum, inf),
				\stretch, Pwhite(1.0, 0.5),
				\spos, Pwhite(0, s.sampleRate*60*6),
				\amp, Pwrand([Array.interpolation(3, -0, -6), Array.interpolation(3, -6, -12)], Array.rand(6, 5, 7), inf),
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 10000,
				\high_pass_mix, 1,
				\high_pass_freq, 300,
				\rq, 0.0005,
				\freq, Pwhite(1000, 5000.0),
				\out, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++~synth_counter.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol))

	}).play(SystemClock);

});

~pattern_bank_4.add(\2-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\melody_3,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwrand(Array.series(10, 0.5, 0.5), Array.rand(10, 5, 7).normalizeSum, inf),
				\atk, Pwrand(Array.series(10, 0.5, 0.5), Array.rand(10, 5, 7).normalizeSum, inf),
				\rel, Pwrand(Array.series(20, 5, 0.5), Array.rand(20, 5, 7).normalizeSum, inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //negantive
				\buf, Prand(m[\melody][(0..(m[\melody].size-1))], inf),
				\rate, Pwrand(Array.series(21, -0.6, 0.01), Array.rand(21, 5, 7).normalizeSum, inf),
				\spos, Pwhite(0, s.sampleRate*60*6),
				\amp, Pwrand([Array.interpolation(3, -0, -6), Array.interpolation(3, -6, -12)], Array.rand(6, 5, 7), inf),
				\loop, 1,
				\strength, Pwhite(0.5, 0.99),
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 1,
				\low_pass_freq, 10000,
				\high_pass_mix, 1,
				\high_pass_freq, 300,
				\out, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++~synth_counter.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol))

	}).play(SystemClock);

});



