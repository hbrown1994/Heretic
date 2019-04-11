Routine({

	var this_synth;

	if(~trigger_14_count == (~synth_bank_14.size-1), {~trigger_14_count=0;}, {nil});

	s.sync;

	~onset_14 = ~set_onset.next(\1);

	~terminate_14 = ~set_terminate.next(\1);

	~continuation_14 = ~set_continuation.next(\1);


	~onset_time_14=  switch (~onset_14,
		\attack,   {~attack_time},
		\emergence, { ~emergence_time.choose },
		\anacrusis, { ~anacrusis_time.choose },
		\upbeat, { ~upbeat_time.choose },
		\downbeat, { ~downbeat_time.choose},
		\departue, { ~departue_time.choose},
	);

	s.sync;

	~terminate_time_14  = switch (~terminate_14,
		\arrival,   {~arrival_time.choose},
		\dissappearance, { ~dissappearance_time.choose},
		\release, { ~release_time.choose},
		\closure, { ~closure_time},
		\resolution,  { ~resolution_time.choose},
		\plane, { ~plane_time.choose},
	);

	s.sync;

	this_synth = ~synth_bank_14[~synth_bank_14_select[~trigger_14_count].asSymbol].value;

	~recall_synth_array.add(this_synth);

	s.sync;

	currentEnvironment.put(("synth_instance_"++~synth_counter.asString).asSymbol, this_synth.value.set(\atk, ~onset_14, \rel, ~terminate_14, \gate, 1));

	s.sync;

	~synth_counter = ~synth_counter + 1;
	~trigger_14_count = ~trigger_14_count + 1;

}).play(SystemClock);



