~language_train_task = Task({

	~toWekinator_nn.sendMsg(*["/wekinator/control/train"]);

	15.wait;

	~train_language_button.valueAction_(2);

}).start(AppClock);