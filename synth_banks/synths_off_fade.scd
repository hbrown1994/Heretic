//Kill all synths
(~synth_counter+1).do{

	arg count=0;

	count.postln;

	if(currentEnvironment.at(("synth_instance_"++count.asString).asSymbol).isPlaying, {currentEnvironment.at(("synth_instance_"++count.asString).asSymbol).set(\rel, {Rand(30.0, 60.0)}, \gate, 0, \prolongation, -8, \del, 0)});

	if(currentEnvironment.at(("pattern_instance_"++count.asString).asSymbol).isPlaying, {currentEnvironment.at(("pattern_instance_"++count.asString).asSymbol).stop});

	if(currentEnvironment.at(("synth_routine_"++count.asString).asSymbol).isPlaying, {currentEnvironment.at(("synth_routine_"++count.asString).asSymbol).stop});
	if(currentEnvironment.at(("build_instance_"++count.asString).asSymbol).isPlaying, {currentEnvironment.at(("build_instance_"++count.asString).asSymbol).set(\gate, 0, \prolongation, -8, \del, 0)});


	count = count + 1;
};



