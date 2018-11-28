////////////////////////////////////////////////////////////////////////
//SYNTHS: 1 -> Sparse Formings


~pattern_bank_1.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\metal2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pexprand(0.3, 5.0),
				\atk, 0.005,
				\rel, Pwhite(0.1, 0.4),
				\buf, Prand(m[\drums][(0..(m[\drums].size-1))], inf),
				\rate, 1,
				\spos, Pwhite(0, s.sampleRate*214),
				\amp, -6,
				\loop, 0,
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


~pattern_bank_1.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\metal2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pexprand(0.1, 5.0),
				\atk, Pwhite(0.005, 0.1),
				\rel, Pwhite(0.05, 1),
				\buf, Prand(m[\struck][(0..(m[\struck].size-1))]++m[\rod][(0..(m[\rod].size-1))]++m[\scrape][(0..(m[\scrape].size-1))]++m[\cringle][(0..(m[\cringle].size-1))], inf),
				\rate, 1,
				\spos, Pwhite(0, s.sampleRate*10),
				\amp, -6,
				\loop, 0,
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


~pattern_bank_1.add(\2-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\sparse_3,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pseq([Prand(Array.rand(10, 0.005, 0.01), 20), Prand(Array.series(20, 3, 0.5), 1)], inf),
				\atk, 0.005,
				\rel, Pseq([Prand(Array.rand(10, 1, 5), 20), Prand(Array.series(10, 0.005, 0.01), 1)], inf),
				\c1, Pwrand([-100, 4], [9, 6].normalizeSum, inf),
				\c2, Pwrand([100, 4], [9, 6].normalizeSum, inf),
				\buf, Pseq([Prand(m[\BassDrum][(0..(m[\BassDrum].size-1))]++m[\snare][(0..(m[\snare].size-1))], 20), m[\silence][0]], inf),
				\rate, Pwrand(Array.series(100, 0.4, 0.1),  Array.rand(100, 4, 7).normalizeSum, inf),
				\spos, 0,
				\amp, -3,
				\loop, 0,
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








