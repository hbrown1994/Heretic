////////////////////////////////////////////////////////////////////////
//SYNTHS: 9 -> Bombastic Formings

~synth_bank_9.add(\0-> {

	Synth(\pattern_mixer, [\atk, if(~onset_9 == \downbeat, {0.01}, {if(~onset_9 == \departue, {0.01}, {~onset_time_9});}); , \rel, ~terminate_time_9,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_9[\0].value}, {nil})}).register;

});

~synth_bank_9.add(\1-> {

	Synth(\pattern_mixer, [\atk, if(~onset_9 == \downbeat, {0.01}, {if(~onset_9 == \departue, {0.01}, {~onset_time_9});}); , \rel, ~terminate_time_9,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_9[\1].value}, {nil})}).register;


});


~synth_bank_9.add(\2-> {

	Synth(\pattern_mixer, [\atk, if(~onset_9 == \downbeat, {0.01}, {if(~onset_9 == \departue, {0.01}, {~onset_time_9});}); , \rel, ~terminate_time_9,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_9[\2].value}, {nil})}).register;


});


~synth_bank_9.add(\3-> {

	Synth(\pattern_mixer, [\atk, if(~onset_9 == \downbeat, {0.01}, {if(~onset_9 == \departue, {0.01}, {~onset_time_9});}); , \rel, ~terminate_time_9,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_9[\3].value}, {nil})}).register;


});


