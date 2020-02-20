Write-Host "#### 7474 Simulation ####"
ghdl.exe -a .\7474.vhd
ghdl.exe -a .\7474_tb.vhd
ghdl.exe -e SN74LS74A_tb
ghdl.exe -r SN74LS74A_tb --vcd=7474.vcd --stop-time=10ns
ghdl.exe --remove

Write-Host "#### 7474 No Process Simulation ####"
ghdl.exe -a .\7474_no_process.vhd
ghdl.exe -a .\7474_tb.vhd
ghdl.exe -e SN74LS74A_tb
ghdl.exe -r SN74LS74A_tb --vcd=7474_np.vcd --stop-time=10ns
ghdl.exe --remove

Write-Host "#### 7474 Wait Until Simulation ####"
ghdl.exe -a .\7474_wait.vhd
ghdl.exe -a .\7474_tb.vhd
ghdl.exe -e SN74LS74A_tb
ghdl.exe -r SN74LS74A_tb --vcd=7474_wait.vcd --stop-time=10ns
ghdl.exe --remove