if(~current_posture==\Solo, {Routine({~end_wait.choose.wait; thisProcess.interpreter.executeFile(~macro_path++"end_all.scd");}).play}, {nil});
if(~current_posture==\Juxtaposition, {Routine({~end_wait.choose.wait; thisProcess.interpreter.executeFile(~macro_path++"end_all.scd");}).play}, {nil});
if(~current_posture==\Silence, {Routine({~end_wait.choose.wait; thisProcess.interpreter.executeFile(~macro_path++"end_all.scd");}).play}, {nil});
if(~current_posture==\Recall, {Routine({~end_wait.choose.wait; thisProcess.interpreter.executeFile(~macro_path++"end_all.scd");}).play}, {nil});

if(~current_posture==\Unison, {

	~end_routine = Routine({

	    var this_langauge_type = ~incoming_language_type;

		loop{
			0.1.wait;
			if(~incoming_language_type == \0, {Routine({~end_routine.stop; s.sync; thisProcess.interpreter.executeFile(~macro_path++"end_all.scd")}).play;}, {nil});
			}
	}).play;
}, {nil});

if(~current_posture==\Complement, {

	~end_routine = Routine({

	    var this_langauge_type = ~incoming_language_type;

		loop{
			0.1.wait;
			if(~incoming_language_type == \0, {Routine({~end_routine.stop; s.sync; thisProcess.interpreter.executeFile(~macro_path++"end_all.scd")}).play;}, {nil});
			}
	}).play;
}, {nil});



