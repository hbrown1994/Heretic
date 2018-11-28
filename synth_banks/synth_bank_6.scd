////////////////////////////////////////////////////////////////////////
//SYNTHS: 6 -> Polyrythmic Formings

~synth_bank_6.add(\0-> {

	Synth(\pattern_mixer, [\atk, ~onset_6, \rel, ~terminate_6, \del, ~delay_6, \prolongation, ~prolongation_6, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_6[\0].value}, {nil})}).register;

});

~synth_bank_6.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~onset_6, \rel, ~terminate_6, \del, ~delay_6, \prolongation, ~prolongation_6, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_6[\1].value}, {nil})}).register;

});



