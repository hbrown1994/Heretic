Routine({

	var this_synth, this_synth_count=~synth_counter, this_language_type=~incoming_language_type;

	if(this_language_type==\0, {this_language_type=[\1, \2, \3, \4, \5].choose}, {nil});

	s.sync;

	case
	{this_language_type==\1}  {if(~unison_trigger_1_count == ~unison_bank_1.size, {~unison_trigger_1_count=0;}, {nil})}
	{this_language_type==\2}  {if(~unison_trigger_2_count == ~unison_bank_2.size, {~unison_trigger_2_count=0;}, {nil})}
	{this_language_type==\3}  {if(~unison_trigger_3_count == ~unison_bank_3.size, {~unison_trigger_3_count=0;}, {nil})}
	{this_language_type==\4}  {if(~unison_trigger_4_count == ~unison_bank_4.size, {~unison_trigger_4_count=0;}, {nil})}
	{this_language_type==\5}  {if(~unison_trigger_5_count == ~unison_bank_5.size, {~unison_trigger_5_count=0;}, {nil})}
	{this_language_type==\6}  {if(~unison_trigger_6_count == ~unison_bank_6.size, {~unison_trigger_6_count=0;}, {nil})}
	{this_language_type==\7}  {if(~unison_trigger_7_count == ~unison_bank_7.size, {~unison_trigger_7_count=0;}, {nil})}
	{this_language_type==\8}  {if(~unison_trigger_8_count == ~unison_bank_8.size, {~unison_trigger_8_count=0;}, {nil})}
	{this_language_type==\9}  {if(~unison_trigger_9_count == ~unison_bank_9.size, {~unison_trigger_9_count=0;}, {nil})};

	~onset_12 = ~set_onset.next(this_language_type);

	~terminate_12 = ~set_terminate.next(this_language_type);

	~continuation_12 = ~set_continuation.next(this_language_type);


	~onset_time_12=  switch (~onset_12,
		\attack,   {~attack_time},
		\emergence, { ~emergence_time.choose },
		\anacrusis, { ~anacrusis_time.choose },
		\upbeat, { ~upbeat_time.choose },
		\downbeat, { ~downbeat_time.choose},
		\departue, { ~departue_time.choose},
	);

	s.sync;

	~terminate_time_12  = switch (~terminate_12,
		\arrival,   {~arrival_time.choose},
		\dissappearance, { ~dissappearance_time.choose},
		\release, { ~release_time.choose},
		\closure, { ~closure_time},
		\resolution,  { ~resolution_time.choose},
		\plane, { ~plane_time.choose},
	);

	s.sync;

	case

	{this_language_type==\1}  {this_synth=~unison_bank_1[~unison_bank_1_select[~unison_trigger_1_count].asSymbol]}
	{this_language_type==\2}  {this_synth=~unison_bank_2[~unison_bank_2_select[~unison_trigger_2_count].asSymbol]}
	{this_language_type==\3}  {this_synth=~unison_bank_3[~unison_bank_3_select[~unison_trigger_3_count].asSymbol]}
	{this_language_type==\4}  {this_synth=~unison_bank_4[~unison_bank_4_select[~unison_trigger_4_count].asSymbol]}
	{this_language_type==\5}  {this_synth=~unison_bank_5[~unison_bank_5_select[~unison_trigger_5_count].asSymbol]}
	{this_language_type==\6}  {this_synth=~unison_bank_6[~unison_bank_6_select[~unison_trigger_6_count].asSymbol]}
	{this_language_type==\7}  {this_synth=~unison_bank_7[~unison_bank_7_select[~unison_trigger_7_count].asSymbol]}
	{this_language_type==\8}  {this_synth=~unison_bank_8[~unison_bank_8_select[~unison_trigger_8_count].asSymbol]}
	{this_language_type==\9}  {this_synth=~unison_bank_9[~unison_bank_9_select[~unison_trigger_9_count].asSymbol]};

	~recall_synth_array.add(this_synth);

	s.sync;

	if(this_language_type==\0, {nil}, {currentEnvironment.put(("synth_instance_"++this_synth_count.asString).asSymbol, this_synth.value.set(\atk, if(~onset_12 == \downbeat, {0.01}, {if(~onset_12 == \departue, {0.01}, {~onset_time_12});}); , \rel, ~terminate_time_12, \gate, 1));});

	s.sync;

	~synth_counter = ~synth_counter + 1;

	s.sync;

	case
	{~incoming_language_type==\1}  {~unison_trigger_1_count = ~unison_trigger_1_count + 1}
	{~incoming_language_type==\2}  {~unison_trigger_2_count = ~unison_trigger_2_count + 1}
	{~incoming_language_type==\3}  {~unison_trigger_3_count = ~unison_trigger_3_count + 1}
	{~incoming_language_type==\4}  {~unison_trigger_4_count = ~unison_trigger_4_count + 1}
	{~incoming_language_type==\5}  {~unison_trigger_5_count = ~unison_trigger_5_count + 1}
	{~incoming_language_type==\6}  {~unison_trigger_6_count = ~unison_trigger_6_count + 1}
	{~incoming_language_type==\7}  {~unison_trigger_7_count = ~unison_trigger_7_count + 1}
	{~incoming_language_type==\8}  {~unison_trigger_8_count = ~unison_trigger_8_count + 1}
	{~incoming_language_type==\9}  {~unison_trigger_9_count = ~unison_trigger_9_count + 1};

}).play(SystemClock);




