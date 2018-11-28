////////////////////////////////////////////////////////////////////////
//SYNTHS: 6 -> Polyrhythmic Formings

~pattern_bank_6.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\poly_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pexprand(0.5, 2),
				\atk, 0.005,
				\rel, Pwhite(2, 10),
				\c1, Pwrand([-100, 4], [9, 2].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 2].normalizeSum, inf),
				\buf, Pwrand(m[\BassDrum][(0..(m[\BassDrum].size-1))]++m[\hats][(0..(m[\hats].size-1))]++m[\snare][(0..(m[\snare].size-1))]++m[\Cymbal][(0..(m[\Cymbal].size-1))], (Array.rand(m[\BassDrum].size, 1, 3)++Array.rand(m[\hats].size, 5, 8)++Array.rand(m[\snare].size, 5, 7)++Array.rand(m[\Cymbal].size, 2, 4)).normalizeSum, inf),
				\rate, Pwrand([1]++Array.rand(10, 0.4, 2.5)++Array.rand(10, 3, 10),  ([9]++Array.rand(10, 5, 8)++Array.rand(10, 1, 3)).normalizeSum, inf),
				\spos, 0,
				\amp, 1,
				\loop, 1,
				\pan_pos, Pwhite(-1.0, 1.0),
				\low_pass_mix, 0,
				\low_pass_freq, 20000,
				\high_pass_mix, 1,
				\high_pass_freq, 30,
				\out,  currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol),
				\group, ~pattern_node,
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++~synth_counter.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol))

	}).play(SystemClock);

});



~pattern_bank_6.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\poly_1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(2, 5),
				\atk, 0.005,
				\rel, Pwhite(5, 15),
				\c1, Pwrand([-100, 4], [9, 2].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 2].normalizeSum, inf),
				\buf, Prand(m[\poly][(0..(m[\poly].size-1))], inf),
				\rate, Pwrand([1]++Array.rand(9, 0.8, 1.1),  ([10]++Array.rand(9, 4, 7)).normalizeSum, inf),
				\spos, 0,
				\amp, 1,
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




