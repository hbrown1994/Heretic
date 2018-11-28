////////////////////////////////////////////////////////////////////////
//SYNTHS: 7 -> Sproradic Formings

~synth_bank_14.add(\0-> {

	Synth(\pattern_mixer, [\atk, ~attack_time, \rel, ~dissappearance_time.choose, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_7[\0].value}, {nil})}).register;

});



~synth_bank_14.add(\1-> {

	Synth(\pattern_mixer, [\atk, ~attack_time, \rel, ~dissappearance_time.choose, \gate, 1, \out, ~outbus_count], ~pattern_mixer_node).onFree({currentEnvironment.at(("pattern_instance_"++~synth_counter.asString).asSymbol).stop}).get(\pattern, { arg value; if(value==1, {~pattern_bank_7[\1].value}, {nil})}).register;

});

