OSCFunc({|msg, time, addr, recvPort|
	~nn_out_array = msg[1..].round(0.01).lag(2);
	~formal_from_wek_bus.setnAt(0, msg[1..]);

},"/wek/outputs_nn");

/*
Ndef(\oscValues_nn_from_wek, {
	var data = In.kr(~formal_from_wek_bus, 10);
	var trig = Impulse.kr(50);
	var sig = data.lag(4).round(0.1).scope;
	var sig1 = ArrayMax.kr(data.lag(2).round(0.01));

	Out.kr(~formal_bus_out, sig);
	Out.kr(~language_bus_out, sig1);
});


OSCFunc({|msg, time, addr, recvPort|
	~nn_out_array = msg[1..].round(0.01).lag(2);
	~formal_from_wek_bus.setnAt(0, msg[1..]);
},"/wek/outputs_nn");

*/


//Timed sends

Ndef(\oscValues_nn_from_wek, {
	var data = In.kr(~formal_from_wek_bus, 10);
	var sig = data.round(0.1).round(0.1).lag(4).scope;
	var sig1 = ArrayMax.kr(data.lag(2).round(0.01))[1];

	var trig = Changed.kr(sig1);
	var timer = Sweep.kr(trig: trig, rate: 1); // how long since the last trigger?

	var sig4 = SetResetFF.kr(timer > 0.5, timer < 0.5);

	var final_sig = Gate.kr(in: Delay1.kr(sig1), trig: sig4);

	SendReply.kr(Impulse.kr(10), "/innerOscFlow_language", final_sig);

    Out.kr(~formal_bus_out, sig);
    Out.kr(~language_bus_out, final_sig);
});

OSCFunc({|msg|

~incoming_language_type_from_nn=msg[3];
},"/innerOscFlow_language");


