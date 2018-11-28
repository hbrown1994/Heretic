////////////////////////////////////////////////////////////////////////
//SYNTHS: 1 -> Sparse Formings


~synth_bank_1.add(\0-> {

	Synth(\pattern_mixer, [\atk, ~onset_1, \rel, ~terminate_1, \del, ~delay_1, \prolongation, ~prolongation_1, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_1[\0].value}, {nil})}).register;


});

~synth_bank_1.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~onset_1, \rel, ~terminate_1, \del, ~delay_1, \prolongation, ~prolongation_1, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_1[\1].value}, {nil})}).register;

});

~synth_bank_1.add(\2-> {

	Synth(\pattern_mixer, [\atk, ~onset_1, \rel, ~terminate_1, \del, ~delay_1, \prolongation, ~prolongation_1, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_1[\2].value}, {nil})}).register;

});


