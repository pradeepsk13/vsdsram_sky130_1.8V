# Design of 4KB Static RAM 1.8V (access time &lt;2.5ns) using OpenRAM and Sky130 node 
The work presented here is the design of Static RAM memory of 1024 x 32 (4Kb) with less than 2.5ns access time using OpenRAM compiler and Sky130 technology node.
Custom cells required for SRAM are designed and simulated in "ngspice". Schematics are created with "xschem" circuit editor. "Magic" Layout tool for creating custom Layouts and for RC extraction. 

# Table of Contents  
- [Prerequisite and Instructions](#Prerequisite-and-Instructions)
- [Custom Cells Required for OpenRAM](#custom-cells-required-for-openram) 
- [SRAM Block Diagram](#SRAM-Block-Diagram)
- [Prelayout Simulations](#prelayout-simulations)
- [Layouts and Postlayout Simulations](#Layouts-and-Postlayout-Simulations)
- [Future Work](#future-work) 
- [Author](#Author)
- [Acknowledgements](#acknowledgements)  
- [Contact Information](#contact-information)  

# Prerequisite and Instructions
1. vsdsram_sky130_1.8V : To clone this repository enter the following commands in your terminal.
   ~~~
       $ sudo apt install -y git
       $ git clone https://github.com/pradeepsk13/vsdsram_sky130_1.8V.git
   ~~~

2. ngspice: An open source spice simulator for electronic circuits. For installation in Windows and Linux platform visit http://ngspice.sourceforge.net/download.html .
       For Ubuntu users enter the command below in terminal.       
   ~~~     
        $ sudo apt-get install -y ngspice
   ~~~     
       
3. Google-skywater130 PDK: To get the foundry open terminal and enter the following command
   ~~~
      $ git clone https://foss-eda-tools.googlesource.com/skywater-pdk/libs/sky130_fd_pr
   ~~~
      Note: Copy the sky130pdk library folder and paste inside cloned vsdsram_sky130_1.8V repo folder to work without changing netlist files ( You can also include library path in each netlist files accordingly, if you wish to have library somewhere)
      
4. xschem (Optional) : An EDA tool for drawing hierarchical circuit schematics and making Spice - Verilog - VHDL netlists for simulation.For installation procedure visit https://sourceforge.net/projects/xschem/. To configure and learn more on xschem, gaw waveform viewer and integrating sky130 visit https://github.com/bluecmd/learn-sky130/blob/main/schematic/xschem/getting-started.md .

5. Magic Layout EDA & sky130A : Magic installation and for linking required technology files for sky130 follow any one of the procedure.  
                     *  To download magic layout tool and installing sky130 tech files to work with magic, visit http://www.opencircuitdesign.com/open_pdks/install.html which                          provides detail procedures.
                     *  Enroll for Udemy free course by Kunal Ghosh and Nickson Jose on "VSD - A complete guide to install Openlane and Sky130nm PDK" by visiting the link                             https://www.udemy.com/course/vsd-a-complete-guide-to-install-openlane-and-sky130nm-pdk/ .This free course guides with complete installation of openlane (RTL to GDSII) along with required magic EDA by configuring sky130A latest libraries.
             
              
     
# Custom Cells Required for OpenRAM
OpenRAM Compiler Flow : Image courtesy "Matthew R Guthaus", University of California, Santa Cruz.  
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/openram.png)

* SRAM Bit cell  
* Sense Amplifier circuit  
* Write Driver Circuit  
* Tristate Buffer  
* D-Flip Flop

# SRAM Block Diagram
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/SRAM_Block_Diagram.png)


#  Schematics and Prelayout Simulations

 To perform simulations, enter the following command to change present working directory to "prelayout". Follow later mentioned commands to simulate each netlist.
 ~~~
   $ cd vsdsram_sky130_1.8V-main/Simulation/Prelayout
 ~~~

### 1. 6T SRAM Cell
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/SRAM_6T_Cell.png)

**-> Read Operation**  
```
$ ngspice cell6T_read.cir
```

![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/cell6T_read.png)


**-> Write Operation**
  
```
$ ngspice cell6T_write.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/cell6T_write.png)


### 6T Cell Stability
#### **-> Static Noise Margin Calculation**
A key figure of merit for an SRAM cell is its static noise margin (SNM). It can be extracted by nesting the largest possible square in the two voltage transfer curves (VTC) of the involved CMOS inverters.The SNM is defined as the side-length of the square, given in volts. When an external DC noise is larger than the SNM, the state of the SRAM cell can change and data is lost.

**1. Hold SNM**

![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/Hold_snm.png)
```
$ ngspice holdsnm.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/hold_snm.png)  
By fitting a square in the upper and lower loop, we get   
Hold SNM = min (SNMh, SNMl) = 0.7V



**2. Read SNM**
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/Read_snm.png)
```
$ ngspice readsnm.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/read_snm.png)  
Similarly,  
Read SNM = min (SNMh, SNMl) = 0.49V


**3. Write SNM**
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/Write_snm.png)
```
$ ngspice writesnm.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/write_snm.png)  
By fitting the smallest square between the two curves, we get  
Write SNM = 0.66V


#### **-> N-Curve**  
N-curve provides the current flow information along with the voltage metrics which is equally important for an overall analysis of cell stability.
Stability Metrics includes,
* Static Voltage Noise Margin (SVNM)  
* Static Current Noise Margin (SINM)
* Write Trip Voltage (WTV) 
* Write Trip Current (WTI)
* Critical Write Current (I Critical write)

**1. N curve read**

![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/ncurve_read.png)
```
$ ngspice ncurve_read.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/ncurveread1.png)
   * SVNM = Point C - Point A = (0.82V - 0.105V) = 0.715V
   * SINM = Point B = 469uA
   * WTV  = Point E - Point C = (1.8V - 0.82V) = 0.98V
   * WTI  = Point D = 55.39uA
   
**2. N curve write**
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/ncurve_write.png)
```
$ ngspice ncurve_write.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/ncurvewrite1.png)

Write Critical Current = 131.25uA

### 2. Sense Amplifier
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/sense_amp.png)
Run the netlist file using the following command:
``` 
$ ngspice senseamp.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/sense_amplifier.png)



### 3. Write Driver
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/Write_driver.png)
Run the netlist file using the following command:
```
$ ngspice writedriver.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/write_driver.png)


