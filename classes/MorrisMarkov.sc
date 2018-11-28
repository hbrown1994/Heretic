//2nd order markov chain deciding the computer's posture of interaction based on the user's "posture of interaction" slider settings in the GUI. Various weights are embedded to control how many times certain "postures of interaction" may be repeated.

MorrisMarkov{
	var <>markov_instance, <>next_markov_instance, <>first_language_types, <>current_postures, next_markov_instance, <>next_markov_instance_no_recall;

	*new {arg silence_weight=1,unison_weight=1,complement_weight=1,juxtaposition_weight=1, solo_weight=1, recall_weight=1, silence_repeat_weight=100;
		^super.new.init(silence_weight,unison_weight,complement_weight,juxtaposition_weight, solo_weight, recall_weight, silence_repeat_weight)

	}

	*newNoRecall {arg silence_weight=1,unison_weight=1,complement_weight=1,juxtaposition_weight=1, solo_weight=1, recall_weight=1, silence_repeat_weight=100;
		^super.new.initNoRecall(silence_weight,unison_weight,complement_weight,juxtaposition_weight, solo_weight, recall_weight, silence_repeat_weight)

	}

	*randPosture {
		^super.new.first_postures;

	}

	init { arg solo_weight,unison_weight,complement_weight,juxtaposition_weight, silence_weight, recall_weight, silence_repeat_weight;
		^markov_instance =  MarkovSetN([
			[[\Solo, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight/100, unison_weight, complement_weight, juxtaposition_weight/10, silence_weight, recall_weight]],
			[[\Solo, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Solo, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Solo, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Solo, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, ((silence_weight/silence_repeat_weight)), recall_weight]],
			[[\Solo, \Recall], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			//////////////////////////////////////
			[[\Unison, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Unison, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Unison, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Unison, \Juxtaposition],[\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Unison, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/silence_repeat_weight), recall_weight]],
			[[\Unison, \Recall], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			//////////////////////////////////////
			[[\Complement, \Solo],[\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Complement, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Complement, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Complement, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Complement, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/silence_repeat_weight), recall_weight]],
			[[\Complement, \Recall], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			////////////////////////////////
			[[\Juxtaposition, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Juxtaposition, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Juxtaposition, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Juxtaposition, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight/10, silence_weight, recall_weight]],
			[[\Juxtaposition, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/silence_repeat_weight), recall_weight]],
			[[\Juxtaposition, \Recall], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			/////////////////////////////////////////////
			[[\Silence, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Silence, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Silence, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Silence, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Silence, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/1000), recall_weight]],
			[[\Silence, \Recall], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			/////////////////////////////////////////////
			[[\Recall, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Recall, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Recall, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Recall, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight]],
			[[\Recall, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/silence_repeat_weight), recall_weight]],
			[[\Recall, \Recall], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence, \Recall], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight, recall_weight/10]],
		], 2);
	}

	first_postures{

		^current_postures =
		[[\Solo, \Solo],
			[\Solo, \Unison],
			[\Solo, \Complement],
			[\Solo, \Juxtaposition],
			[\Solo, \Silence],

			//////////////////////////////////////
			[\Unison, \Solo],
			[\Unison, \Unison],
			[\Unison, \Complement],
			[\Unison, \Juxtaposition],
			[\Unison, \Silence],

			//////////////////////////////////////
			[\Complement, \Solo],
			[\Complement, \Unison],
			[\Complement, \Complement],
			[\Complement, \Juxtaposition],
			[\Complement, \Silence],

			////////////////////////////////
			[\Juxtaposition, \Solo],
			[\Juxtaposition, \Unison],
			[\Juxtaposition, \Complement],
			[\Juxtaposition, \Juxtaposition],
			[\Juxtaposition, \Silence],

			/////////////////////////////////////////////
			[\Silence, \Solo],
			[\Silence, \Unison],
			[\Silence, \Complement],
			[\Silence, \Juxtaposition],
			[\Silence, \Silence],
			/////////////////////////////////////////////
		].choose;
	}

	initNoRecall { arg solo_weight,unison_weight,complement_weight,juxtaposition_weight, silence_weight, recall_weight, silence_repeat_weight;
		^next_markov_instance_no_recall = MarkovSetN([
			[[\Solo, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight/100, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Solo, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Solo, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Solo, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Solo, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, ((silence_weight/silence_repeat_weight))]],

			//////////////////////////////////////
			[[\Unison, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight/100, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Unison, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Unison, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Unison, \Juxtaposition],[\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Unison, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/silence_repeat_weight)]],

			//////////////////////////////////////
			[[\Complement, \Solo],[\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Complement, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Complement, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Complement, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Complement, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/silence_repeat_weight)]],

			////////////////////////////////
			[[\Juxtaposition, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Juxtaposition, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Juxtaposition, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Juxtaposition, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Juxtaposition, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/silence_repeat_weight)]],

			/////////////////////////////////////////////
			[[\Silence, \Solo], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight/100, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Silence, \Unison], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Silence, \Complement], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Silence, \Juxtaposition], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, silence_weight]],
			[[\Silence, \Silence], [\Solo, \Unison, \Complement, \Juxtaposition, \Silence], [solo_weight, unison_weight, complement_weight, juxtaposition_weight, (silence_weight/1000)]],

			/////////////////////////////////////////////

		], 2)

	}
}