//GUI for real-time control over the SuperCollider code.

//Makes Window to house GUI objects
Window.closeAll;
w = Window("Heretic | Hunter Brown", Rect(750,50,1200,600))
.front
.alwaysOnTop_(true);

/*______________________________________________ 1. Static Text Labels for all 8 Composite Views  ______________________________________________*/


// Composite View 0 ------------------------------------------
StaticText(w, Rect(0,0,580,40))
.string_("Heretic | Hunter Brown")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 30));

// Composite View 1 ------------------------------------------
StaticText(w, Rect(602,0,580,30))
.string_("Preset Managment")
.align_(\center)
.front
.font_(Font(size: 20));

// Composite View 2 ------------------------------------------
StaticText(w, Rect(440,182,150,100))
.string_("Interaction Postures")
.align_(\center)
.front
.font_(Font(size: 30));

StaticText(w, Rect(1,200,70,30))
.string_("Silence")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(70,200,70,30))
.string_("Unison")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(130,200,100,30))
.string_("Comp.")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(210,200,70,30))
.string_("Jux.")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(280,200,70,30))
.string_("Solo")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(350,200,70,30))
.string_("Recall")
.align_(\center)
.front
.font_(Font(size: 20));

// Composite View 3 ------------------------------------------
StaticText(w, Rect(614, 200,200,30))
.string_("Select Language Type")
.align_(\left)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 18));

StaticText(w, Rect(614, 280,200,30))
.string_("Select Rec. Time")
.align_(\left)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 18));

// Composite View 4 ------------------------------------------


StaticText(w, Rect(3,400,60,30))
.string_("OH L")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(55,400,80,30))
.string_("OH R")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(114,400,80,30))
.string_("Hat")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(175,400,80,30))
.string_("Snare")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(233,400,80,30))
.string_("Kick")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(295,400,80,30))
.string_("Rack")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(355,400,80,30))
.string_("Floor")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

StaticText(w, Rect(415,400,80,30))
.string_("Master")
.align_(\center)
.front
.stringColor_(Color(1, 1, 1))
.font_(Font(size: 15));

// Composite View 5 ------------------------------------------
StaticText(w, Rect(1050, 490,150,100))
.string_("Computer Output")
.align_(\center)
.front
.font_(Font(size: 30));

StaticText(w, Rect(605,402,70,30))
.string_("Field")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(695,402,80,30))
.string_("Patterns")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(785,402,80,30))
.string_("Drones")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(875,402,100,30))
.string_("Synthesis")
.align_(\center)
.front
.font_(Font(size: 20));

StaticText(w, Rect(970,402,100,30))
.string_("Live")
.align_(\center)
.front
.font_(Font(size: 20));

/*______________________________________________ 2. Assign GUI objects to composite views  ______________________________________________*/

// Create Composite Views ------------------------------------------
w.view.decorator_(FlowLayout(w.bounds, 0@0, 0@0));

c = Array.fill( 6, {
	arg view;
	view = CompositeView(w, 600@200)
	.background_();

	view.decorator_(FlowLayout(view.bounds, 10@25, 70@0));
});

// Composite View 0: Init & Stop Reset ------------------------------------------
c[0].background_(Color(0, 0, 0));
c[0].decorator_(FlowLayout(c[0].bounds, 5@20, 15@15)); // Array 0
c[0].decorator.nextLine;
c[0].decorator.nextLine;
c[0].decorator.nextLine;
Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Initialization", Color.black, Color.gray(0.8)],["Initialized", Color.white, Color(0,0,0)]])});
Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Stop & Reset", Color.black, Color.gray(0.8)]])});
c[0].decorator.nextLine;
Array.fill(1, {Button(c[0], 200@50).font_(Font(size: 30)).states_([["Train Silence", Color.black, Color.gray(0.8)],["Training", Color.black, Color(1,0,0)], ["Trained", Color.white, Color(0,0,0)]])});
Array.fill(1,
	~timing_menu = PopUpMenu(c[0],Rect(0,0,200,50))
	.items_(["8 Minutes", "12 Minutes" , "18 Minutes" , "23 Minutes", "30 Minutes"])
	.background_(Color.white);
);

