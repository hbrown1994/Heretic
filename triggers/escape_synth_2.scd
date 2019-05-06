Routine({
	var synth_num = ~synth_counter-1;

	currentEnvironment.at(("synth_routine_"++synth_num.asString).asSymbol).stop;

	e[\unison_sequence].value;

	~over_lap_wait[[0, 1, 2, 3, 4, 5].wchoose([0.2, 0.2, 0.3, 0.5, 0.5, 0.0].normalizeSum)].choose.wait;
	currentEnvironment.at(("synth_instance_"++synth_num.asString).asSymbol).set(\gate, 0);
	if(currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).isPlaying,
		{currentEnvironment.at(("pattern_instance_"++synth_num.asString).asSymbol).stop}, {nil})


}).play(SystemClock);

