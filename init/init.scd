//INIT Audio and Interactivity
e[\reset_posture_matrix].value;

~end=0;

~mics = Synth(\mic_in, [\gate, 1], target: ~input_node).register;
~features_drums = Synth(\features, [\input, ~drums, \thresh, ~feature_onset_numBox.value], target: ~features_node).register;

e[\random_postures].value;
e[\next_posture].value;
e[\next_posture].value;
e[\next_posture].value;
e[\pedal].value;

thisProcess.interpreter.executeFile(~wek_path++"to_wekinator.scd");

thisProcess.interpreter.executeFile(~wek_path++"from_wekinator.scd");

thisProcess.interpreter.executeFile(~init_path++"make_arrays.scd");

