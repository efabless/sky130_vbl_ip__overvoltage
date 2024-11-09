# Tcl script to run LVS on the HCMUS INSTRAMP

if {[catch {set PDK_ROOT $::env(PDK_ROOT)}]} {set PDK_ROOT /usr/local/share/pdk}
if {[catch {set PDK $::env(PDK)}]} {set PDK sky130A}

set pdklib ${PDK_ROOT}/${PDK}
set techlibs ${pdklib}/libs.tech
set reflibs ${pdklib}/libs.ref

set setupfile ${techlibs}/netgen/sky130A_setup.tcl

set circuit1 [readnet spice ../netlist/layout/sky130_vbl_ip__overvoltage.spice]
set circuit2 [readnet spice ../netlist/schematic/sky130_vbl_ip__overvoltage.spice]

lvs "$circuit1 sky130_vbl_ip__overvoltage" "$circuit2 sky130_vbl_ip__overvoltage" \
        $setupfile sky130_vbl_ip__overvoltage_comp.out
