
Synth(\key);

Ndef(\oscValues_keys, {
	var data_a= In.kr(~a_key_bus, 1);
	var data_b= In.kr(~b_key_bus, 1);
	var trig_a= Changed.kr(data_a);
	var trig_b= Changed.kr(data_b);
	SendReply.kr(trig_a, "/innerOscFlow_key_a", data_a);
	SendReply.kr(trig_b, "/innerOscFlow_key_b", data_b);
});


(
OSCFunc({ arg msg;
	//msg[3].postln;

	if(msg[3] > 0.5, {if(~end!=1, {"kill language".postln;  thisProcess.interpreter.executeFile(~trigger_file_path++"escape_synth_2.scd")}, {Routine({~end_routine.stop; s.sync; thisProcess.interpreter.executeFile(~macro_path++"end_all.scd")}).play;});}, {nil});
	if(msg[3]  < 0.5, {nil}, {nil});

}, "/innerOscFlow_key_a");
);


(
OSCFunc({ arg msg;
	//msg[3].postln;
	if(msg[3] > 0.5, {if(~end!=1, {"kill language".postln;  thisProcess.interpreter.executeFile(~trigger_file_path++"escape_synth_3.scd")}, {Routine({~end_routine.stop; s.sync; thisProcess.interpreter.executeFile(~macro_path++"end_all_fade.scd")}).play;});}, {nil});
	if(msg[3]  < 0.5, {nil}, {nil});
}, "/innerOscFlow_key_b");
);






