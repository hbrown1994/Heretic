Routine({

	var this_onset = ~set_onset.next(\5).postln, this_terminate = ~set_terminate.next(\5).postln, this_synth, prolong_term;

	//Set ONSET/delay

	s.sync;

	~synth_counter = ~synth_counter + 1;

	this_onset.postln;

	if(this_onset == \delay,
		{
			~delay_5 = ~delay_time.choose;

			~onset_5 =  switch (~set_onset_no_delay.next(\5),
				\attack,   {~attack_time},
				\emergence, { ~emergence_time.choose },
				\anacrusis, { ~anacrusis_time.choose },
				\upbeat, { ~upbeat_time.choose },
			);
		},

		{
			~delay_5 = 0;

			~onset_5 =  switch (this_onset,
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

			prolong_term = ~set_terminate_no_delay.next(\5);


			Routine({
				~terminate_5  = switch (prolong_term,
					\arrival,   {~arrival_time.choose},
					\dissappearance, { ~dissappearance_time.choose},
					\release, { ~release_time.choose},
					\closure, { ~closure_time},
				);

				s.sync;


				~prolongation_5  = switch (prolong_term,
					\arrival,   {20},
					\dissappearance, { 0.5},
					\release, { 10},
					\closure, { 500},
				);

			}).play(SystemClock);


		},

		{
			~prolongation_5 = (-8);

			~terminate_5  = switch (this_terminate,
				\arrival,   {~arrival_time.choose },
				\dissappearance, { ~dissappearance_time.choose },
				\release, { ~release_time.choose },
				\closure, { ~closure_time},
			);
	});


	s.sync;

	if(~outbus_count == 8, {~outbus_count=0}, {~outbus_count = ~outbus_count + 2});

	s.sync;

	this_synth = ~synth_bank_5.choose;

	~recall_synth_array.add(this_synth);

	s.sync;

	currentEnvironment.put(("synth_instance_"++~synth_counter.asString).asSymbol, this_synth.value.set(\atk, ~onset_5, \rel, ~terminate_5, \del, ~delay_5, \prolongation, ~prolongation_5, \gate, 1));

}).play(SystemClock);

