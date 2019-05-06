////////////////////////////////////////////////////////////////////////
//SYNTHS: 7 -> Sproradic Formings

~synth_bank_7.add(\0-> {

	Synth(\pattern_mixer, [\amp, -6, \atk, if(~onset_7 == \downbeat, {0.01}, {if(~onset_7 == \departue, {0.01}, {~onset_time_7});}); , \rel, ~terminate_time_7,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_7[\0].value}, {nil})}).register;

});



~synth_bank_7.add(\1-> {

	Synth(\pattern_mixer, [\amp, -12, \atk, if(~onset_7 == \downbeat, {0.01}, {if(~onset_7 == \departue, {0.01}, {~onset_time_7});}); , \rel, ~terminate_time_7,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_7[\1].value}, {nil})}).register;

});

~synth_bank_7.add(\2-> {

	Synth(\pattern_mixer, [\amp, -6, \atk, if(~onset_7 == \downbeat, {0.01}, {if(~onset_7 == \departue, {0.01}, {~onset_time_7});}); , \rel, ~terminate_time_7,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_7[\2].value}, {nil})}).register;

});


~synth_bank_7.add(\2-> {

	Synth(\pattern_mixer, [\amp, -6, \atk, if(~onset_7 == \downbeat, {0.01}, {if(~onset_7 == \departue, {0.01}, {~onset_time_7});}); , \rel, ~terminate_time_7,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_7[\2].value}, {nil})}).register;

});
