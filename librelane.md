# Using Librelane with VHDL and Tiny Tapeout configuration
When using Librelane, we have a choice of either using Verilog of VHDL as HDL language to develop the RTL design used by Librelane to create a GDSII file of the design. Librelane needs to be be configured to be able to synthesize VHDL into a Gatelevel netlist.
## Configuring Librelane for VHDL
Librelane can use either a json formatting or a Yaml formatting. The configuration files below inform the Librelane to use a "VHDLClassic" flow, using the Yosys synthesis tool together with the GHDL plugin for Yosys, that in effect convert the VHDL code into Verilog
 ### config.json
~~~
{
    "meta": {
        "flow": "VHDLClassic"
    },
"DESIGN_NAME": "counter",
"VHDL_FILES": ["dir::counter.vhd"],
"CLOCK_PORT": "clk_i",
"CLOCK_PERIOD": "20"
}
~~~
### config.yaml
~~~
meta:
  flow: VHDLClassic

DESIGN_NAME: counter
VHDL_FILES: dir::counter.vhd
CLOCK_PORT: clk_i
CLOCK_PERIOD: 20 # 20ns = 50MHz
~~~

## VHDL example
The VHDL example used above is the counter example in the Librelane documentation.
### Verification
In principle, the code for the counter should be functionally verified using a testbench and a suitable simulator.
## Tiny Tapeout Configuration
Apart form configuring Librelane for VHDL, listing the source files, defining a clock port and setting a clock period. LIbrelane can be configured to apply a specified die size, specified pins, and their placement on the perimeter of a chip.
### Configuration files with Die size and pin configuration for a Tiny Tapeout submission.
 #### config.json
~~~
{
    "meta": {
        "flow": "VHDLClassic"
    },
"DESIGN_NAME": "counter",
"VHDL_FILES": ["dir::counter.vhd"],
"CLOCK_PORT": "clk_i",
"CLOCK_PERIOD": "20"
}
~~~
#### config.yaml
~~~
meta:
  flow: VHDLClassic

DESIGN_NAME: counter
VHDL_FILES: dir::counter.vhd
CLOCK_PORT: clk_i
CLOCK_PERIOD: 20 # 20ns = 50MHz
~~~
## Inspecting results
### Synthesis and gate level netlist
### Floorplanning
### Placement
### Clock tree
### Routing
