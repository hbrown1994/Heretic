Routine({

	~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);
	0.001.wait;
	~toWekinator_nn.sendMsg(*["/wekinator/control/startRecording"]);

	30.wait;

	~toWekinator_nn.sendMsg(*["/wekinator/control/stopRecording"]);
	~train_button.valueAction_(2);
}).play(AppClock);