c[0].decorator_(FlowLayout(c[0].bounds, 450@45, 15@15)); // Array 0
Array.fill(1, {Button(c[0], 120@120).font_(Font(size: 30)).states_([["START", Color.black, Color.gray(0.8)],["ACTIVE", Color.black, Color(1,0,0)]])});

// Composite View 1: Presets ------------------------------------------
c[1].background_(Color(1, 1, 1));


// Composite View 2: Postures of Interaction ------------------------------------------
c[2].decorator_(FlowLayout(c[0].bounds, 9@25, 20@0));
c[2].background_(Color(1, 1, 1));
Array.fill(6, {Slider(c[2], 50@150)});
c[2].decorator.nextLine;
Array.fill(6, {NumberBox(c[2], 50@20)});
c[2].decorator_(FlowLayout(c[0].bounds, 465@75, 4@0)); // A
Array.fill(1, {Button(c[2], 100@50).font_(Font(size: 20)).states_([["Random", Color.black, Color.gray(0.8)]])});
c[2].decorator_(FlowLayout(c[0].bounds, 465@140, 4@0)); // A
Array.fill(1, {Button(c[2], 100@50).font_(Font(size: 15)).states_([["Reset Matrix", Color.black, Color.gray(0.8)]])});

// Composite View 3: Record Data into Neural Network ------------------------------------------
c[3].background_(Color.black);
c[3].decorator_(FlowLayout(c[3].bounds, 9@30, 45@0)); // Array 0
Array.fill(1,
	~language_type_menu = PopUpMenu(c[3],Rect(0,0,200,50))
	.items_(["Silence", "Sparse Formings", "Drone Formings", "Granular Formings", "Melodic Formings",  "Pulse-Based Formings", "Polyrhythmic Formings", "Sporadic Formings", "Transgressive Formings", "Bombastic Formings"])
	.background_(Color.white);
);
c[3].decorator.nextLine;
c[3].decorator_(FlowLayout(c[3].bounds, 9@110, 45@0));
Array.fill(1,
	~record_time_menu = TextField(c[3], Rect(10, 10, 150, 85)).font_(Font(size: 60));
	~record_time_menu.string = "0";
	~record_time_menu.action = {arg field; field.value; ~record_time_value=field.value.asInt;};
);

c[3].decorator_(FlowLayout(c[3].bounds, 220@15, 45@0));

Array.fill(1, {Button(c[3], 200@50).font_(Font(size: 30)).states_([["RECORD", Color.black, Color.gray(0.8)],["COUNTING", Color.black, Color(0,1,0)], ["RECORDING", Color.black, Color(1,0,0)]])});

c[3].decorator_(FlowLayout(c[3].bounds, 220@75, 45@0));

Array.fill(1, {Button(c[3], 200@50).font_(Font(size: 30)).states_([["Stop Rec.", Color.black, Color.gray(0.8)]])});

c[3].decorator_(FlowLayout(c[3].bounds, 220@135, 45@0));

Array.fill(1, {Button(c[3], 200@50).font_(Font(size: 30)).states_([["TRAIN", Color.black, Color.gray(0.8)],["TRANING", Color.black, Color(1,0,0)], ["TRAINED", Color.black, Color(0,1,0)]])});

c[3].decorator_(FlowLayout(c[3].bounds, 440@15, 45@0));

Array.fill(1, {Button(c[3], 150@85).font_(Font(size: 20)).states_([["COUNTDOWN", Color.black, Color.gray(0.8)],["4", Color.black, Color(1,0,0)], ["3", Color.black, Color(1,1,1)], ["2", Color.black, Color(1,0,0)], ["1", Color.black, Color(1,1,1)], ["GO", Color.black, Color(0,1,0)]])});

c[3].decorator_(FlowLayout(c[3].bounds, 440@110, 45@0));

Array.fill(1, {NumberBox(c[3], 150@85).font_(Font(size: 60))});

// Composite View 4: Dry Drum Mixing  ------------------------------------------

c[4].decorator_(FlowLayout(c[4].bounds, 9@55, 10@0)); // Array 0
c[4].background_(Color(0, 0, 0));

