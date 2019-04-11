Routine({

	var this_synth, this_synth_count=~synth_counter;

	if(~trigger_2_count == ~synth_bank_2.size, {~trigger_2_count=0;}, {nil});

	s.sync;

	~onset_2 = ~set_onset.next(\1);

	~terminate_2 = ~set_terminate.next(\1);

	~continuation_2 = ~set_continuation.next(\1);


	~onset_time_2=  switch (~onset_2,
		\attack,   {~attack_time},
		\emergence, { ~emergence_time.choose },
		\anacrusis, { ~anacrusis_time.choose },
		\upbeat, { ~upbeat_time.choose },
		\downbeat, { ~downbeat_time.choose},
		\departue, { ~departue_time.choose},
	);

	s.sync;

	~terminate_time_2  = switch (~terminate_2,
		\arrival,   {~arrival_time.choose},
		\dissappearance, { ~dissappearance_time.choose},
		\release, { ~release_time.choose},
		\closure, { ~closure_time},
		\resolution,  { ~resolution_time.choose},
		\plane, { ~plane_time.choose},
	);

	s.sync;

	this_synth = ~synth_bank_2[~synth_bank_2_select[~trigger_2_count].asSymbol];

	~recall_synth_array.add(this_synth);

	s.sync;

	currentEnvironment.put(("synth_instance_"++this_synth_count.asString).asSymbol, this_synth.value.set(\atk, if(~onset_2 == \downbeat, {0.01}, {if(~onset_2 == \departue, {0.01}, {~onset_time_2});}); , \rel, ~terminate_time_2, \gate, 1));
÷
	s.sync;

	~synth_counter = ~synth_counter + 1;
	~trigger_2_count = ~trigger_2_count + 1;

}).play(SystemClock);



