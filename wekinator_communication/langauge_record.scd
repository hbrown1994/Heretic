~language_record_task = Task({

	0.001.wait;

	if(~language_type_menu.value == 0, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);});
	if(~language_type_menu.value == 1, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);});
	if(~language_type_menu.value == 2, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);});
	if(~language_type_menu.value == 3, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);});
	if(~language_type_menu.value == 4, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0]);});
	if(~language_type_menu.value == 5, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0]);});
	if(~language_type_menu.value == 6, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0]);});
	if(~language_type_menu.value == 7, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0]);});
	if(~language_type_menu.value == 8, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0]);});
	if(~language_type_menu.value == 9, {~toWekinator_nn.sendMsg(*["/wekinator/control/outputs", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0]);});


	~countdown_button.valueAction_(1);
	~train_language_button.valueAction_(0);

	1.wait;

	~countdown_button.valueAction_(2);

	1.wait;

	~countdown_button.valueAction_(3);

	1.wait;

	~countdown_button.valueAction_(4);

	1.wait;

	~countdown_button.valueAction_(5);
	~record_language_button.valueAction_(2);
	~toWekinator_nn.sendMsg(*["/wekinator/control/startRecording"]); //TRIGGER RECORDING
	~new_record_time_value = ~record_time_value + 1;
	~hold_record_time_value = ~record_time_value + 1;


	~record_timer = Task({
		~hold_record_time_value.do({ arg i;


			~new_record_time_value = ~new_record_time_value - 1;
			~countdown_numBox.value_(~new_record_time_value);
			if(~new_record_time_value == 0,
				{

					~toWekinator_nn.sendMsg(*["/wekinator/control/stopRecording"]);
					~countdown_button.valueAction_(0);
					~record_language_button.valueAction_(0);
					~train_language_button.valueAction_(0);
					~countdown_numBox.value_(0);
			});
			1.wait;

		});
	}).start(AppClock);

}).start(AppClock);