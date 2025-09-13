export DESIGN_NICKNAME = top
export DESIGN_NAME = top
export PLATFORM    = sky130hd

export VERILOG_FILES = /home/julio/Documents/ohd_2025_demo/openroad/main.sv
export SDC_FILE      = /home/julio/Documents/ohd_2025_demo/openroad/constraint.sdc

export PLACE_PINS_ARGS = -min_distance 4 -min_distance_in_tracks

export CORE_UTILIZATION = 20
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2

export PLACE_DENSITY = 0.6
export TNS_END_PERCENT = 100

export FASTROUTE_TCL = /home/julio/Documents/ohd_2025_demo/openroad/sky130hd/fastroute.tcl

export REMOVE_ABC_BUFFERS = 1

export CTS_CLUSTER_SIZE = 20
export CTS_CLUSTER_DIAMETER = 50