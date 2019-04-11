//Make interaction postures from markovs.

if(~recall_wait_counter > 2, {
	Routine({
		~postures = ~postures.swap(0,1);
		0.001.wait;
		~current_posture = ~next_posture.next(~postures);
		0.001.wait;
		~postures = ~postures.put(1, ~current_posture);
		s.sync;
		~previous_posture = ~postures[0];
		0.001.wait;
	}).play;
},
{
	Routine({
		~postures = ~postures.swap(0,1);
		0.001.wait;
		~current_posture = ~next_posture_no_recall.next(~postures);
		0.001.wait;
		~postures = ~postures.put(1, ~current_posture);
		0.001.wait;
		~recall_wait_counter = ~recall_wait_counter + 1;
		s.sync;
		~previous_posture = ~postures[0];
	}).play;
});