Array.fill(8, {Slider(c[4], 50@120)});
c[4].decorator.nextLine;
Array.fill(8, {NumberBox(c[4], 50@20)});

c[4].decorator_(FlowLayout(c[4].bounds, 20@25, 30@0)); // Array 0
Array.fill(7, {Knob(c[4], 30@30)});

c[4].decorator_(FlowLayout(c[4].bounds, 545@5, 4@0)); // A
Array.fill(1, {Button(c[4], 50@50).font_(Font(size: 15)).states_([["Mono", Color.black, Color.gray(0.8)]])});

c[4].decorator_(FlowLayout(c[4].bounds, 490@55, 10@0)); // Array 0
c[4].background_(Color(0, 0, 0));

Array.fill(1, {Slider(c[4], 50@120)});
c[4].decorator.nextLine;
Array.fill(1, {NumberBox(c[4], 50@20)});

c[4].decorator_(FlowLayout(c[4].bounds, 490@5, 4@0)); // A
Array.fill(1, {Button(c[4], 50@20).font_(Font(size: 15)).states_([["Onset", Color.black, Color.gray(0.8)], ["Off",  Color.black, Color(1,0,0)]])});


// Composite View 5: Computer Output Mixing  ------------------------------------------
c[5].decorator_(FlowLayout(c[5].bounds, 9@55, 35@0)); // Array 0
c[5].background_(Color(1, 1, 1));
Array.fill(5, {Slider(c[5], 60@120)});
c[5].decorator.nextLine;
Array.fill(5, {NumberBox(c[5], 60@20)});
c[5].decorator_(FlowLayout(c[5].bounds, 9@35, 35@0)); // Array 0
Array.fill(5,
	{PopUpMenu(c[5],Rect(0,0,60,20))
		.items_(["Pink Noise", "1khz Sine", "440khz Sine"])
		.background_(Color.white)
		.font_(Font(size: 15));
});

c[5].decorator_(FlowLayout(c[5].bounds, 500@15, 35@0)); // Array 0
Array.fill(1,
	{PopUpMenu(c[5],Rect(0,0,60,20))
		.items_(["Field", "Patterns", "Drones", "Synthesis", "Live", "All"])
		.background_(Color.white)
		.font_(Font(size: 15));
});

c[5].decorator_(FlowLayout(c[5].bounds, 500@45, 4@0)); // A
Array.fill(1, {Button(c[5], 50@50).font_(Font(size: 15)).states_([["Test", Color.black, Color.gray(0.8)], ["Off",  Color.black, Color(1,0,0)]])});


/*______________________________________________ 3. GUI Object Functionality  ______________________________________________*/

~init_button = c[0].children[0]
.action_({
	arg obj;
	if(obj.value == 1, {e[\init].value;"init".postln},{nil});
});

~stop_button = c[0].children[1]
.mouseDownAction_({e[\stop_reset].value});


~train_button = c[0].children[2]
.action_({
	arg obj;
	if(obj.value == 1, {e[\train_silence].value},{nil});
});

~start_button = c[0].children[4]
.action_({
	arg obj;
	if(obj.value == 1, {e[\start].value},{nil});
});


//GUI FUNC: 2

~random_posture_button = c[2].children[12]
.mouseDownAction_({e[\random_postures].value})

.mouseUpAction_({~random_posture_button.valueAction = 0});


~reset_matrix_button = c[2].children[13]
.mouseDownAction_({e[\reset_posture_matrix].value})

.mouseUpAction_({~reset_matrix_button.valueAction = 0});

~silence_slider = c[2].children[0].action_({
	arg obj;
	var amp;
	~silence_weight=obj.value;
	~silence_numBox.value_(~silence_weight);
});

~silence_numBox = c[2].children[6]
.decimals_(2)
.clipLo_(0)
.clipHi_(1)
.action_({
	arg obj;
	~silence_slider.valueAction_(~silence_weight)
});

~unison_slider = c[2].children[1].action_({
	arg obj;
	var amp;
	~unison_weight=obj.value;
	~unison_numBox.value_(~unison_weight);
});

