////////////////////////////////////////////////////////////////////////
//SYNTHS: 12 -> Unison


~synth_bank_12.add(\0-> {

	switch (~incoming_language_type,
		\0, {e[\silence_sequence].value},
		\1, {~unison_bank_1.choose},
		\2, {~unison_bank_2.choose},
		\3, {~unison_bank_3.choose},
		\4, {~unison_bank_4.choose},
		\5, {~unison_bank_5.choose},
		\6, {~unison_bank_6.choose},
		\7, {~unison_bank_7.choose},
		\8, {~unison_bank_8.choose},
		\9, {~unison_bank_9.choose},
	);
});

