* NGSPICE file created from cell_1rw.ext - technology: sky130A

.subckt cell_1rw bl br wl vdd gnd
X0 Q wl bl gnd sky130_fd_pr__nfet_01v8 ad=7.728e+11p pd=4.2e+06u as=1.428e+11p ps=1.52e+06u w=420000u l=150000u
X1 gnd Q Q_bar gnd sky130_fd_pr__nfet_01v8 ad=8.82e+11p pd=6.44e+06u as=7.728e+11p ps=4.2e+06u w=1.26e+06u l=150000u
X2 Q Q_bar gnd gnd sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.26e+06u l=150000u
X3 Q_bar wl br gnd sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=1.428e+11p ps=1.52e+06u w=420000u l=150000u
X4 vdd Q Q_bar vdd sky130_fd_pr__pfet_01v8 ad=3.85e+11p pd=3.6e+06u as=1.925e+11p ps=1.8e+06u w=550000u l=150000u
X5 Q Q_bar vdd vdd sky130_fd_pr__pfet_01v8 ad=1.925e+11p pd=1.8e+06u as=0p ps=0u w=550000u l=150000u
.ends

