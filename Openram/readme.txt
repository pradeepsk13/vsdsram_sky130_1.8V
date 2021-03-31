SkyWater130 SRAM Macros
========================


Author: Pradeepkumar S K, Assistant Professor, Department of ECE, Kalpataru Institute of Technology, Tiptur,Karnataka,India.
========================

The Repo contains SRAM2x16 and SRAM32x256 sample memory generated using openram compiler.

This is an ongoing work which has lots of issues in the designs. Repo will be updated upon improvements time to time (Old files will be overwritten)

Note: Only "Openram" folder of the repo is updating, other stuffs are perfectly working. Upon completion entire repo will be updated with new designs.






********************** Date : 31 March 2021 ******************************************
=========
# Updates  
=========
 * SRAM bit cell layout optimised for area and performance and for tiling.
 * Sense amplifier optimised for tiling which was causing DRC issues (Let me know if any)
 * Write driver layout optimised for area and also for proper tiling which was causing DRC issues (Let me know if any).
 
=========
# Known Issues
=========
 * DRC Issues from pre generated cells.
 * DFF cell need optimisation interms of area and DRC issue yet to be fixed.




********************** Date : 26 March 2021 ********************************************
=========
# Updates
=========
 * Inside Openram folder, contains updated layouts for openram compiler which are yet to be finalised.
 * SRAM bit cell is optimised would not give DRC issues with openram.( Correct me if you find any, will look into it) 
 

=========
# Known Issues
=========
 * DRC Issues 
 * Other Custom cells yet to be optimised 

