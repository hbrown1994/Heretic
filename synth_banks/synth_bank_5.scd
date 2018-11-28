////////////////////////////////////////////////////////////////////////
//SYNTHS: 5 -> Pulse Formings

~synth_bank_5.add(\0-> {

	Synth(\pattern_mixer, [\input_bus, ~melody_test_5, \atk, ~onset_5, \rel, ~terminate_5, \del, ~delay_5, \prolongation, ~prolongation_5, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_5[\0].value}, {nil})}).register;

});