### 4. Tristate Buffer
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/tristate_buffer.png)
Run the netlist file using the following command:
```
$ ngspice tristatebuff.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/Tri_state_buffer.png)


### 5. Positive Edge Triggered DFF
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/Schematics/D_flipflop.png)
Run the netlist file using the following command:
```
$ ngspice dff.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/DFF.png)

### 1-Bit SRAM  

![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/1bitsram.PNG)

**-> Read Operation**
```
$ ngspice 1bitsram_read.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/1bitSRAM_read.png)
**-> Write Operation**  
  
```
$ ngspice 1bitsram_write.cir
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/prelayout/1bitSRAM_write.png)


#  Layouts and Postlayout Simulations

 Layouts are created for all custom cells in Magic EDA with sky130A.tech (Technology file), layouts are checked for DRC violations and RC extracted to a postlayout spice netlist. Extracted postlayout spice netlist is backannotated, simlulated to verify and match the response with prelayout simulations.
 To perform simulations, enter the following command to change present working directory to "postlayout". Follow later mentioned commands to simulate each netlist.
 ~~~
   $ cd vsdsram_sky130_1.8V-main/Simulation/postlayout
 ~~~

### 1. 6T SRAM Cell
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/layout_snaps/sram_6t_cell.png)

Layout Area: 29.70 um^2 

**-> Read Operation**  
```
$ ngspice sram_6t_cell_read.spice
```

![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/postlayout/sram_6t_cell_read.png)


**-> Write Operation**
  
```
$ ngspice sram_6t_cell_write.spice
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/postlayout/sram_6t_cell_write.png)


### 2. Sense Amplifier
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/layout_snaps/sense_amp.png)


Layout Area: 30.54 um^2 

Run the netlist file using the following command:
``` 
$ ngspice sense_amp.spice
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/postlayout/sense_amp.png)



### 3. Write Driver
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/layout_snaps/write_driver.png)

Layout Area: 84.89 um^2 

Run the netlist file using the following command:
```
$ ngspice write_precharge.spice
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/postlayout/write_ckt.png)


### 4. Tristate Buffer
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/layout_snaps/tristatebuffer.png)

Layout Area: 23.18 um^2 

Run the netlist file using the following command:
```
$ ngspice tristatebuffer.spice
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/postlayout/tristatebuffer.png)


### 5. Positive Edge Triggered DFF
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/layout_snaps/d_flipflop.png)

Layout Area: 60.25 um^2 

Run the netlist file using the following command:
```
$ ngspice d_flipflop.spice
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/postlayout/d_flipflop.png)

### 1-Bit SRAM Integrated 
1 Bit SRAM cell along with write driver, precharge circuit and sense amplifier are integrated in a single layout in order to test for proper functionality of read and write operations after integration. Here in the below layout all custom cells are integrated without using any cell instantiation. The same integrated SRAM layout can also be created using individual custom cells by instantation which provides same functionality.


![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/others/layout_snaps/sram_ip.png)

Layout Area: 106.69 um^2 

**-> Read Operation**
```
$ ngspice sram_ip_read.spice
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/postlayout/sram_ip_read.png)
**-> Write Operation**  
  
```
$ ngspice sram_ip_write.spice
```
![](https://github.com/pradeepsk13/vsdsram_sky130_1.8V/blob/main/waveforms/postlayout/sram_ip_write.png)

# Future Work
* Porting sky130 technology to OpenRAM Compiler and adding the above created custom cells to it. 

# Author
* Pradeepkumar S K

# Acknowledgements  
* Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd.
* Matthew R. Guthaus, University of California, Santa Cruz.
* Philipp Gühring, Software Architect, LibreSilicon Assocation
* Yash Kumar, VSD Teaching Assistant - laryash99@gmail.com
* Reuel Reuben, VSD Teaching Assistant -reuel992000@gmail.com
* Nickson Jose,, VSD Teaching Assistant

# Contact Information  
* Pradeepkumar S K, Assistant Professor,Electronics and Communication Engineering, Kalpataru Institute of Technology, Tiptur, Karnataka.     
   -E-mail: pradeepsk13@gmail.com
* Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. - kunalghosh@gmail.com
* Philipp Gühring, Software Architect, LibreSilicon Assocation - pg@futureware.at



