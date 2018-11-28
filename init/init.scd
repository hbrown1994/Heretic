//INIT Audio and Interactivity

if(~timing_menu.value == 0, {

	Routine({

		~mics = Synth(\mic_in, [\gate, 1], target: ~input_node).register;
		~features_drums = Synth(\features, [\input, ~drums], target: ~features_node);

		s.sync;

		thisProcess.interpreter.executeFile(~wek_path++"to_wekinator.scd");

		s.sync;

		thisProcess.interpreter.executeFile(~wek_path++"from_wekinator.scd");

		s.sync;

		thisProcess.interpreter.executeFile(~markovs_and_banks_path++"load_banks.scd");

		thisProcess.interpreter.executeFile(~markovs_and_banks_path++"load_markovs.scd");

		thisProcess.interpreter.executeFile(~macro_path++"foot_pedal.scd");

	}).play(AppClock);

});
