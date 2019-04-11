//Load markov classes

~set_onset = SmalleyMarkovOnset.new;

~set_continuation = SmalleyMarkovContinuation.new;

~set_LanguageTypeDuration = LanguageTypeDuration.new;

~set_terminate = SmalleyMarkovTerminate.new;

~set_terminate_rand = SmalleyMarkovTerminate.randTerminate;

~postures = MorrisMarkov.randPosture;

~next_posture = MorrisMarkov.new(~solo_weight,~unison_weight, ~complement_weight, ~juxtaposition_weight, ~silence_weight, ~recall_weight);

~next_posture_no_recall = MorrisMarkov.newNoRecall(~solo_weight,~unison_weight, ~complement_weight, ~juxtaposition_weight, ~silence_weight, ~recall_weight);






