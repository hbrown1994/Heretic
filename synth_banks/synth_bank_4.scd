////////////////////////////////////////////////////////////////////////
//SYNTHS: 4 -> Melodic Formings
/*
~synth_bank_4.add(\0-> {

Synth(\pattern_mixer_melody_4, [\input_bus, ~melody_test_4, \atk, ~onset_4, \rel, ~terminate_4, \del, ~delay_4, \prolongation, ~prolongation_4, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_4[\0].value}, {nil})}).register;

});
*/


~synth_bank_4.add(\1-> {

	Synth(\pattern_mixer_melody_2, [\input_bus, ~melody_test_4, \atk, ~onset_4, \rel, ~terminate_4, \del, ~delay_4, \prolongation, ~prolongation_4, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_4[\1].value}, {nil})}).register;

});

~synth_bank_4.add(\2-> {

	Synth(\pattern_mixer_melody_2, [\input_bus, ~melody_test_4, \atk, ~onset_4, \rel, ~terminate_4, \del, ~delay_4, \prolongation, ~prolongation_4, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_4[\2].value}, {nil})}).register;

});
