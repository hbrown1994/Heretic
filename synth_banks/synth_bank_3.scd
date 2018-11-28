////////////////////////////////////////////////////////////////////////
//SYNTHS: 3 -> Granular Formings

~synth_bank_3.add(\0-> {

	Synth(\pattern_mixer, [\atk, ~onset_3, \rel, ~terminate_3, \del, ~delay_3, \prolongation, ~prolongation_3, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_3[\0].value}, {nil})}).register;

});


~synth_bank_3.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~onset_3, \rel, ~terminate_3, \del, ~delay_3, \prolongation, ~prolongation_3, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_3[\1].value}, {nil})}).register;

});