~unison_numBox = c[2].children[7]
.decimals_(2)
.clipLo_(0)
.clipHi_(1)
.action_({
	arg obj;
	~unison_slider.valueAction_(~unison_weight)
});


~complement_slider = c[2].children[2].action_({
	arg obj;
	var amp;
	~complement_weight=obj.value;
	~complement_numBox.value_(obj.value);
});

~complement_numBox = c[2].children[8]
.decimals_(2)
.clipLo_(0)
.clipHi_(1)
.action_({
	arg obj;
	~complement_slider.valueAction_(obj.value)
});

~juxtaposition_slider = c[2].children[3].action_({
	arg obj;
	var amp;
	~juxtaposition_weight=obj.value;
	~juxtaposition_numBox.value_(obj.value);
});

~juxtaposition_numBox = c[2].children[9]
.decimals_(2)
.clipLo_(0)
.clipHi_(1)
.action_({
	arg obj;
	~juxtaposition_slider.valueAction_(obj.value)
});

~solo_slider = c[2].children[4].action_({
	arg obj;
	var amp;
	~solo_weight=obj.value;
	~solo_numBox.value_(obj.value);
});

~solo_numBox = c[2].children[10]
.decimals_(2)
.clipLo_(0)
.clipHi_(1)
.action_({
	arg obj;
	~solo_slider.valueAction_(obj.value)
});

~recall_slider = c[2].children[5].action_({
	arg obj;
	var amp;
	~recall_weight=obj.value;
	~recall_numBox.value_(obj.value);
});

~recall_numBox = c[2].children[11]
.decimals_(2)
.clipLo_(0)
.clipHi_(1)
.action_({
	arg obj;
	~recall_slider.valueAction_(obj.value)
});



//GUI FUNC: 3
~record_language_button = c[3].children[2]
.action_({
	arg obj;
	if(obj.value == 1, {e[\language_record].value},{nil});
});

~stop_record_button = c[3].children[3]
.mouseDownAction_({e[\stop_language_record].value});


~train_language_button = c[3].children[4]
.mouseDownAction_({e[\language_train].value});


~countdown_button = c[3].children[5];


~countdown_numBox = c[3].children[6]
.decimals_(0)
.action_({
	arg obj;
	~countdown_numBox.valueAction_(~record_time_value.asInt)
});


//GUI FUNC: 6

~mono_button = c[4].children[23]
.mouseDownAction_({e[\mono].value})

.mouseUpAction_({~mono_button.valueAction = 0});


~oh_left_slider = c[4].children[0].action_({
	arg obj;
	var oh_left_amp;
	oh_left_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~oh_left_init_val = obj.value;
	if(~mics.isPlaying,
		{~mics.set(\oh_left_amp, oh_left_amp)}
	);
	~oh_left_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~oh_left_numBox = c[4].children[8]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~oh_left_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});



