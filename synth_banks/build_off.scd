//Kill all synths
(~synth_counter+1).do{

	arg count=0;
	~build_array.at(count).set(\gate, 0, \prolongation, -8, \del, 0)});
	count = count + 1;
};



