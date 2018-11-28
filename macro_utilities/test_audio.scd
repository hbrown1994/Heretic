//Turns on test audio

if(~audio_test_menu.value == 0,
	{
		if(~field_recording_test_menu.value == 0, {~audio_test_field = Synth(\pink_noise_test, [\gate, 1, \out, ~field_recording_out, a], target: ~input_node).register;}, {nil});
		if(~field_recording_test_menu.value == 1, {~audio_test_field = Synth(\sine_test_1000, [\gate, 1, \out, ~field_recording_out], target: ~input_node).register;}, {nil});
		if(~field_recording_test_menu.value == 2, {~audio_test_field = Synth(\sine_test_440, [\gate, 1, \out, ~field_recording_out], target: ~input_node).register;}, {nil});
	}
);

if(~audio_test_menu.value == 1,
	{
		if(~patterns_test_menu.value == 0, {~audio_test_patterns = Synth(\pink_noise_test, [\gate, 1, \out, ~patterns_out], target: ~input_node).register;}, {nil});
		if(~patterns_test_menu.value == 1, {~audio_test_patterns = Synth(\sine_test_1000, [\gate, 1, \out,  ~patterns_out], target: ~input_node).register;}, {nil});
		if(~patterns_test_menu.value == 2, {~audio_test_patterns = Synth(\sine_test_440, [\gate, 1, \out, ~patterns_out], target: ~input_node).register;}, {nil});
	}
);

if(~audio_test_menu.value == 2,
	{
		if(~drones_test_menu.value == 0, {~audio_test_drones = Synth(\pink_noise_test, [\gate, 1, \out, ~drones_out], target: ~input_node).register;}, {nil});
		if(~drones_test_menu.value == 1, {~audio_test_drones = Synth(\sine_test_1000, [\gate, 1, \out,  ~drones_out], target: ~input_node).register;}, {nil});
		if(~drones_test_menu.value == 2, {~audio_test_drones = Synth(\sine_test_440, [\gate, 1, \out, ~drones_out], target: ~input_node).register;}, {nil});
	}
);

if(~audio_test_menu.value == 3,
	{
		if(~synthesis_test_menu.value == 0, {~audio_test_synthesis = Synth(\pink_noise_test, [\gate, 1, \out, ~synthesis_out], target: ~input_node).register;}, {nil});
		if(~synthesis_test_menu.value == 1, {~audio_test_synthesis = Synth(\sine_test_1000, [\gate, 1, \out,  ~synthesis_out], target: ~input_node).register;}, {nil});
		if(~synthesis_test_menu.value == 2, {~audio_test_synthesis = Synth(\sine_test_440, [\gate, 1, \out, ~synthesis_out], target: ~input_node).register;}, {nil});
	}
);

if(~audio_test_menu.value == 4,
	{
		if(~live_processing_test_menu.value == 0, {~audio_test_live_processing = Synth(\pink_noise_test, [\gate, 1, \out, ~live_processing_out], target: ~input_node).register;}, {nil});
		if(~live_processing_test_menu.value == 1, {~audio_test_live_processing = Synth(\sine_test_1000, [\gate, 1, \out,  ~live_processing_out], target: ~input_node).register;}, {nil});
		if(~live_processing_test_menu.value == 2, {~audio_test_live_processing = Synth(\sine_test_440, [\gate, 1, \out, ~live_processing_out], target: ~input_node).register;}, {nil});
	}
);