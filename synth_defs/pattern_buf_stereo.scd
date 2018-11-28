SynthDef(\pattern_buf_stereo, {
	arg atk=0, sus=0, rel=3, c1=6, c2=(-6),
	buf=0, rate=1, spos=0, freq=440, rq=1, bpfmix=0,
	pan_pos=0, amp=1.0, wet=0, distmix=0, out=~inputbus1, loop=1, combmix=0, delayTime=0.2, decayTime=1.0,
	low_pass_freq, low_pass_mix, high_pass_freq, high_pass_mix;
	var sig, env;
	env = EnvGen.kr(Env([0.0,0.2,0.2,0.0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
	sig = PlayBuf.ar(2, buf, rate*BufRateScale.ir(buf),startPos:spos, loop: loop);
	sig = XFade2.ar(sig, LPF.ar(sig, low_pass_freq), (low_pass_mix*2-1));
	sig = XFade2.ar(sig, HPF.ar(sig, high_pass_freq);, (high_pass_mix*2-1));
	sig = sig * env;
	Out.ar(out, sig * amp.dbamp.lag(0.1));
}).add;
