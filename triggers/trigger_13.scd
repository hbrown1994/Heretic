Routine({

	var this_onset = ~set_onset.next(\1).postln, this_terminate = ~set_terminate.next(\1).postln, this_synth, prolong_term;

	s.sync;

	~synth_counter = ~synth_counter + 1;

	s.sync;

	if(~outbus_count == 8, {~outbus_count=0}, {~outbus_count = ~outbus_count + 2});

	s.sync;

	this_synth = ~synth_bank_13.choose;

	~recall_synth_array.add(this_synth);

	s.sync;

	~build_array.add(this_synth);

	s.sync;

	currentEnvironment.put(("synth_instance_"++~synth_counter.asString).asSymbol, this_synth.value);


}).play(SystemClock);

//FIX PROLONGSRION