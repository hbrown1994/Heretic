////////////////////////////////////////////////////////////////////////
//SYNTHS: 5 -> Pulse Formings

~synth_bank_13.add(\0-> {

	Synth(\pattern_mixer, [\input_bus, ~melody_test_5, \atk, ~onset_13, \rel, ~terminate_13, \gate, 1, \out, 0], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_5[\0].value}, {nil})}).register;

});

~synth_bank_13.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~onset_13, \rel, ~terminate_13, \gate, 1, \out, 0], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_6[\0].value}, {nil})}).register;

});

~synth_bank_13.add(\2-> {

	Synth(\pattern_mixer, [\atk, ~onset_13, \rel, ~terminate_13, \gate, 1, \out, 0], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_6[\1].value}, {nil})}).register;

});


~synth_bank_13.add(\3-> {

	Synth(\pattern_mixer, [\atk, ~onset_13, \rel, ~terminate_13, \gate, 1, \out, 0], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_8[\1].value}, {nil})}).register;

});

