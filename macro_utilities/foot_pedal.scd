
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
		if(msg[3] > 0.5, {"kill language".postln;  ~language_type_routine.stop; ~incoming_language_type=\0;}, {nil});
		if(msg[3]  < 0.5, {"get_language".postln; e[\get_language].value}, {nil});
	}, "/innerOscFlow_key_a");
);

/*(
OSCFunc({ arg msg;
if(msgaaaaaaaaaaaaaaaaaaaa[3] == 1, {e[\build].value}, {nil});
if(msg[3aa]  == 0, {e[\release].value}, {nil});
}, "/innerOscFlow_key_b");a
);*/


