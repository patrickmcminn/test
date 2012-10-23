/*
Monday, October 8th 2012
convReverbStereo.scd
prm
*/

SynthDef(\convReverbStereo, {
	| in, out, fftSize = 2048, buffer, mix = 1, amp = 1, inputScale = 0.2 |
	var input, scale, reverb, wet, dry, sig;
	input = In.ar(in, 2);
	scale = input * inputScale;
	reverb = PartConv.ar(scale, fftSize, buffer);
	dry = input * (1-mix);
	wet = reverb * mix;
	sig = dry + wet;
	sig = sig * amp;
	sig = Out.ar(out, sig);
}).add;

"convReverbStereo SynthDef Added".postln;
"      args: in, out, fftSize = 2048, buffer, mix = 1, amp = 1, inputScale = 0.2".postln;
"".postln;