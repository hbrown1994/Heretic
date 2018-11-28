////////////////////////////////////////////////////////////////////////
//SYNTHS: 10 -> SOLO

~synth_bank_10.add(\0-> {

	Synth(\pattern_mixer, [\atk, ~onset_10, \rel, ~terminate_10, \del, ~delay_10, \prolongation, ~prolongation_10, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_10[\0].value}, {nil})}).register;


});

~synth_bank_10.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~onset_10, \rel, ~terminate_10, \del, ~delay_10, \prolongation, ~prolongation_10, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_10[\1].value}, {nil})}).register;

});
