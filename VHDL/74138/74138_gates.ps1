#ghdl.exe -a .\74138_gates.vhd
ghdl.exe -a .\74138_if.vhd
ghdl.exe -a .\74138_tb.vhd
ghdl.exe -e SN74LS138_tb
#ghdl.exe -r SN74LS138_tb --vcd=74138_gates.vcd
ghdl.exe -r SN74LS138_tb --vcd=74138_if.vcd