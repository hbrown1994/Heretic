////////////////////////////////////////////////////////////////////////
//SYNTHS: 3 -> Granular Formings

~synth_bank_3.add(\0-> {


		Synth(\pattern_mixer, [\atk, if(~onset_3 == \downbeat, {0.01}, {if(~onset_3 == \departue, {0.01}, {~onset_time_3});});, \rel, ~terminate_time_3, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_3[\0].value}, {nil})}).register;

});


~synth_bank_3.add(\1-> {


		Synth(\pattern_mixer, [\atk, if(~onset_3 == \downbeat, {0.01}, {if(~onset_3 == \departue, {0.01}, {~onset_time_3});});, \rel, ~terminate_time_3, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_3[\1].value}, {nil})}).register;

});

~synth_bank_3.add(\2-> {


		Synth(\pattern_mixer, [\atk, if(~onset_3 == \downbeat, {0.01}, {if(~onset_3 == \departue, {0.01}, {~onset_time_3});});, \rel, ~terminate_time_3, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_3[\2].value}, {nil})}).register;

});

~synth_bank_3.add(\3-> {


		Synth(\pattern_mixer, [\atk, if(~onset_3 == \downbeat, {0.01}, {if(~onset_3 == \departue, {0.01}, {~onset_time_3});});, \rel, ~terminate_time_3, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_3[\3].value}, {nil})}).register;

});





