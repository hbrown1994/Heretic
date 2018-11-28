//Create node groups on server.

~input_node = Group.new;
~pattern_node = Group.after(~input_node);
~pattern_mixer_node = Group.after(~pattern_node);
~features_node = Group.after(~pattern_mixer_node);
~feature_data_node = Group.after(~features_node);
~control_node = Group.after(~feature_data_node);
~field_recordings_node = Group.after(~control_node);
~patterns_node = Group.after(~field_recordings_node);
~drones_node = Group.after(~patterns_node);
~synthesis_node = Group.after(~drones_node);
~live_processing_node = Group.after(~synthesis_node);