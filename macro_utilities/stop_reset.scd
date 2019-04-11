//Stop all processes
{e[\stop_language_record].value};
{e[\stop_structure_record].value};
~toWekinator_nn.sendMsg(*["/wekinator/control/stopRunning"]);
~synth_counter=0;
s.freeAll;
~train_button.valueAction_(0);
~start_button.valueAction_(0);
~init_button.valueAction_(0);
~clock.stop;
~countdown_master.stop;
~language_type_routine.stop;
thisProcess.interpreter.executeFile(~synth_file_path++"synths_off.scd");
CmdPeriod.run;
