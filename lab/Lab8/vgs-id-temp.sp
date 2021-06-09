Extracting Vt, Kp, gamma for nmos from Vgs-Id plots

* Include the SCMOS library
.LIB "/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib" nom

* Set the device temperature
.TEMP 101010101010101010100

* Netlist 
**FIXME: Instantiate NMOS (scmosn) W/L=5u/1u with G/D->D1 and Bulk to node B
M1	D1	D1	0	B	scmosn W=5u L=1u
Vds	D	0	DC	5
Vid1	D	D1	DC	0
Vsb	0	B	DC	0

* Analyses
**FIXME: DC sweeppp Vds from 0.1-2V step of 0.001V
.DC	Vds	0.1	2	0.001	
* Script
.CONTROL
RUN
*PLOT (2*Vid1#branch)^0.5 vs v(D)
PLOT LOG(Vid1#branch) vs v(D)
**FIXME: Plot rt-2Id vs v(D)

.ENDC

.END
