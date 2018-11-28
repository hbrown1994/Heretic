
//Load Synth Banks -> Add to Dictionary
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_1.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_2.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_3.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_4.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_5.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_6.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_7.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_8.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_9.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_10.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_11.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_12.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_13.scd");
thisProcess.interpreter.executeFile(~synth_file_path++"synth_bank_14.scd");

thisProcess.interpreter.executeFile(~synth_file_path++"synth_trig.scd");

//Load Pattern Banks -> Add to Dictionary
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_1.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_2.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_3.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_4.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_5.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_6.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_7.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_8.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_9.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_10.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_11.scd");
thisProcess.interpreter.executeFile(~pattern_file_path++"pattern_bank_12.scd");

//Load Unison Synth Banks -> Add to Dictionary
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_1.scd");
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_2.scd");
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_3.scd");
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_4.scd");
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_5.scd");
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_6.scd");
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_7.scd");
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_8.scd");
thisProcess.interpreter.executeFile(~unison_file_path++"unison_bank_9.scd");

//INIT recall synth array
~recall_synth_array = Array.new(30);