~oh_right_slider = c[4].children[1].action_({
	arg obj;
	var oh_right_amp;
	oh_right_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~oh_right_init_val = obj.value;
	if(~mics.isPlaying,
		{~mics.set(\oh_right_amp, oh_right_amp)}
	);
	~oh_right_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~oh_right_numBox = c[4].children[9]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~oh_right_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~hat_slider = c[4].children[2].action_({
	arg obj;
	var hat_amp;
	hat_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~hat_init_val = obj.value;
	if(~mics.isPlaying,
		{~mics.set(\hat_amp, hat_amp)}
	);
	~hat_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~hat_numBox = c[4].children[10]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~hat_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~snare_slider = c[4].children[3].action_({
	arg obj;
	var snare_amp;
	snare_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~snare_init_val = obj.value;
	if(~mics.isPlaying,
		{~mics.set(\snare_amp, snare_amp)}
	);
	~snare_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~snare_numBox = c[4].children[11]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~snare_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~kick_slider = c[4].children[4].action_({
	arg obj;
	var kick_amp;
	kick_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~kick_init_val = obj.value;
	if(~mics.isPlaying,
		{~mics.set(\kick_amp, kick_amp)}
	);
	~kick_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~kick_numBox = c[4].children[12]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~kick_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~rack_slider = c[4].children[5].action_({
	arg obj;
	var rack_amp;
	rack_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~rack_init_val = obj.value;
	if(~mics.isPlaying,
		{~mics.set(\rack_amp, rack_amp)}
	);
	~rack_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~rack_numBox = c[4].children[13]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~rack_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~floor_slider = c[4].children[6].action_({
	arg obj;
	var floor_amp;
	floor_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~floor_init_val = obj.value;
	if(~mics.isPlaying,
		{~mics.set(\floor_amp, floor_amp)}
	);
	~floor_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~floor_numBox = c[4].children[14]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~floor_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});


~drum_master_slider = c[4].children[7].action_({
	arg obj;
	var drum_master_amp;
	drum_master_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);

	if(~mics.isPlaying,
		{~mics.set(\master_amp, drum_master_amp)}
	);
	~drum_master_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~drum_master_numBox = c[4].children[15]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~drum_master_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~oh_left_pan_knob = c[4].children[16].action_({
	arg obj;
	var oh_left_pan;
	oh_left_pan = obj.value.linlin(0.0,1.0, -1,1);
	if(~mics.isPlaying,
		{~mics.set(\oh_left_pan, oh_left_pan)}
	);
});


~oh_right_pan_knob = c[4].children[17].action_({
	arg obj;
	var oh_right_pan;
	oh_right_pan = obj.value.linlin(0.0,1.0, -1.0, 1.0);

	if(~mics.isPlaying,
		{~mics.set(\oh_right_pan, oh_right_pan)}
	);
});

~hat_pan_knob = c[4].children[18].action_({
	arg obj;
	var hat_pan;
	hat_pan = obj.value.linlin(0.0,1.0, -1.0, 1.0);

	if(~mics.isPlaying,
		{~mics.set(\hat_pan, hat_pan)}
	);
});

~snare_pan_knob = c[4].children[19].action_({
	arg obj;
	var snare_pan;
	snare_pan = obj.value.linlin(0.0,1.0, -1.0, 1.0);

	if(~mics.isPlaying,
		{~mics.set(\snare_pan, snare_pan)}
	);
});

~kick_pan_knob = c[4].children[20].action_({
	arg obj;
	var kick_pan;
	kick_pan = obj.value.linlin(0.0,1.0, -1.0, 1.0);
	if(~mics.isPlaying,
		{~mics.set(\kick_pan, kick_pan)}
	);
});

~rack_pan_knob = c[4].children[21].action_({
	arg obj;
	var rack_pan;
	rack_pan = obj.value.linlin(0.0,1.0, -1.0, 1.0);

	if(~mics.isPlaying,
		{~mics.set(\rack_pan, rack_pan)}
	);
});

~floor_pan_knob = c[4].children[22].action_({
	arg obj;
	var floor_pan;
	floor_pan = obj.value.linlin(0.0,1.0, -1.0, 1.0);

	if(~mics.isPlaying,
		{~mics.set(\floor_pan, floor_pan)}
	);
});

~percussion_onset_slider= c[4].children[24].action_({
	arg obj;
	var thresh=0.0;
	thresh = obj.value;

	if(~mics.isPlaying,
		{~mics.set(\thresh, thresh)}
	);
	~percussion_onset_numBox.value_(obj.value);
});

~percussion_onset_numBox = c[4].children[25]
.decimals_(3)
.action_({
	arg obj;
	~percussion_onset_slider.valueAction_(obj.value)
});


~percussion_onset_test_trig = c[4].children[26]
.action_({
	arg obj;
	if(obj.value == 1, {e[\drum_onset_test].value},{e[\drum_onset_test_off].value});
});




//GUI: FUNC: 7
~audio_test_button = c[5].children[16]
.action_({
	arg obj;
	if(obj.value == 1, {e[\test_audio].value},{e[\test_audio_off].value});
});


~field_recording_test_menu = c[5].children[10];
~patterns_test_menu = c[5].children[11];
~drones_test_menu = c[5].children[12];
~synthesis_test_menu = c[5].children[13];
~live_processing_test_menu = c[5].children[14];

~audio_test_menu = c[5].children[15];

~field_recordings_slider = c[5].children[0].action_({
	arg obj;
	var field_recordings_amp;
	field_recordings_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~field_recordings_init_val = obj.value;
	if(~field_recordings_bus.isPlaying,{~field_recordings_bus.set(\amp, field_recordings_amp)}
	);
	~field_recordings_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~field_recordings_numBox = c[5].children[5]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~field_recordings_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~patterns_slider = c[5].children[1].action_({
	arg obj;
	var patterns_amp;
	patterns_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~patterns_init_val = obj.value;
	if(~patterns_out_bus.isPlaying,
		{~patterns_out_bus.set(\amp, patterns_amp)}
	);
	~patterns_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~patterns_numBox = c[5].children[6]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~patterns_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~drones_slider = c[5].children[2].action_({
	arg obj;
	var drones_amp;
	drones_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~drones_init_val = obj.value;
	if(~drones_out_bus.isPlaying,
		{~drones_out_bus.set(\amp, drones_amp)}
	);
	~drones_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~drones_numBox = c[5].children[7]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~drones_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~synthesis_slider = c[5].children[3].action_({
	arg obj;
	var synthesis_amp;
	synthesis_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~synthesis_init_val = obj.value;
	if(~synthesis_out_bus.isPlaying,
		{~synthesis_out_bus.set(\amp, synthesis_amp)}
	);
	~synthesis_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~synthesis_numBox = c[5].children[8]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~synthesis_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

~live_processing_slider = c[5].children[4].action_({
	arg obj;
	var live_processing_amp;
	live_processing_amp = obj.value.linlin(0.0,1.0, -60.0,-0.0);
	~live_processing_init_val = obj.value;
	if(~live_processing_out_bus.isPlaying,
		{~live_processing_out_bus.set(\amp, live_processing_amp)}
	);
	~live_processing_numBox.value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
});

~live_processing_numBox = c[5].children[9]
.decimals_(1)
.clipLo_(-60.0)
.clipHi_(0.0)
.action_({
	arg obj;
	~live_processing_slider.valueAction_(obj.value.linlin(-60.0,0.0, 0.0,1.0))
});

/*______________________________________________ 4. GUI Object INIT  ______________________________________________*/

~oh_left_slider.valueAction_(-60);
~oh_right_slider.valueAction_(-60);
~hat_slider.valueAction_(-60);
~snare_slider.valueAction_(-60);
~kick_slider.valueAction_(-60);
~rack_slider.valueAction_(-60);
~floor_slider.valueAction_(-60);
~drum_master_slider.valueAction_(-60);

~oh_left_numBox.valueAction_(-60);
~oh_right_numBox.valueAction_(-60);
~hat_numBox.valueAction_(-60);
~snare_numBox.valueAction_(-60);
~kick_numBox.valueAction_(-60);
~rack_numBox.valueAction_(-60);
~floor_numBox.valueAction_(-60);
~drum_master_numBox.valueAction_(-60);

~oh_left_pan_knob.valueAction_(0.5);
~oh_right_pan_knob.valueAction_(0.5);
~hat_pan_knob.valueAction_(0.5);
~snare_pan_knob.valueAction_(0.5);
~kick_pan_knob.valueAction_(0.5);
~rack_pan_knob.valueAction_(0.5);
~floor_pan_knob.valueAction_(0.5);

/*______________________________________________ 5. Build Preset Directory GUI ______________________________________________*/


Array.fill(1, {

	~preset = ViewPreset( c[1], ~presetFile ); // Works too

	c[1].layout_( HLayout(
		~preset.build.background_(Color(1, 1, 1));

	));

	~preset.start(
		[~silence_slider, ~unison_slider, ~complement_slider, ~juxtaposition_slider, ~solo_slider, ~recall_slider], //interpolation objects
		[~timing_menu] //launching objects
	);

});

//stopwatch window
t = Window("Timer", Rect(750,50,600,300))
.front
.alwaysOnTop_(true);


Array.fill(1,
    ~stopwatch = TextField(t, Rect(10, 10, 600, 300)).font_(Font(size: 260));
	~stopwatch.string = "0";
	~stopwatch.action = {arg field; field.value; ~stopwatch=field.value.asInt;};
);

