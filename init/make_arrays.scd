//Arrays for use within "n_tube" SynthDefs.

~loss_array_6 = [ 0.84170231819153, 0.94297409057617, 0.85653557777405, 0.9596275806427, 0.9224214553833, 0.82305891513824, 0.97994046211243, 0.83652091026306, 0.80309219360352, 0.93469014167786, 0.92701959609985, 0.98909296989441, 0.98663191795349, 0.91383962631226, 0.81915123462677, 0.96901977062225, 0.94612686634064, 0.82331376075745, 0.90670688152313, 0.98065736293793 ];

~k_array_6 = [ 0.90479707717896, 0.92195267677307, 0.92996267080307, 0.92437303066254, 0.99244954586029, 0.94290665388107, 0.97665801048279, 0.96240893602371, 0.90467557907104, 0.90395483970642, 0.95048950910568, 0.91864706277847, 0.94882205724716, 0.9729239821434, 0.90734416246414, 0.95884075164795, 0.91900454759598, 0.91219396591187, 0.99262874126434, 0.90931832790375 ];

~delay_array_6 = [ 0.022421363592148, 0.020732258558273, 0.063973298072815, 0.048794677257538, 0.014339470863342, 0.041041913032532, 0.061983206272125, 0.019500019550323, 0.059908345937729, 0.073623296022415, 0.091670110225677, 0.025563979148865, 0.07596363067627, 0.028674504756927, 0.088992739915848, 0.060037682056427, 0.067005438804626, 0.070808854103088, 0.076022703647614, 0.022791004180908 ];

//Arrays Smalley "Structual Function" Envelope Times
~arrival_time = Array.series(26, 5, 0.2);
~dissappearance_time = Array.series(61, 20, 0.5);
~release_time = Array.series(11, 1.0, 0.2);

~closure_time = 0.01;
~resolution_time =  Array.series(11, 1.0, 0.2);
~plane_time = Array.series(21, 10, 0.5);

~prolongation_time = Array.series(16, 5, 1);


~attack_time = 0.01;
~emergence_time = Array.series(61, 20, 0.5);
~anacrusis_time = Array.series(26, 5, 0.2);
~upbeat_time = Array.series(11, 1.0, 0.2);
~delay_time = Array.series(16, 5, 1);
~downbeat_time = Array.series(11, 1.0, 0.2);
~departue_time = Array.series(51, 30, 0.5);

~choose_solo_wait = Array.series(70, 70, 1);


~end_wait = Array.series(100, 0.5, 0.5);


~over_lap_wait = [[0.01], Array.series(36, 4, 0.2),  Array.series(46, 11, 0.2), Array.series(46, 20, 1), Array.series(56, 65, 1), Array.series(61, 120, 1)];

~silence_wait_times = [Array.series(36, 3, 0.1), Array.series(36, 6.5, 0.2), Array.series(56, 13.5, 1), Array.series(66, 68.5, 1)];
~silence_follow_wait_times = [[0.001], Array.series(36, 3, 0.1), Array.series(36, 6.5, 0.2)];


~synth_bank_1_select = Array.series(~synth_bank_1.size, 0, 1).scramble;
~synth_bank_2_select = Array.series(~synth_bank_2.size, 0, 1).scramble;
~synth_bank_3_select = Array.series(~synth_bank_3.size, 0, 1).scramble;
~synth_bank_4_select = Array.series(~synth_bank_4.size, 0, 1).scramble;
~synth_bank_5_select = Array.series(~synth_bank_5.size, 0, 1).scramble;
~synth_bank_6_select = Array.series(~synth_bank_6.size, 0, 1).scramble;
~synth_bank_7_select = Array.series(~synth_bank_7.size, 0, 1).scramble;
~synth_bank_8_select = Array.series(~synth_bank_8.size, 0, 1).scramble;
~synth_bank_9_select = Array.series(~synth_bank_9.size, 0, 1).scramble;
~synth_bank_10_select = Array.series(~synth_bank_10.size, 0, 1).scramble;


~unison_bank_0_select = Array.series(~unison_bank_0.size, 0, 1).scramble;
~unison_bank_1_select = Array.series(~unison_bank_1.size, 0, 1).scramble;
~unison_bank_2_select = Array.series(~unison_bank_2.size, 0, 1).scramble;
~unison_bank_3_select = Array.series(~unison_bank_3.size, 0, 1).scramble;
~unison_bank_4_select = Array.series(~unison_bank_4.size, 0, 1).scramble;
~unison_bank_5_select = Array.series(~unison_bank_5.size, 0, 1).scramble;
~unison_bank_6_select = Array.series(~unison_bank_6.size, 0, 1).scramble;
~unison_bank_7_select = Array.series(~unison_bank_7.size, 0, 1).scramble;
~unison_bank_8_select = Array.series(~unison_bank_8.size, 0, 1).scramble;
~unison_bank_9_select = Array.series(~unison_bank_9.size, 0, 1).scramble;
