* NGSPICE file created from sense_amp.ext - technology: sky130A

.subckt sense_amp bl br dout en vdd gnd
X0 vdd a_202_279# a_78_195# vdd sky130_fd_pr__pfet_01v8 ad=8.355e+11p pd=5.5e+06u as=3.7e+11p ps=2.74e+06u w=1e+06u l=150000u
X1 a_202_279# a_202_279# vdd vdd sky130_fd_pr__pfet_01v8 ad=1.87e+11p pd=1.78e+06u as=0p ps=0u w=550000u l=150000u
X2 gnd a_78_195# dout gnd sky130_fd_pr__nfet_01v8 ad=5.89e+11p pd=4.54e+06u as=1.68e+11p ps=1.64e+06u w=420000u l=150000u
X3 vdd a_78_195# dout vdd sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=2.2e+11p ps=1.9e+06u w=550000u l=150000u
X4 a_134_48# en gnd gnd sky130_fd_pr__nfet_01v8 ad=6.012e+11p pd=4.46e+06u as=0p ps=0u w=1e+06u l=150000u
X5 a_202_279# br a_134_48# gnd sky130_fd_pr__nfet_01v8 ad=1.428e+11p pd=1.52e+06u as=0p ps=0u w=420000u l=150000u
X6 a_134_48# bl a_78_195# gnd sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=1.47e+11p ps=1.54e+06u w=420000u l=150000u
.ends

