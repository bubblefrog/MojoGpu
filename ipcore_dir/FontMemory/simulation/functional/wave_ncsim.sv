

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /FontMemory_tb/status
      waveform add -signals /FontMemory_tb/FontMemory_synth_inst/bmg_port/CLKA
      waveform add -signals /FontMemory_tb/FontMemory_synth_inst/bmg_port/ADDRA
      waveform add -signals /FontMemory_tb/FontMemory_synth_inst/bmg_port/DINA
      waveform add -signals /FontMemory_tb/FontMemory_synth_inst/bmg_port/WEA
      waveform add -signals /FontMemory_tb/FontMemory_synth_inst/bmg_port/CLKB
      waveform add -signals /FontMemory_tb/FontMemory_synth_inst/bmg_port/ADDRB
      waveform add -signals /FontMemory_tb/FontMemory_synth_inst/bmg_port/DOUTB

console submit -using simulator -wait no "run"
