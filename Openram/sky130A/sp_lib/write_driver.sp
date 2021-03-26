* NGSPICE file created from write_driver.ext - technology: sky130A

.subckt write_driver din bl br en vdd gnd
X0 net3 net1 gnd gnd sky130_fd_pr__nfet_01v8 ad=2.1e+11p pd=1.84e+06u as=2.0874e+12p ps=1.634e+07u w=420000u l=150000u
X1 net2 en gnd gnd sky130_fd_pr__nfet_01v8 ad=4.2e+11p pd=3.68e+06u as=0p ps=0u w=420000u l=150000u
X2 net2 en net5 vdd sky130_fd_pr__pfet_01v8 ad=2.75e+11p pd=2.1e+06u as=5.5e+11p ps=4.2e+06u w=550000u l=150000u
X3 net4 net3 gnd gnd sky130_fd_pr__nfet_01v8 ad=3.738e+11p pd=3.46e+06u as=0p ps=0u w=420000u l=150000u
X4 net5 net1 vdd vdd sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=1.1e+12p ps=8.4e+06u w=550000u l=150000u
X5 br net2 gnd gnd sky130_fd_pr__nfet_01v8 ad=4.2e+11p pd=2.68e+06u as=0p ps=0u w=840000u l=150000u
X6 net2 net1 gnd gnd sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=420000u l=150000u
X7 bl net4 gnd gnd sky130_fd_pr__nfet_01v8 ad=4.2e+11p pd=2.68e+06u as=0p ps=0u w=840000u l=150000u
X8 net1 din vdd vdd sky130_fd_pr__pfet_01v8 ad=2.75e+11p pd=2.1e+06u as=0p ps=0u w=550000u l=150000u
X9 net4 en net6 vdd sky130_fd_pr__pfet_01v8 ad=2.75e+11p pd=2.1e+06u as=5.5e+11p ps=4.2e+06u w=550000u l=150000u
X10 net4 en gnd gnd sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=420000u l=150000u
X11 net3 net1 vdd vdd sky130_fd_pr__pfet_01v8 ad=2.75e+11p pd=2.1e+06u as=0p ps=0u w=550000u l=150000u
X12 net1 din gnd gnd sky130_fd_pr__nfet_01v8 ad=2.1e+11p pd=1.84e+06u as=0p ps=0u w=420000u l=150000u
X13 net6 net3 vdd vdd sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=550000u l=150000u
.ends

