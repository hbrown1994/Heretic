////////////////////////////////////////////////////////////////////////
//SYNTHS: 8 -> Transgressive Formings

/*
~synth_bank_8.add(\0-> {

Synth(\pattern_mixer, [\atk, ~onset_8, \rel, ~terminate_8, \del, ~delay_8, \prolongation, ~prolongation_8, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_8[\0].value}, {nil})}).register;


});
*/

~synth_bank_8.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~onset_8, \rel, ~terminate_8, \del, ~delay_8, \prolongation, ~prolongation_8, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_8[\1].value}, {nil})}).register;

});

