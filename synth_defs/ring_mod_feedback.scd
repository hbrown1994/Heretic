SynthDef(\fbMod, {
	arg amp=0.5, gate=1, outputbusCV=~cvBus, outputbusFX=~fxBus,
	inputbus, rel=30, atk=0.005, sus=0.5, dryamp=0.2, fb=0, modeEnd, modStart, out=0, changeTime=0.1, startAmount = 0.0, endAmount = 1.0, decay=0.3, fb_amount=0.0, freq=300, fb_start, fb_end, fb_dur, del, prolongation, bias=0;
	var in, env, sig, modIn, mult, modFreq=131, sine, temp, modMix;
	in = In.ar(inputbus)!2;
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);
	sig = in * SinOscFB.ar({Rand(300, 700)}, RMS.kr(in).linlin(0.0, 0.2, 0.1, 2pi));
	sig = env * sig * amp.dbamp.lag(0.1);
	Out.ar(out, sig);
}).add;