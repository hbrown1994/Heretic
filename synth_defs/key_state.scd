SynthDef(\key, {
	var a, b;

	a = KeyState.kr(0, 0, 1).round;
	b = KeyState.kr(11, 0, 1).round;

	Out.kr(~a_key_bus, a);
	Out.kr(~b_key_bus, b);

}).add;