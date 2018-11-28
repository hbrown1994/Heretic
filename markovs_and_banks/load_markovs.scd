//Load markov classes

~set_onset = SmalleyMarkovOnset.new;

~set_onset_no_delay = SmalleyMarkovOnset.newNoDelay;

~set_onset_rand = SmalleyMarkovOnset.randOnset;

~set_terminate = SmalleyMarkovTerminate.new;

~set_terminate_no_delay = SmalleyMarkovTerminate.newNoDelay;

~set_terminate_rand = SmalleyMarkovTerminate.randTerminate;

~postures = MorrisMarkov.randPosture;

~next_posture = MorrisMarkov.new(~solo_weight,~unison_weight, ~complement_weight, ~juxtaposition_weight, ~silence_weight, ~recall_weight);

~next_posture_no_recall = MorrisMarkov.newNoRecall(~solo_weight,~unison_weight, ~complement_weight, ~juxtaposition_weight, ~silence_weight, ~recall_weight);



