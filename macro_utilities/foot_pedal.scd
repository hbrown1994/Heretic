//Footpedla Connectivity

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
		~a_trig = msg[3];
	}, "/innerOscFlow_key_a");
);

(
	OSCFunc({ arg msg;
		~b_trig = msg[3];
	}, "/innerOscFlow_key_b");
);

~key_triggers = Routine({

	loop{
		if(~a_trig == 1, {e[\release].value}, {nil});
		if(~b_trig == 1, {e[\build].value}, {nil});

		0.5.wait;
	}
}).play(SystemClock);