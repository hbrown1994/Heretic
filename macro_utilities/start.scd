//START PERFORMANCE
Routine({

	~toWekinator_nn.sendMsg(*["/wekinator/control/startRunning"]); //START WEKINATOR
	0.001.wait;
	~toWekinator_velocity.sendMsg(*["/wekinator/control/startRunning"]);

	s.sync;

	e[\get_language].value;

	s.sync;

    ~countdown_master = Routine({
	var sec=10, min=0;
	~stopwatch.string = "0:10";
	loop{
	1.wait;
	sec = sec - 1;
	s.sync;
	if(sec==60, {sec=0; min = min + 1}, {nil});
	s.sync;
    ~stopwatch.string = min.asString++":"++sec.asString;
	if(~stopwatch.string == "0:0", {~countdown_master.stop}, {nil});
	}
}).play(AppClock);

	10.wait;

	~clock = Routine({
	var sec=0, min=0;
	~stopwatch.string = "0:0";
	loop{
	1.wait;
	sec = sec + 1;
	s.sync;
	if(sec==60, {sec=0; min = min + 1}, {nil});
	s.sync;
    ~stopwatch.string = min.asString++":"++sec.asString;
	if(~stopwatch.string == "8:0", {e[\end].value}, {nil});
	}
}).play(AppClock);

	s.sync;

	e[\synths_sequence_choose].value;

}).play(AppClock);
