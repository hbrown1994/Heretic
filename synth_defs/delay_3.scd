SynthDef(\delay_3, {
	arg amp=(-6), out=2, atk=0.05, sus=0.6, dec=20, rel=0.05, curve=(-10), gate=1, time=180, predelay=0.1, input_bus, del, prolongation, bias=0;
	var env, sig, temp, in;
	in = In.ar(input_bus);
	env = EnvGen.kr(Env.dadsr(del, atk, 0.01, 1, rel, 1, [0, 9, 9, prolongation], bias), gate, doneAction: 2);

	sig = 0;

	temp = DelayN.ar(in, 0, 0.1, predelay, mul: 3);
	temp = HPF.ar(temp, 1000);
	5.do{
		temp =  SwitchDelay.ar(temp, delaytime: {Rand(0.1, 1)} ,delayfactor: {Rand(0.005, 0.05)}, wetlevel: 1, drylevel: 0);
		temp = FreqShift.ar(temp, freq: ({Rand(-1000, -300)} + {LFBrownNoise2.kr({Rand(1, 20)}).range(0, {Rand(-300, -600)})}), phase: 0, mul: 0.6, add: 0);
		sig = sig + temp;
	};
	sig = sig * env * amp.dbamp.lag(0.1);

	Out.ar(out, Pan2.ar(sig, LFBrownNoise1.kr(({Rand(1, 1.5)}),1, {IRand(0, 5)}).linlin(-1, 1, -0.9, 0.9)));
}).add;