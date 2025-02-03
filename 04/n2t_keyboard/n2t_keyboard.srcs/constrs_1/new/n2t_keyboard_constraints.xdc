
# Constraint for n2t_keyboard.v


## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 

## key_codes
set_property PACKAGE_PIN U16 [get_ports {ascii_code[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[0]}]
set_property PACKAGE_PIN E19 [get_ports {ascii_code[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[1]}]
set_property PACKAGE_PIN U19 [get_ports {ascii_code[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[2]}]
set_property PACKAGE_PIN V19 [get_ports {ascii_code[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[3]}]
set_property PACKAGE_PIN W18 [get_ports {ascii_code[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[4]}]
set_property PACKAGE_PIN U15 [get_ports {ascii_code[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[5]}]
set_property PACKAGE_PIN U14 [get_ports {ascii_code[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[6]}]
set_property PACKAGE_PIN V14 [get_ports {ascii_code[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[7]}]
set_property PACKAGE_PIN V13 [get_ports {ascii_code[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[8]}]
set_property PACKAGE_PIN V3 [get_ports {ascii_code[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[9]}]
set_property PACKAGE_PIN W3 [get_ports {ascii_code[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[10]}]
set_property PACKAGE_PIN U3 [get_ports {ascii_code[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[11]}]
set_property PACKAGE_PIN P3 [get_ports {ascii_code[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[12]}]
set_property PACKAGE_PIN N3 [get_ports {ascii_code[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[13]}]
set_property PACKAGE_PIN P1 [get_ports {ascii_code[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[14]}]
set_property PACKAGE_PIN L1 [get_ports {ascii_code[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ascii_code[15]}]



##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]


#USB HID (PS/2)
set_property PACKAGE_PIN C17 [get_ports ps2c]						
	set_property IOSTANDARD LVCMOS33 [get_ports ps2c]
	set_property PULLUP true [get_ports ps2c]
set_property PACKAGE_PIN B17 [get_ports ps2d]					
	set_property IOSTANDARD LVCMOS33 [get_ports ps2d]	
	set_property PULLUP true [get_ports ps2d]
	



# Uncomment following code for testing n2t_keyboard_ps2.v



## This file is a general .xdc for the Basys3 rev B board
### To use it in a project:
### - uncomment the lines corresponding to used pins
### - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
#set_property PACKAGE_PIN W5 [get_ports clk]							
#	set_property IOSTANDARD LVCMOS33 [get_ports clk]
#	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 

### key_codes
#set_property PACKAGE_PIN U16 [get_ports {key_code[0]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {key_code[0]}]
#set_property PACKAGE_PIN E19 [get_ports {key_code[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {key_code[1]}]
#set_property PACKAGE_PIN U19 [get_ports {key_code[2]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {key_code[2]}]
#set_property PACKAGE_PIN V19 [get_ports {key_code[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {key_code[3]}]
#set_property PACKAGE_PIN W18 [get_ports {key_code[4]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {key_code[4]}]
#set_property PACKAGE_PIN U15 [get_ports {key_code[5]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {key_code[5]}]
#set_property PACKAGE_PIN U14 [get_ports {key_code[6]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {key_code[6]}]
#set_property PACKAGE_PIN V14 [get_ports {key_code[7]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {key_code[7]}]
#set_property PACKAGE_PIN L1 [get_ports {rx_done_tick}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {rx_done_tick}]



###Buttons
#set_property PACKAGE_PIN U18 [get_ports reset]						
#	set_property IOSTANDARD LVCMOS33 [get_ports reset]


##USB HID (PS/2)
#set_property PACKAGE_PIN C17 [get_ports ps2c]						
#	set_property IOSTANDARD LVCMOS33 [get_ports ps2c]
#	set_property PULLUP true [get_ports ps2c]
#set_property PACKAGE_PIN B17 [get_ports ps2d]					
#	set_property IOSTANDARD LVCMOS33 [get_ports ps2d]	
#	set_property PULLUP true [get_ports ps2d]
	



