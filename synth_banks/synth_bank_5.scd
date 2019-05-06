////////////////////////////////////////////////////////////////////////
//SYNTHS: 5 -> Pulse Formings

~synth_bank_5.add(\0-> {

	Synth(\pattern_mixer, [\amp, -6, \input_bus, ~melody_test_5, \atk, if(~onset_5 == \downbeat, {0.01}, {if(~onset_5 == \departue, {0.01}, {~onset_time_5});}); , \rel, ~terminate_time_5,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_5[\0].value}, {nil})}).register;

});

~synth_bank_5.add(\1-> {

	Synth(\pattern_mixer, [\amp, -9, \input_bus, ~melody_test_5, \atk, if(~onset_5 == \downbeat, {0.01}, {if(~onset_5 == \departue, {0.01}, {~onset_time_5});}); , \rel, ~terminate_time_5,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_5[\1].value}, {nil})}).register;

});

~synth_bank_5.add(\2-> {

	Synth(\pattern_mixer, [\amp, -3,\input_bus, ~melody_test_5, \atk, if(~onset_5 == \downbeat, {0.01}, {if(~onset_5 == \departue, {0.01}, {~onset_time_5});}); , \rel, ~terminate_time_5,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_5[\2].value}, {nil})}).register;

});

~synth_bank_5.add(\3-> {

	Synth(\pattern_mixer, [\amp, -3,\input_bus, ~melody_test_5, \atk, if(~onset_5 == \downbeat, {0.01}, {if(~onset_5 == \departue, {0.01}, {~onset_time_5});}); , \rel, ~terminate_time_5,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_5[\3].value}, {nil})}).register;
});




