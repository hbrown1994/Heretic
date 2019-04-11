////////////////////////////////////////////////////////////////////////
//SYNTHS: 2 -> Drone Formings



~synth_bank_2.add(\0-> {


		Synth(\pattern_mixer, [\atk, 0.01, \rel, ~terminate_time_2, \del, 0.01, \prolongation, (-8), \gate, 1, \out, ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_2[\0].value}, {nil})}).register;


});

~synth_bank_2.add(\1-> {

		Synth(\pattern_mixer, [\atk, 0.01, \rel, ~terminate_time_2, \del, 0.01, \prolongation, (-8), \gate, 1, \out, ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_2[\1].value}, {nil})}).register;

});

~synth_bank_2.add(\2-> {

		Synth(\pattern_mixer, [\atk, 0.01, \rel, ~terminate_time_2, \del, 0.01, \prolongation, (-8), \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_2[\2].value}, {nil})}).register;

});


~synth_bank_2.add(\3-> {

		Synth(\pattern_mixer, [\atk, 0.01, \rel, ~terminate_time_2, \del, 0.01, \prolongation, (-8), \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).get(\pattern, { arg value; if(value==1, {~pattern_bank_2[\3].value}, {nil})}).register;

});



~synth_bank_2.add(\4-> {

		Synth(\playbuf_drone, [\bufnum, b[\voyager_drone_formings][1], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});

~synth_bank_2.add(\5-> {

		Synth(\playbuf_drone, [\bufnum, b[\voyager_drone_formings][2], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});


/*~synth_bank_2.add(\7-> {

Synth(\playbuf_drone, [\bufnum, b[\voyager_drone_formings][4], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2,, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});

~synth_bank_2.add(\8-> {

Synth(\playbuf_drone, [\rate, 1.0.rand, \bufnum, b[\voyager_drone_formings][5], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2,, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});



~synth_bank_2.add(\9-> {

Synth(\playbuf_drone, [\bufnum, b[\arp_drone_forming][1], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2,, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});


~synth_bank_2.add(\10-> {

Synth(\playbuf_drone, [\bufnum, b[\arp_drone_forming][0], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2,, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});

~synth_bank_2.add(\11-> {

Synth(\playbuf_drone, [\bufnum, b[\arp_drone_forming][2], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2,, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});

~synth_bank_2.add(\12-> {

Synth(\playbuf_drone, [\bufnum, b[\dx7_drone][2], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2,, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});


~synth_bank_2.add(\13-> {

Synth(\playbuf_drone, [\bufnum, b[\dx7_drone][1], \atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2,, \del, ~delay_2, \prolongation, ~prolongation_2, \gate, 1, \out,  ~outbus_patterns], ~pattern_mixer_node).register;

});

*/




