//A markov chain takes the incoming "language type" from the neural network/the current "posture of interaction" and returns the computer's language time.

BraxtonMorrisChoose{

	classvar <>incoming_language_type=\0;
	classvar <>current_posture=\Silence;

	var <>if_statements, <>next_markov_instance, <>first_language_types, <>current_postures, next_markov_instance, <>next_markov_reduced;

	*setLanguageType {arg incoming_language_type, current_posture;
		^super.new.init(incoming_language_type, current_posture);
	}

	*newNoDelay {
		^super.new.initNoDelay;
	}

	*randTerminate {
		^super.new.first_postures;

	}

	init { arg incoming_language_type, current_posture;
		^if_statements =

		if(current_posture == \Silence, {"silence".postln; \0}, {
			if(current_posture == \Unison, {"unison".postln; {\12}}, {
				if(current_posture == \Complement, {MarkovSetN([
					[\0, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0.9, 0.3, 0.3, 0.1, 0.1, 0, 0, 0, 0, 0, 0]],
					[\1, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0.1, 0.9, 0.2, 0.0, 0.2, 0.2, 0, 0, 0, 0, 0]],
					[\2, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0.01, 0.2, 0.9, 0.1, 0.2, 0.2, 0, 0, 0, 0, 0]],
					[\3, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0, 0.9, 0.2, 0.2, 0, 0.2, 0, 0, 0]],
					[\4, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0.2, 0.2, 0.9, 0, 0, 0, 0, 0, 0]],
					[\5, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0, 0.2, 0.2, 0.9, 0.3, 0.1, 0.1, 0, 0]],
					[\6, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0, 0.2, 0, 0.3, 0.9, 0.2, 0.2, 0, 0]],
					[\7, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0, 0, 0.2, 0, 0.2, 0.9, 0.3, 0.1, 0.05]],
					[\8, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0.3, 0.2, 0, 0.0, 0, 0.3, 0.6, 0.3, 0.2]],
					[\9, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0, 0.1, 0.1, 0, 0.2, 0.3, 0.3, 0.6, 0.3]],
					[\10, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0, 0, 0, 0, 0.3, 0.3, 0.3, 0.3, 0.6]],
				], 1).next(incoming_language_type)},{
					if(current_posture == \Juxtaposition,{MarkovSetN([
						[\0, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2]],
						[\1, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0, 0.1, 0, 0.1, 0.1, 0.2, 0.2, 0.2, 0.2]],
						[\2, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0, 0, 0, 0.1, 0.1, 0.1, 0.2, 0.2, 0.2, 0.2]],
						[\3, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0.1, 0, 0, 0, 0.2, 0.2, 0.2, 0.2, 0.2]],
						[\4, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.1, 0.1, 0, 0, 0, 0, 0.2, 0.2, 0.2, 0.2]],
						[\5, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0.2, 0, 0, 0, 0, 0, 0.2, 0.2, 0.2]],
						[\6, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0.2, 0, 0, 0, 0, 0, 0.2, 0.2, 0.2]],
						[\7, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0, 0.2, 0.2, 0, 0, 0, 0, 0, 0]],
						[\8,[\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0.2, 0.2, 0.2, 0.2, 0, 0, 0, 0, 0]],
						[\9, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0.2, 0.2, 0.2, 0.2, 0, 0, 0, 0, 0]],
						[\10, [\0, \1, \2, \3, \4, \5, \6, \7, \8, \9, \10], [0, 0.2, 0.2, 0.2, 0.2, 0.2, 0, 0, 0, 0, 0]],
					], 1).next(incoming_language_type)}, {
						if(current_posture == \Solo,  {\10}, {
							if(current_posture == \Recall,  {\11}, {nil});
						});
					});
				});
			});
		});


	}
}
