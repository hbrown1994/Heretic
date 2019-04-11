Routine({

	var this_synth, this_synth_count=~synth_counter;

	if(~trigger_1_count == ~synth_bank_1.size, {~trigger_1_count=0;}, {nil});

	s.sync;

	~onset_1 = ~set_onset.next(\1);

	~terminate_1 = ~set_terminate.next(\1);

	~continuation_1 = ~set_continuation.next(\1);


	~onset_time_1=  switch (~onset_1,
		\attack,   {~attack_time},
		\emergence, { ~emergence_time.choose },
		\anacrusis, { ~anacrusis_time.choose },
		\upbeat, { ~upbeat_time.choose },
		\downbeat, { ~downbeat_time.choose},
		\departue, { ~departue_time.choose},
	);

	s.sync;

	~terminate_time_1  = switch (~terminate_1,
		\arrival,   {~arrival_time.choose},
		\dissappearance, { ~dissappearance_time.choose},
		\release, { ~release_time.choose},
		\closure, { ~closure_time},
		\resolution,  { ~resolution_time.choose},
		\plane, { ~plane_time.choose},
	);

	s.sync;

	this_synth = ~synth_bank_1[~synth_bank_1_select[~trigger_1_count].asSymbol].value;


	~recall_synth_array.add(this_synth);

	s.sync;

	currentEnvironment.put(("synth_instance_"++this_synth_count.asString).asSymbol, this_synth);

	s.sync;

	~synth_counter = ~synth_counter + 1;
	~trigger_1_count = ~trigger_1_count + 1;


}).play(SystemClock);





