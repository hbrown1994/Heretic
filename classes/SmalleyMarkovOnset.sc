//A markov chain deciding which of Denis Smalley "Onset" Structual Functions are applied to the current synthesis envelope based
//on Heretics's chosen "language type."

SmalleyMarkovOnset{
	var <>markov_instance, <>next_markov_instance, <>first_language_types, <>current_postures, next_markov_instance, <>next_markov_reduced;

	*new {
		^super.new.init;
	}

	*newNoDelay {
		^super.new.initNoDelay;
	}

	*randOnset {
		^super.new.first_postures;

	}

	init {
		^markov_instance =  MarkovSetN([
			[\0, [\attack, \emergence, \anacrusis, \upbeat, \delay], [1, 0, 0, 0, 0]],
			[\1, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.8, 0.1, 0.6, 0.7, 0.4]], //sparse
			[\2, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.2, 0.8, 0.5, 0.3, 0.3]], //drone
			[\3, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.4, 0.5, 0.5, 0.4, 0.4]], //gran
			[\4, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.3, 0.6, 0.6, 0.4, 0.4]],  //melodic
			[\5, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.7, 0.4, 0.4, 0.4, 0.4]],  //pulse
			[\6, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.7, 0.4, 0.4, 0.4, 0.4]], //poly
			[\7, [\attack, \emergence, \anacrusis, \upbeat, \delay], [1, 0, 0, 0, 0]], //sporadic
			[\8, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.7, 0.4, 0.5, 0.6, 0.5]],   //trans
			[\9, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.8, 0.4, 0.5, 0.5, 0.5]],   //bomb
			[\10, [\attack, \emergence, \anacrusis, \upbeat, \delay], [1, 1, 1, 1, 1]], //SOLO??
			[\11, [\attack, \emergence, \anacrusis, \upbeat, \delay], [1, 1, 1, 1, 1]], //RECALL
			[\12, [\attack, \emergence, \anacrusis, \upbeat, \delay], [0.1, 1, 0.5, 0.1, 0.1]], //Unison
		], 1);
	}

	first_postures{

		^current_postures =
		[\attack, \emergence, \anacrusis, \upbeat, \delay].choose;
	}

	initNoDelay {
		^next_markov_reduced = MarkovSetN([
			[\0, [\attack, \emergence, \anacrusis, \upbeat], [1, 0, 0, 0]],
			[\1, [\attack, \emergence, \anacrusis, \upbeat], [0.8, 0.1, 0.6, 0.7]], //sparse
			[\2, [\attack, \emergence, \anacrusis, \upbeat], [0.2, 0.8, 0.5, 0.3]], //drone
			[\3, [\attack, \emergence, \anacrusis, \upbeat], [0.4, 0.5, 0.5, 0.4]], //gran
			[\4, [\attack, \emergence, \anacrusis, \upbeat], [0.3, 0.6, 0.6, 0.4]],  //melodic
			[\5, [\attack, \emergence, \anacrusis, \upbeat], [0.7, 0.4, 0.4, 0.4]],  //pulse
			[\6, [\attack, \emergence, \anacrusis, \upbeat], [0.7, 0.4, 0.4, 0.4]], //poly
			[\7, [\attack, \emergence, \anacrusis, \upbeat], [1, 0, 0, 0]], //sporadic
			[\8, [\attack, \emergence, \anacrusis, \upbeat], [0.7, 0.4, 0.5, 0.6]],   //trans
			[\9, [\attack, \emergence, \anacrusis, \upbeat], [0.8, 0.4, 0.5, 0.5]],   //bomb
			[\10, [\attack, \emergence, \anacrusis, \upbeat], [1, 1, 1, 1]], //SOLO??
			[\11, [\attack, \emergence, \anacrusis, \upbeat], [1, 1, 1, 1]], //RECALL
			[\12, [\attack, \emergence, \anacrusis, \upbeat], [0.1, 1, 0.5, 0.1]], //Unison
		], 1)

	}
}