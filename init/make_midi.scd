//Connect MIDI controllers

MIDIClient.init(4, 4, verbose: true);

MIDIIn.connectAll;

//MIDI functions for real-time control during the performance.

MIDIdef.cc(\knob_1, {
	arg val;
	~knob_1 = val.linlin(0, 127, -60.0, 0.0);

	{c[2].children[4].valueAction_(~knob_1)}.defer;

}, 16);

MIDIdef.cc(\knob_2, {
	arg val;
	~knob_2 = val.linlin(0, 127, -60.0, 5.0);

	{c[2].children[5].valueAction_(~knob_2)}.defer;
}, 17);

MIDIdef.cc(\knob_3, {
	arg val;
	~knob_3 = val.linlin(0, 127, -60.0, 0.0);

	{c[2].children[6].valueAction_(~knob_3)}.defer;
}, 18);

MIDIdef.cc(\knob_0, {
	arg val;
	~knob_0 = val.linlin(0, 127, 30.0, 100.0);

	{c[2].children[7].valueAction_(~knob_0)}.defer;
}, 19);


MIDIdef.cc(\knob_4, {
	arg val;
	~knob_4 = val.linlin(0, 127, -60.0, 0.0);

	{c[4].children[5].valueAction_(~knob_4)}.defer;
}, 0);

MIDIdef.cc(\knob_5, {
	arg val;
	~knob_5 = val.linlin(0, 127, -60.0, 0.0);

	{c[4].children[6].valueAction_(~knob_5)}.defer;
}, 1);

MIDIdef.cc(\knob_6, {
	arg val;
	~knob_6 = val.linlin(0, 127, -60.0, 5.0);

	{c[4].children[7].valueAction_(~knob_6)}.defer;
}, 2);

MIDIdef.cc(\knob_7, {
	arg val;
	~knob_7 = val.linlin(0, 127, -60.0, 0.0);

	{c[4].children[8].valueAction_(~knob_7)}.defer;
}, 3);

MIDIdef.cc(\knob_8, {
	arg val;
	~knob_8 = val.linlin(0, 127, -60.0, 0.0);

	{c[4].children[9].valueAction_(~knob_8)}.defer;
}, 4);

MIDIdef.cc(\knob_16, {
	arg val;
	~knob_16 = val.linlin(0, 127, -60.0, 0.0);

	{c[5].children[3].valueAction_(~knob_16)}.defer;

}, 5);

MIDIdef.cc(\knob_17, {
	arg val;
	~knob_17 = val.linlin(0, 127, -60.0, 0.0);

	{c[5].children[4].valueAction_(~knob_17)}.defer;
}, 6);

MIDIdef.cc(\knob_18, {
	arg val;
	~knob_18 = val.linlin(0, 127, -60.0, 0.0);

	{c[5].children[5].valueAction_(~knob_18)}.defer;
}, 7);