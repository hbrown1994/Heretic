////////////////////////////////////////////////////////////////////////
//SYNTHS: 1 -> Sparse Formings


~synth_bank_1.add(\0-> {

	Synth(\pattern_mixer, [\atk, if(~onset_1 == \downbeat, {0.01}, {if(~onset_1 == \departue, {0.01}, {~onset_time_1});}); , \rel, ~terminate_time_1, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_1[\0].value}, {nil})}).register;


});

~synth_bank_1.add(\1-> {

	Synth(\pattern_mixer, [\atk, if(~onset_1 == \downbeat, {0.01}, {if(~onset_1 == \departue, {0.01}, {~onset_time_1});}); , \rel, ~terminate_time_1, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_1[\1].value}, {nil})}).register;


});

~synth_bank_1.add(\2-> {


	Synth(\pattern_mixer, [\atk, if(~onset_1 == \downbeat, {0.01}, {if(~onset_1 == \departue, {0.01}, {~onset_time_1});}); , \rel, ~terminate_time_1, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_1[\2].value}, {nil})}).register;

});

~synth_bank_1.add(\3-> {


	Synth(\pattern_mixer, [\atk, if(~onset_1 == \downbeat, {0.01}, {if(~onset_1 == \departue, {0.01}, {~onset_time_1});}); , \rel, ~terminate_time_1, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_1[\3].value}, {nil})}).register;

});

