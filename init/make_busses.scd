// Audio Busses
~oh_left_send = Bus.audio(s, 1);
~oh_right_send = Bus.audio(s, 1);
~snare_send = Bus.audio(s, 1);
~rack_send = Bus.audio(s, 1);
~floor_send = Bus.audio(s, 1);
~kick_send = Bus.audio(s, 1);
~bass_send = Bus.audio(s, 1);
~hat_send = Bus.audio(s, 1);
~sum_out_send = Bus.audio(s, 1);
~field_recording_out = Bus.audio(s, 2);
~patterns_out = Bus.audio(s, 2);
~synthesis_out = Bus.audio(s, 2);
~drones_out = Bus.audio(s, 2);
~live_processing_out = Bus.audio(s, 2);

// Control Busses
~mfcc_bus = Bus.control(s, 13);
~mfcc_bus_out = Bus.control(s, 2);
~feature_bus = Bus.control(s, 16);
~onset_bus = Bus.control(s, 3);
~mfcc_from_wek_bus = Bus.control(s, 2);
~wek_bus_out = Bus.control(s, 2);
~formal_bus_out= Bus.control(s, 10);
~formal_from_wek_bus = Bus.control(s, 10);
~regress_from_wek = Bus.control(s, 6);
~regress_bus_out = Bus.control(s, 17);
~trig_bus = Bus.control(s, 1);
~language_bus_out= Bus.control(s, 2);

// Key State Busses
~a_key_bus = Bus.control(s, 1);
~b_key_bus = Bus.control(s, 1);