Routine({

	var this_synth, this_synth_count=~synth_counter;

	if(~trigger_4_count == ~synth_bank_4.size, {~trigger_4_count=0;}, {nil});

	s.sync;

	~onset_4 = ~set_onset.next(\1);

	~terminate_4 = ~set_terminate.next(\1);

	~continuation_4 = ~set_continuation.next(\1);


	~onset_time_4=  switch (~onset_4,
		\attack,   {~attack_time},
		\emergence, { ~emergence_time.choose },
		\anacrusis, { ~anacrusis_time.choose },
		\upbeat, { ~upbeat_time.choose },
		\downbeat, { ~downbeat_time.choose},
		\departue, { ~departue_time.choose},
	);

	s.sync;

	~terminate_time_4  = switch (~terminate_4,
		\arrival,   {~arrival_time.choose},
		\dissappearance, { ~dissappearance_time.choose},
		\release, { ~release_time.choose},
		\closure, { ~closure_time},
		\resolution,  { ~resolution_time.choose},
		\plane, { ~plane_time.choose},
	);

	s.sync;

	this_synth = ~synth_bank_4[~synth_bank_4_select[~trigger_4_count].asSymbol];

	~recall_synth_array.add(this_synth);

	s.sync;

	currentEnvironment.put(("synth_instance_"++this_synth_count.asString).asSymbol, this_synth.value.set(\atk, if(~onset_4 == \downbeat, {0.01}, {if(~onset_4 == \departue, {0.01}, {~onset_time_4});}); , \rel, ~terminate_time_4, \gate, 1));

	s.sync;

	~synth_counter = ~synth_counter + 1;
	~trigger_4_count = ~trigger_4_count + 1;

}).play(SystemClock);



