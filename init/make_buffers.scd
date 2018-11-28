//Adds all buffers in the "buffers" folder to a dictionary array.

//Stereo Buffers
b = Dictionary.new;
PathName(~buffer_path).entries.do{
	arg subfolder;
	b.add(
		subfolder.folderName.asSymbol ->
		Array.fill(
			subfolder.entries.size,
			{
				arg i;
					Buffer.read(s, subfolder.entries[i].fullPath);
				}
			)
		);
	};

//Mono Buffers
m = Dictionary.new;
PathName(~buffer_path).entries.do{
	arg subfolder;
	m.add(
		subfolder.folderName.asSymbol ->
		Array.fill(
			subfolder.entries.size,
			{
				arg i;
					Buffer.readChannel(s, subfolder.entries[i].fullPath, channels: 0);
				}
			)
		);
	};

//Delay Buffers
~long_delay_buffer_1 = Buffer.alloc(s, s.sampleRate*10, 1);


