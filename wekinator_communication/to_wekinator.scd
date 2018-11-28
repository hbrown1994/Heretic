////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
	Ndef(\oscValues_input_help, {
		var data= In.kr(~feature_bus, 16);
		var trig= /*Changed.kr(data).sum +*/ Impulse.kr(10); // trigger when some value changed + “updater” at 1/second. Impulse is FrameRate
		//data = LPF.kr(data, 3.0);
		SendReply.kr(trig, "/innerOscFlow_features", data);
	});

	// get the array of values from SendReply, explode them as individual floats and send them trough the network address
	(
		OSCFunc({|msg|
			msg[3..]; //debug
			~toWekinator_nn.sendMsg("/wek/inputs_nn", *msg[3..]);
		}, "/innerOscFlow_features");
	);
);