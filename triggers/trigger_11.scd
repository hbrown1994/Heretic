Routine({

	var this_synth, this_synth_count=~synth_counter;

	~onset_11 = ~set_onset.next([\1, \2, \3, \4, \5, \6, \7, \8, \9].choose);

	~terminate_11 = ~set_terminate.next([\1, \2, \3, \4, \5, \6, \7, \8, \9].choose);

	~continuation_11 = ~set_continuation.next([\1, \2, \3, \4, \5, \6, \7, \8, \9].choose);


	~onset_time_11=  switch (~onset_11,
		\attack,   {~attack_time},
		\emergence, { ~emergence_time.choose },
		\anacrusis, { ~anacrusis_time.choose },
		\upbeat, { ~upbeat_time.choose },
		\downbeat, { ~downbeat_time.choose},
		\departue, { ~departue_time.choose},
	);

	s.sync;

	~terminate_time_11  = switch (~terminate_11,
		\arrival,   {~arrival_time.choose},
		\dissappearance, { ~dissappearance_time.choose},
		\release, { ~release_time.choose},
		\closure, { ~closure_time},
		\resolution,  { ~resolution_time.choose},
		\plane, { ~plane_time.choose},
	);

	s.sync;

	this_synth = ~synth_bank_11.choose.value;

	s.sync;

	currentEnvironment.put(("synth_instance_"++this_synth_count.asString).asSymbol, this_synth);

	s.sync;

	~synth_counter = ~synth_counter + 1;

}).play(SystemClock);



