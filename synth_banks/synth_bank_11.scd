////////////////////////////////////////////////////////////////////////
//SYNTHS: 11 -> Recall

~synth_bank_11.add(\0-> {

	~recall_synth_array.choose.set(\atk, if(~onset_11 == \downbeat, {0.01}, {if(~onset_11 == \departue, {0.01}, {~onset_time_11});}); , \rel, ~terminate_time_11, \gate, 1, \out,  ~outbus_patterns);

});
