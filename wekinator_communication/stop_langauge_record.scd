//STOP LNAGUAGE RECORD
~language_record_task.stop;
~toWekinator_nn.sendMsg(*["/wekinator/control/stopRecording"]);
~toWekinator_nn.sendMsg(*["/wekinator/control/cancelTrain"]);
~countdown_button.valueAction_(0);
~record_language_button.valueAction_(0);
~train_language_button.valueAction_(0);
~record_timer.stop;
~countdown_numBox.value_(0);
