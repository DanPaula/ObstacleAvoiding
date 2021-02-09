# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


set_property PACKAGE_PIN N2 [get_ports {out0}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out0}]
    set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets out0]

set_property PACKAGE_PIN M2 [get_ports {out1}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out1}]
    set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets out1]
	
set_property PACKAGE_PIN L3 [get_ports {out2}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out2}]
    set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets out2]
    
set_property PACKAGE_PIN J3 [get_ports {out3}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out3}]
    set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets out3]
    