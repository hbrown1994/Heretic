////////////////////////////////////////////////////////////////////////
//SYNTHS: 8 -> Transgressive Formings



~synth_bank_8.add(\0-> {

	Synth(\pattern_mixer, [\atk, if(~onset_8 == \downbeat, {0.01}, {if(~onset_8 == \departue, {0.01}, {~onset_time_8});}); , \rel, ~terminate_time_8,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_8[\0].value}, {nil})}).register;

});

~synth_bank_8.add(\1-> {

	Synth(\pattern_mixer, [\atk, if(~onset_8 == \downbeat, {0.01}, {if(~onset_8 == \departue, {0.01}, {~onset_time_8});}); , \rel, ~terminate_time_8,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_8[\1].value}, {nil})}).register;

});


~synth_bank_8.add(\2-> {

	Synth(\pattern_mixer, [\atk, if(~onset_8 == \downbeat, {0.01}, {if(~onset_8 == \departue, {0.01}, {~onset_time_8});}); , \rel, ~terminate_time_8,  \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_8[\2].value}, {nil})}).register;

});

~synth_bank_8.add(\3-> {

Synth(\playbuf_drone, [\bufnum, b[\trans_loops].choose, \atk, if(~onset_8 == \downbeat, {0.01}, {if(~onset_8 == \departue, {0.01}, {~onset_time_8});}); , \rel, ~terminate_time_8,  \gate, 1, \loop, 1, \out, ~outbus_patterns], ~pattern_mixer_node).register;

});

~synth_bank_8.add(\4-> {

Synth(\playbuf_drone, [\bufnum, b[\trans_loops_high].choose, \atk, if(~onset_8 == \downbeat, {0.01}, {if(~onset_8 == \departue, {0.01}, {~onset_time_8});}); , \rel, ~terminate_time_8,  \gate, 1, \loop, 1, \out, ~outbus_patterns], ~pattern_mixer_node).register;

});

~synth_bank_8.add(\5-> {

Synth(\gendy_bass, [\atk, if(~onset_8 == \downbeat, {0.01}, {if(~onset_8 == \departue, {0.01}, {~onset_time_8});}); , \rel, ~terminate_time_8,  \gate, 1, \loop, 1, \out, ~outbus_patterns, \amp, -12], ~pattern_mixer_node).register;

});

