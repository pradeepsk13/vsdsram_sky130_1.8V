magic -T /usr/share/pdk/sky130A/libs.tech/magic/sky130A.tech -dnull -noconsole << EOF

load dummy_cell_1rw
extract all
ext2spice lvs
ext2spice  
gds write ../gds_lib/dummy_cell_1rw.gds

load replica_cell_1rw
extract all
ext2spice lvs
ext2spice  
gds write ../gds_lib/replica_cell_1rw.gds

load cell_1rw
extract all
ext2spice  
gds write ../gds_lib/cell_1rw.gds


load dff
extract all
ext2spice lvs
ext2spice  
gds write ../gds_lib/dff.gds

load sense_amp
extract all
ext2spice lvs
ext2spice  
gds write ../gds_lib/sense_amp.gds

load tri_gate
extract all
ext2spice lvs
ext2spice  
gds write ../gds_lib/tri_gate.gds

load write_driver
extract all
ext2spice lvs
ext2spice  
gds write ../gds_lib/write_driver.gds


EOF
