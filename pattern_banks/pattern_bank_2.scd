////////////////////////////////////////////////////////////////////////
//SYNTHS: 2 -> DRONE Formings


~pattern_bank_2.add(\0-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\metal1,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(0.5, 2),
				\atk, Pwhite(1, 5),
				\rel, Pwhite(10, 30),
				\buf, Prand(m[\tb_cym][(0..(m[\tb_cym].size-1))], inf),
				\rate, Prand([Pexprand(-0.1, -0.6), Pwhite(0.1, 0.6)], inf),
				\spos, Pwhite(0, s.sampleRate*240),
				\amp, 0,
				\loop, 0,
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


~pattern_bank_2.add(\1-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\metal2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(0.5, 2),
				\atk, Pwhite(5, 10),
				\rel, Pwhite(10, 30),
				\buf, Prand(m[\bowed_cymbal][(0..(m[\bowed_cymbal].size-1))], inf),
				\rate, Prand([Pexprand(-0.1, -0.6), Pwhite(0.1, 0.6)], inf),
				\spos, Pwhite(0, 3000),
				\amp, 0,
				\loop, 0,
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


~pattern_bank_2.add(\2-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\metal2,
			Pbind(
				\instrument, \pattern_buf,
				\dur, Pwhite(0.5, 2),
				\atk, Pwhite(5, 10),
				\rel, Pwhite(10, 30),
				\buf, Prand(m[\gong][(0..(m[\gong].size-1))], inf),
				\rate, Prand([Pexprand(-0.6, -1.2), Pwhite(0.6, 1.2)], inf),
				\spos, Pwhite(0, s.sampleRate*201),
				\amp, 0,
				\loop, 0,
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


~pattern_bank_2.add(\3-> {
	Routine({
		currentEnvironment.put(("pattern_bus_"++~synth_counter.asString).asSymbol, Bus.audio(s, 2));
		s.sync;
		currentEnvironment.put(("pattern_instance_"++~synth_counter.asString).asSymbol, Pdef(
			\sinepat,
			Pbind(
				\instrument, \pattern_sine, // chooses instrument
				\dur, Pexprand(0.5, 2, inf), //Pwhite creates linear random numbers
				\octave, Prand([0.5, 1, 2, 3], inf),
				\c1, Pwrand(Array.series(8, 1, 1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf),
				\c2, Pwrand(Array.series(8, -1, -1), [1, 1, 1, 4, 3, 2, 1, 4].normalizeSum, inf), //neg
				\freq, Pseq([58, 63, 68, 73, 60, 66, 71, 76, 59, 64, 69, 73, 56, 62, 67, 72, 55, 60, 65, 70, 55, 60, 64, 71, 54, 60, 63, 70 , 54, 59, 62, 69, 56, 62, 67, 72, 55, 62, 65, 72, 58, 64, 68, 73, 58, 63, 68, 73, 56, 51, 67, 72, 56, 62, 67, 72], inf).midicps,//Pexprand produces exponentioal random numbers within the range for 'x' amount of times.
				\atk, Pwhite(7.0, 15.0, inf),
				\rel, Pwhite(7.0, 15.0, inf),
				\amp, 0.4,
				\pan, Pwhite(-1.0, 1.0, inf),
				\out, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol),
			);
		).play;
		);

		s.sync;

		currentEnvironment.at(("synth_instance_"++~synth_counter.asString).asSymbol).set(\input_bus, currentEnvironment.at(("pattern_bus_"++~synth_counter.asString).asSymbol))

	}).play(SystemClock);

});
