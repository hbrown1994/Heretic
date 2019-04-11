////////////////////////////////////////////////////////////////////////
//SYNTHS: 10 -> SOLO

~synth_bank_10.add(\0-> {

	Synth(\pattern_mixer, [\atk, if(~onset_10 == \downbeat, {0.01}, {if(~onset_10 == \departue, {0.01}, {~onset_time_10});}); , \rel, ~terminate_time_10,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_10[\0].value}, {nil})}).register;


});

~synth_bank_10.add(\1-> {

	Synth(\pattern_mixer, [\atk, if(~onset_10 == \downbeat, {0.01}, {if(~onset_10 == \departue, {0.01}, {~onset_time_10});}); , \rel, ~terminate_time_10,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_10[\1].value}, {nil})}).register;

});


~synth_bank_10.add(\2-> {

	Synth(\pattern_mixer, [\atk, if(~onset_10 == \downbeat, {0.01}, {if(~onset_10 == \departue, {0.01}, {~onset_time_10});}); , \rel, ~terminate_time_10,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_10[\2].value}, {nil})}).register;

});

~synth_bank_10.add(\3-> {

	Synth(\pattern_mixer, [\atk, if(~onset_10 == \downbeat, {0.01}, {if(~onset_10 == \departue, {0.01}, {~onset_time_10});}); , \rel, ~terminate_time_10,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_10[\3].value}, {nil})}).register;

});