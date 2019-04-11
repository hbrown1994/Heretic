// Right speaker is the source and at left is a burst of noise when an onset is detected

SynthDef(\onset_test, {
	arg in, out;
	var trig = In.kr(in);
    var detect = PinkNoise.ar(Decay.kr(trig, 0.2));
	Out.ar(out, detect);
}).add;
