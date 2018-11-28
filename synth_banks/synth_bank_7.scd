////////////////////////////////////////////////////////////////////////
//SYNTHS: 7 -> Sproradic Formings

~synth_bank_7.add(\0-> {

	Synth(\pattern_mixer, [\atk, ~onset_7, \rel, ~terminate_7, \del, ~delay_7, \prolongation, ~prolongation_7, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_7[\0].value}, {nil})}).register;

});



~synth_bank_7.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~onset_7, \rel, ~terminate_7, \del, ~delay_7, \prolongation, ~prolongation_7, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_7[\1].value}, {nil})}).register;

});
