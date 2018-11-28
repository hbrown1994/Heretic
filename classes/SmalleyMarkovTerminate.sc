SmalleyMarkovTerminate{
	var <>markov_instance, <>next_markov_instance, <>first_language_types, <>current_postures, next_markov_instance, <>next_markov_reduced;

	*new {
		^super.new.init;
	}

	*newNoDelay {
		^super.new.initNoDelay;
	}

	*randTerminate {
		^super.new.first_postures;

	}

	init {
		^markov_instance =  MarkovSetN([
			[\0, [\arrival, \dissappearance, \release, \closure, \prolongation], [1, 0, 0, 0, 0]],
			[\1, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.2, 0.2, 0.3, 0.7, 0.3]], //sparse
			[\2, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.1, 0.7, 0.3, 0.1, 0.3]], //drone
			[\3, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.5, 0.5, 0.5, 0.5, 0.5]], //gran
			[\4, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.6, 0.7, 0.6, 0.1, 0.4]], //melodic
			[\5, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.4, 0.4, 0.4, 0.4, 0.4]], //pulse
			[\6, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.4, 0.4, 0.4, 0.4, 0.4]], //poly
			[\7, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.2, 0.2, 0.2, 0.8, 0.4]], //sporadic
			[\8, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.4, 0.2, 0.5, 0.5, 0.2]], //trans
			[\9, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.4, 0.2, 0.5, 0.5, 0.2]], //bomb
			[\10, [\arrival, \dissappearance, \release, \closure, \prolongation], [1, 1, 1, 1, 1]], //Solo
			[\11, [\arrival, \dissappearance, \release, \closure, \prolongation], [1, 1, 1, 1, 1]], //Recall
			[\12, [\arrival, \dissappearance, \release, \closure, \prolongation], [0.1, 1, 0.1, 0.1, 0.1]], //Unison
		], 1);
	}

	first_postures{

		^current_postures =
		[\arrival, \dissappearance, \release, \closure, \prolongation].choose;
	}

	initNoDelay {
		^next_markov_reduced = MarkovSetN([
			[\0, [\arrival, \dissappearance, \release, \closure], [1, 0, 0, 0]],
			[\1, [\arrival, \dissappearance, \release, \closure], [0.2, 0.2, 0.3, 0.7]], //sparse
			[\2, [\arrival, \dissappearance, \release, \closure], [0.1, 0.7, 0.3, 0.1]], //drone
			[\3, [\arrival, \dissappearance, \release, \closure], [0.5, 0.5, 0.5, 0.5]], //gran
			[\4, [\arrival, \dissappearance, \release, \closure], [0.6, 0.7, 0.6, 0.1]], //melodic
			[\5, [\arrival, \dissappearance, \release, \closure], [0.4, 0.4, 0.4, 0.4]], //pulse
			[\6, [\arrival, \dissappearance, \release, \closure], [0.4, 0.4, 0.4, 0.4]], //poly
			[\7, [\arrival, \dissappearance, \release, \closure], [0.2, 0.2, 0.2, 0.8]], //sporadic
			[\8, [\arrival, \dissappearance, \release, \closure], [0.4, 0.2, 0.5, 0.5]], //trans
			[\9, [\arrival, \dissappearance, \release, \closure], [0.4, 0.2, 0.5, 0.5]], //bomb
			[\10, [\arrival, \dissappearance, \release, \closure], [1, 1, 1, 1]], //Solo
			[\11, [\arrival, \dissappearance, \release, \closure], [1, 1, 1, 1]], //Recall
			[\12, [\arrival, \dissappearance, \release, \closure], [0.1, 1, 0.1, 0.1]], //Unison
		], 1)

	}
}