Routine({
	var synth_num = ~synth_counter;

	0.1.wait;

	e[\unison_sequence].value;

	~over_lap_wait[[0, 1, 2, 3, 4, 5].wchoose([0.1, 0.1, 0.4, 0.5, 0.5, 0.0].normalizeSum)].choose.wait;


	//Kill all synths
	(synth_num).do{

	arg count=0;

	count.postln;

		if(currentEnvironment.at(("synth_instance_"++count.asString).asSymbol).isPlaying, {currentEnvironment.at(("synth_instance_"++count.asString).asSymbol).set(\gate, 0)});

	if(currentEnvironment.at(("pattern_instance_"++count.asString).asSymbol).isPlaying, {currentEnvironment.at(("pattern_instance_"++count.asString).asSymbol).stop});





	count = count + 1;
};



}).play(SystemClock);

