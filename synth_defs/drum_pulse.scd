SynthDef(\drum_pulse, {
	arg trig_speed=2, trig_dev=0, delay1=100, delay2=50, pitch_high=0.02, atk=0.005,sus=1.0,rel=0.005, c1=4, c2=(-4), out=0,half, quarter, quarter_quin, quarter_trip, eighth, trip, sixteenth, quin, amp=(-3);
	var mult_trig = TWChoose.kr(Impulse.kr(trig_speed/2), [0.5, 1, 1.25, 3/2, 2, 3, 4, 5], [half, quarter, quarter_quin, quarter_trip, eighth, trip, sixteenth, quin], 1);
	var trig = GaussTrig.kr(trig_speed*mult_trig, trig_dev);
	var excitation = EnvGen.kr(Env.perc, trig, timeScale: 0.1, doneAction: 0) * WhiteNoise.ar(0.6);
	var sig = MembraneHexagon.ar(excitation, TExpRand.kr(pitch_high, 0.005, trig), TRand.kr(0.999972, 0.999, trig));
	var res = XFade2.ar(sig, Formlet.ar(in: sig, freq: [40,50], attacktime: 1, decaytime: 5.0, mul: 0.009, add: 0), TWChoose.kr(trig, [-1, 1], [0.9, 0.1], normalize: 0));
	var env = EnvGen.kr(Env([0.0,1.0,1.0,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);

	res  = Friction.ar(res, damp: TRand.kr(0.00100003, 0.873197, trig).lag(1), friction: TRand.kr(0.00001, 0.00360689, trig).lag(1), mass: TRand.kr(0.200004, 9.82763, trig).lag(1));


	res = Compander.ar(HPF.ar(res, 20), res,
        thresh: 0.0883749,
        slopeBelow: 1,
        slopeAbove: 0.5,
        clampTime:  0.01,
        relaxTime:  0.01
    );

	res = res * env * amp.dbamp;

	Out.ar(out, Limiter.ar(res, 0.9));

}).add;