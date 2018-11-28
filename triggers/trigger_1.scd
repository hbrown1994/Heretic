Routine({

	var this_onset = ~set_onset.next(\1).postln, this_terminate = ~set_terminate.next(\1).postln, this_synth, prolong_term;

	s.sync;

	~synth_counter = ~synth_counter + 1;

	//Set onsets
	this_onset.postln;

	if(this_onset == \delay,
		{
			~delay_1 = ~delay_time.choose;

			~onset_1 =  switch (~set_onset_no_delay.next(\1),
				\attack,   {~attack_time},
				\emergence, { ~emergence_time.choose },
				\anacrusis, { ~anacrusis_time.choose },
				\upbeat, { ~upbeat_time.choose },
			);
		},

		{
			~delay_1 = 0;

			~onset_1 =  switch (this_onset,
				\attack,   {~attack_time},
				\emergence, { ~emergence_time.choose },
				\anacrusis, { ~anacrusis_time.choose },
				\upbeat, { ~upbeat_time.choose },
			);
		}
	);

	s.sync;

	//Set termination/prolongation
	if(this_terminate == \prolongation,
		{

			prolong_term = ~set_terminate_no_delay.next(\1);


			Routine({
				~terminate_1  = switch (prolong_term,
					\arrival,   {~arrival_time.choose},
					\dissappearance, { ~dissappearance_time.choose},
					\release, { ~release_time.choose},
					\closure, { ~closure_time},
				);

				s.sync;


				~prolongation_1  = switch (prolong_term,
					\arrival,   {20},
					\dissappearance, { 0.5},
					\release, { 10},
					\closure, { 500},
				);

			}).play(SystemClock);


		},

		{
			~prolongation_1 = (-8);

			~terminate_1  = switch (this_terminate,
				\arrival,   {~arrival_time.choose },
				\dissappearance, { ~dissappearance_time.choose },
				\release, { ~release_time.choose },
				\closure, { ~closure_time},
			);
	});


	s.sync;

	if(~outbus_count == 8, {~outbus_count=0}, {~outbus_count = ~outbus_count + 2});

	s.sync;

	this_synth = ~synth_bank_1.choose;

	~recall_synth_array.add(this_synth);

	s.sync;

	currentEnvironment.put(("synth_instance_"++~synth_counter.asString).asSymbol, this_synth.value.set(\atk, ~onset_1, \rel, ~terminate_1, \del, ~delay_1, \prolongation, ~prolongation_1, \gate, 1));

}).play(SystemClock);

//FIX PROLONGSRION