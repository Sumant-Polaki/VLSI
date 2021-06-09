Testbench for inverter sub circuit

.GLOBAL vdd gnd
.PARAM vsupply=5.0

**Library model file
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom

**Include the Inverter Netlist
.INCLUDE lab_9_inv_sue.sp

**Instantiate inverter
Xinv1 in out lab_9_inv_sue

**Sources
Vsup	Vdd	0	DC supply
Vin	in	0	PULSE(5n vsupply 0 10p 10p 100p 200p)
Cload	out	0	50f

**Analyses
.TRAN 10p 20n

.CONTROL
RUN
PLOT v(out)
.ENDC

.END
