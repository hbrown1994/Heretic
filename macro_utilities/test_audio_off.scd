//Turns off test audio

if(~audio_test_field.isPlaying,{~audio_test_field.set(\gate, 0);}, {nil});
if(~audio_test_live_processing.isPlaying,{~audio_test_live_processing.set(\gate, 0);}, {nil});
if(~audio_test_synthesis.isPlaying,{~audio_test_synthesis.set(\gate, 0);}, {nil});
if(~audio_test_drones.isPlaying,{~audio_test_drones.set(\gate, 0);}, {nil});
if(~audio_test_patterns.isPlaying,{~audio_test_patterns.set(\gate, 0);}, {nil});