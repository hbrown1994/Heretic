////////////////////////////////////////////////////////////////////////
//SYNTHS: 2 -> Drone Formings

~synth_bank_2.add(\0-> {

	Synth(\pattern_mixer, [\atk, ~onset_2, \rel, ~terminate_2, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_2[\0].value}, {nil})}).register;

});

~synth_bank_2.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~onset_2, \rel, ~terminate_2, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_2[\1].value}, {nil})}).register;

});

~synth_bank_2.add(\2-> {

	Synth(\pattern_mixer, [\atk, ~onset_2, \rel, ~terminate_2, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_2[\2].value}, {nil})}).register;

});


/*~synth_bank_2.add(\3-> {

	Synth(\pattern_mixer, [\atk, ~onset_2, \rel, ~terminate_2, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_2[\3].value}, {nil})}).register;

});

*/

