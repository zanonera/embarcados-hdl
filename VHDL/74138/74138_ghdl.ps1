Write-Host "#### Gates Simulation ####"
ghdl.exe -a .\74138_gates.vhd
ghdl.exe -a .\74138_tb.vhd
ghdl.exe -e SN74LS138_tb
ghdl.exe -r SN74LS138_tb --vcd=74138_gates.vcd
ghdl.exe --remove

Write-Host "#### IF Simulation ####"
ghdl.exe -a .\74138_if.vhd
ghdl.exe -a .\74138_tb.vhd
ghdl.exe -e SN74LS138_tb
ghdl.exe -r SN74LS138_tb --vcd=74138_if.vcd
ghdl.exe --remove

Write-Host "#### CASE Simulation ####"
ghdl.exe -a .\74138_case.vhd
ghdl.exe -a .\74138_tb.vhd
ghdl.exe -e SN74LS138_tb
ghdl.exe -r SN74LS138_tb --vcd=74138_case.vcd
ghdl.exe --remove

Write-Host "#### WHEN Simulation ####"
ghdl.exe -a .\74138_when.vhd
ghdl.exe -a .\74138_tb.vhd
ghdl.exe -e SN74LS138_tb
ghdl.exe -r SN74LS138_tb --vcd=74138_when.vcd
ghdl.exe --remove

Write-Host "#### WITH Simulation ####"
ghdl.exe -a .\74138_with.vhd
ghdl.exe -a .\74138_tb.vhd
ghdl.exe -e SN74LS138_tb
ghdl.exe -r SN74LS138_tb --vcd=74138_with.vcd
ghdl.exe --remove