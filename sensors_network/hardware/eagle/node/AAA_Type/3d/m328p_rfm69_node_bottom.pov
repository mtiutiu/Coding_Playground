//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/Work/AVR_Playground/sensors_network/hardware/eagle/node/AAA_Type/m328p_rfm69_node.brd
//5/11/16 4:41 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 3;
#declare pin_short = on;

#declare e3d_environment = on;

#local cam_x = 0;
#local cam_y = 180;
#local cam_z = -96;
#local cam_a = 25;
#local cam_look_x = 0;
#local cam_look_y = -4;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 45;
#local pcb_rotate_z = 180;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 19;
#local lgt1_pos_y = 28;
#local lgt1_pos_z = 22;
#local lgt1_intense = 0.730415;
#local lgt2_pos_x = -19;
#local lgt2_pos_y = 28;
#local lgt2_pos_z = 22;
#local lgt2_intense = 0.730415;
#local lgt3_pos_x = 19;
#local lgt3_pos_y = 28;
#local lgt3_pos_z = -15;
#local lgt3_intense = 0.730415;
#local lgt4_pos_x = -19;
#local lgt4_pos_y = 28;
#local lgt4_pos_z = -15;
#local lgt4_intense = 0.730415;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 50.800000;
#declare pcb_y_size = 41.910000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(722);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_table.inc"
#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-25.400000,0,-20.955000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro M328P_RFM69_NODE(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
//Board
box{<50.546000,0,41.910000><-0.254000,-1.500000,0.000000> texture{col_brd}}

//Holes(real)/Parts
//Holes(real)/Board
cylinder{<1.270000,1,40.132000><1.270000,-5,40.132000>1.000000 texture{col_hls}}
cylinder{<1.270000,1,1.778000><1.270000,-5,1.778000>1.000000 texture{col_hls}}
cylinder{<49.022000,1,1.778000><49.022000,-5,1.778000>1.000000 texture{col_hls}}
cylinder{<49.022000,1,40.132000><49.022000,-5,40.132000>1.000000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<16.256000,0.000000,11.684000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100n 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<38.100000,0.000000,15.748000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C2 10uF EIA3528
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<16.764000,0.000000,16.256000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C4 100n 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<42.926000,0.000000,35.560000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<41.402000,0.000000,38.608000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C6 10uF EIA3528
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<32.258000,0.000000,15.494000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C7 100n 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<4.064000,0.000000,10.922000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C8 47uF EIA3528
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<13.208000,0.000000,12.446000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C9 47uF EIA3528
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<32.258000,0.000000,17.526000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C10 100n 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<9.144000,0.000000,10.668000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 100n 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<16.764000,0.000000,18.542000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_LED_SMD_SIDE(Green,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<36.068000,0.000000,10.160000>}#end		//Diskrete 3MM LED D1 RF_LED LED-0603
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_TSSOP8("L6920","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<9.398000,0.000000,15.748000>translate<0,0.035000,0> }#end		//TSSOP8 IC2 L6920 TSSOP8
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.050000,0.000000,3.048000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP2 HTU21D 1X04
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<5.588000,0.000000,25.654000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) JP3 ISP 2X3
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.050000,0.000000,6.350000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP4 OTHER 1X04
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<32.258000,0.000000,6.350000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP5 OTHER 1X04
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<32.258000,0.000000,3.048000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP6 OTHER 1X04
#ifndef(pack_JP7) #declare global_pack_JP7=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<4.064000,0.000000,20.574000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) JP7 Ammeter probe 1X02
#ifndef(pack_L1) #declare global_pack_L1=yes; object {SPC_L_MURATA_2012_LQH3C("10uH",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.064000,0.000000,15.748000>}#end		//Inductor MURATA Chip Coil L1 10uH DLJ-4018
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<36.830000,0.000000,21.590000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 100K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<36.830000,0.000000,19.050000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 100K 0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<12.192000,0.000000,25.654000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R3 10K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<25.654000,0.000000,6.604000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("681",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<36.068000,0.000000,12.446000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 680 0805
#ifndef(pack_RB1) #declare global_pack_RB1=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.386000,0.000000,20.574000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB1 470 0805
#ifndef(pack_RB2) #declare global_pack_RB2=yes; object {RES_SMD_CHIP_0805("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.386000,0.000000,25.908000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB2 330 0805
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ1 LED_D5_EN
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ2 VB_EN_DIS
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("ATMEGA328P","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.130000,0.000000,16.510000>translate<0,0.035000,0> }#end		//TQFP-32 U1 ATMEGA328P TQFP32-08
#ifndef(pack_U2) #declare global_pack_U2=yes; object {RFM69HW_SMD("RFM69W",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<25.654000,0.000000,32.512000>}#end		//RFM69HW SMD U2 RFM69W RFM69W
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {RESONATOR_SMD("8MHz",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<30.988000,0.000000,21.844000>}#end		//RESONATOR SMD Y1 8MHz RESONATOR-SMD_MED
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.552700,1.701800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<47.244000,0,34.036000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.552700,1.701800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<39.624000,0,34.036000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.552700,1.701800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<4.064000,0,34.036000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.552700,1.701800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<11.684000,0,34.036000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.552700,1.701800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<4.064000,0,7.112000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.552700,1.701800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<11.684000,0,7.112000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.552700,1.701800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<47.244000,0,7.112000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.552700,1.701800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<39.624000,0,7.112000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.256000,0.000000,12.584000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<16.256000,0.000000,10.784000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<39.750000,0.000000,15.748000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.450000,0.000000,15.748000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.864000,0.000000,16.256000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.664000,0.000000,16.256000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<42.026000,0.000000,35.560000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<43.826000,0.000000,35.560000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<39.752000,0.000000,38.608000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<43.052000,0.000000,38.608000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.158000,0.000000,15.494000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.358000,0.000000,15.494000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<2.414000,0.000000,10.922000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<5.714000,0.000000,10.922000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.208000,0.000000,14.096000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.208000,0.000000,10.796000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.158000,0.000000,17.526000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.358000,0.000000,17.526000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.044000,0.000000,10.668000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.244000,0.000000,10.668000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.864000,0.000000,18.542000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<17.664000,0.000000,18.542000>}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<46.736000,0,26.974000> texture{col_thl}}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<46.736000,0,14.174000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,30) rotate<0,-270.000000,0> texture{col_pds} translate<35.191000,0.000000,10.160000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,30) rotate<0,-270.000000,0> texture{col_pds} translate<36.945000,0.000000,10.160000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.423000,0.000000,12.848000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.073000,0.000000,12.848000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.723000,0.000000,12.848000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.373000,0.000000,12.848000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.373000,0.000000,18.648000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.723000,0.000000,18.648000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.073000,0.000000,18.648000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.423000,0.000000,18.648000>}
object{TOOLS_PCB_SMD(3.900000,2.400000,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<7.620000,0.000000,39.116000>}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<15.240000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<17.780000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<20.320000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<22.860000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<8.128000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<8.128000,0,24.384000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<5.588000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<5.588000,0,24.384000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<3.048000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.676400,1.016000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<3.048000,0,24.384000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<15.240000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<17.780000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<20.320000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<22.860000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<28.448000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<30.988000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<33.528000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<36.068000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<28.448000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<30.988000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<33.528000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<36.068000,0,3.048000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-270.000000,0>translate<5.334000,0,20.574000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-270.000000,0>translate<2.794000,0,20.574000> texture{col_thl}}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.564000,0.000000,15.748000>}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<2.564000,0.000000,15.748000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.730000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.930000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.930000,0.000000,19.050000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.730000,0.000000,19.050000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<12.192000,0.000000,26.554000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<12.192000,0.000000,24.754000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<25.654000,0.000000,7.504000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<25.654000,0.000000,5.704000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.168000,0.000000,12.446000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.968000,0.000000,12.446000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.386000,0.000000,19.674000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.386000,0.000000,21.474000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.386000,0.000000,25.008000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.386000,0.000000,26.808000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.004000,0.000000,9.144000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.004000,0.000000,10.668000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.004000,0.000000,12.192000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.446000,0.000000,21.844000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.922000,0.000000,21.844000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<28.575000,-1.537000,16.874000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<27.305000,-1.537000,16.874000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.035000,-1.537000,16.874000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<24.765000,-1.537000,16.874000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.495000,-1.537000,16.874000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.225000,-1.537000,16.874000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.955000,-1.537000,16.874000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.685000,-1.537000,16.874000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.685000,-1.537000,24.274000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.955000,-1.537000,24.274000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<22.225000,-1.537000,24.274000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.495000,-1.537000,24.274000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<24.765000,-1.537000,24.274000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<26.035000,-1.537000,24.274000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<27.305000,-1.537000,24.274000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<28.575000,-1.537000,24.274000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.422600,0.000000,13.710000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.422600,0.000000,14.510000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.422600,0.000000,15.310000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.422600,0.000000,16.110000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.422600,0.000000,16.910000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.422600,0.000000,17.710000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.422600,0.000000,18.510000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.422600,0.000000,19.310000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.930000,0.000000,20.802600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.130000,0.000000,20.802600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.330000,0.000000,20.802600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.530000,0.000000,20.802600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.730000,0.000000,20.802600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.930000,0.000000,20.802600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.130000,0.000000,20.802600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.330000,0.000000,20.802600>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.837400,0.000000,19.310000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.837400,0.000000,18.510000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.837400,0.000000,17.710000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.837400,0.000000,16.910000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.837400,0.000000,16.110000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.837400,0.000000,15.310000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.837400,0.000000,14.510000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.837400,0.000000,13.710000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.330000,0.000000,12.217400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.130000,0.000000,12.217400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.930000,0.000000,12.217400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.730000,0.000000,12.217400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.530000,0.000000,12.217400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.330000,0.000000,12.217400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.130000,0.000000,12.217400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.930000,0.000000,12.217400>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.504000,0.000000,25.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.504000,0.000000,27.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.504000,0.000000,29.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.504000,0.000000,31.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.504000,0.000000,33.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.504000,0.000000,35.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.504000,0.000000,37.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.504000,0.000000,39.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.804000,0.000000,39.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.804000,0.000000,37.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.804000,0.000000,35.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.804000,0.000000,33.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.804000,0.000000,31.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.804000,0.000000,29.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.804000,0.000000,27.512000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.804000,0.000000,25.512000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.488000,0.000000,21.844000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.988000,0.000000,21.844000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.488000,0.000000,21.844000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<25.654000,0,3.810000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<18.288000,0,14.732000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<28.448000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<33.782000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<20.066000,0,11.176000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<22.606000,0,14.224000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<21.590000,0,14.986000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<26.924000,0,18.796000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<25.654000,0,18.542000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<24.384000,0,18.542000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<22.860000,0,18.542000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<21.590000,0,19.050000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<21.590000,0,10.160000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<40.132000,0,18.288000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<28.575000,0,28.067000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<28.448000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<31.496000,0,27.686000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<21.336000,0,31.496000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<19.304000,0,31.496000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<22.352000,0,29.464000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<19.304000,0,29.464000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<25.146000,0,9.144000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<23.368000,0,27.432000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,2,0) translate<19.304000,0,27.432000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.762000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.762000,0.000000,7.112000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,90.000000,0> translate<0.762000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.762000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.762000,0.000000,35.052000>}
box{<0,0,-0.203200><27.940000,0.035000,0.203200> rotate<0,90.000000,0> translate<0.762000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,13.970000>}
box{<0,0,-0.203200><11.430000,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.270000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.524000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.524000,0.000000,30.988000>}
box{<0,0,-0.304800><9.398000,0.035000,0.304800> rotate<0,90.000000,0> translate<1.524000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.762000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,0.000000,36.322000>}
box{<0,0,-0.203200><1.983803,0.035000,0.203200> rotate<0,-39.802944,0> translate<0.762000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.310000,0.000000,11.072000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.414000,0.000000,10.922000>}
box{<0,0,-0.304800><0.182527,0.035000,0.304800> rotate<0,55.261493,0> translate<2.310000,0.000000,11.072000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.524000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.540000,0.000000,20.574000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<1.524000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.414000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.564000,0.000000,11.072000>}
box{<0,0,-0.304800><0.212132,0.035000,0.304800> rotate<0,-44.997030,0> translate<2.414000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.564000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.564000,0.000000,11.072000>}
box{<0,0,-0.304800><4.676000,0.035000,0.304800> rotate<0,-90.000000,0> translate<2.564000,0.000000,11.072000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.310000,0.000000,17.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.564000,0.000000,15.748000>}
box{<0,0,-0.304800><1.819813,0.035000,0.304800> rotate<0,81.971349,0> translate<2.310000,0.000000,17.550000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.794000,0.000000,20.574000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,0.000000,0> translate<2.540000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,0.000000,24.638000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,90.000000,0> translate<3.048000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,-1.535000,26.924000>}
box{<0,0,-0.203200><2.341764,0.035000,0.203200> rotate<0,-40.598615,0> translate<1.270000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.762000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,0.000000,7.112000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.762000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.524000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.064000,0.000000,34.036000>}
box{<0,0,-0.304800><3.967607,0.035000,0.304800> rotate<0,-50.191116,0> translate<1.524000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,25.908000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.048000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,30.734000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,90.000000,0> translate<4.318000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.310000,0.000000,17.550000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,20.574000>}
box{<0,0,-0.304800><4.276582,0.035000,0.304800> rotate<0,-44.997030,0> translate<2.310000,0.000000,17.550000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.064000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.714000,0.000000,8.762000>}
box{<0,0,-0.304800><2.333452,0.035000,0.304800> rotate<0,-44.997030,0> translate<4.064000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.714000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.714000,0.000000,8.762000>}
box{<0,0,-0.304800><1.652000,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.714000,0.000000,8.762000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.714000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.714000,0.000000,10.414000>}
box{<0,0,-0.304800><0.508000,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.714000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.714000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.830000,0.000000,10.298000>}
box{<0,0,-0.304800><0.164049,0.035000,0.304800> rotate<0,44.997030,0> translate<5.714000,0.000000,10.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.762000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,1.016000>}
box{<0,0,-0.203200><7.725108,0.035000,0.203200> rotate<0,43.664898,0> translate<0.762000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,0.000000,25.654000>}
box{<0,0,-0.203200><1.626394,0.035000,0.203200> rotate<0,-51.336803,0> translate<5.588000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<5.564000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.088000,0.000000,17.272000>}
box{<0,0,-0.228600><2.155261,0.035000,0.228600> rotate<0,-44.997030,0> translate<5.564000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,11.546000>}
box{<0,0,-0.203200><2.932000,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.366000,0.000000,11.546000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,20.574000>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.334000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.874000,0.000000,38.862000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<7.620000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.830000,0.000000,10.298000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.244000,0.000000,10.298000>}
box{<0,0,-0.304800><2.414000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.830000,0.000000,10.298000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.244000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.244000,0.000000,10.298000>}
box{<0,0,-0.152400><0.370000,0.035000,0.152400> rotate<0,-90.000000,0> translate<8.244000,0.000000,10.298000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,11.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.244000,0.000000,10.668000>}
box{<0,0,-0.203200><1.241680,0.035000,0.203200> rotate<0,44.997030,0> translate<7.366000,0.000000,11.546000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.064000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.382000,0.000000,7.112000>}
box{<0,0,-0.304800><4.318000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.064000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,12.889000>}
box{<0,0,-0.203200><0.827000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,0.000000,12.889000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.382000,0.000000,12.889000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.423000,0.000000,12.848000>}
box{<0,0,-0.152400><0.057983,0.035000,0.152400> rotate<0,44.997030,0> translate<8.382000,0.000000,12.889000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.423000,0.000000,18.648000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.423000,0.000000,19.599000>}
box{<0,0,-0.228600><0.951000,0.035000,0.228600> rotate<0,90.000000,0> translate<8.423000,0.000000,19.599000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.088000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.636000,0.000000,17.272000>}
box{<0,0,-0.228600><1.548000,0.035000,0.228600> rotate<0,0.000000,0> translate<7.088000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.423000,0.000000,19.599000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,19.812000>}
box{<0,0,-0.304800><0.301227,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.423000,0.000000,19.599000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.382000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.762000,0.000000,14.096000>}
box{<0,0,-0.228600><0.537401,0.035000,0.228600> rotate<0,-44.997030,0> translate<8.382000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,0.000000,21.844000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.620000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.636000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<9.073000,0.000000,17.709000>}
box{<0,0,-0.228600><0.618011,0.035000,0.228600> rotate<0,-44.997030,0> translate<8.636000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.073000,0.000000,18.648000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.073000,0.000000,17.709000>}
box{<0,0,-0.203200><0.939000,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.073000,0.000000,17.709000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,0.000000,26.924000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.128000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,25.654000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.604000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.723000,0.000000,16.835000>}
box{<0,0,-0.203200><3.333301,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.366000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.723000,0.000000,18.648000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.723000,0.000000,16.835000>}
box{<0,0,-0.203200><1.813000,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.723000,0.000000,16.835000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,36.322000>}
box{<0,0,-0.203200><7.902625,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.318000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.762000,0.000000,14.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,14.096000>}
box{<0,0,-0.304800><1.398000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.762000,0.000000,14.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.044000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.373000,0.000000,10.997000>}
box{<0,0,-0.203200><0.465276,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.044000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.373000,0.000000,12.848000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.373000,0.000000,10.997000>}
box{<0,0,-0.203200><1.851000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.373000,0.000000,10.997000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,-1.535000,4.572000>}
box{<0,0,-0.203200><13.112404,0.035000,0.203200> rotate<0,45.781803,0> translate<1.270000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,14.096000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,14.350000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.160000,0.000000,14.096000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<10.414000,0.000000,18.689000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<10.414000,0.000000,14.350000>}
box{<0,0,-0.228600><4.339000,0.035000,0.228600> rotate<0,-90.000000,0> translate<10.414000,0.000000,14.350000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.373000,0.000000,18.648000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.414000,0.000000,18.689000>}
box{<0,0,-0.152400><0.057983,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.373000,0.000000,18.648000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.414000,0.000000,19.812000>}
box{<0,0,-0.304800><1.778000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.636000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<10.414000,0.000000,18.689000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<10.414000,0.000000,19.812000>}
box{<0,0,-0.228600><1.123000,0.035000,0.228600> rotate<0,90.000000,0> translate<10.414000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.286000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,36.322000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.286000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,0.000000,36.322000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.906000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,0.000000,32.004000>}
box{<0,0,-0.203200><7.184205,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.588000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.922000,0.000000,21.844000>}
box{<0,0,-0.304800><2.032000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.890000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.128000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.568000,0.000000,24.384000>}
box{<0,0,-0.304800><3.440000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.128000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.414000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.938000,0.000000,19.812000>}
box{<0,0,-0.304800><1.524000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.414000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,38.862000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.874000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.382000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.066000,0.000000,10.796000>}
box{<0,0,-0.304800><5.209963,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.382000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.568000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.192000,0.000000,24.754000>}
box{<0,0,-0.304800><0.725449,0.035000,0.304800> rotate<0,-30.663743,0> translate<11.568000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.066000,0.000000,10.796000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.320000,0.000000,10.796000>}
box{<0,0,-0.304800><0.254000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.066000,0.000000,10.796000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.938000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446000,0.000000,20.320000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.938000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446000,0.000000,20.320000>}
box{<0,0,-0.304800><1.524000,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.446000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.192000,0.000000,24.754000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.446000,0.000000,24.500000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<12.192000,0.000000,24.754000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446000,0.000000,24.500000>}
box{<0,0,-0.304800><2.656000,0.035000,0.304800> rotate<0,90.000000,0> translate<12.446000,0.000000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.668000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,32.004000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.668000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,36.322000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.414000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,0.000000,26.554000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.150000,0.000000,27.512000>}
box{<0,0,-0.203200><1.354817,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.192000,0.000000,26.554000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.320000,0.000000,10.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,0.000000,10.796000>}
box{<0,0,-0.203200><0.888000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.320000,0.000000,10.796000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,14.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.208000,0.000000,14.096000>}
box{<0,0,-0.304800><3.048000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.160000,0.000000,14.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,0.000000,35.814000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<12.700000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.256000,0.000000,29.512000>}
box{<0,0,-0.203200><5.456036,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.398000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.462000,0.000000,31.242000>}
box{<0,0,-0.203200><6.106574,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.144000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.542000,0.000000,37.512000>}
box{<0,0,-0.203200><2.096501,0.035000,0.203200> rotate<0,40.082859,0> translate<11.938000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.208000,0.000000,33.512000>}
box{<0,0,-0.203200><2.132634,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.700000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,-1.535000,20.574000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.334000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.740000,0.000000,35.814000>}
box{<0,0,-0.203200><1.532000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.208000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.208000,0.000000,14.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.744000,0.000000,14.096000>}
box{<0,0,-0.304800><1.536000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.208000,0.000000,14.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,0.000000,3.048000>}
box{<0,0,-0.304800><3.302000,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.240000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,0.000000,7.112000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.240000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.462000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.534000,0.000000,31.242000>}
box{<0,0,-0.203200><2.072000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.462000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.446000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,21.844000>}
box{<0,0,-0.304800><3.302000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.446000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.208000,0.000000,10.796000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.760000,0.000000,10.796000>}
box{<0,0,-0.304800><2.552000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.208000,0.000000,10.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.150000,0.000000,27.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.804000,0.000000,27.512000>}
box{<0,0,-0.203200><2.654000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.150000,0.000000,27.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.256000,0.000000,29.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.804000,0.000000,29.512000>}
box{<0,0,-0.203200><2.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.256000,0.000000,29.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.534000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.804000,0.000000,31.512000>}
box{<0,0,-0.203200><0.381838,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.534000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.208000,0.000000,33.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.804000,0.000000,33.512000>}
box{<0,0,-0.203200><1.596000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.208000,0.000000,33.512000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.740000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.804000,0.000000,35.512000>}
box{<0,0,-0.152400><1.106029,0.035000,0.152400> rotate<0,15.844730,0> translate<14.740000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.542000,0.000000,37.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.804000,0.000000,37.512000>}
box{<0,0,-0.203200><2.262000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.542000,0.000000,37.512000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.804000,0.000000,29.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.852000,0.000000,29.464000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,44.997030,0> translate<15.804000,0.000000,29.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.864000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.864000,0.000000,14.616000>}
box{<0,0,-0.203200><1.640000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.864000,0.000000,14.616000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.864000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.864000,0.000000,16.256000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.864000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.804000,0.000000,27.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.884000,0.000000,27.432000>}
box{<0,0,-0.152400><0.113137,0.035000,0.152400> rotate<0,44.997030,0> translate<15.804000,0.000000,27.512000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.804000,0.000000,35.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.010000,0.000000,35.814000>}
box{<0,0,-0.152400><0.365568,0.035000,0.152400> rotate<0,-55.697675,0> translate<15.804000,0.000000,35.512000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.804000,0.000000,31.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.074000,0.000000,31.496000>}
box{<0,0,-0.152400><0.270474,0.035000,0.152400> rotate<0,3.391116,0> translate<15.804000,0.000000,31.512000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.760000,0.000000,10.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,10.784000>}
box{<0,0,-0.152400><0.496145,0.035000,0.152400> rotate<0,1.385826,0> translate<15.760000,0.000000,10.796000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.744000,0.000000,14.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.256000,0.000000,12.584000>}
box{<0,0,-0.304800><2.138291,0.035000,0.304800> rotate<0,44.997030,0> translate<14.744000,0.000000,14.096000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.804000,0.000000,33.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.328000,0.000000,33.528000>}
box{<0,0,-0.152400><0.524244,0.035000,0.152400> rotate<0,-1.748831,0> translate<15.804000,0.000000,33.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,14.732000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.764000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.804000,0.000000,39.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.186000,0.000000,40.894000>}
box{<0,0,-0.203200><1.954443,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.804000,0.000000,39.512000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,9.398000>}
box{<0,0,-0.304800><3.232892,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.240000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.256000,0.000000,12.584000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,11.568000>}
box{<0,0,-0.304800><1.626394,0.035000,0.304800> rotate<0,38.657257,0> translate<16.256000,0.000000,12.584000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,11.568000>}
box{<0,0,-0.304800><2.170000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.526000,0.000000,11.568000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.664000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.696000,0.000000,18.510000>}
box{<0,0,-0.152400><0.045255,0.035000,0.152400> rotate<0,44.997030,0> translate<17.664000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.696000,0.000000,19.896000>}
box{<0,0,-0.304800><2.754888,0.035000,0.304800> rotate<0,44.997030,0> translate<15.748000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.696000,0.000000,18.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.696000,0.000000,19.896000>}
box{<0,0,-0.304800><1.386000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.696000,0.000000,19.896000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,3.048000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,90.000000,0> translate<17.780000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,3.048000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,17.272000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.764000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,1.016000>}
box{<0,0,-0.203200><11.684000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.350000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,1.016000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<17.780000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,6.858000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.780000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,6.858000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.288000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.864000,0.000000,14.616000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,12.192000>}
box{<0,0,-0.203200><3.428054,0.035000,0.203200> rotate<0,44.997030,0> translate<15.864000,0.000000,14.616000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,-1.535000,14.732000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,90.000000,0> translate<18.288000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.664000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,16.256000>}
box{<0,0,-0.203200><0.624000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.664000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.726000,0.000000,17.710000>}
box{<0,0,-0.203200><1.042478,0.035000,0.203200> rotate<0,-24.842597,0> translate<17.780000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,0.000000,15.240000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.288000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.942000,0.000000,16.910000>}
box{<0,0,-0.203200><0.924896,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.288000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,7.874000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.050000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,12.446000>}
box{<0,0,-0.203200><3.232892,0.035000,0.203200> rotate<0,44.997030,0> translate<16.764000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.328000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,33.528000>}
box{<0,0,-0.203200><2.722000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.328000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.884000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,27.432000>}
box{<0,0,-0.203200><3.420000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.884000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.852000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,29.464000>}
box{<0,0,-0.203200><3.452000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.852000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,31.496000>}
box{<0,0,-0.203200><3.230000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.074000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.010000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,0.000000,35.814000>}
box{<0,0,-0.203200><3.548000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.010000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,0.000000,35.941000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.558000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.767400,0.000000,15.240000>}
box{<0,0,-0.203200><0.971400,0.035000,0.203200> rotate<0,0.000000,0> translate<18.796000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.767400,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.837400,0.000000,15.310000>}
box{<0,0,-0.152400><0.098995,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.767400,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.942000,0.000000,16.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.837400,0.000000,16.910000>}
box{<0,0,-0.203200><0.895400,0.035000,0.203200> rotate<0,0.000000,0> translate<18.942000,0.000000,16.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.726000,0.000000,17.710000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.837400,0.000000,17.710000>}
box{<0,0,-0.203200><1.111400,0.035000,0.203200> rotate<0,0.000000,0> translate<18.726000,0.000000,17.710000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.696000,0.000000,18.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.837400,0.000000,18.510000>}
box{<0,0,-0.304800><2.141400,0.035000,0.304800> rotate<0,0.000000,0> translate<17.696000,0.000000,18.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.837400,0.000000,13.710000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.843400,0.000000,13.716000>}
box{<0,0,-0.152400><0.008485,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.837400,0.000000,13.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.837400,0.000000,14.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.869400,0.000000,14.478000>}
box{<0,0,-0.152400><0.045255,0.035000,0.152400> rotate<0,44.997030,0> translate<19.837400,0.000000,14.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,-1.535000,14.732000>}
box{<0,0,-0.203200><8.261836,0.035000,0.203200> rotate<0,44.997030,0> translate<14.224000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,-1.535000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,-1.535000,14.732000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,90.000000,0> translate<20.066000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,6.350000>}
box{<0,0,-0.203200><1.983803,0.035000,0.203200> rotate<0,50.191116,0> translate<19.050000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.837400,0.000000,19.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,19.792600>}
box{<0,0,-0.203200><0.682499,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.837400,0.000000,19.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,19.792600>}
box{<0,0,-0.203200><12.465400,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.320000,0.000000,19.792600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,32.258000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<19.050000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.837400,0.000000,18.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.606000,0.000000,18.510000>}
box{<0,0,-0.203200><0.768600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.837400,0.000000,18.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,37.084000>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.685000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,40.640000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,90.000000,0> translate<20.828000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,-1.535000,24.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,-1.535000,24.274000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.685000,-1.535000,24.274000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.869400,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,0.000000,14.478000>}
box{<0,0,-0.152400><1.212600,0.035000,0.152400> rotate<0,0.000000,0> translate<19.869400,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.955000,-1.535000,16.874000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,-1.535000,17.001000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.955000,-1.535000,16.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,17.001000>}
box{<0,0,-0.203200><0.779000,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.082000,-1.535000,17.001000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.186000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,0.000000,40.894000>}
box{<0,0,-0.203200><3.896000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.186000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,0.000000,40.894000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.828000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107400,0.000000,12.217400>}
box{<0,0,-0.203200><1.472762,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.066000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.107400,0.000000,12.217400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.330000,0.000000,12.217400>}
box{<0,0,-0.203200><0.222600,0.035000,0.203200> rotate<0,0.000000,0> translate<21.107400,0.000000,12.217400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.330000,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,20.808600>}
box{<0,0,-0.152400><0.008485,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.330000,0.000000,20.802600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,0.000000,20.808600>}
box{<0,0,-0.203200><10.687400,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.336000,0.000000,20.808600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336000,-1.535000,31.496000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.304000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,4.318000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.320000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,4.318000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.590000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,0.000000,14.986000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.082000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.606000,0.000000,18.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,17.526000>}
box{<0,0,-0.203200><1.391586,0.035000,0.203200> rotate<0,44.997030,0> translate<20.606000,0.000000,18.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,-1.535000,18.288000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.082000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,-1.535000,18.288000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.590000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.843400,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,0.000000,13.716000>}
box{<0,0,-0.152400><2.254600,0.035000,0.152400> rotate<0,0.000000,0> translate<19.843400,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,15.494000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.590000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,17.001000>}
box{<0,0,-0.203200><0.779000,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.098000,-1.535000,17.001000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,0.000000,19.558000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.590000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.130000,0.000000,10.700000>}
box{<0,0,-0.203200><0.763675,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.590000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.130000,0.000000,12.217400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.130000,0.000000,10.700000>}
box{<0,0,-0.203200><1.517400,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.130000,0.000000,10.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.130000,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.130000,0.000000,28.988000>}
box{<0,0,-0.203200><8.185400,0.035000,0.203200> rotate<0,90.000000,0> translate<22.130000,0.000000,28.988000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,-1.535000,17.001000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.225000,-1.535000,16.874000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<22.098000,-1.535000,17.001000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,-1.535000,24.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,-1.535000,24.274000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.955000,-1.535000,24.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,29.464000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.304000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.130000,0.000000,28.988000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,0.000000,29.464000>}
box{<0,0,-0.203200><0.525224,0.035000,0.203200> rotate<0,-64.991998,0> translate<22.130000,0.000000,28.988000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.606000,0.000000,14.224000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.098000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,6.604000>}
box{<0,0,-0.203200><6.647816,0.035000,0.203200> rotate<0,46.545086,0> translate<18.288000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,6.604000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.860000,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,18.542000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.098000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.930000,0.000000,9.468000>}
box{<0,0,-0.203200><1.895046,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.590000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.930000,0.000000,12.217400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.930000,0.000000,9.468000>}
box{<0,0,-0.203200><2.749400,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.930000,0.000000,9.468000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.930000,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.930000,0.000000,26.486000>}
box{<0,0,-0.203200><5.683400,0.035000,0.203200> rotate<0,90.000000,0> translate<22.930000,0.000000,26.486000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,14.732000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.606000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,18.542000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.860000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,19.558000>}
box{<0,0,-0.152400><1.016000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.098000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,-1.535000,17.001000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,-1.535000,17.526000>}
box{<0,0,-0.203200><0.525000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.368000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,-1.535000,27.432000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.304000,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.930000,0.000000,26.486000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,27.432000>}
box{<0,0,-0.203200><1.042478,0.035000,0.203200> rotate<0,-65.151464,0> translate<22.930000,0.000000,26.486000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.368000,-1.535000,17.001000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,-1.535000,16.874000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<23.368000,-1.535000,17.001000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,-1.535000,24.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,24.274000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.225000,-1.535000,24.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,4.572000>}
box{<0,0,-0.203200><13.208000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.414000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.730000,0.000000,12.217400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.730000,0.000000,7.766000>}
box{<0,0,-0.203200><4.451400,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.730000,0.000000,7.766000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.730000,0.000000,20.174000>}
box{<0,0,-0.152400><0.871156,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.114000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.730000,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.730000,0.000000,20.174000>}
box{<0,0,-0.152400><0.628600,0.035000,0.152400> rotate<0,-90.000000,0> translate<23.730000,0.000000,20.174000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,4.572000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.860000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,4.572000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.384000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.730000,0.000000,7.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,0.000000,7.112000>}
box{<0,0,-0.203200><0.924896,0.035000,0.203200> rotate<0,44.997030,0> translate<23.730000,0.000000,7.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,18.542000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.368000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.530000,0.000000,12.217400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.530000,0.000000,9.760000>}
box{<0,0,-0.203200><2.457400,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.530000,0.000000,9.760000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.530000,0.000000,19.958000>}
box{<0,0,-0.152400><2.002526,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.114000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.530000,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.530000,0.000000,19.958000>}
box{<0,0,-0.152400><0.844600,0.035000,0.152400> rotate<0,-90.000000,0> translate<24.530000,0.000000,19.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.638000,-1.535000,5.588000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.622000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.638000,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.638000,-1.535000,8.636000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.638000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,24.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,-1.535000,24.274000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.495000,-1.535000,24.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.837400,0.000000,16.110000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.784000,0.000000,16.110000>}
box{<0,0,-0.203200><4.946600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.837400,0.000000,16.110000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,15.748000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.892000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.784000,0.000000,16.110000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.892000,0.000000,16.002000>}
box{<0,0,-0.152400><0.152735,0.035000,0.152400> rotate<0,44.997030,0> translate<24.784000,0.000000,16.110000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,16.002000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.892000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.765000,-1.535000,16.874000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.892000,-1.535000,17.001000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.765000,-1.535000,16.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,-1.535000,17.001000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,-1.535000,17.780000>}
box{<0,0,-0.203200><0.779000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.892000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.530000,0.000000,9.760000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,9.144000>}
box{<0,0,-0.203200><0.871156,0.035000,0.203200> rotate<0,44.997030,0> translate<24.530000,0.000000,9.760000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.638000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,-1.535000,9.144000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.638000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,16.764000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.892000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.330000,0.000000,12.217400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.330000,0.000000,10.484000>}
box{<0,0,-0.203200><1.733400,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.330000,0.000000,10.484000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.330000,0.000000,15.310000>}
box{<0,0,-0.203200><0.619426,0.035000,0.203200> rotate<0,44.997030,0> translate<24.892000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.384000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.330000,0.000000,19.742000>}
box{<0,0,-0.152400><1.528043,0.035000,0.152400> rotate<0,-51.746694,0> translate<24.384000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.330000,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.330000,0.000000,19.742000>}
box{<0,0,-0.152400><1.060600,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.330000,0.000000,19.742000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,5.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,3.810000>}
box{<0,0,-0.203200><1.894000,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.654000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.892000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,18.542000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.892000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,7.504000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.770000,0.000000,7.504000>}
box{<0,0,-0.203200><0.116000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.654000,0.000000,7.504000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.770000,0.000000,8.520000>}
box{<0,0,-0.203200><0.882469,0.035000,0.203200> rotate<0,44.997030,0> translate<25.146000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.770000,0.000000,7.504000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.770000,0.000000,8.520000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<25.770000,0.000000,8.520000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,-1.535000,24.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,-1.535000,24.274000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.765000,-1.535000,24.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.130000,0.000000,12.217400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.130000,0.000000,10.954000>}
box{<0,0,-0.203200><1.263400,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.130000,0.000000,10.954000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.654000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.130000,0.000000,19.526000>}
box{<0,0,-0.152400><1.093084,0.035000,0.152400> rotate<0,-64.180860,0> translate<25.654000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.130000,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.130000,0.000000,19.526000>}
box{<0,0,-0.152400><1.276600,0.035000,0.152400> rotate<0,-90.000000,0> translate<26.130000,0.000000,19.526000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.035000,-1.535000,16.874000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.162000,-1.535000,17.001000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<26.035000,-1.535000,16.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.001000>}
box{<0,0,-0.203200><0.525000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.162000,-1.535000,17.001000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,4.572000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-36.867464,0> translate<25.654000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,15.494000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.098000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,0.000000,4.572000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.924000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.330000,0.000000,10.484000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,0.000000,8.890000>}
box{<0,0,-0.203200><2.254256,0.035000,0.203200> rotate<0,44.997030,0> translate<25.330000,0.000000,10.484000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,18.288000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.162000,-1.535000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,-1.535000,18.288000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.924000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.930000,0.000000,19.056000>}
box{<0,0,-0.152400><0.260069,0.035000,0.152400> rotate<0,-88.672172,0> translate<26.924000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.930000,0.000000,20.802600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.930000,0.000000,19.056000>}
box{<0,0,-0.152400><1.746600,0.035000,0.152400> rotate<0,-90.000000,0> translate<26.930000,0.000000,19.056000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,17.526000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.590000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,-1.535000,16.129000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.670000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,-1.535000,16.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,-1.535000,16.129000>}
box{<0,0,-0.203200><0.745000,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.305000,-1.535000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,-1.535000,24.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,-1.535000,24.274000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.035000,-1.535000,24.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.362000,0.000000,17.710000>}
box{<0,0,-0.203200><0.260215,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.178000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,14.732000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.114000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,16.764000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.146000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.559000,0.000000,28.067000>}
box{<0,0,-0.203200><11.135518,0.035000,0.203200> rotate<0,44.997030,0> translate<19.685000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.578000,0.000000,16.910000>}
box{<0,0,-0.203200><0.206475,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.432000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.930000,0.000000,12.217400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.717400,0.000000,11.430000>}
box{<0,0,-0.203200><1.113552,0.035000,0.203200> rotate<0,44.997030,0> translate<26.930000,0.000000,12.217400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.130000,0.000000,10.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,8.890000>}
box{<0,0,-0.203200><2.918937,0.035000,0.203200> rotate<0,44.997030,0> translate<26.130000,0.000000,10.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,40.894000>}
box{<0,0,-0.203200><7.112000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.082000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,13.710000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,13.233400>}
box{<0,0,-0.203200><0.476600,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.422600,0.000000,13.233400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.330000,0.000000,15.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,15.310000>}
box{<0,0,-0.203200><3.092600,0.035000,0.203200> rotate<0,0.000000,0> translate<25.330000,0.000000,15.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.578000,0.000000,16.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,16.910000>}
box{<0,0,-0.203200><0.844600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.578000,0.000000,16.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.362000,0.000000,17.710000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,17.710000>}
box{<0,0,-0.203200><1.060600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.362000,0.000000,17.710000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.924000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,3.048000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<26.924000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,8.890000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.194000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,9.144000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.448000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.717400,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,11.430000>}
box{<0,0,-0.203200><0.730600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.717400,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,14.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.454600,0.000000,14.478000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<28.422600,0.000000,14.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.422600,0.000000,18.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.454600,0.000000,18.542000>}
box{<0,0,-0.152400><0.045255,0.035000,0.152400> rotate<0,-44.997030,0> translate<28.422600,0.000000,18.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,15.621000>}
box{<0,0,-0.203200><1.448023,0.035000,0.203200> rotate<0,-37.872484,0> translate<27.432000,-1.535000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,16.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,15.621000>}
box{<0,0,-0.203200><1.253000,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.575000,-1.535000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,-1.535000,24.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,24.274000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.305000,-1.535000,24.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.559000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,0.000000,28.067000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.559000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,24.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,-1.535000,28.067000>}
box{<0,0,-0.203200><3.793000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.575000,-1.535000,28.067000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,0.000000,40.513000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<28.194000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,10.160000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.590000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.454600,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,14.478000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,0.000000,0> translate<28.454600,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,19.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.488000,0.000000,20.375400>}
box{<0,0,-0.203200><1.506703,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.422600,0.000000,19.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.488000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.488000,0.000000,20.375400>}
box{<0,0,-0.203200><1.468600,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.488000,0.000000,20.375400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,15.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.648000,0.000000,15.310000>}
box{<0,0,-0.203200><1.225400,0.035000,0.203200> rotate<0,0.000000,0> translate<28.422600,0.000000,15.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,7.620000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.448000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,7.620000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.718000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,10.668000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.210000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.422600,0.000000,13.233400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,11.938000>}
box{<0,0,-0.203200><1.831972,0.035000,0.203200> rotate<0,44.997030,0> translate<28.422600,0.000000,13.233400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,12.954000>}
box{<0,0,-0.203200><1.983803,0.035000,0.203200> rotate<0,-50.191116,0> translate<28.448000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,26.162000>}
box{<0,0,-0.203200><13.208000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.718000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,13.462000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<29.464000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,13.462000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.480000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.454600,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,18.542000>}
box{<0,0,-0.203200><2.025400,0.035000,0.203200> rotate<0,0.000000,0> translate<28.454600,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.648000,0.000000,15.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,0.000000,14.224000>}
box{<0,0,-0.203200><1.535836,0.035000,0.203200> rotate<0,44.997030,0> translate<29.648000,0.000000,15.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.422600,0.000000,16.110000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.742000,0.000000,16.110000>}
box{<0,0,-0.304800><2.319400,0.035000,0.304800> rotate<0,0.000000,0> translate<28.422600,0.000000,16.110000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,3.556000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.988000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,6.350000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.988000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.575000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,25.654000>}
box{<0,0,-0.203200><3.412497,0.035000,0.203200> rotate<0,44.997030,0> translate<28.575000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,25.654000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.988000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.422600,0.000000,17.710000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.174000,0.000000,17.710000>}
box{<0,0,-0.304800><2.751400,0.035000,0.304800> rotate<0,0.000000,0> translate<28.422600,0.000000,17.710000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,0.000000,10.668000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<30.480000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.742000,0.000000,16.110000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.358000,0.000000,15.494000>}
box{<0,0,-0.304800><0.871156,0.035000,0.304800> rotate<0,44.997030,0> translate<30.742000,0.000000,16.110000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.358000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.358000,0.000000,15.494000>}
box{<0,0,-0.304800><2.032000,0.035000,0.304800> rotate<0,-90.000000,0> translate<31.358000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.174000,0.000000,17.710000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.358000,0.000000,17.526000>}
box{<0,0,-0.152400><0.260215,0.035000,0.152400> rotate<0,44.997030,0> translate<31.174000,0.000000,17.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.358000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.358000,0.000000,18.150000>}
box{<0,0,-0.152400><0.624000,0.035000,0.152400> rotate<0,90.000000,0> translate<31.358000,0.000000,18.150000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,-1.535000,27.686000>}
box{<0,0,-0.203200><2.341764,0.035000,0.203200> rotate<0,-40.598615,0> translate<29.718000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,9.144000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.988000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.242000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,10.668000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.242000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,0.000000,12.192000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,-90.000000,0> translate<32.004000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,4.826000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.988000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,7.112000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,90.000000,0> translate<32.258000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.488000,0.000000,20.550000>}
box{<0,0,-0.203200><2.839741,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.480000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.488000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.488000,0.000000,20.550000>}
box{<0,0,-0.203200><1.294000,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.488000,0.000000,20.550000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.512000,0.000000,14.224000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.734000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.034000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,1.016000>}
box{<0,0,-0.203200><14.986000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.034000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.512000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,14.732000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.512000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,15.356000>}
box{<0,0,-0.203200><0.624000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.020000,0.000000,15.356000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,15.356000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.158000,0.000000,15.494000>}
box{<0,0,-0.152400><0.195161,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.020000,0.000000,15.356000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.158000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.158000,0.000000,17.526000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.158000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.158000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.412000,0.000000,15.748000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.158000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,1.524000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.020000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,1.524000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,3.048000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.528000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,3.048000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.528000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,6.743000>}
box{<0,0,-0.203200><0.393000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.528000,0.000000,6.743000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,8.636000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.258000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,8.890000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.448000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,0.000000,8.890000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.782000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.158000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.406000,0.000000,17.526000>}
box{<0,0,-0.203200><1.248000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.158000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,4.572000>}
box{<0,0,-0.203200><7.874000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.670000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.358000,0.000000,18.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.798000,0.000000,21.590000>}
box{<0,0,-0.304800><4.864895,0.035000,0.304800> rotate<0,-44.997030,0> translate<31.358000,0.000000,18.150000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.916000,0.000000,27.686000>}
box{<0,0,-0.203200><3.420000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.496000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.168000,0.000000,12.446000>}
box{<0,0,-0.203200><3.164000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.004000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.191000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.191000,0.000000,10.669000>}
box{<0,0,-0.203200><0.509000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.191000,0.000000,10.669000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.916000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.504000,0.000000,27.512000>}
box{<0,0,-0.152400><0.613205,0.035000,0.152400> rotate<0,16.483365,0> translate<34.916000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.406000,0.000000,17.526000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.930000,0.000000,19.050000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.406000,0.000000,17.526000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.798000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.930000,0.000000,21.590000>}
box{<0,0,-0.304800><1.132000,0.035000,0.304800> rotate<0,0.000000,0> translate<34.798000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,3.048000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<34.544000,-1.535000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,3.048000>}
box{<0,0,-0.304800><3.302000,0.035000,0.304800> rotate<0,-90.000000,0> translate<36.068000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,7.112000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,90.000000,0> translate<36.068000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.412000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.450000,0.000000,15.748000>}
box{<0,0,-0.203200><3.038000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.412000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,-1.535000,18.288000>}
box{<0,0,-0.203200><10.423289,0.035000,0.203200> rotate<0,-46.971834,0> translate<29.718000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.528000,0.000000,6.743000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.945000,0.000000,10.160000>}
box{<0,0,-0.203200><4.832368,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.528000,0.000000,6.743000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.945000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.945000,0.000000,10.529000>}
box{<0,0,-0.152400><0.369000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.945000,0.000000,10.529000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.191000,0.000000,10.669000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.968000,0.000000,12.446000>}
box{<0,0,-0.203200><2.513058,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.191000,0.000000,10.669000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.730000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.730000,0.000000,19.050000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.730000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.945000,0.000000,10.529000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,11.938000>}
box{<0,0,-0.203200><1.992627,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.945000,0.000000,10.529000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.450000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,13.844000>}
box{<0,0,-0.203200><2.692663,0.035000,0.203200> rotate<0,44.997030,0> translate<36.450000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,13.844000>}
box{<0,0,-0.203200><1.906000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.354000,0.000000,13.844000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.930000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.354000,0.000000,24.014000>}
box{<0,0,-0.304800><3.428054,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.930000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.354000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.354000,0.000000,24.014000>}
box{<0,0,-0.304800><3.926000,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.354000,0.000000,24.014000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.504000,0.000000,39.512000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.594000,0.000000,39.512000>}
box{<0,0,-0.304800><3.090000,0.035000,0.304800> rotate<0,0.000000,0> translate<35.504000,0.000000,39.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.730000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,22.976000>}
box{<0,0,-0.203200><1.960100,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.730000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,22.976000>}
box{<0,0,-0.203200><3.440000,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.116000,0.000000,22.976000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.730000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.750000,0.000000,17.030000>}
box{<0,0,-0.203200><2.856711,0.035000,0.203200> rotate<0,44.997030,0> translate<37.730000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.750000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.750000,0.000000,17.030000>}
box{<0,0,-0.152400><1.282000,0.035000,0.152400> rotate<0,90.000000,0> translate<39.750000,0.000000,17.030000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.752000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.752000,0.000000,37.834000>}
box{<0,0,-0.304800><0.774000,0.035000,0.304800> rotate<0,-90.000000,0> translate<39.752000,0.000000,37.834000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.594000,0.000000,39.512000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.752000,0.000000,38.608000>}
box{<0,0,-0.304800><1.469075,0.035000,0.304800> rotate<0,37.975096,0> translate<38.594000,0.000000,39.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.762000,0.000000,26.808000>}
box{<0,0,-0.203200><0.755632,0.035000,0.203200> rotate<0,-31.247781,0> translate<39.116000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.068000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.132000,0.000000,11.176000>}
box{<0,0,-0.304800><5.747364,0.035000,0.304800> rotate<0,-44.997030,0> translate<36.068000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,-1.535000,18.288000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.830000,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.132000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,0.000000,18.542000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<40.132000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,19.674000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,18.542000>}
box{<0,0,-0.203200><1.132000,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.386000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,25.008000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.386000,0.000000,21.474000>}
box{<0,0,-0.203200><3.534000,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.386000,0.000000,21.474000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.762000,0.000000,26.808000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,0.000000,26.808000>}
box{<0,0,-0.152400><0.624000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.762000,0.000000,26.808000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.044000,0.000000,26.974000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,0.000000,26.808000>}
box{<0,0,-0.152400><0.380158,0.035000,0.152400> rotate<0,25.889306,0> translate<40.044000,0.000000,26.974000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.354000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.026000,0.000000,31.612000>}
box{<0,0,-0.304800><5.192992,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.354000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.026000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.026000,0.000000,31.612000>}
box{<0,0,-0.304800><3.948000,0.035000,0.304800> rotate<0,-90.000000,0> translate<42.026000,0.000000,31.612000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.752000,0.000000,37.834000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.026000,0.000000,35.560000>}
box{<0,0,-0.304800><3.215922,0.035000,0.304800> rotate<0,44.997030,0> translate<39.752000,0.000000,37.834000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.026000,0.000000,31.612000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.164000,0.000000,31.750000>}
box{<0,0,-0.152400><0.195161,0.035000,0.152400> rotate<0,-44.997030,0> translate<42.026000,0.000000,31.612000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.418000,0.000000,40.894000>}
box{<0,0,-0.203200><14.224000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.194000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.418000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.052000,0.000000,40.006000>}
box{<0,0,-0.203200><1.091100,0.035000,0.203200> rotate<0,54.470936,0> translate<42.418000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.052000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.052000,0.000000,40.006000>}
box{<0,0,-0.203200><1.398000,0.035000,0.203200> rotate<0,90.000000,0> translate<43.052000,0.000000,40.006000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.052000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.826000,0.000000,37.834000>}
box{<0,0,-0.152400><1.094601,0.035000,0.152400> rotate<0,44.997030,0> translate<43.052000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.826000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.826000,0.000000,37.834000>}
box{<0,0,-0.152400><2.274000,0.035000,0.152400> rotate<0,90.000000,0> translate<43.826000,0.000000,37.834000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.132000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.246000,0.000000,14.174000>}
box{<0,0,-0.304800><5.818075,0.035000,0.304800> rotate<0,44.997030,0> translate<40.132000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.132000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,11.176000>}
box{<0,0,-0.304800><6.096000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.132000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.246000,0.000000,14.174000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,0.000000,14.174000>}
box{<0,0,-0.304800><2.490000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.246000,0.000000,14.174000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.044000,0.000000,26.974000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,0.000000,26.974000>}
box{<0,0,-0.304800><6.692000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.044000,0.000000,26.974000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.164000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,0.000000,31.750000>}
box{<0,0,-0.304800><4.572000,0.035000,0.304800> rotate<0,0.000000,0> translate<42.164000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.244000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.244000,0.000000,33.782000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,-90.000000,0> translate<47.244000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.514000,0.000000,13.208000>}
box{<0,0,-0.304800><3.058565,0.035000,0.304800> rotate<0,-41.630792,0> translate<46.228000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.736000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.514000,0.000000,30.226000>}
box{<0,0,-0.304800><2.341764,0.035000,0.304800> rotate<0,40.598615,0> translate<46.736000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.514000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<48.514000,0.000000,30.226000>}
box{<0,0,-0.304800><17.018000,0.035000,0.304800> rotate<0,90.000000,0> translate<48.514000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,0.000000,8.636000>}
box{<0,0,-0.304800><2.747430,0.035000,0.304800> rotate<0,-33.687844,0> translate<47.244000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,0.000000,8.636000>}
box{<0,0,-0.304800><23.622000,0.035000,0.304800> rotate<0,-90.000000,0> translate<49.530000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.244000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<49.530000,0.000000,32.258000>}
box{<0,0,-0.304800><2.747430,0.035000,0.304800> rotate<0,33.687844,0> translate<47.244000,0.000000,33.782000> }
//Text
//Rect
union{
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<30.988000,0.000000,20.794000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<30.988000,0.000000,22.894000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<32.488000,0.000000,20.794000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<32.488000,0.000000,22.894000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<29.488000,0.000000,20.794000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<29.488000,0.000000,22.894000>}
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,3.356638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,30.946578>}
box{<0,0,-0.203200><27.589941,0.035000,0.203200> rotate<0,90.000000,0> translate<0.609597,0.000000,30.946578> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,3.356638>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.929619,0.000000,3.489197>}
box{<0,0,-0.203200><0.346390,0.035000,0.203200> rotate<0,-22.498817,0> translate<0.609597,0.000000,3.356638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.909872,0.000000,3.657600>}
box{<0,0,-0.203200><13.300275,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.316272,0.000000,4.064000>}
box{<0,0,-0.203200><13.706675,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325600,0.000000,4.470400>}
box{<0,0,-0.203200><13.716003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325600,0.000000,4.876800>}
box{<0,0,-0.203200><13.716003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.845663,0.000000,5.283200>}
box{<0,0,-0.203200><10.236066,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.439262,0.000000,5.689600>}
box{<0,0,-0.203200><9.829666,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.032863,0.000000,6.096000>}
box{<0,0,-0.203200><9.423266,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,6.502400>}
box{<0,0,-0.203200><9.188453,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,6.908800>}
box{<0,0,-0.203200><9.188453,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,7.315200>}
box{<0,0,-0.203200><9.188453,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,7.721600>}
box{<0,0,-0.203200><9.188453,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.032866,0.000000,8.128000>}
box{<0,0,-0.203200><9.423269,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.439266,0.000000,8.534400>}
box{<0,0,-0.203200><9.829669,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.845666,0.000000,8.940800>}
box{<0,0,-0.203200><10.236069,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.288709,0.000000,9.347200>}
box{<0,0,-0.203200><0.679113,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,9.753600>}
box{<0,0,-0.203200><0.594803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,10.160000>}
box{<0,0,-0.203200><0.594803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,10.566400>}
box{<0,0,-0.203200><0.594803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,10.972800>}
box{<0,0,-0.203200><0.594803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,11.379200>}
box{<0,0,-0.203200><0.594803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,11.785600>}
box{<0,0,-0.203200><0.594803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,12.192000>}
box{<0,0,-0.203200><0.594803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.378297,0.000000,12.598400>}
box{<0,0,-0.203200><0.768700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.649600,0.000000,13.004800>}
box{<0,0,-0.203200><1.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.043678,0.000000,13.411200>}
box{<0,0,-0.203200><0.434081,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,13.817600>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,14.224000>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,14.630400>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,15.036800>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,15.443200>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,15.849600>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,16.256000>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,16.662400>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,17.068800>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,17.475200>}
box{<0,0,-0.203200><0.344803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.959516,0.000000,17.881600>}
box{<0,0,-0.203200><0.349919,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.274722,0.000000,18.288000>}
box{<0,0,-0.203200><0.665125,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.161247,0.000000,18.694400>}
box{<0,0,-0.203200><1.551650,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.567647,0.000000,19.100800>}
box{<0,0,-0.203200><1.958050,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.921066,0.000000,19.507200>}
box{<0,0,-0.203200><1.311469,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.514666,0.000000,19.913600>}
box{<0,0,-0.203200><0.905069,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.422400,0.000000,20.320000>}
box{<0,0,-0.203200><0.812803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.094444,0.000000,20.726400>}
box{<0,0,-0.203200><0.484847,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.723638,0.000000,21.132800>}
box{<0,0,-0.203200><0.114041,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,21.539200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,21.945600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,22.352000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,22.758400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,23.164800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,23.571200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,23.977600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,24.384000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,24.790400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,25.196800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,25.603200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,26.009600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,26.416000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,26.822400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,27.228800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,27.635200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,28.041600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,28.448000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,28.854400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,29.260800>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,29.667200>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,30.073600>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,30.480000>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,30.886400>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,30.946578>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,30.946513>}
box{<0,0,-0.203200><0.000066,0.035000,0.203200> rotate<0,87.267929,0> translate<0.609597,0.000000,30.946578> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,31.127134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,38.553359>}
box{<0,0,-0.203200><7.426225,0.035000,0.203200> rotate<0,90.000000,0> translate<0.609597,0.000000,38.553359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,31.127134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,31.127153>}
box{<0,0,-0.203200><0.000019,0.035000,0.203200> rotate<0,-80.532363,0> translate<0.609597,0.000000,31.127134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.660519,0.000000,31.292800>}
box{<0,0,-0.203200><0.050922,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.926388,0.000000,31.699200>}
box{<0,0,-0.203200><0.316791,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.265056,0.000000,32.105600>}
box{<0,0,-0.203200><0.655459,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.603722,0.000000,32.512000>}
box{<0,0,-0.203200><0.994125,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.942391,0.000000,32.918400>}
box{<0,0,-0.203200><1.332794,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178050,0.000000,33.324800>}
box{<0,0,-0.203200><1.568453,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178050,0.000000,33.731200>}
box{<0,0,-0.203200><1.568453,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178050,0.000000,34.137600>}
box{<0,0,-0.203200><1.568453,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178050,0.000000,34.544000>}
box{<0,0,-0.203200><1.568453,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.311266,0.000000,34.950400>}
box{<0,0,-0.203200><1.701669,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.717666,0.000000,35.356800>}
box{<0,0,-0.203200><2.108069,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.124066,0.000000,35.763200>}
box{<0,0,-0.203200><2.514469,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,36.169600>}
box{<0,0,-0.203200><32.284803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.241925,0.000000,36.576000>}
box{<0,0,-0.203200><12.632328,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.908994,0.000000,36.982400>}
box{<0,0,-0.203200><12.299397,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.590134,0.000000,37.388800>}
box{<0,0,-0.203200><4.980537,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.159756,0.000000,37.795200>}
box{<0,0,-0.203200><4.550159,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,38.201600>}
box{<0,0,-0.203200><4.450803,0.035000,0.203200> rotate<0,0.000000,0> translate<0.609597,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609597,0.000000,38.553359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.929619,0.000000,38.420800>}
box{<0,0,-0.203200><0.346390,0.035000,0.203200> rotate<0,22.498817,0> translate<0.609597,0.000000,38.553359> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,21.408113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.748809,0.000000,21.072031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<0.609600,0.000000,21.408113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,30.946513>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,21.408113>}
box{<0,0,-0.203200><9.538400,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.609600,0.000000,21.408113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,31.169884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,31.127153>}
box{<0,0,-0.203200><0.042731,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.609600,0.000000,31.127153> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.609600,0.000000,31.169884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.663328,0.000000,31.299588>}
box{<0,0,-0.203200><0.140391,0.035000,0.203200> rotate<0,-67.494289,0> translate<0.609600,0.000000,31.169884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.663328,0.000000,31.299588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.705097,0.000000,31.433656>}
box{<0,0,-0.203200><0.140425,0.035000,0.203200> rotate<0,-72.690923,0> translate<0.663328,0.000000,31.299588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.705097,0.000000,31.433656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.732459,0.000000,31.466488>}
box{<0,0,-0.203200><0.042739,0.035000,0.203200> rotate<0,-50.187898,0> translate<0.705097,0.000000,31.433656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.732459,0.000000,31.466488>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.748809,0.000000,31.505966>}
box{<0,0,-0.203200><0.042730,0.035000,0.203200> rotate<0,-67.498487,0> translate<0.732459,0.000000,31.466488> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.748809,0.000000,21.072031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.006031,0.000000,20.814809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<0.748809,0.000000,21.072031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.748809,0.000000,31.505966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.848084,0.000000,31.605238>}
box{<0,0,-0.203200><0.140394,0.035000,0.203200> rotate<0,-44.996128,0> translate<0.748809,0.000000,31.505966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.848084,0.000000,31.605238>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.202422,0.000000,33.230441>}
box{<0,0,-0.203200><2.115541,0.035000,0.203200> rotate<0,-50.191084,0> translate<0.848084,0.000000,31.605238> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.929619,0.000000,3.489197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610378,0.000000,3.489197>}
box{<0,0,-0.203200><0.680759,0.035000,0.203200> rotate<0,0.000000,0> translate<0.929619,0.000000,3.489197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.929619,0.000000,38.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610378,0.000000,38.420800>}
box{<0,0,-0.203200><0.680759,0.035000,0.203200> rotate<0,0.000000,0> translate<0.929619,0.000000,38.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,13.626741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.047206,0.000000,13.402688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<0.954400,0.000000,13.626741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,17.869256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,13.626741>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.954400,0.000000,13.626741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.954400,0.000000,17.869256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.047206,0.000000,18.093309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<0.954400,0.000000,17.869256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.006031,0.000000,20.814809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.006034,0.000000,20.814809>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.006031,0.000000,20.814809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.006034,0.000000,20.814809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.422400,0.000000,20.398444>}
box{<0,0,-0.203200><0.588830,0.035000,0.203200> rotate<0,44.997030,0> translate<1.006034,0.000000,20.814809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.047206,0.000000,13.402688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.218688,0.000000,13.231206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<1.047206,0.000000,13.402688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.047206,0.000000,18.093309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.218688,0.000000,18.264791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.047206,0.000000,18.093309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,9.550741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.297206,0.000000,9.326688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<1.204400,0.000000,9.550741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,12.293256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,9.550741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.204400,0.000000,9.550741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.204400,0.000000,12.293256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.297206,0.000000,12.517309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<1.204400,0.000000,12.293256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.218688,0.000000,13.231206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.442741,0.000000,13.138400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<1.218688,0.000000,13.231206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.218688,0.000000,18.264791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.442741,0.000000,18.357597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<1.218688,0.000000,18.264791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.297206,0.000000,9.326688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.468688,0.000000,9.155206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<1.297206,0.000000,9.326688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.297206,0.000000,12.517309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.468688,0.000000,12.688791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.297206,0.000000,12.517309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.422400,0.000000,20.005866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.225866,0.000000,19.202400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<1.422400,0.000000,20.005866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.422400,0.000000,20.398444>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.422400,0.000000,20.005866>}
box{<0,0,-0.203200><0.392578,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.422400,0.000000,20.005866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.442741,0.000000,13.138400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.649600,0.000000,13.138400>}
box{<0,0,-0.203200><0.206859,0.035000,0.203200> rotate<0,0.000000,0> translate<1.442741,0.000000,13.138400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.442741,0.000000,18.357597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.824441,0.000000,18.357597>}
box{<0,0,-0.203200><0.381700,0.035000,0.203200> rotate<0,0.000000,0> translate<1.442741,0.000000,18.357597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.468688,0.000000,9.155206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.692741,0.000000,9.062400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<1.468688,0.000000,9.155206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.468688,0.000000,12.688791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.649600,0.000000,12.763725>}
box{<0,0,-0.203200><0.195817,0.035000,0.203200> rotate<0,-22.497965,0> translate<1.468688,0.000000,12.688791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610378,0.000000,3.489197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.239316,0.000000,3.228681>}
box{<0,0,-0.203200><0.680757,0.035000,0.203200> rotate<0,22.498607,0> translate<1.610378,0.000000,3.489197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.610378,0.000000,38.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.239316,0.000000,38.681316>}
box{<0,0,-0.203200><0.680757,0.035000,0.203200> rotate<0,-22.498607,0> translate<1.610378,0.000000,38.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.649600,0.000000,13.138400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.649600,0.000000,12.763725>}
box{<0,0,-0.203200><0.374675,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.649600,0.000000,12.763725> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.692741,0.000000,9.062400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.135256,0.000000,9.062400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<1.692741,0.000000,9.062400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.824441,0.000000,18.357597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.669247,0.000000,19.202400>}
box{<0,0,-0.203200><1.194734,0.035000,0.203200> rotate<0,-44.996924,0> translate<1.824441,0.000000,18.357597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.062316,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,38.608000>}
box{<0,0,-0.203200><2.998084,0.035000,0.203200> rotate<0,0.000000,0> translate<2.062316,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178050,0.000000,33.254812>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.202422,0.000000,33.230441>}
box{<0,0,-0.203200><0.034467,0.035000,0.203200> rotate<0,44.997030,0> translate<2.178050,0.000000,33.254812> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178050,0.000000,34.817184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178050,0.000000,33.254812>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.178050,0.000000,33.254812> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178050,0.000000,34.817184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.282813,0.000000,35.921947>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.178050,0.000000,34.817184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184953,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,3.251200>}
box{<0,0,-0.203200><11.683447,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184953,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.225866,0.000000,19.202400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.669247,0.000000,19.202400>}
box{<0,0,-0.203200><0.443381,0.035000,0.203200> rotate<0,0.000000,0> translate<2.225866,0.000000,19.202400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.239316,0.000000,3.228681>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.720681,0.000000,2.747316>}
box{<0,0,-0.203200><0.680754,0.035000,0.203200> rotate<0,44.997030,0> translate<2.239316,0.000000,3.228681> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.239316,0.000000,38.681316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.720681,0.000000,39.162681>}
box{<0,0,-0.203200><0.680754,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.239316,0.000000,38.681316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,21.968753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,25.486106>}
box{<0,0,-0.203200><3.517353,0.035000,0.203200> rotate<0,90.000000,0> translate<2.438397,0.000000,25.486106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,21.968753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.461553,0.000000,21.945597>}
box{<0,0,-0.203200><0.032748,0.035000,0.203200> rotate<0,44.997030,0> translate<2.438397,0.000000,21.968753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.104844,0.000000,22.352000>}
box{<0,0,-0.203200><5.666447,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.728200,0.000000,22.758400>}
box{<0,0,-0.203200><7.289803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.759700,0.000000,23.164800>}
box{<0,0,-0.203200><2.321303,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.353300,0.000000,23.571200>}
box{<0,0,-0.203200><1.914903,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,23.977600>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,24.384000>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,24.790400>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.353303,0.000000,25.196800>}
box{<0,0,-0.203200><1.914906,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,25.486106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.448300,0.000000,25.476200>}
box{<0,0,-0.203200><0.014007,0.035000,0.203200> rotate<0,45.006068,0> translate<2.438397,0.000000,25.486106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,28.361891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,30.656944>}
box{<0,0,-0.203200><2.295053,0.035000,0.203200> rotate<0,90.000000,0> translate<2.438397,0.000000,30.656944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,28.361891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.448300,0.000000,28.371797>}
box{<0,0,-0.203200><0.014007,0.035000,0.203200> rotate<0,-45.006068,0> translate<2.438397,0.000000,28.361891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.962531,0.000000,28.448000>}
box{<0,0,-0.203200><3.524134,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.368931,0.000000,28.854400>}
box{<0,0,-0.203200><3.930534,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.775331,0.000000,29.260800>}
box{<0,0,-0.203200><4.336934,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.181731,0.000000,29.667200>}
box{<0,0,-0.203200><4.743334,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.588131,0.000000,30.073600>}
box{<0,0,-0.203200><5.149734,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.994531,0.000000,30.480000>}
box{<0,0,-0.203200><5.556134,0.035000,0.203200> rotate<0,0.000000,0> translate<2.438397,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438397,0.000000,30.656944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.682653,0.000000,32.150050>}
box{<0,0,-0.203200><1.943589,0.035000,0.203200> rotate<0,-50.191093,0> translate<2.438397,0.000000,30.656944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.448300,0.000000,25.476200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.647697,0.000000,25.476200>}
box{<0,0,-0.203200><1.199397,0.035000,0.203200> rotate<0,0.000000,0> translate<2.448300,0.000000,25.476200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.448300,0.000000,28.371797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.647697,0.000000,28.371797>}
box{<0,0,-0.203200><1.199397,0.035000,0.203200> rotate<0,0.000000,0> translate<2.448300,0.000000,28.371797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.461550,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.698444,0.000000,21.945600>}
box{<0,0,-0.203200><5.236894,0.035000,0.203200> rotate<0,0.000000,0> translate<2.461550,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.461553,0.000000,21.945597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.362131,0.000000,21.945597>}
box{<0,0,-0.203200><0.900578,0.035000,0.203200> rotate<0,0.000000,0> translate<2.461553,0.000000,21.945597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.572400,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,39.014400>}
box{<0,0,-0.203200><2.488000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.572400,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.623197,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,2.844800>}
box{<0,0,-0.203200><11.245203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.623197,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.629609,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.400931,0.000000,30.886400>}
box{<0,0,-0.203200><5.771322,0.035000,0.203200> rotate<0,0.000000,0> translate<2.629609,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.720681,0.000000,2.747316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,2.118378>}
box{<0,0,-0.203200><0.680757,0.035000,0.203200> rotate<0,67.495453,0> translate<2.720681,0.000000,2.747316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.720681,0.000000,39.162681>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,39.791619>}
box{<0,0,-0.203200><0.680757,0.035000,0.203200> rotate<0,-67.495453,0> translate<2.720681,0.000000,39.162681> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.743425,0.000000,0.863597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,1.437619>}
box{<0,0,-0.203200><0.621318,0.035000,0.203200> rotate<0,-67.495185,0> translate<2.743425,0.000000,0.863597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.743425,0.000000,0.863597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.548572,0.000000,0.863597>}
box{<0,0,-0.203200><44.805147,0.035000,0.203200> rotate<0,0.000000,0> translate<2.743425,0.000000,0.863597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.743425,0.000000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,40.472378>}
box{<0,0,-0.203200><0.621318,0.035000,0.203200> rotate<0,67.495185,0> translate<2.743425,0.000000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.743425,0.000000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.548572,0.000000,41.046400>}
box{<0,0,-0.203200><44.805147,0.035000,0.203200> rotate<0,0.000000,0> translate<2.743425,0.000000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.827597,0.000000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,39.420800>}
box{<0,0,-0.203200><2.232803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.827597,0.000000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.848641,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.909866,0.000000,2.438400>}
box{<0,0,-0.203200><11.061225,0.035000,0.203200> rotate<0,0.000000,0> translate<2.848641,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890722,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.401272,0.000000,1.219200>}
box{<0,0,-0.203200><44.510550,0.035000,0.203200> rotate<0,0.000000,0> translate<2.890722,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.911766,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.307634,0.000000,40.640000>}
box{<0,0,-0.203200><2.395869,0.035000,0.203200> rotate<0,0.000000,0> translate<2.911766,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.968275,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.807331,0.000000,31.292800>}
box{<0,0,-0.203200><5.839056,0.035000,0.203200> rotate<0,0.000000,0> translate<2.968275,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,1.437619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,2.118378>}
box{<0,0,-0.203200><0.680759,0.035000,0.203200> rotate<0,90.000000,0> translate<2.981197,0.000000,2.118378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,1.625600>}
box{<0,0,-0.203200><44.329603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.981197,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.316266,0.000000,2.032000>}
box{<0,0,-0.203200><11.335069,0.035000,0.203200> rotate<0,0.000000,0> translate<2.981197,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,39.791619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,40.472378>}
box{<0,0,-0.203200><0.680759,0.035000,0.203200> rotate<0,90.000000,0> translate<2.981197,0.000000,40.472378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,39.827200>}
box{<0,0,-0.203200><2.079203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.981197,0.000000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.981197,0.000000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.075591,0.000000,40.233600>}
box{<0,0,-0.203200><2.094394,0.035000,0.203200> rotate<0,0.000000,0> translate<2.981197,0.000000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.135256,0.000000,9.062400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.359309,0.000000,9.155206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<3.135256,0.000000,9.062400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.282813,0.000000,35.921947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.845184,0.000000,35.921947>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,0.000000,0> translate<3.282813,0.000000,35.921947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.306944,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.213731,0.000000,31.699200>}
box{<0,0,-0.203200><5.906788,0.035000,0.203200> rotate<0,0.000000,0> translate<3.306944,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.359309,0.000000,9.155206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.530791,0.000000,9.326688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.359309,0.000000,9.155206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.362131,0.000000,21.945597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,0.000000,21.243728>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,44.997030,0> translate<3.362131,0.000000,21.945597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.478397,0.000000,12.569703>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.478397,0.000000,13.138400>}
box{<0,0,-0.203200><0.568697,0.035000,0.203200> rotate<0,90.000000,0> translate<3.478397,0.000000,13.138400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.478397,0.000000,12.569703>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.530791,0.000000,12.517309>}
box{<0,0,-0.203200><0.074096,0.035000,0.203200> rotate<0,44.997030,0> translate<3.478397,0.000000,12.569703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.478397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.613400,0.000000,12.598400>}
box{<0,0,-0.203200><4.135003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.478397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.478397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,13.004800>}
box{<0,0,-0.203200><4.090803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.478397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.478397,0.000000,13.138400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.685256,0.000000,13.138400>}
box{<0,0,-0.203200><0.206859,0.035000,0.203200> rotate<0,0.000000,0> translate<3.478397,0.000000,13.138400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.530791,0.000000,9.326688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,9.550741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<3.530791,0.000000,9.326688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.530791,0.000000,12.517309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,12.293256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<3.530791,0.000000,12.517309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.539284,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.182044,0.000000,9.347200>}
box{<0,0,-0.203200><12.642759,0.035000,0.203200> rotate<0,0.000000,0> translate<3.539284,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,9.550741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,12.293256>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,90.000000,0> translate<3.623597,0.000000,12.293256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.114400,0.000000,9.753600>}
box{<0,0,-0.203200><5.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.623597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.034400,0.000000,10.160000>}
box{<0,0,-0.203200><5.410803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.623597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.034400,0.000000,10.566400>}
box{<0,0,-0.203200><5.410803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.623597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.034400,0.000000,10.972800>}
box{<0,0,-0.203200><5.410803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.623597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.034400,0.000000,11.379200>}
box{<0,0,-0.203200><5.410803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.623597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.300644,0.000000,11.785600>}
box{<0,0,-0.203200><5.677047,0.035000,0.203200> rotate<0,0.000000,0> translate<3.623597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.623597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.648500,0.000000,12.192000>}
box{<0,0,-0.203200><4.024903,0.035000,0.203200> rotate<0,0.000000,0> translate<3.623597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.645609,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.620131,0.000000,32.105600>}
box{<0,0,-0.203200><5.974522,0.035000,0.203200> rotate<0,0.000000,0> translate<3.645609,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.647697,0.000000,25.476200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,26.146503>}
box{<0,0,-0.203200><0.947952,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.647697,0.000000,25.476200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.647697,0.000000,28.371797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,27.701494>}
box{<0,0,-0.203200><0.947952,0.035000,0.203200> rotate<0,44.997030,0> translate<3.647697,0.000000,28.371797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.682653,0.000000,32.150050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.845184,0.000000,32.150050>}
box{<0,0,-0.203200><1.162531,0.035000,0.203200> rotate<0,0.000000,0> translate<3.682653,0.000000,32.150050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.685256,0.000000,13.138400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.909309,0.000000,13.231206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<3.685256,0.000000,13.138400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.768528,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.359472,0.000000,21.539200>}
box{<0,0,-0.203200><0.590944,0.035000,0.203200> rotate<0,0.000000,0> translate<3.768528,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.774697,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.759703,0.000000,25.603200>}
box{<0,0,-0.203200><0.985006,0.035000,0.203200> rotate<0,0.000000,0> translate<3.774697,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.909309,0.000000,13.231206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,0.000000,13.385897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.909309,0.000000,13.231206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.977894,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.658106,0.000000,28.041600>}
box{<0,0,-0.203200><0.680213,0.035000,0.203200> rotate<0,0.000000,0> translate<3.977894,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,0.000000,13.385897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.218688,0.000000,13.231206>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<4.064000,0.000000,13.385897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.064000,0.000000,21.243728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765866,0.000000,21.945597>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,-44.997158,0> translate<4.064000,0.000000,21.243728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,23.784300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.988300,0.000000,22.936200>}
box{<0,0,-0.203200><1.199395,0.035000,0.203200> rotate<0,44.997030,0> translate<4.140200,0.000000,23.784300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,24.983697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,23.784300>}
box{<0,0,-0.203200><1.199397,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.140200,0.000000,23.784300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,24.983697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.810503,0.000000,25.654000>}
box{<0,0,-0.203200><0.947952,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.140200,0.000000,24.983697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181097,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.454903,0.000000,26.009600>}
box{<0,0,-0.203200><0.273806,0.035000,0.203200> rotate<0,0.000000,0> translate<4.181097,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.218688,0.000000,13.231206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.442741,0.000000,13.138400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<4.218688,0.000000,13.231206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,26.146503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.810503,0.000000,25.654000>}
box{<0,0,-0.203200><0.696505,0.035000,0.203200> rotate<0,44.997030,0> translate<4.318000,0.000000,26.146503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.318000,0.000000,27.701494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.988300,0.000000,28.371797>}
box{<0,0,-0.203200><0.947950,0.035000,0.203200> rotate<0,-44.997164,0> translate<4.318000,0.000000,27.701494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.442741,0.000000,13.138400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.685256,0.000000,13.138400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<4.442741,0.000000,13.138400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.765866,0.000000,21.945597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.902131,0.000000,21.945597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<4.765866,0.000000,21.945597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.845184,0.000000,32.150050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.949947,0.000000,33.254812>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.845184,0.000000,32.150050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.845184,0.000000,35.921947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.949947,0.000000,34.817184>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,44.997030,0> translate<4.845184,0.000000,35.921947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.988300,0.000000,22.936200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.187697,0.000000,22.936200>}
box{<0,0,-0.203200><1.199397,0.035000,0.203200> rotate<0,0.000000,0> translate<4.988300,0.000000,22.936200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.988300,0.000000,28.371797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.886328,0.000000,28.371797>}
box{<0,0,-0.203200><0.898028,0.035000,0.203200> rotate<0,0.000000,0> translate<4.988300,0.000000,28.371797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.003931,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.744066,0.000000,35.763200>}
box{<0,0,-0.203200><5.740134,0.035000,0.203200> rotate<0,0.000000,0> translate<5.003931,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,38.035066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.198878,0.000000,37.700753>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<5.060400,0.000000,38.035066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,40.196931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,38.035066>}
box{<0,0,-0.203200><2.161866,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.060400,0.000000,38.035066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.060400,0.000000,40.196931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.198878,0.000000,40.531244>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<5.060400,0.000000,40.196931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.198878,0.000000,37.700753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.454753,0.000000,37.444878>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<5.198878,0.000000,37.700753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.198878,0.000000,40.531244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.454753,0.000000,40.787119>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.198878,0.000000,40.531244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207134,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.026531,0.000000,32.512000>}
box{<0,0,-0.203200><4.819397,0.035000,0.203200> rotate<0,0.000000,0> translate<5.207134,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.410331,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.337666,0.000000,35.356800>}
box{<0,0,-0.203200><4.927334,0.035000,0.203200> rotate<0,0.000000,0> translate<5.410331,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.454753,0.000000,37.444878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.789066,0.000000,37.306400>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,22.498713,0> translate<5.454753,0.000000,37.444878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.454753,0.000000,40.787119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.789066,0.000000,40.925597>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-22.498713,0> translate<5.454753,0.000000,40.787119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.613534,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.134462,0.000000,32.918400>}
box{<0,0,-0.203200><4.520928,0.035000,0.203200> rotate<0,0.000000,0> translate<5.613534,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.789066,0.000000,37.306400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.450931,0.000000,37.306400>}
box{<0,0,-0.203200><3.661866,0.035000,0.203200> rotate<0,0.000000,0> translate<5.789066,0.000000,37.306400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.789066,0.000000,40.925597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.450931,0.000000,40.925597>}
box{<0,0,-0.203200><3.661866,0.035000,0.203200> rotate<0,0.000000,0> translate<5.789066,0.000000,40.925597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.816731,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.931266,0.000000,34.950400>}
box{<0,0,-0.203200><4.114534,0.035000,0.203200> rotate<0,0.000000,0> translate<5.816731,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.886328,0.000000,28.371797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.207584,0.000000,32.693056>}
box{<0,0,-0.203200><6.111181,0.035000,0.203200> rotate<0,-44.997051,0> translate<5.886328,0.000000,28.371797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.902131,0.000000,21.945597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.359331,0.000000,21.488397>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<5.902131,0.000000,21.945597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.949947,0.000000,33.254812>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.949947,0.000000,34.817184>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,90.000000,0> translate<5.949947,0.000000,34.817184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.949947,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,33.324800>}
box{<0,0,-0.203200><3.848103,0.035000,0.203200> rotate<0,0.000000,0> translate<5.949947,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.949947,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,33.731200>}
box{<0,0,-0.203200><3.848103,0.035000,0.203200> rotate<0,0.000000,0> translate<5.949947,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.949947,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,34.137600>}
box{<0,0,-0.203200><3.848103,0.035000,0.203200> rotate<0,0.000000,0> translate<5.949947,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.949947,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,34.544000>}
box{<0,0,-0.203200><3.848103,0.035000,0.203200> rotate<0,0.000000,0> translate<5.949947,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.187697,0.000000,22.936200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,0.000000,23.606503>}
box{<0,0,-0.203200><0.947952,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.187697,0.000000,22.936200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.308528,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.292044,0.000000,21.539200>}
box{<0,0,-0.203200><0.983516,0.035000,0.203200> rotate<0,0.000000,0> translate<6.308528,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.359331,0.000000,21.488397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.241241,0.000000,21.488397>}
box{<0,0,-0.203200><0.881909,0.035000,0.203200> rotate<0,0.000000,0> translate<6.359331,0.000000,21.488397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.416297,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.299700,0.000000,23.164800>}
box{<0,0,-0.203200><0.883403,0.035000,0.203200> rotate<0,0.000000,0> translate<6.416297,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.685256,0.000000,13.138400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.909309,0.000000,13.231206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<6.685256,0.000000,13.138400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.822697,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.893300,0.000000,23.571200>}
box{<0,0,-0.203200><0.070603,0.035000,0.203200> rotate<0,0.000000,0> translate<6.822697,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,0.000000,23.606503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.528300,0.000000,22.936200>}
box{<0,0,-0.203200><0.947950,0.035000,0.203200> rotate<0,44.997164,0> translate<6.858000,0.000000,23.606503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.909309,0.000000,13.231206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.080791,0.000000,13.402688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.909309,0.000000,13.231206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.080791,0.000000,13.402688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,13.626741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<7.080791,0.000000,13.402688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.084316,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,13.411200>}
box{<0,0,-0.203200><0.484884,0.035000,0.203200> rotate<0,0.000000,0> translate<7.084316,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,13.626741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,16.172206>}
box{<0,0,-0.203200><2.545466,0.035000,0.203200> rotate<0,90.000000,0> translate<7.173597,0.000000,16.172206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.543800,0.000000,13.817600>}
box{<0,0,-0.203200><0.370203,0.035000,0.203200> rotate<0,0.000000,0> translate<7.173597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.704613,0.000000,14.224000>}
box{<0,0,-0.203200><0.531016,0.035000,0.203200> rotate<0,0.000000,0> translate<7.173597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.003244,0.000000,14.630400>}
box{<0,0,-0.203200><0.829647,0.035000,0.203200> rotate<0,0.000000,0> translate<7.173597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,15.036800>}
box{<0,0,-0.203200><2.402203,0.035000,0.203200> rotate<0,0.000000,0> translate<7.173597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,15.443200>}
box{<0,0,-0.203200><2.402203,0.035000,0.203200> rotate<0,0.000000,0> translate<7.173597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,15.849600>}
box{<0,0,-0.203200><2.402203,0.035000,0.203200> rotate<0,0.000000,0> translate<7.173597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.173597,0.000000,16.172206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.435191,0.000000,16.433800>}
box{<0,0,-0.203200><0.369949,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.173597,0.000000,16.172206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.241241,0.000000,21.488397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.114809,0.000000,22.361966>}
box{<0,0,-0.203200><1.235413,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.241241,0.000000,21.488397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.257391,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,16.256000>}
box{<0,0,-0.203200><2.318409,0.035000,0.203200> rotate<0,0.000000,0> translate<7.257391,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.435191,0.000000,16.433800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.802728,0.000000,16.433800>}
box{<0,0,-0.203200><1.367537,0.035000,0.203200> rotate<0,0.000000,0> translate<7.435191,0.000000,16.433800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.528300,0.000000,22.936200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.727697,0.000000,22.936200>}
box{<0,0,-0.203200><1.199397,0.035000,0.203200> rotate<0,0.000000,0> translate<7.528300,0.000000,22.936200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.543800,0.000000,13.549269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,13.487950>}
box{<0,0,-0.203200><0.066371,0.035000,0.203200> rotate<0,67.494794,0> translate<7.543800,0.000000,13.549269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.543800,0.000000,13.882728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.543800,0.000000,13.549269>}
box{<0,0,-0.203200><0.333459,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.543800,0.000000,13.549269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.543800,0.000000,13.882728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.671409,0.000000,14.190800>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-67.495255,0> translate<7.543800,0.000000,13.882728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,12.727322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.613400,0.000000,12.620613>}
box{<0,0,-0.203200><0.115501,0.035000,0.203200> rotate<0,67.495761,0> translate<7.569200,0.000000,12.727322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,13.487950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,12.727322>}
box{<0,0,-0.203200><0.760628,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.569200,0.000000,12.727322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.613400,0.000000,12.276741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.706206,0.000000,12.052688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<7.613400,0.000000,12.276741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.613400,0.000000,12.620613>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.613400,0.000000,12.276741>}
box{<0,0,-0.203200><0.343872,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.613400,0.000000,12.276741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.671409,0.000000,14.190800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.910609,0.000000,14.429997>}
box{<0,0,-0.203200><0.338278,0.035000,0.203200> rotate<0,-44.996656,0> translate<7.671409,0.000000,14.190800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.706206,0.000000,12.052688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.877688,0.000000,11.881206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<7.706206,0.000000,12.052688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.877688,0.000000,11.881206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.101741,0.000000,11.788400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<7.877688,0.000000,11.881206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.910609,0.000000,14.429997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.986809,0.000000,14.613966>}
box{<0,0,-0.203200><0.199125,0.035000,0.203200> rotate<0,-67.496170,0> translate<7.910609,0.000000,14.429997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.986809,0.000000,14.613966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.244031,0.000000,14.871188>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.986809,0.000000,14.613966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.101741,0.000000,11.788400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.744256,0.000000,11.788400>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<8.101741,0.000000,11.788400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.114809,0.000000,22.361966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.372031,0.000000,22.619188>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.114809,0.000000,22.361966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.244031,0.000000,14.871188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.580113,0.000000,15.010397>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<8.244031,0.000000,14.871188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.372031,0.000000,22.619188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.708113,0.000000,22.758397>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<8.372031,0.000000,22.619188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.580113,0.000000,15.010397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,15.010397>}
box{<0,0,-0.203200><0.995688,0.035000,0.203200> rotate<0,0.000000,0> translate<8.580113,0.000000,15.010397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.708113,0.000000,22.758397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.728200,0.000000,22.758397>}
box{<0,0,-0.203200><1.020088,0.035000,0.203200> rotate<0,0.000000,0> translate<8.708113,0.000000,22.758397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.727697,0.000000,22.936200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.261097,0.000000,23.469600>}
box{<0,0,-0.203200><0.754342,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.727697,0.000000,22.936200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.744256,0.000000,11.788400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.747997,0.000000,11.789950>}
box{<0,0,-0.203200><0.004049,0.035000,0.203200> rotate<0,-22.506128,0> translate<8.744256,0.000000,11.788400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.747997,0.000000,11.789950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.751741,0.000000,11.788400>}
box{<0,0,-0.203200><0.004052,0.035000,0.203200> rotate<0,22.489214,0> translate<8.747997,0.000000,11.789950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.751741,0.000000,11.788400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.307406,0.000000,11.788400>}
box{<0,0,-0.203200><0.555666,0.035000,0.203200> rotate<0,0.000000,0> translate<8.751741,0.000000,11.788400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.802728,0.000000,16.433800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.110800,0.000000,16.561409>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-22.498805,0> translate<8.802728,0.000000,16.433800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.956297,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.001928,0.000000,23.164800>}
box{<0,0,-0.203200><1.045631,0.035000,0.203200> rotate<0,0.000000,0> translate<8.956297,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.034400,0.000000,9.946741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.127206,0.000000,9.722688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<9.034400,0.000000,9.946741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.034400,0.000000,11.389256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.034400,0.000000,9.946741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.034400,0.000000,9.946741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.034400,0.000000,11.389256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.127206,0.000000,11.613309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<9.034400,0.000000,11.389256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.110800,0.000000,16.561409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.346588,0.000000,16.797197>}
box{<0,0,-0.203200><0.333454,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.110800,0.000000,16.561409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.127206,0.000000,9.722688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.298687,0.000000,9.551206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<9.127206,0.000000,9.722688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.127206,0.000000,11.613309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.298687,0.000000,11.784791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.127206,0.000000,11.613309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.211791,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,16.662400>}
box{<0,0,-0.203200><0.364009,0.035000,0.203200> rotate<0,0.000000,0> translate<9.211791,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.261097,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.453019,0.000000,23.469600>}
box{<0,0,-0.203200><2.191922,0.035000,0.203200> rotate<0,0.000000,0> translate<9.261097,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.298687,0.000000,9.551206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.522741,0.000000,9.458400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<9.298687,0.000000,9.551206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.298687,0.000000,11.784791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.307406,0.000000,11.788400>}
box{<0,0,-0.203200><0.009436,0.035000,0.203200> rotate<0,-22.487019,0> translate<9.298687,0.000000,11.784791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.346588,0.000000,16.797197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,17.026412>}
box{<0,0,-0.203200><0.324158,0.035000,0.203200> rotate<0,-44.997421,0> translate<9.346588,0.000000,16.797197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.450931,0.000000,37.306400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.785244,0.000000,37.444878>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-22.498713,0> translate<9.450931,0.000000,37.306400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.450931,0.000000,40.925597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.785244,0.000000,40.787119>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,22.498713,0> translate<9.450931,0.000000,40.925597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.522741,0.000000,9.458400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.565256,0.000000,9.458400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<9.522741,0.000000,9.458400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,17.026412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.575800,0.000000,15.010397>}
box{<0,0,-0.203200><2.016016,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.575800,0.000000,15.010397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.649859,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.426131,0.000000,37.388800>}
box{<0,0,-0.203200><2.776272,0.035000,0.203200> rotate<0,0.000000,0> translate<9.649859,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.728200,0.000000,22.765356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.728200,0.000000,22.758397>}
box{<0,0,-0.203200><0.006959,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.728200,0.000000,22.758397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.728200,0.000000,22.765356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.821006,0.000000,22.989409>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<9.728200,0.000000,22.765356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.785244,0.000000,37.444878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.041119,0.000000,37.700753>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.785244,0.000000,37.444878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.785244,0.000000,40.787119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.041119,0.000000,40.531244>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<9.785244,0.000000,40.787119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,6.330813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.902813,0.000000,5.226050>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,44.997030,0> translate<9.798050,0.000000,6.330813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,7.893184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,6.330813>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.798050,0.000000,6.330813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,7.893184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.902813,0.000000,8.997947>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.798050,0.000000,7.893184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,33.254812>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.315225,0.000000,32.737641>}
box{<0,0,-0.203200><0.731394,0.035000,0.203200> rotate<0,44.996857,0> translate<9.798050,0.000000,33.254812> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,34.817184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,33.254812>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.798050,0.000000,33.254812> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.798050,0.000000,34.817184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.902813,0.000000,35.921947>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.798050,0.000000,34.817184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.821006,0.000000,22.989409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.992488,0.000000,23.160891>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.821006,0.000000,22.989409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.932362,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.069897,0.000000,40.640000>}
box{<0,0,-0.203200><23.137534,0.035000,0.203200> rotate<0,0.000000,0> translate<9.932362,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.992488,0.000000,23.160891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.216541,0.000000,23.253697>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<9.992488,0.000000,23.160891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.041119,0.000000,37.700753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,38.035066>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<10.041119,0.000000,37.700753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.041119,0.000000,40.531244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,40.196931>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<10.041119,0.000000,40.531244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.080238,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.943266,0.000000,37.795200>}
box{<0,0,-0.203200><1.863028,0.035000,0.203200> rotate<0,0.000000,0> translate<10.080238,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.164409,0.000000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,40.233600>}
box{<0,0,-0.203200><22.729991,0.035000,0.203200> rotate<0,0.000000,0> translate<10.164409,0.000000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,38.035066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,38.049200>}
box{<0,0,-0.203200><0.014134,0.035000,0.203200> rotate<0,90.000000,0> translate<10.179597,0.000000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.641478,0.000000,38.049200>}
box{<0,0,-0.203200><1.461881,0.035000,0.203200> rotate<0,0.000000,0> translate<10.179597,0.000000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,39.674797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,40.196931>}
box{<0,0,-0.203200><0.522134,0.035000,0.203200> rotate<0,90.000000,0> translate<10.179597,0.000000,40.196931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,39.674797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.903113,0.000000,39.674797>}
box{<0,0,-0.203200><1.723516,0.035000,0.203200> rotate<0,0.000000,0> translate<10.179597,0.000000,39.674797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.179597,0.000000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,39.827200>}
box{<0,0,-0.203200><22.714803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.179597,0.000000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.207584,0.000000,32.693056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.315225,0.000000,32.737641>}
box{<0,0,-0.203200><0.116509,0.035000,0.203200> rotate<0,-22.497683,0> translate<10.207584,0.000000,32.693056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.216541,0.000000,23.253697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.531600,0.000000,23.253697>}
box{<0,0,-0.203200><1.315059,0.035000,0.203200> rotate<0,0.000000,0> translate<10.216541,0.000000,23.253697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.565256,0.000000,9.458400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.789309,0.000000,9.551206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<10.565256,0.000000,9.458400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.789309,0.000000,9.551206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.960791,0.000000,9.722688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.789309,0.000000,9.551206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.902813,0.000000,5.226050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465184,0.000000,5.226050>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,0.000000,0> translate<10.902813,0.000000,5.226050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.902813,0.000000,8.997947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465184,0.000000,8.997947>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,0.000000,0> translate<10.902813,0.000000,8.997947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.902813,0.000000,35.921947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465184,0.000000,35.921947>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,0.000000,0> translate<10.902813,0.000000,35.921947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.960791,0.000000,9.722688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.053597,0.000000,9.946741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<10.960791,0.000000,9.722688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.973594,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.588444,0.000000,9.753600>}
box{<0,0,-0.203200><5.614850,0.035000,0.203200> rotate<0,0.000000,0> translate<10.973594,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.053597,0.000000,9.946741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.053597,0.000000,10.528128>}
box{<0,0,-0.203200><0.581387,0.035000,0.203200> rotate<0,90.000000,0> translate<11.053597,0.000000,10.528128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.053597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,10.160000>}
box{<0,0,-0.203200><5.558003,0.035000,0.203200> rotate<0,0.000000,0> translate<11.053597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.053597,0.000000,10.528128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.062056,0.000000,10.536584>}
box{<0,0,-0.203200><0.011961,0.035000,0.203200> rotate<0,-44.986446,0> translate<11.053597,0.000000,10.528128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.062056,0.000000,10.536584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,10.835322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<11.062056,0.000000,10.536584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.074403,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,10.566400>}
box{<0,0,-0.203200><5.537197,0.035000,0.203200> rotate<0,0.000000,0> translate<11.074403,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.182597,0.000000,13.017397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.182597,0.000000,13.181600>}
box{<0,0,-0.203200><0.164203,0.035000,0.203200> rotate<0,90.000000,0> translate<11.182597,0.000000,13.181600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.182597,0.000000,13.017397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,13.009675>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<11.182597,0.000000,13.017397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.182597,0.000000,13.181600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.428403,0.000000,13.181600>}
box{<0,0,-0.203200><0.245806,0.035000,0.203200> rotate<0,0.000000,0> translate<11.182597,0.000000,13.181600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,10.835322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,13.009675>}
box{<0,0,-0.203200><2.174353,0.035000,0.203200> rotate<0,90.000000,0> translate<11.185797,0.000000,13.009675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,10.972800>}
box{<0,0,-0.203200><5.425803,0.035000,0.203200> rotate<0,0.000000,0> translate<11.185797,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.298244,0.000000,11.379200>}
box{<0,0,-0.203200><5.112447,0.035000,0.203200> rotate<0,0.000000,0> translate<11.185797,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.192294,0.000000,11.785600>}
box{<0,0,-0.203200><4.006497,0.035000,0.203200> rotate<0,0.000000,0> translate<11.185797,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.046400,0.000000,12.192000>}
box{<0,0,-0.203200><3.860603,0.035000,0.203200> rotate<0,0.000000,0> translate<11.185797,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.948441,0.000000,12.598400>}
box{<0,0,-0.203200><3.762644,0.035000,0.203200> rotate<0,0.000000,0> translate<11.185797,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.185797,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.587094,0.000000,13.004800>}
box{<0,0,-0.203200><0.401297,0.035000,0.203200> rotate<0,0.000000,0> translate<11.185797,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,15.010397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,18.897600>}
box{<0,0,-0.203200><3.887203,0.035000,0.203200> rotate<0,90.000000,0> translate<11.252197,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,15.010397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.428403,0.000000,15.010397>}
box{<0,0,-0.203200><0.176206,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,15.010397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.439341,0.000000,15.036800>}
box{<0,0,-0.203200><0.187144,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,15.443200>}
box{<0,0,-0.203200><4.699003,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,15.849600>}
box{<0,0,-0.203200><4.699003,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,16.256000>}
box{<0,0,-0.203200><4.699003,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,16.662400>}
box{<0,0,-0.203200><4.699003,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,17.068800>}
box{<0,0,-0.203200><4.699003,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.968403,0.000000,17.475200>}
box{<0,0,-0.203200><4.716206,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.224128,0.000000,17.881600>}
box{<0,0,-0.203200><4.971931,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.654400,0.000000,18.288000>}
box{<0,0,-0.203200><5.402203,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.654400,0.000000,18.694400>}
box{<0,0,-0.203200><5.402203,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.252197,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.119884,0.000000,18.897600>}
box{<0,0,-0.203200><0.867687,0.035000,0.203200> rotate<0,0.000000,0> translate<11.252197,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.428403,0.000000,13.181600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.441206,0.000000,13.150688>}
box{<0,0,-0.203200><0.033459,0.035000,0.203200> rotate<0,67.497525,0> translate<11.428403,0.000000,13.181600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.428403,0.000000,15.010397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.441206,0.000000,15.041309>}
box{<0,0,-0.203200><0.033459,0.035000,0.203200> rotate<0,-67.497525,0> translate<11.428403,0.000000,15.010397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.441206,0.000000,13.150688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.612687,0.000000,12.979206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<11.441206,0.000000,13.150688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.441206,0.000000,15.041309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.612687,0.000000,15.212791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.441206,0.000000,15.041309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.453019,0.000000,23.469600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.517834,0.000000,23.453038>}
box{<0,0,-0.203200><0.066898,0.035000,0.203200> rotate<0,14.333250,0> translate<11.453019,0.000000,23.469600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.517834,0.000000,23.453038>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.531600,0.000000,23.455013>}
box{<0,0,-0.203200><0.013907,0.035000,0.203200> rotate<0,-8.164159,0> translate<11.517834,0.000000,23.453038> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.531600,0.000000,23.455013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.531600,0.000000,23.253697>}
box{<0,0,-0.203200><0.201316,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.531600,0.000000,23.253697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.612687,0.000000,12.979206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836741,0.000000,12.886400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<11.612687,0.000000,12.979206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.612687,0.000000,15.212791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836741,0.000000,15.305597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<11.612687,0.000000,15.212791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.641478,0.000000,38.049200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.991931,0.000000,36.912597>}
box{<0,0,-0.203200><1.765103,0.035000,0.203200> rotate<0,40.082854,0> translate<11.641478,0.000000,38.049200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836741,0.000000,12.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.579256,0.000000,12.886400>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836741,0.000000,12.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836741,0.000000,15.305597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.579256,0.000000,15.305597>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836741,0.000000,15.305597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.903113,0.000000,39.674797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.029450,0.000000,39.685659>}
box{<0,0,-0.203200><0.126804,0.035000,0.203200> rotate<0,-4.913882,0> translate<11.903113,0.000000,39.674797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.029450,0.000000,39.685659>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.063722,0.000000,39.674797>}
box{<0,0,-0.203200><0.035952,0.035000,0.203200> rotate<0,17.584896,0> translate<12.029450,0.000000,39.685659> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.063722,0.000000,39.674797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.099675,0.000000,39.674797>}
box{<0,0,-0.203200><0.035953,0.035000,0.203200> rotate<0,0.000000,0> translate<12.063722,0.000000,39.674797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.099675,0.000000,39.674797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.216816,0.000000,39.626275>}
box{<0,0,-0.203200><0.126792,0.035000,0.203200> rotate<0,22.498782,0> translate<12.099675,0.000000,39.674797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.119884,0.000000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.455966,0.000000,19.036809>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<12.119884,0.000000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.216816,0.000000,39.626275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.337691,0.000000,39.587966>}
box{<0,0,-0.203200><0.126801,0.035000,0.203200> rotate<0,17.584009,0> translate<12.216816,0.000000,39.626275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.337691,0.000000,39.587966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.365197,0.000000,39.564813>}
box{<0,0,-0.203200><0.035954,0.035000,0.203200> rotate<0,40.086032,0> translate<12.337691,0.000000,39.587966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.365197,0.000000,39.564813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.398413,0.000000,39.551056>}
box{<0,0,-0.203200><0.035952,0.035000,0.203200> rotate<0,22.495405,0> translate<12.365197,0.000000,39.564813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.398413,0.000000,39.551056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.488066,0.000000,39.461400>}
box{<0,0,-0.203200><0.126791,0.035000,0.203200> rotate<0,44.998029,0> translate<12.398413,0.000000,39.551056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.455966,0.000000,19.036809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.221188,0.000000,19.802031>}
box{<0,0,-0.203200><1.082187,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.455966,0.000000,19.036809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465184,0.000000,5.226050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,6.330813>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.465184,0.000000,5.226050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465184,0.000000,8.997947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,7.893184>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,44.997030,0> translate<12.465184,0.000000,8.997947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465184,0.000000,35.921947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,34.817184>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,44.997030,0> translate<12.465184,0.000000,35.921947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.488066,0.000000,39.461400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.412909,0.000000,38.683009>}
box{<0,0,-0.203200><1.208813,0.035000,0.203200> rotate<0,40.082847,0> translate<12.488066,0.000000,39.461400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.519956,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.654400,0.000000,19.100800>}
box{<0,0,-0.203200><4.134444,0.035000,0.203200> rotate<0,0.000000,0> translate<12.519956,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.522331,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.775644,0.000000,8.940800>}
box{<0,0,-0.203200><3.253312,0.035000,0.203200> rotate<0,0.000000,0> translate<12.522331,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.522334,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325600,0.000000,5.283200>}
box{<0,0,-0.203200><1.803266,0.035000,0.203200> rotate<0,0.000000,0> translate<12.522334,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.536306,0.000000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,39.420800>}
box{<0,0,-0.203200><20.358094,0.035000,0.203200> rotate<0,0.000000,0> translate<12.536306,0.000000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.623931,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,35.763200>}
box{<0,0,-0.203200><20.270469,0.035000,0.203200> rotate<0,0.000000,0> translate<12.623931,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.926356,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.767100,0.000000,19.507200>}
box{<0,0,-0.203200><3.840744,0.035000,0.203200> rotate<0,0.000000,0> translate<12.926356,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.928731,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.369244,0.000000,8.534400>}
box{<0,0,-0.203200><2.440513,0.035000,0.203200> rotate<0,0.000000,0> translate<12.928731,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.928734,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.960666,0.000000,5.689600>}
box{<0,0,-0.203200><1.031931,0.035000,0.203200> rotate<0,0.000000,0> translate<12.928734,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.991931,0.000000,36.912597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.081584,0.000000,36.822941>}
box{<0,0,-0.203200><0.126791,0.035000,0.203200> rotate<0,44.998029,0> translate<12.991931,0.000000,36.912597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.019169,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,39.014400>}
box{<0,0,-0.203200><19.875231,0.035000,0.203200> rotate<0,0.000000,0> translate<13.019169,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.030331,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,35.356800>}
box{<0,0,-0.203200><19.864069,0.035000,0.203200> rotate<0,0.000000,0> translate<13.030331,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.081584,0.000000,36.822941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.114800,0.000000,36.809184>}
box{<0,0,-0.203200><0.035952,0.035000,0.203200> rotate<0,22.495405,0> translate<13.081584,0.000000,36.822941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.114800,0.000000,36.809184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.142306,0.000000,36.786031>}
box{<0,0,-0.203200><0.035954,0.035000,0.203200> rotate<0,40.086032,0> translate<13.114800,0.000000,36.809184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.142306,0.000000,36.786031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.194400,0.000000,36.769522>}
box{<0,0,-0.203200><0.054647,0.035000,0.203200> rotate<0,17.583113,0> translate<13.142306,0.000000,36.786031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.194400,0.000000,36.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.287206,0.000000,36.466687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<13.194400,0.000000,36.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.194400,0.000000,36.769522>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.194400,0.000000,36.690741>}
box{<0,0,-0.203200><0.078781,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.194400,0.000000,36.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.221188,0.000000,19.802031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.360397,0.000000,20.138113>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-67.495551,0> translate<13.221188,0.000000,19.802031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.267400,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.385241,0.000000,19.913600>}
box{<0,0,-0.203200><3.117841,0.035000,0.203200> rotate<0,0.000000,0> translate<13.267400,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.287206,0.000000,36.466687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458687,0.000000,36.295206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<13.287206,0.000000,36.466687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335131,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.962844,0.000000,8.128000>}
box{<0,0,-0.203200><1.627713,0.035000,0.203200> rotate<0,0.000000,0> translate<13.335131,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.335134,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,6.096000>}
box{<0,0,-0.203200><0.533266,0.035000,0.203200> rotate<0,0.000000,0> translate<13.335134,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.360397,0.000000,20.138113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.360397,0.000000,20.520847>}
box{<0,0,-0.203200><0.382734,0.035000,0.203200> rotate<0,90.000000,0> translate<13.360397,0.000000,20.520847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.360397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.978841,0.000000,20.320000>}
box{<0,0,-0.203200><2.618444,0.035000,0.203200> rotate<0,0.000000,0> translate<13.360397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.360397,0.000000,20.520847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.375509,0.000000,20.527106>}
box{<0,0,-0.203200><0.016357,0.035000,0.203200> rotate<0,-22.497132,0> translate<13.360397,0.000000,20.520847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.375509,0.000000,20.527106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.546991,0.000000,20.698588>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.375509,0.000000,20.527106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.412909,0.000000,38.683009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458687,0.000000,38.728791>}
box{<0,0,-0.203200><0.064742,0.035000,0.203200> rotate<0,-44.998986,0> translate<13.412909,0.000000,38.683009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436731,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,34.950400>}
box{<0,0,-0.203200><19.457669,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436731,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458687,0.000000,36.295206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.682741,0.000000,36.202400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<13.458687,0.000000,36.295206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458687,0.000000,38.728791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.682741,0.000000,38.821597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<13.458687,0.000000,38.728791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.546991,0.000000,20.698588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.639797,0.000000,20.922641>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<13.546991,0.000000,20.698588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.558509,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.572441,0.000000,20.726400>}
box{<0,0,-0.203200><2.013931,0.035000,0.203200> rotate<0,0.000000,0> translate<13.558509,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,6.330813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,7.893184>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,90.000000,0> translate<13.569947,0.000000,7.893184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,6.502400>}
box{<0,0,-0.203200><0.298453,0.035000,0.203200> rotate<0,0.000000,0> translate<13.569947,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,6.908800>}
box{<0,0,-0.203200><0.298453,0.035000,0.203200> rotate<0,0.000000,0> translate<13.569947,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.265472,0.000000,7.315200>}
box{<0,0,-0.203200><0.695525,0.035000,0.203200> rotate<0,0.000000,0> translate<13.569947,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.556444,0.000000,7.721600>}
box{<0,0,-0.203200><0.986497,0.035000,0.203200> rotate<0,0.000000,0> translate<13.569947,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,34.774875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,34.817184>}
box{<0,0,-0.203200><0.042309,0.035000,0.203200> rotate<0,90.000000,0> translate<13.569947,0.000000,34.817184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569947,0.000000,34.774875>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.682741,0.000000,34.821597>}
box{<0,0,-0.203200><0.122088,0.035000,0.203200> rotate<0,-22.499024,0> translate<13.569947,0.000000,34.774875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.639797,0.000000,20.922641>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.639797,0.000000,20.929600>}
box{<0,0,-0.203200><0.006959,0.035000,0.203200> rotate<0,90.000000,0> translate<13.639797,0.000000,20.929600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.639797,0.000000,20.929600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.369241,0.000000,20.929600>}
box{<0,0,-0.203200><1.729444,0.035000,0.203200> rotate<0,0.000000,0> translate<13.639797,0.000000,20.929600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.682741,0.000000,34.821597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.925256,0.000000,34.821597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<13.682741,0.000000,34.821597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.682741,0.000000,36.202400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.925256,0.000000,36.202400>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<13.682741,0.000000,36.202400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.682741,0.000000,38.821597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.925256,0.000000,38.821597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<13.682741,0.000000,38.821597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,2.479866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.671866,0.000000,1.676400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<13.868400,0.000000,2.479866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,3.616131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,2.479866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.868400,0.000000,2.479866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,3.616131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325600,0.000000,4.073328>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<13.868400,0.000000,3.616131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,5.781866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325600,0.000000,5.324666>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<13.868400,0.000000,5.781866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,6.918131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,5.781866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.868400,0.000000,5.781866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.868400,0.000000,6.918131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.383194,0.000000,7.432922>}
box{<0,0,-0.203200><0.728026,0.035000,0.203200> rotate<0,-44.996856,0> translate<13.868400,0.000000,6.918131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325600,0.000000,5.324666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325600,0.000000,4.073328>}
box{<0,0,-0.203200><1.251337,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.325600,0.000000,4.073328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.383194,0.000000,7.432922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.464809,0.000000,7.629966>}
box{<0,0,-0.203200><0.213278,0.035000,0.203200> rotate<0,-67.496183,0> translate<14.383194,0.000000,7.432922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.464809,0.000000,7.629966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,9.776756>}
box{<0,0,-0.203200><3.036020,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.464809,0.000000,7.629966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.579256,0.000000,12.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.636662,0.000000,12.910181>}
box{<0,0,-0.203200><0.062137,0.035000,0.203200> rotate<0,-22.500903,0> translate<14.579256,0.000000,12.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.579256,0.000000,15.305597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.803309,0.000000,15.212791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<14.579256,0.000000,15.305597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.636662,0.000000,12.910181>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.046400,0.000000,12.500441>}
box{<0,0,-0.203200><0.579459,0.035000,0.203200> rotate<0,44.997249,0> translate<14.636662,0.000000,12.910181> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.671866,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.808131,0.000000,1.676400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<14.671866,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.803309,0.000000,15.212791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.974791,0.000000,15.041309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<14.803309,0.000000,15.212791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.974791,0.000000,15.041309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.000375,0.000000,14.979541>}
box{<0,0,-0.203200><0.066858,0.035000,0.203200> rotate<0,67.496399,0> translate<14.974791,0.000000,15.041309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.976659,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,15.036800>}
box{<0,0,-0.203200><0.974541,0.035000,0.203200> rotate<0,0.000000,0> translate<14.976659,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.000375,0.000000,14.979541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.261966,0.000000,14.871188>}
box{<0,0,-0.203200><0.283143,0.035000,0.203200> rotate<0,22.498280,0> translate<15.000375,0.000000,14.979541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.046400,0.000000,12.062741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.139206,0.000000,11.838688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<15.046400,0.000000,12.062741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.046400,0.000000,12.500441>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.046400,0.000000,12.062741>}
box{<0,0,-0.203200><0.437700,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.046400,0.000000,12.062741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.139206,0.000000,11.838688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.310688,0.000000,11.667206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<15.139206,0.000000,11.838688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.261966,0.000000,14.871188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.539556,0.000000,13.593597>}
box{<0,0,-0.203200><1.806786,0.035000,0.203200> rotate<0,44.997030,0> translate<15.261966,0.000000,14.871188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.310688,0.000000,11.667206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.534741,0.000000,11.574400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<15.310688,0.000000,11.667206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.369241,0.000000,20.929600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.779372,0.000000,19.519472>}
box{<0,0,-0.203200><1.994225,0.035000,0.203200> rotate<0,44.996967,0> translate<15.369241,0.000000,20.929600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.502753,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,14.630400>}
box{<0,0,-0.203200><0.448447,0.035000,0.203200> rotate<0,0.000000,0> translate<15.502753,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.534741,0.000000,11.574400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.054247,0.000000,11.574400>}
box{<0,0,-0.203200><0.519506,0.035000,0.203200> rotate<0,0.000000,0> translate<15.534741,0.000000,11.574400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.808131,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,2.479866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.808131,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.909153,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.122525,0.000000,14.224000>}
box{<0,0,-0.203200><0.213372,0.035000,0.203200> rotate<0,0.000000,0> translate<15.909153,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,14.570322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074941,0.000000,14.271584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<15.951200,0.000000,14.570322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,17.433675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,14.570322>}
box{<0,0,-0.203200><2.863353,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.951200,0.000000,14.570322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,17.433675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074941,0.000000,17.732413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<15.951200,0.000000,17.433675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.054247,0.000000,11.574400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,11.128516>}
box{<0,0,-0.203200><0.713761,0.035000,0.203200> rotate<0,38.657374,0> translate<16.054247,0.000000,11.574400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074941,0.000000,14.271584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.752931,0.000000,13.593597>}
box{<0,0,-0.203200><0.958821,0.035000,0.203200> rotate<0,44.996898,0> translate<16.074941,0.000000,14.271584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.074941,0.000000,17.732413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.303584,0.000000,17.961056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.074941,0.000000,17.732413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154397,0.000000,4.073328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154397,0.000000,5.324666>}
box{<0,0,-0.203200><1.251337,0.035000,0.203200> rotate<0,90.000000,0> translate<16.154397,0.000000,5.324666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154397,0.000000,4.073328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,3.616131>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<16.154397,0.000000,4.073328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154397,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.592928,0.000000,4.470400>}
box{<0,0,-0.203200><4.438531,0.035000,0.203200> rotate<0,0.000000,0> translate<16.154397,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.777200,0.000000,4.876800>}
box{<0,0,-0.203200><4.622803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.154397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.447066,0.000000,5.283200>}
box{<0,0,-0.203200><3.292669,0.035000,0.203200> rotate<0,0.000000,0> translate<16.154397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154397,0.000000,5.324666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,5.781866>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.154397,0.000000,5.324666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.163728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.396269,0.000000,4.064000>}
box{<0,0,-0.203200><3.232541,0.035000,0.203200> rotate<0,0.000000,0> translate<16.163728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.163731,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.396266,0.000000,2.032000>}
box{<0,0,-0.203200><3.232534,0.035000,0.203200> rotate<0,0.000000,0> translate<16.163731,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.303584,0.000000,17.961056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.602322,0.000000,18.084797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<16.303584,0.000000,17.961056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.315553,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.528925,0.000000,13.817600>}
box{<0,0,-0.203200><0.213372,0.035000,0.203200> rotate<0,0.000000,0> translate<16.315553,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.475441,0.000000,7.054288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,6.918131>}
box{<0,0,-0.203200><0.192554,0.035000,0.203200> rotate<0,44.997030,0> translate<16.475441,0.000000,7.054288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.475441,0.000000,7.054288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.043966,0.000000,8.622809>}
box{<0,0,-0.203200><2.218227,0.035000,0.203200> rotate<0,-44.996973,0> translate<16.475441,0.000000,7.054288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.519331,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.040666,0.000000,5.689600>}
box{<0,0,-0.203200><2.521334,0.035000,0.203200> rotate<0,0.000000,0> translate<16.519331,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.539556,0.000000,13.593597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.752931,0.000000,13.593597>}
box{<0,0,-0.203200><0.213375,0.035000,0.203200> rotate<0,0.000000,0> translate<16.539556,0.000000,13.593597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.570128,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.989869,0.000000,3.657600>}
box{<0,0,-0.203200><2.419741,0.035000,0.203200> rotate<0,0.000000,0> translate<16.570128,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.570131,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.989866,0.000000,2.438400>}
box{<0,0,-0.203200><2.419734,0.035000,0.203200> rotate<0,0.000000,0> translate<16.570131,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.602322,0.000000,18.084797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.654400,0.000000,18.084797>}
box{<0,0,-0.203200><0.052078,0.035000,0.203200> rotate<0,0.000000,0> translate<16.602322,0.000000,18.084797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,2.479866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,3.616131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<16.611597,0.000000,3.616131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.611597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,3.251200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.611597,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,5.781866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,6.918131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<16.611597,0.000000,6.918131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,6.096000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.611597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,6.502400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.611597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796303,0.000000,6.908800>}
box{<0,0,-0.203200><2.184706,0.035000,0.203200> rotate<0,0.000000,0> translate<16.611597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,11.128516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,9.776756>}
box{<0,0,-0.203200><1.351759,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.611600,0.000000,9.776756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.654400,0.000000,19.263256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.654400,0.000000,18.084797>}
box{<0,0,-0.203200><1.178459,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.654400,0.000000,18.084797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.654400,0.000000,19.263256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.747206,0.000000,19.487309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<16.654400,0.000000,19.263256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.736353,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.457638,0.000000,7.315200>}
box{<0,0,-0.203200><1.721284,0.035000,0.203200> rotate<0,0.000000,0> translate<16.736353,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.747206,0.000000,19.487309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.779372,0.000000,19.519472>}
box{<0,0,-0.203200><0.045487,0.035000,0.203200> rotate<0,-44.994247,0> translate<16.747206,0.000000,19.487309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.142753,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,7.721600>}
box{<0,0,-0.203200><1.094447,0.035000,0.203200> rotate<0,0.000000,0> translate<17.142753,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.549153,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,8.128000>}
box{<0,0,-0.203200><0.688047,0.035000,0.203200> rotate<0,0.000000,0> translate<17.549153,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.925256,0.000000,34.821597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.149309,0.000000,34.728791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<17.925256,0.000000,34.821597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.925256,0.000000,36.202400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.149309,0.000000,36.295206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<17.925256,0.000000,36.202400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.925256,0.000000,38.821597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.149309,0.000000,38.728791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<17.925256,0.000000,38.821597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.955553,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,8.534400>}
box{<0,0,-0.203200><0.281647,0.035000,0.203200> rotate<0,0.000000,0> translate<17.955553,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.043966,0.000000,8.622809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,8.816047>}
box{<0,0,-0.203200><0.273277,0.035000,0.203200> rotate<0,-44.997493,0> translate<18.043966,0.000000,8.622809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.149309,0.000000,34.728791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.320791,0.000000,34.557309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<18.149309,0.000000,34.728791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.149309,0.000000,36.295206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.320791,0.000000,36.466687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.149309,0.000000,36.295206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.149309,0.000000,38.728791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.320791,0.000000,38.557309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<18.149309,0.000000,38.728791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.225900,0.000000,7.786572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,7.750306>}
box{<0,0,-0.203200><0.037985,0.035000,0.203200> rotate<0,72.688699,0> translate<18.225900,0.000000,7.786572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.225900,0.000000,7.786572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,7.910875>}
box{<0,0,-0.203200><0.124816,0.035000,0.203200> rotate<0,-84.800104,0> translate<18.225900,0.000000,7.786572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,7.712322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.284963,0.000000,7.597016>}
box{<0,0,-0.203200><0.124807,0.035000,0.203200> rotate<0,67.495084,0> translate<18.237200,0.000000,7.712322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,7.750306>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,7.712322>}
box{<0,0,-0.203200><0.037984,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.237200,0.000000,7.712322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,8.816047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.237200,0.000000,7.910875>}
box{<0,0,-0.203200><0.905172,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.237200,0.000000,7.910875> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.270100,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.928672,0.000000,38.608000>}
box{<0,0,-0.203200><14.658572,0.035000,0.203200> rotate<0,0.000000,0> translate<18.270100,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.284963,0.000000,7.597016>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.322088,0.000000,7.477859>}
box{<0,0,-0.203200><0.124806,0.035000,0.203200> rotate<0,72.689960,0> translate<18.284963,0.000000,7.597016> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.320791,0.000000,34.557309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.410472,0.000000,34.340797>}
box{<0,0,-0.203200><0.234351,0.035000,0.203200> rotate<0,67.495808,0> translate<18.320791,0.000000,34.557309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.320791,0.000000,36.466687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413597,0.000000,36.690741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<18.320791,0.000000,36.466687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.320791,0.000000,38.557309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413597,0.000000,38.333256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<18.320791,0.000000,38.557309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.322088,0.000000,7.477859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.346403,0.000000,7.448681>}
box{<0,0,-0.203200><0.037982,0.035000,0.203200> rotate<0,50.190513,0> translate<18.322088,0.000000,7.477859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.326306,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.955181,0.000000,34.544000>}
box{<0,0,-0.203200><14.628875,0.035000,0.203200> rotate<0,0.000000,0> translate<18.326306,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.346403,0.000000,7.448681>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.360941,0.000000,7.413584>}
box{<0,0,-0.203200><0.037989,0.035000,0.203200> rotate<0,67.495687,0> translate<18.346403,0.000000,7.448681> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.360941,0.000000,7.413584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.449197,0.000000,7.325331>}
box{<0,0,-0.203200><0.124811,0.035000,0.203200> rotate<0,44.996016,0> translate<18.360941,0.000000,7.413584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.366069,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.941928,0.000000,36.576000>}
box{<0,0,-0.203200><14.575859,0.035000,0.203200> rotate<0,0.000000,0> translate<18.366069,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.410472,0.000000,34.340797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.211675,0.000000,34.340797>}
box{<0,0,-0.203200><0.801203,0.035000,0.203200> rotate<0,0.000000,0> translate<18.410472,0.000000,34.340797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413597,0.000000,36.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413597,0.000000,38.333256>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,90.000000,0> translate<18.413597,0.000000,38.333256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413597,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,36.982400>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.413597,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413597,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,37.388800>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.413597,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413597,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,37.795200>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.413597,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413597,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,38.201600>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.413597,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.449197,0.000000,7.325331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,6.726284>}
box{<0,0,-0.203200><0.779783,0.035000,0.203200> rotate<0,50.191263,0> translate<18.449197,0.000000,7.325331> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,2.479866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.751866,0.000000,1.676400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<18.948400,0.000000,2.479866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,3.616131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,2.479866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.948400,0.000000,2.479866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,3.616131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.751866,0.000000,4.419597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.948400,0.000000,3.616131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,5.781866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.751866,0.000000,4.978400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<18.948400,0.000000,5.781866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,6.726284>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.948400,0.000000,5.781866>}
box{<0,0,-0.203200><0.944419,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.948400,0.000000,5.781866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.211675,0.000000,34.340797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.510413,0.000000,34.217056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<19.211675,0.000000,34.340797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.510413,0.000000,34.217056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.739056,0.000000,33.988413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<19.510413,0.000000,34.217056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.589869,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,34.137600>}
box{<0,0,-0.203200><13.304531,0.035000,0.203200> rotate<0,0.000000,0> translate<19.589869,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.739056,0.000000,33.988409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.739056,0.000000,33.988413>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<19.739056,0.000000,33.988413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.739056,0.000000,33.988409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.780409,0.000000,32.947056>}
box{<0,0,-0.203200><1.472696,0.035000,0.203200> rotate<0,44.997030,0> translate<19.739056,0.000000,33.988409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.751866,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.888131,0.000000,1.676400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<19.751866,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.751866,0.000000,4.419597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542125,0.000000,4.419597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<19.751866,0.000000,4.419597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.751866,0.000000,4.978400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.777200,0.000000,4.978400>}
box{<0,0,-0.203200><1.025334,0.035000,0.203200> rotate<0,0.000000,0> translate<19.751866,0.000000,4.978400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.996266,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,33.731200>}
box{<0,0,-0.203200><12.898134,0.035000,0.203200> rotate<0,0.000000,0> translate<19.996266,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.402666,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,33.324800>}
box{<0,0,-0.203200><12.491734,0.035000,0.203200> rotate<0,0.000000,0> translate<20.402666,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542125,0.000000,4.419597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.777200,0.000000,4.654672>}
box{<0,0,-0.203200><0.332446,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.542125,0.000000,4.419597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.777200,0.000000,4.978400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.777200,0.000000,4.654672>}
box{<0,0,-0.203200><0.323728,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.777200,0.000000,4.654672> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.780409,0.000000,32.947056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.780413,0.000000,32.947056>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.780409,0.000000,32.947056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.780413,0.000000,32.947056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.009056,0.000000,32.718412>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<20.780413,0.000000,32.947056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.808513,0.000000,16.110000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.817709,0.000000,16.106191>}
box{<0,0,-0.203200><0.009955,0.035000,0.203200> rotate<0,22.498008,0> translate<20.808513,0.000000,16.110000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.808513,0.000000,16.110000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.817709,0.000000,16.113806>}
box{<0,0,-0.203200><0.009953,0.035000,0.203200> rotate<0,-22.481390,0> translate<20.808513,0.000000,16.110000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.809069,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,32.918400>}
box{<0,0,-0.203200><12.085331,0.035000,0.203200> rotate<0,0.000000,0> translate<20.809069,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.817709,0.000000,16.106191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.989191,0.000000,15.934709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<20.817709,0.000000,16.106191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.817709,0.000000,16.113806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.989191,0.000000,16.285287>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.817709,0.000000,16.113806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.888131,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.589997,0.000000,2.378269>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,-44.997158,0> translate<20.888131,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.959903,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,16.256000>}
box{<0,0,-0.203200><6.218097,0.035000,0.203200> rotate<0,0.000000,0> translate<20.959903,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.989191,0.000000,15.934709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.003141,0.000000,15.901028>}
box{<0,0,-0.203200><0.036456,0.035000,0.203200> rotate<0,67.497332,0> translate<20.989191,0.000000,15.934709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.989191,0.000000,16.285287>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.081997,0.000000,16.509341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<20.989191,0.000000,16.285287> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.003141,0.000000,15.901028>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.150106,0.000000,16.047997>}
box{<0,0,-0.203200><0.207843,0.035000,0.203200> rotate<0,-44.997639,0> translate<21.003141,0.000000,15.901028> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.009056,0.000000,32.718412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.075500,0.000000,32.557997>}
box{<0,0,-0.203200><0.173632,0.035000,0.203200> rotate<0,67.496331,0> translate<21.009056,0.000000,32.718412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.075500,0.000000,32.557997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.775891,0.000000,32.557997>}
box{<0,0,-0.203200><0.700391,0.035000,0.203200> rotate<0,0.000000,0> translate<21.075500,0.000000,32.557997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.081997,0.000000,16.509341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.081997,0.000000,16.884531>}
box{<0,0,-0.203200><0.375191,0.035000,0.203200> rotate<0,90.000000,0> translate<21.081997,0.000000,16.884531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.081997,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.240856,0.000000,16.662400>}
box{<0,0,-0.203200><6.158859,0.035000,0.203200> rotate<0,0.000000,0> translate<21.081997,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.081997,0.000000,16.884531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.129584,0.000000,16.836941>}
box{<0,0,-0.203200><0.067301,0.035000,0.203200> rotate<0,44.998911,0> translate<21.081997,0.000000,16.884531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.129584,0.000000,16.836941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.428322,0.000000,16.713200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<21.129584,0.000000,16.836941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.150106,0.000000,16.047997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.029891,0.000000,16.047997>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,0.000000,0> translate<21.150106,0.000000,16.047997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.243728,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.936266,0.000000,2.032000>}
box{<0,0,-0.203200><0.692538,0.035000,0.203200> rotate<0,0.000000,0> translate<21.243728,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.428322,0.000000,16.713200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.261897,0.000000,16.713200>}
box{<0,0,-0.203200><5.833575,0.035000,0.203200> rotate<0,0.000000,0> translate<21.428322,0.000000,16.713200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.589997,0.000000,2.378269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.291866,0.000000,1.676400>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,44.997030,0> translate<21.589997,0.000000,2.378269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.775891,0.000000,32.557997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.397997,0.000000,31.935891>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,44.997030,0> translate<21.775891,0.000000,32.557997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.821888,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968438,0.000000,32.512000>}
box{<0,0,-0.203200><11.146550,0.035000,0.203200> rotate<0,0.000000,0> translate<21.821888,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.029891,0.000000,16.047997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.651997,0.000000,15.425891>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,44.997030,0> translate<22.029891,0.000000,16.047997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148797,0.000000,30.525997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148797,0.000000,30.806906>}
box{<0,0,-0.203200><0.280909,0.035000,0.203200> rotate<0,90.000000,0> translate<22.148797,0.000000,30.806906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148797,0.000000,30.525997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.791891,0.000000,30.525997>}
box{<0,0,-0.203200><0.643094,0.035000,0.203200> rotate<0,0.000000,0> translate<22.148797,0.000000,30.525997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.148797,0.000000,30.806906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.397997,0.000000,31.056106>}
box{<0,0,-0.203200><0.352422,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.148797,0.000000,30.806906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.228288,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,15.849600>}
box{<0,0,-0.203200><4.949713,0.035000,0.203200> rotate<0,0.000000,0> translate<22.228288,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.228288,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,32.105600>}
box{<0,0,-0.203200><10.666113,0.035000,0.203200> rotate<0,0.000000,0> translate<22.228288,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.228291,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,30.886400>}
box{<0,0,-0.203200><10.666109,0.035000,0.203200> rotate<0,0.000000,0> translate<22.228291,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.291866,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.428131,0.000000,1.676400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<22.291866,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.397997,0.000000,31.056106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.397997,0.000000,31.935891>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,90.000000,0> translate<22.397997,0.000000,31.935891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.397997,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,31.292800>}
box{<0,0,-0.203200><10.496403,0.035000,0.203200> rotate<0,0.000000,0> translate<22.397997,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.397997,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,31.699200>}
box{<0,0,-0.203200><10.496403,0.035000,0.203200> rotate<0,0.000000,0> translate<22.397997,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.634688,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.312894,0.000000,15.443200>}
box{<0,0,-0.203200><4.678206,0.035000,0.203200> rotate<0,0.000000,0> translate<22.634688,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.651997,0.000000,15.285997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.651997,0.000000,15.425891>}
box{<0,0,-0.203200><0.139894,0.035000,0.203200> rotate<0,90.000000,0> translate<22.651997,0.000000,15.425891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.651997,0.000000,15.285997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.045891,0.000000,15.285997>}
box{<0,0,-0.203200><0.393894,0.035000,0.203200> rotate<0,0.000000,0> translate<22.651997,0.000000,15.285997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.791891,0.000000,30.525997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.413997,0.000000,29.903891>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,44.997030,0> translate<22.791891,0.000000,30.525997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.837888,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.955188,0.000000,30.480000>}
box{<0,0,-0.203200><10.117300,0.035000,0.203200> rotate<0,0.000000,0> translate<22.837888,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942797,0.000000,28.493997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942797,0.000000,28.552906>}
box{<0,0,-0.203200><0.058909,0.035000,0.203200> rotate<0,90.000000,0> translate<22.942797,0.000000,28.552906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942797,0.000000,28.493997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.807891,0.000000,28.493997>}
box{<0,0,-0.203200><0.865094,0.035000,0.203200> rotate<0,0.000000,0> translate<22.942797,0.000000,28.493997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.942797,0.000000,28.552906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.413997,0.000000,29.024106>}
box{<0,0,-0.203200><0.666377,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.942797,0.000000,28.552906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.045891,0.000000,15.285997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667997,0.000000,14.663891>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,44.997030,0> translate<23.045891,0.000000,15.285997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.244288,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,30.073600>}
box{<0,0,-0.203200><9.650113,0.035000,0.203200> rotate<0,0.000000,0> translate<23.244288,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.244291,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,28.854400>}
box{<0,0,-0.203200><9.650109,0.035000,0.203200> rotate<0,0.000000,0> translate<23.244291,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.295088,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.230253,0.000000,15.036800>}
box{<0,0,-0.203200><3.935166,0.035000,0.203200> rotate<0,0.000000,0> translate<23.295088,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.345884,0.000000,13.461997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667997,0.000000,13.784106>}
box{<0,0,-0.203200><0.455534,0.035000,0.203200> rotate<0,-44.996752,0> translate<23.345884,0.000000,13.461997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.345884,0.000000,13.461997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,13.461997>}
box{<0,0,-0.203200><3.832116,0.035000,0.203200> rotate<0,0.000000,0> translate<23.345884,0.000000,13.461997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.413997,0.000000,29.024106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.413997,0.000000,29.903891>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,90.000000,0> translate<23.413997,0.000000,29.903891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.413997,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,29.260800>}
box{<0,0,-0.203200><9.480403,0.035000,0.203200> rotate<0,0.000000,0> translate<23.413997,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.413997,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,29.667200>}
box{<0,0,-0.203200><9.480403,0.035000,0.203200> rotate<0,0.000000,0> translate<23.413997,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.428131,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.231597,0.000000,2.479866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.428131,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667997,0.000000,13.784106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667997,0.000000,14.663891>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,90.000000,0> translate<23.667997,0.000000,14.663891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667997,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,13.817600>}
box{<0,0,-0.203200><3.510003,0.035000,0.203200> rotate<0,0.000000,0> translate<23.667997,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667997,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,14.224000>}
box{<0,0,-0.203200><3.510003,0.035000,0.203200> rotate<0,0.000000,0> translate<23.667997,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667997,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,14.630400>}
box{<0,0,-0.203200><3.510003,0.035000,0.203200> rotate<0,0.000000,0> translate<23.667997,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,22.047197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,26.306963>}
box{<0,0,-0.203200><4.259766,0.035000,0.203200> rotate<0,90.000000,0> translate<23.742797,0.000000,26.306963> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,22.047197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.330656,0.000000,22.047197>}
box{<0,0,-0.203200><3.587859,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,22.047197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.549122,0.000000,22.352000>}
box{<0,0,-0.203200><4.806325,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,22.758400>}
box{<0,0,-0.203200><4.735603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,23.164800>}
box{<0,0,-0.203200><4.735603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.653097,0.000000,23.571200>}
box{<0,0,-0.203200><4.910300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.024447,0.000000,23.977600>}
box{<0,0,-0.203200><13.281650,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.069894,0.000000,24.384000>}
box{<0,0,-0.203200><9.327097,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,24.790400>}
box{<0,0,-0.203200><9.151603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,25.196800>}
box{<0,0,-0.203200><9.151603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,25.603200>}
box{<0,0,-0.203200><9.151603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,26.009600>}
box{<0,0,-0.203200><9.151603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.742797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.742797,0.000000,26.306963>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.771981,0.000000,26.370000>}
box{<0,0,-0.203200><0.069465,0.035000,0.203200> rotate<0,-65.153051,0> translate<23.742797,0.000000,26.306963> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.771981,0.000000,26.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.807891,0.000000,26.370000>}
box{<0,0,-0.203200><0.035909,0.035000,0.203200> rotate<0,0.000000,0> translate<23.771981,0.000000,26.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.783731,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.524266,0.000000,2.032000>}
box{<0,0,-0.203200><3.740534,0.035000,0.203200> rotate<0,0.000000,0> translate<23.783731,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.807891,0.000000,26.370000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.429997,0.000000,26.992106>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.807891,0.000000,26.370000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.807891,0.000000,28.493997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.429997,0.000000,27.871891>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,44.997030,0> translate<23.807891,0.000000,28.493997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.853888,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.756109,0.000000,28.448000>}
box{<0,0,-0.203200><6.902222,0.035000,0.203200> rotate<0,0.000000,0> translate<23.853888,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.853891,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.928678,0.000000,26.416000>}
box{<0,0,-0.203200><9.074788,0.035000,0.203200> rotate<0,0.000000,0> translate<23.853891,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.190131,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.117866,0.000000,2.438400>}
box{<0,0,-0.203200><2.927734,0.035000,0.203200> rotate<0,0.000000,0> translate<24.190131,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.231597,0.000000,2.479866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.231597,0.000000,3.270125>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,90.000000,0> translate<24.231597,0.000000,3.270125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.231597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.117306,0.000000,2.844800>}
box{<0,0,-0.203200><0.885709,0.035000,0.203200> rotate<0,0.000000,0> translate<24.231597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.231597,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.710906,0.000000,3.251200>}
box{<0,0,-0.203200><0.479309,0.035000,0.203200> rotate<0,0.000000,0> translate<24.231597,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.231597,0.000000,3.270125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,0.000000,3.630531>}
box{<0,0,-0.203200><0.509689,0.035000,0.203200> rotate<0,-44.997279,0> translate<24.231597,0.000000,3.270125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.260288,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.434000,0.000000,28.041600>}
box{<0,0,-0.203200><6.173713,0.035000,0.203200> rotate<0,0.000000,0> translate<24.260288,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.260291,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.857706,0.000000,26.822400>}
box{<0,0,-0.203200><6.597416,0.035000,0.203200> rotate<0,0.000000,0> translate<24.260291,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.429997,0.000000,26.992106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.429997,0.000000,27.871891>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,90.000000,0> translate<24.429997,0.000000,27.871891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.429997,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.451306,0.000000,27.228800>}
box{<0,0,-0.203200><6.021309,0.035000,0.203200> rotate<0,0.000000,0> translate<24.429997,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.429997,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.434000,0.000000,27.635200>}
box{<0,0,-0.203200><6.004003,0.035000,0.203200> rotate<0,0.000000,0> translate<24.429997,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,0.000000,3.370106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.214106,0.000000,2.748000>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,44.997030,0> translate<24.592000,0.000000,3.370106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,0.000000,3.630531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,0.000000,3.370106>}
box{<0,0,-0.203200><0.260425,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.592000,0.000000,3.370106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.214106,0.000000,2.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.093891,0.000000,2.748000>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,0.000000,0> translate<25.214106,0.000000,2.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.093891,0.000000,2.748000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,0.000000,3.370106>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.093891,0.000000,2.748000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.190691,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076400,0.000000,2.844800>}
box{<0,0,-0.203200><0.885709,0.035000,0.203200> rotate<0,0.000000,0> translate<26.190691,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.597091,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076400,0.000000,3.251200>}
box{<0,0,-0.203200><0.479309,0.035000,0.203200> rotate<0,0.000000,0> translate<26.597091,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,0.000000,3.370106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,0.000000,3.630531>}
box{<0,0,-0.203200><0.260425,0.035000,0.203200> rotate<0,90.000000,0> translate<26.715997,0.000000,3.630531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,0.000000,3.630531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076400,0.000000,3.270125>}
box{<0,0,-0.203200><0.509689,0.035000,0.203200> rotate<0,44.997279,0> translate<26.715997,0.000000,3.630531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076400,0.000000,2.479866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.879866,0.000000,1.676400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<27.076400,0.000000,2.479866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076400,0.000000,3.270125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.076400,0.000000,2.479866>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.076400,0.000000,2.479866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,14.910656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,13.461997>}
box{<0,0,-0.203200><1.448659,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.178000,0.000000,13.461997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,14.910656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.270806,0.000000,15.134709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<27.178000,0.000000,14.910656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,15.709341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.270806,0.000000,15.485288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<27.178000,0.000000,15.709341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,16.510656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,15.709341>}
box{<0,0,-0.203200><0.801316,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.178000,0.000000,15.709341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,16.510656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.261897,0.000000,16.713200>}
box{<0,0,-0.203200><0.219232,0.035000,0.203200> rotate<0,-67.495423,0> translate<27.178000,0.000000,16.510656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.270806,0.000000,15.134709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.442288,0.000000,15.306191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.270806,0.000000,15.134709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.270806,0.000000,15.485288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.442288,0.000000,15.313806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<27.270806,0.000000,15.485288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.330656,0.000000,22.047197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.554709,0.000000,21.954391>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<27.330656,0.000000,22.047197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.442288,0.000000,15.306191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.451484,0.000000,15.309997>}
box{<0,0,-0.203200><0.009953,0.035000,0.203200> rotate<0,-22.481390,0> translate<27.442288,0.000000,15.306191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.442288,0.000000,15.313806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.451484,0.000000,15.309997>}
box{<0,0,-0.203200><0.009955,0.035000,0.203200> rotate<0,22.498008,0> translate<27.442288,0.000000,15.313806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.554709,0.000000,21.954391>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.726191,0.000000,21.782909>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<27.554709,0.000000,21.954391> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.563500,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.675200,0.000000,21.945600>}
box{<0,0,-0.203200><1.111700,0.035000,0.203200> rotate<0,0.000000,0> translate<27.563500,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.726191,0.000000,21.782909>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818997,0.000000,21.558856>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<27.726191,0.000000,21.782909> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818997,0.000000,20.198997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818997,0.000000,21.558856>}
box{<0,0,-0.203200><1.359859,0.035000,0.203200> rotate<0,90.000000,0> translate<27.818997,0.000000,21.558856> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818997,0.000000,20.198997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.162128,0.000000,20.198997>}
box{<0,0,-0.203200><0.343131,0.035000,0.203200> rotate<0,0.000000,0> translate<27.818997,0.000000,20.198997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818997,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.283131,0.000000,20.320000>}
box{<0,0,-0.203200><0.464134,0.035000,0.203200> rotate<0,0.000000,0> translate<27.818997,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818997,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,20.726400>}
box{<0,0,-0.203200><0.659403,0.035000,0.203200> rotate<0,0.000000,0> translate<27.818997,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818997,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,21.132800>}
box{<0,0,-0.203200><0.659403,0.035000,0.203200> rotate<0,0.000000,0> translate<27.818997,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.818997,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.675200,0.000000,21.539200>}
box{<0,0,-0.203200><0.856203,0.035000,0.203200> rotate<0,0.000000,0> translate<27.818997,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.879866,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.016131,0.000000,1.676400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<27.879866,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.162128,0.000000,20.198997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,20.515269>}
box{<0,0,-0.203200><0.447276,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.162128,0.000000,20.198997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,21.165256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,20.515269>}
box{<0,0,-0.203200><0.649988,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.478400,0.000000,20.515269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,21.165256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571206,0.000000,21.389309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.478400,0.000000,21.165256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,22.522741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571206,0.000000,22.298687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<28.478400,0.000000,22.522741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,23.265256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,22.522741>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.478400,0.000000,22.522741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.478400,0.000000,23.265256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571206,0.000000,23.489309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.478400,0.000000,23.265256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571206,0.000000,21.389309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.675200,0.000000,21.493303>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.571206,0.000000,21.389309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571206,0.000000,22.298687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.678400,0.000000,22.191494>}
box{<0,0,-0.203200><0.151595,0.035000,0.203200> rotate<0,44.997030,0> translate<28.571206,0.000000,22.298687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.571206,0.000000,23.489309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.742688,0.000000,23.660791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.571206,0.000000,23.489309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.675200,0.000000,22.005675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.675200,0.000000,21.493303>}
box{<0,0,-0.203200><0.512372,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.675200,0.000000,21.493303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.675200,0.000000,22.005675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.678400,0.000000,22.013397>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-67.486080,0> translate<28.675200,0.000000,22.005675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.678400,0.000000,22.191494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.678400,0.000000,22.013397>}
box{<0,0,-0.203200><0.178097,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.678400,0.000000,22.013397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.742688,0.000000,23.660791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.966741,0.000000,23.753597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<28.742688,0.000000,23.660791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.966741,0.000000,23.753597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.009256,0.000000,23.753597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<28.966741,0.000000,23.753597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.016131,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717997,0.000000,2.378269>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,-44.997158,0> translate<29.016131,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.371728,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.064266,0.000000,2.032000>}
box{<0,0,-0.203200><0.692538,0.035000,0.203200> rotate<0,0.000000,0> translate<29.371728,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717997,0.000000,2.378269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.419866,0.000000,1.676400>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,44.997030,0> translate<29.717997,0.000000,2.378269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.009256,0.000000,23.753597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.233309,0.000000,23.660791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<30.009256,0.000000,23.753597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.233309,0.000000,23.660791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.238000,0.000000,23.656100>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,44.997030,0> translate<30.233309,0.000000,23.660791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.238000,0.000000,23.656100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.242688,0.000000,23.660791>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,-45.016121,0> translate<30.238000,0.000000,23.656100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.242688,0.000000,23.660791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.466741,0.000000,23.753597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<30.242688,0.000000,23.660791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.297597,0.000000,22.013397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.297597,0.000000,22.104463>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,90.000000,0> translate<30.297597,0.000000,22.104463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.297597,0.000000,22.013397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.300797,0.000000,22.005675>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<30.297597,0.000000,22.013397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.297597,0.000000,22.104463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.466741,0.000000,22.034400>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,22.498765,0> translate<30.297597,0.000000,22.104463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.300797,0.000000,21.584859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.300797,0.000000,22.005675>}
box{<0,0,-0.203200><0.420816,0.035000,0.203200> rotate<0,90.000000,0> translate<30.300797,0.000000,22.005675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.300797,0.000000,21.584859>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.466741,0.000000,21.653597>}
box{<0,0,-0.203200><0.179617,0.035000,0.203200> rotate<0,-22.498912,0> translate<30.300797,0.000000,21.584859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.300797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.675200,0.000000,21.945600>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<30.300797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.419866,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.556131,0.000000,1.676400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<30.419866,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.434000,0.000000,27.246106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.056106,0.000000,26.624000>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,44.997030,0> translate<30.434000,0.000000,27.246106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.434000,0.000000,28.125891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.434000,0.000000,27.246106>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.434000,0.000000,27.246106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.434000,0.000000,28.125891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.056106,0.000000,28.747997>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.434000,0.000000,28.125891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.466741,0.000000,21.653597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.509256,0.000000,21.653597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<30.466741,0.000000,21.653597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.466741,0.000000,22.034400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.509256,0.000000,22.034400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<30.466741,0.000000,22.034400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.466741,0.000000,23.753597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.509256,0.000000,23.753597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<30.466741,0.000000,23.753597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.786081,0.000000,14.305388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.836741,0.000000,14.284400>}
box{<0,0,-0.203200><0.054835,0.035000,0.203200> rotate<0,22.502086,0> translate<30.786081,0.000000,14.305388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.786081,0.000000,14.305388>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.169056,0.000000,13.922413>}
box{<0,0,-0.203200><0.541608,0.035000,0.203200> rotate<0,44.997030,0> translate<30.786081,0.000000,14.305388> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.836741,0.000000,14.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.879256,0.000000,14.284400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<30.836741,0.000000,14.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.867469,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.603666,0.000000,14.224000>}
box{<0,0,-0.203200><7.736197,0.035000,0.203200> rotate<0,0.000000,0> translate<30.867469,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.056106,0.000000,26.624000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.935891,0.000000,26.624000>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,0.000000,0> translate<31.056106,0.000000,26.624000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.056106,0.000000,28.747997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.935891,0.000000,28.747997>}
box{<0,0,-0.203200><0.879784,0.035000,0.203200> rotate<0,0.000000,0> translate<31.056106,0.000000,28.747997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.169056,0.000000,13.922413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292797,0.000000,13.623675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<31.169056,0.000000,13.922413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.212472,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.309241,0.000000,13.817600>}
box{<0,0,-0.203200><12.096769,0.035000,0.203200> rotate<0,0.000000,0> translate<31.212472,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292797,0.000000,13.385797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292797,0.000000,13.623675>}
box{<0,0,-0.203200><0.237878,0.035000,0.203200> rotate<0,90.000000,0> translate<31.292797,0.000000,13.623675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292797,0.000000,13.385797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.925356,0.000000,13.385797>}
box{<0,0,-0.203200><1.632559,0.035000,0.203200> rotate<0,0.000000,0> translate<31.292797,0.000000,13.385797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.292797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.271097,0.000000,13.411200>}
box{<0,0,-0.203200><2.978300,0.035000,0.203200> rotate<0,0.000000,0> translate<31.292797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.509256,0.000000,21.653597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.675200,0.000000,21.584859>}
box{<0,0,-0.203200><0.179617,0.035000,0.203200> rotate<0,22.498912,0> translate<31.509256,0.000000,21.653597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.509256,0.000000,22.034400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.678400,0.000000,22.104463>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,-22.498765,0> translate<31.509256,0.000000,22.034400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.509256,0.000000,23.753597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.733309,0.000000,23.660791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<31.509256,0.000000,23.753597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.556131,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.359597,0.000000,2.479866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.556131,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.675200,0.000000,22.005675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.675200,0.000000,21.584859>}
box{<0,0,-0.203200><0.420816,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.675200,0.000000,21.584859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.675200,0.000000,22.005675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.678400,0.000000,22.013397>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-67.486080,0> translate<31.675200,0.000000,22.005675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.678400,0.000000,22.104463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.678400,0.000000,22.013397>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.678400,0.000000,22.013397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.733309,0.000000,23.660791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.737997,0.000000,23.656100>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,45.016121,0> translate<31.733309,0.000000,23.660791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.737997,0.000000,23.656100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.742688,0.000000,23.660791>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.737997,0.000000,23.656100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.742688,0.000000,23.660791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.966741,0.000000,23.753597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<31.742688,0.000000,23.660791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.879256,0.000000,14.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.103309,0.000000,14.377206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<31.879256,0.000000,14.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.911731,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.144266,0.000000,2.032000>}
box{<0,0,-0.203200><3.232534,0.035000,0.203200> rotate<0,0.000000,0> translate<31.911731,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.935891,0.000000,26.624000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.185091,0.000000,26.873200>}
box{<0,0,-0.203200><0.352422,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.935891,0.000000,26.624000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.935891,0.000000,28.747997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.185091,0.000000,28.498797>}
box{<0,0,-0.203200><0.352422,0.035000,0.203200> rotate<0,44.997030,0> translate<31.935891,0.000000,28.747997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.966741,0.000000,23.753597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.009256,0.000000,23.753597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<31.966741,0.000000,23.753597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.103309,0.000000,14.377206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.274791,0.000000,14.548688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.103309,0.000000,14.377206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.134291,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,26.822400>}
box{<0,0,-0.203200><0.760109,0.035000,0.203200> rotate<0,0.000000,0> translate<32.134291,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.185091,0.000000,26.873200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,26.873200>}
box{<0,0,-0.203200><0.709309,0.035000,0.203200> rotate<0,0.000000,0> translate<32.185091,0.000000,26.873200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.185091,0.000000,28.498797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.962972,0.000000,28.498797>}
box{<0,0,-0.203200><0.777881,0.035000,0.203200> rotate<0,0.000000,0> translate<32.185091,0.000000,28.498797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.272397,0.000000,16.441700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.272397,0.000000,16.578297>}
box{<0,0,-0.203200><0.136597,0.035000,0.203200> rotate<0,90.000000,0> translate<32.272397,0.000000,16.578297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.272397,0.000000,16.441700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.274791,0.000000,16.439309>}
box{<0,0,-0.203200><0.003383,0.035000,0.203200> rotate<0,44.959609,0> translate<32.272397,0.000000,16.441700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.272397,0.000000,16.578297>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.274791,0.000000,16.580687>}
box{<0,0,-0.203200><0.003383,0.035000,0.203200> rotate<0,-44.959609,0> translate<32.272397,0.000000,16.578297> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.274791,0.000000,14.548688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,14.772741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<32.274791,0.000000,14.548688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.274791,0.000000,16.439309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,16.215256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<32.274791,0.000000,16.439309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.274791,0.000000,16.580687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,16.804741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<32.274791,0.000000,16.580687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278597,0.000000,3.697128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.359597,0.000000,3.616131>}
box{<0,0,-0.203200><0.114549,0.035000,0.203200> rotate<0,44.995925,0> translate<32.278597,0.000000,3.697128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.278597,0.000000,3.697128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.718412,0.000000,4.136941>}
box{<0,0,-0.203200><0.621991,0.035000,0.203200> rotate<0,-44.996827,0> translate<32.278597,0.000000,3.697128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308634,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,14.630400>}
box{<0,0,-0.203200><6.231766,0.035000,0.203200> rotate<0,0.000000,0> translate<32.308634,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.308634,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,16.662400>}
box{<0,0,-0.203200><6.231766,0.035000,0.203200> rotate<0,0.000000,0> translate<32.308634,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.318128,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.737869,0.000000,3.657600>}
box{<0,0,-0.203200><2.419741,0.035000,0.203200> rotate<0,0.000000,0> translate<32.318128,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.318131,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.737866,0.000000,2.438400>}
box{<0,0,-0.203200><2.419734,0.035000,0.203200> rotate<0,0.000000,0> translate<32.318131,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.350722,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,16.256000>}
box{<0,0,-0.203200><6.189678,0.035000,0.203200> rotate<0,0.000000,0> translate<32.350722,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.359597,0.000000,2.479866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.359597,0.000000,3.616131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<32.359597,0.000000,3.616131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.359597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.359597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.359597,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,3.251200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.359597,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,14.772741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,16.215256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<32.367597,0.000000,16.215256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,15.036800>}
box{<0,0,-0.203200><6.172803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.367597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,15.443200>}
box{<0,0,-0.203200><6.172803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.367597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,15.849600>}
box{<0,0,-0.203200><6.172803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.367597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,16.804741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,17.866441>}
box{<0,0,-0.203200><1.061700,0.035000,0.203200> rotate<0,90.000000,0> translate<32.367597,0.000000,17.866441> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,17.068800>}
box{<0,0,-0.203200><6.172803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.367597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.155325,0.000000,17.475200>}
box{<0,0,-0.203200><5.787728,0.035000,0.203200> rotate<0,0.000000,0> translate<32.367597,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.367597,0.000000,17.866441>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.079525,0.000000,20.578372>}
box{<0,0,-0.203200><3.835248,0.035000,0.203200> rotate<0,-44.997063,0> translate<32.367597,0.000000,17.866441> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.382753,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.109275,0.000000,17.881600>}
box{<0,0,-0.203200><4.726522,0.035000,0.203200> rotate<0,0.000000,0> translate<32.382753,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.645469,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.144269,0.000000,4.064000>}
box{<0,0,-0.203200><2.498800,0.035000,0.203200> rotate<0,0.000000,0> translate<32.645469,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.718412,0.000000,4.136941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.947056,0.000000,4.365584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.718412,0.000000,4.136941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.789153,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.737275,0.000000,18.288000>}
box{<0,0,-0.203200><3.948122,0.035000,0.203200> rotate<0,0.000000,0> translate<32.789153,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,24.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.987206,0.000000,24.466688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<32.894400,0.000000,24.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,26.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,24.690741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.894400,0.000000,24.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,26.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,26.511997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<32.894400,0.000000,26.333256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,26.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,26.511997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<32.894400,0.000000,26.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,26.873200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,26.690741>}
box{<0,0,-0.203200><0.182459,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.894400,0.000000,26.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,28.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,28.511997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<32.894400,0.000000,28.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,30.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,28.690741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.894400,0.000000,28.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,30.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,30.511997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<32.894400,0.000000,30.333256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,30.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,30.511997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<32.894400,0.000000,30.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,32.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,30.690741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.894400,0.000000,30.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,32.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,32.511997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<32.894400,0.000000,32.333256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,32.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,32.511997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<32.894400,0.000000,32.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,34.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,32.690741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.894400,0.000000,32.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,34.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,34.511997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<32.894400,0.000000,34.333256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,34.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,34.511997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<32.894400,0.000000,34.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,36.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,34.690741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.894400,0.000000,34.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,36.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,36.511997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<32.894400,0.000000,36.333256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,36.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,36.511997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<32.894400,0.000000,36.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,38.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,36.690741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.894400,0.000000,36.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,38.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,38.511997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<32.894400,0.000000,38.333256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,38.690741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,38.511997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<32.894400,0.000000,38.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,40.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,38.690741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.894400,0.000000,38.690741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.894400,0.000000,40.333256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.987206,0.000000,40.557309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<32.894400,0.000000,40.333256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.925356,0.000000,13.385797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.149409,0.000000,13.292991>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<32.925356,0.000000,13.385797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.947056,0.000000,4.365584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,4.664322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<32.947056,0.000000,4.365584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.962972,0.000000,28.498797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.968441,0.000000,28.511997>}
box{<0,0,-0.203200><0.014288,0.035000,0.203200> rotate<0,-67.491355,0> translate<32.962972,0.000000,28.498797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.987206,0.000000,24.466688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.158687,0.000000,24.295206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<32.987206,0.000000,24.466688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.987206,0.000000,40.557309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.158687,0.000000,40.728791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.987206,0.000000,40.557309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.990472,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.153600,0.000000,4.470400>}
box{<0,0,-0.203200><2.163128,0.035000,0.203200> rotate<0,0.000000,0> translate<32.990472,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.009256,0.000000,23.753597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.233309,0.000000,23.660791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<33.009256,0.000000,23.753597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,4.664322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,6.775325>}
box{<0,0,-0.203200><2.111003,0.035000,0.203200> rotate<0,90.000000,0> translate<33.070797,0.000000,6.775325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.153600,0.000000,4.876800>}
box{<0,0,-0.203200><2.082803,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.153600,0.000000,5.283200>}
box{<0,0,-0.203200><2.082803,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.788666,0.000000,5.689600>}
box{<0,0,-0.203200><1.717869,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,6.096000>}
box{<0,0,-0.203200><1.625603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,6.502400>}
box{<0,0,-0.203200><1.625603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,6.775325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.123472,0.000000,7.828000>}
box{<0,0,-0.203200><1.488707,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.070797,0.000000,6.775325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.149409,0.000000,13.292991>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.183603,0.000000,13.258797>}
box{<0,0,-0.203200><0.048357,0.035000,0.203200> rotate<0,44.997030,0> translate<33.149409,0.000000,13.292991> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.158687,0.000000,24.295206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.382741,0.000000,24.202400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<33.158687,0.000000,24.295206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.158687,0.000000,40.728791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.382741,0.000000,40.821597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.158687,0.000000,40.728791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.183603,0.000000,13.258797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.196319,0.000000,13.258797>}
box{<0,0,-0.203200><1.012716,0.035000,0.203200> rotate<0,0.000000,0> translate<33.183603,0.000000,13.258797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.195553,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720400,0.000000,18.694400>}
box{<0,0,-0.203200><3.524847,0.035000,0.203200> rotate<0,0.000000,0> translate<33.195553,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.204272,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,6.908800>}
box{<0,0,-0.203200><1.492128,0.035000,0.203200> rotate<0,0.000000,0> translate<33.204272,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.233309,0.000000,23.660791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.404791,0.000000,23.489309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<33.233309,0.000000,23.660791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.297597,0.000000,22.013397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.297597,0.000000,22.191494>}
box{<0,0,-0.203200><0.178097,0.035000,0.203200> rotate<0,90.000000,0> translate<33.297597,0.000000,22.191494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.297597,0.000000,22.013397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.300797,0.000000,22.005675>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<33.297597,0.000000,22.013397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.297597,0.000000,22.191494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.404791,0.000000,22.298687>}
box{<0,0,-0.203200><0.151595,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.297597,0.000000,22.191494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.300797,0.000000,21.493303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.300797,0.000000,22.005675>}
box{<0,0,-0.203200><0.512372,0.035000,0.203200> rotate<0,90.000000,0> translate<33.300797,0.000000,22.005675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.300797,0.000000,21.493303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.354472,0.000000,21.439625>}
box{<0,0,-0.203200><0.075910,0.035000,0.203200> rotate<0,44.998698,0> translate<33.300797,0.000000,21.493303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.300797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.454047,0.000000,21.539200>}
box{<0,0,-0.203200><0.153250,0.035000,0.203200> rotate<0,0.000000,0> translate<33.300797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.300797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.860447,0.000000,21.945600>}
box{<0,0,-0.203200><0.559650,0.035000,0.203200> rotate<0,0.000000,0> translate<33.300797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.322900,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.618047,0.000000,23.571200>}
box{<0,0,-0.203200><3.295147,0.035000,0.203200> rotate<0,0.000000,0> translate<33.322900,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.354472,0.000000,21.439625>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.022809,0.000000,22.107966>}
box{<0,0,-0.203200><0.945174,0.035000,0.203200> rotate<0,-44.997164,0> translate<33.354472,0.000000,21.439625> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.382741,0.000000,24.202400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.249247,0.000000,24.202400>}
box{<0,0,-0.203200><3.866506,0.035000,0.203200> rotate<0,0.000000,0> translate<33.382741,0.000000,24.202400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.382741,0.000000,40.821597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.625256,0.000000,40.821597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<33.382741,0.000000,40.821597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.404791,0.000000,22.298687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.497597,0.000000,22.522741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.404791,0.000000,22.298687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.404791,0.000000,23.489309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.497597,0.000000,23.265256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.404791,0.000000,23.489309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.426872,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.266844,0.000000,22.352000>}
box{<0,0,-0.203200><0.839972,0.035000,0.203200> rotate<0,0.000000,0> translate<33.426872,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.497597,0.000000,22.522741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.497597,0.000000,23.265256>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,90.000000,0> translate<33.497597,0.000000,23.265256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.497597,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.309284,0.000000,22.758400>}
box{<0,0,-0.203200><1.811688,0.035000,0.203200> rotate<0,0.000000,0> translate<33.497597,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.497597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.211647,0.000000,23.164800>}
box{<0,0,-0.203200><2.714050,0.035000,0.203200> rotate<0,0.000000,0> translate<33.497597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.601953,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720400,0.000000,19.100800>}
box{<0,0,-0.203200><3.118447,0.035000,0.203200> rotate<0,0.000000,0> translate<33.601953,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.610672,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.093472,0.000000,7.315200>}
box{<0,0,-0.203200><1.482800,0.035000,0.203200> rotate<0,0.000000,0> translate<33.610672,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.008353,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720400,0.000000,19.507200>}
box{<0,0,-0.203200><2.712047,0.035000,0.203200> rotate<0,0.000000,0> translate<34.008353,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.017072,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.384444,0.000000,7.721600>}
box{<0,0,-0.203200><1.367372,0.035000,0.203200> rotate<0,0.000000,0> translate<34.017072,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.022809,0.000000,22.107966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.280031,0.000000,22.365188>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.022809,0.000000,22.107966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.123472,0.000000,7.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.221891,0.000000,7.828000>}
box{<0,0,-0.203200><0.098419,0.035000,0.203200> rotate<0,0.000000,0> translate<34.123472,0.000000,7.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.196319,0.000000,13.258797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.251206,0.000000,13.391309>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,-67.495905,0> translate<34.196319,0.000000,13.258797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.221891,0.000000,7.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.843997,0.000000,8.450106>}
box{<0,0,-0.203200><0.879791,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.221891,0.000000,7.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.251206,0.000000,13.391309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.422688,0.000000,13.562791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.251206,0.000000,13.391309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.280031,0.000000,22.365188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.616112,0.000000,22.504397>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<34.280031,0.000000,22.365188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.414753,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.779363,0.000000,19.913600>}
box{<0,0,-0.203200><2.364609,0.035000,0.203200> rotate<0,0.000000,0> translate<34.414753,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.422688,0.000000,13.562791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.646741,0.000000,13.655597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<34.422688,0.000000,13.562791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.521891,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.790844,0.000000,8.128000>}
box{<0,0,-0.203200><1.268953,0.035000,0.203200> rotate<0,0.000000,0> translate<34.521891,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.616112,0.000000,22.504397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.000403,0.000000,22.504397>}
box{<0,0,-0.203200><0.384291,0.035000,0.203200> rotate<0,0.000000,0> translate<34.616112,0.000000,22.504397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.646741,0.000000,13.655597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.689256,0.000000,13.655597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<34.646741,0.000000,13.655597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,2.479866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.499866,0.000000,1.676400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<34.696400,0.000000,2.479866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,3.616131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,2.479866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.696400,0.000000,2.479866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,3.616131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.153600,0.000000,4.073331>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.696400,0.000000,3.616131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,5.781866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.153600,0.000000,5.324666>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<34.696400,0.000000,5.781866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,6.918131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,5.781866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.696400,0.000000,5.781866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.696400,0.000000,6.918131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.211191,0.000000,7.432919>}
box{<0,0,-0.203200><0.728022,0.035000,0.203200> rotate<0,-44.996856,0> translate<34.696400,0.000000,6.918131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.821153,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.917200,0.000000,20.320000>}
box{<0,0,-0.203200><2.096047,0.035000,0.203200> rotate<0,0.000000,0> translate<34.821153,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.843997,0.000000,8.450106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.843997,0.000000,9.050400>}
box{<0,0,-0.203200><0.600294,0.035000,0.203200> rotate<0,90.000000,0> translate<34.843997,0.000000,9.050400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.843997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.197244,0.000000,8.534400>}
box{<0,0,-0.203200><1.353247,0.035000,0.203200> rotate<0,0.000000,0> translate<34.843997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.843997,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.603644,0.000000,8.940800>}
box{<0,0,-0.203200><1.759647,0.035000,0.203200> rotate<0,0.000000,0> translate<34.843997,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.843997,0.000000,9.050400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.692094,0.000000,9.050400>}
box{<0,0,-0.203200><0.848097,0.035000,0.203200> rotate<0,0.000000,0> translate<34.843997,0.000000,9.050400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.000403,0.000000,22.504397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.013206,0.000000,22.535309>}
box{<0,0,-0.203200><0.033459,0.035000,0.203200> rotate<0,-67.497525,0> translate<35.000403,0.000000,22.504397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.013206,0.000000,22.535309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.184688,0.000000,22.706791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.013206,0.000000,22.535309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.079525,0.000000,20.578372>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.184688,0.000000,20.473206>}
box{<0,0,-0.203200><0.148724,0.035000,0.203200> rotate<0,44.997881,0> translate<35.079525,0.000000,20.578372> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.153600,0.000000,5.324666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.153600,0.000000,4.073331>}
box{<0,0,-0.203200><1.251334,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.153600,0.000000,4.073331> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.184688,0.000000,20.473206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.408741,0.000000,20.380400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<35.184688,0.000000,20.473206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.184688,0.000000,22.706791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.408741,0.000000,22.799597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.184688,0.000000,22.706791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.211191,0.000000,7.432919>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292809,0.000000,7.629966>}
box{<0,0,-0.203200><0.213282,0.035000,0.203200> rotate<0,-67.495728,0> translate<35.211191,0.000000,7.432919> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292809,0.000000,7.629966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.356809,0.000000,11.693966>}
box{<0,0,-0.203200><5.747364,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.292809,0.000000,7.629966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.408741,0.000000,20.380400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.451256,0.000000,20.380400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.408741,0.000000,20.380400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.408741,0.000000,22.799597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.846441,0.000000,22.799597>}
box{<0,0,-0.203200><0.437700,0.035000,0.203200> rotate<0,0.000000,0> translate<35.408741,0.000000,22.799597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.499866,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.636131,0.000000,1.676400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<35.499866,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.689256,0.000000,13.655597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.913309,0.000000,13.562791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<35.689256,0.000000,13.655597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.692094,0.000000,9.050400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.971278,0.000000,9.166041>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,-22.498282,0> translate<35.692094,0.000000,9.050400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.846441,0.000000,22.799597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.249247,0.000000,24.202400>}
box{<0,0,-0.203200><1.983865,0.035000,0.203200> rotate<0,-44.996966,0> translate<35.846441,0.000000,22.799597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.913309,0.000000,13.562791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.067997,0.000000,13.408100>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<35.913309,0.000000,13.562791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.971278,0.000000,9.166041>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.184956,0.000000,9.379719>}
box{<0,0,-0.203200><0.302187,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.971278,0.000000,9.166041> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.064900,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.071097,0.000000,13.411200>}
box{<0,0,-0.203200><0.006197,0.035000,0.203200> rotate<0,0.000000,0> translate<36.064900,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.067997,0.000000,13.408100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.222687,0.000000,13.562791>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.067997,0.000000,13.408100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.152438,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.010044,0.000000,9.347200>}
box{<0,0,-0.203200><0.857606,0.035000,0.203200> rotate<0,0.000000,0> translate<36.152438,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.184956,0.000000,9.379719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300597,0.000000,9.658903>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,-67.495778,0> translate<36.184956,0.000000,9.379719> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.222687,0.000000,13.562791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.446741,0.000000,13.655597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.222687,0.000000,13.562791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300597,0.000000,9.658903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300597,0.000000,10.629128>}
box{<0,0,-0.203200><0.970225,0.035000,0.203200> rotate<0,90.000000,0> translate<36.300597,0.000000,10.629128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.416444,0.000000,9.753600>}
box{<0,0,-0.203200><1.115847,0.035000,0.203200> rotate<0,0.000000,0> translate<36.300597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.822844,0.000000,10.160000>}
box{<0,0,-0.203200><1.522247,0.035000,0.203200> rotate<0,0.000000,0> translate<36.300597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.229244,0.000000,10.566400>}
box{<0,0,-0.203200><1.928647,0.035000,0.203200> rotate<0,0.000000,0> translate<36.300597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.300597,0.000000,10.629128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.907869,0.000000,11.236400>}
box{<0,0,-0.203200><0.858812,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.300597,0.000000,10.629128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.446741,0.000000,13.655597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.489256,0.000000,13.655597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<36.446741,0.000000,13.655597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.451256,0.000000,20.380400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.675309,0.000000,20.473206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.451256,0.000000,20.380400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.636131,0.000000,1.676400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,2.479866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.636131,0.000000,1.676400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.644269,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.635644,0.000000,10.972800>}
box{<0,0,-0.203200><1.991375,0.035000,0.203200> rotate<0,0.000000,0> translate<36.644269,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.675309,0.000000,20.473206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,20.627897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.675309,0.000000,20.473206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720400,0.000000,18.328741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.813206,0.000000,18.104688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<36.720400,0.000000,18.328741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720400,0.000000,19.771256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720400,0.000000,18.328741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.720400,0.000000,18.328741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720400,0.000000,19.771256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.813206,0.000000,19.995309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<36.720400,0.000000,19.771256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.813206,0.000000,18.104688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.984687,0.000000,17.933206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<36.813206,0.000000,18.104688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.813206,0.000000,19.995309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.917200,0.000000,20.099300>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<36.813206,0.000000,19.995309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,20.627897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.917200,0.000000,20.540697>}
box{<0,0,-0.203200><0.123319,0.035000,0.203200> rotate<0,44.997030,0> translate<36.830000,0.000000,20.627897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.907869,0.000000,11.236400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.489256,0.000000,11.236400>}
box{<0,0,-0.203200><0.581388,0.035000,0.203200> rotate<0,0.000000,0> translate<36.907869,0.000000,11.236400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.917200,0.000000,20.540697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.917200,0.000000,20.099300>}
box{<0,0,-0.203200><0.441397,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.917200,0.000000,20.099300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982397,0.000000,4.073331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982397,0.000000,5.324666>}
box{<0,0,-0.203200><1.251334,0.035000,0.203200> rotate<0,90.000000,0> translate<36.982397,0.000000,5.324666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982397,0.000000,4.073331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,3.616131>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<36.982397,0.000000,4.073331> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982397,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,4.470400>}
box{<0,0,-0.203200><12.700003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.982397,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,4.876800>}
box{<0,0,-0.203200><12.700003,0.035000,0.203200> rotate<0,0.000000,0> translate<36.982397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982397,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.785663,0.000000,5.283200>}
box{<0,0,-0.203200><1.803266,0.035000,0.203200> rotate<0,0.000000,0> translate<36.982397,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982397,0.000000,5.324666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,5.781866>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.982397,0.000000,5.324666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.984687,0.000000,17.933206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.208741,0.000000,17.840400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<36.984687,0.000000,17.933206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.991728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,4.064000>}
box{<0,0,-0.203200><12.690672,0.035000,0.203200> rotate<0,0.000000,0> translate<36.991728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.991731,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,2.032000>}
box{<0,0,-0.203200><10.319069,0.035000,0.203200> rotate<0,0.000000,0> translate<36.991731,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.208741,0.000000,17.840400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.790125,0.000000,17.840400>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,0.000000,0> translate<37.208741,0.000000,17.840400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.303441,0.000000,7.054284>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,6.918131>}
box{<0,0,-0.203200><0.192552,0.035000,0.203200> rotate<0,44.996373,0> translate<37.303441,0.000000,7.054284> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.303441,0.000000,7.054284>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.738050,0.000000,7.488897>}
box{<0,0,-0.203200><0.614633,0.035000,0.203200> rotate<0,-44.997236,0> translate<37.303441,0.000000,7.054284> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.347331,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.379263,0.000000,5.689600>}
box{<0,0,-0.203200><1.031931,0.035000,0.203200> rotate<0,0.000000,0> translate<37.347331,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.398128,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,3.657600>}
box{<0,0,-0.203200><12.284272,0.035000,0.203200> rotate<0,0.000000,0> translate<37.398128,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.398131,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.443359,0.000000,2.438400>}
box{<0,0,-0.203200><10.045228,0.035000,0.203200> rotate<0,0.000000,0> translate<37.398131,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,2.479866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,3.616131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<37.439597,0.000000,3.616131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.668800,0.000000,2.844800>}
box{<0,0,-0.203200><10.229203,0.035000,0.203200> rotate<0,0.000000,0> translate<37.439597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.107047,0.000000,3.251200>}
box{<0,0,-0.203200><10.667450,0.035000,0.203200> rotate<0,0.000000,0> translate<37.439597,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,5.781866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,6.918131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<37.439597,0.000000,6.918131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.972863,0.000000,6.096000>}
box{<0,0,-0.203200><0.533266,0.035000,0.203200> rotate<0,0.000000,0> translate<37.439597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.738050,0.000000,6.502400>}
box{<0,0,-0.203200><0.298453,0.035000,0.203200> rotate<0,0.000000,0> translate<37.439597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.439597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.738050,0.000000,6.908800>}
box{<0,0,-0.203200><0.298453,0.035000,0.203200> rotate<0,0.000000,0> translate<37.439597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.489256,0.000000,11.236400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.713309,0.000000,11.329206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<37.489256,0.000000,11.236400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.489256,0.000000,13.655597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.713309,0.000000,13.562791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<37.489256,0.000000,13.655597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.564353,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.738050,0.000000,7.315200>}
box{<0,0,-0.203200><0.173697,0.035000,0.203200> rotate<0,0.000000,0> translate<37.564353,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.625256,0.000000,40.821597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.849309,0.000000,40.728791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<37.625256,0.000000,40.821597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.713309,0.000000,11.329206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.884791,0.000000,11.500687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.713309,0.000000,11.329206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.713309,0.000000,13.562791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.884791,0.000000,13.391309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<37.713309,0.000000,13.562791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.738050,0.000000,6.330813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.842813,0.000000,5.226050>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,44.997030,0> translate<37.738050,0.000000,6.330813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.738050,0.000000,7.488897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.738050,0.000000,6.330813>}
box{<0,0,-0.203200><1.158084,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.738050,0.000000,6.330813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.763303,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.042044,0.000000,11.379200>}
box{<0,0,-0.203200><1.278741,0.035000,0.203200> rotate<0,0.000000,0> translate<37.763303,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.790125,0.000000,17.840400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,17.090125>}
box{<0,0,-0.203200><1.061049,0.035000,0.203200> rotate<0,44.997030,0> translate<37.790125,0.000000,17.840400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.849309,0.000000,40.728791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.020791,0.000000,40.557309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<37.849309,0.000000,40.728791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.864900,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.715641,0.000000,13.411200>}
box{<0,0,-0.203200><5.850741,0.035000,0.203200> rotate<0,0.000000,0> translate<37.864900,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.884791,0.000000,11.500687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.977597,0.000000,11.724741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<37.884791,0.000000,11.500687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.884791,0.000000,13.391309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.977597,0.000000,13.167256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<37.884791,0.000000,13.391309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.938100,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.380234,0.000000,40.640000>}
box{<0,0,-0.203200><9.442134,0.035000,0.203200> rotate<0,0.000000,0> translate<37.938100,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.977597,0.000000,11.724741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.977597,0.000000,13.167256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<37.977597,0.000000,13.167256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.977597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.448444,0.000000,11.785600>}
box{<0,0,-0.203200><1.470847,0.035000,0.203200> rotate<0,0.000000,0> translate<37.977597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.977597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.994653,0.000000,12.192000>}
box{<0,0,-0.203200><8.017056,0.035000,0.203200> rotate<0,0.000000,0> translate<37.977597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.977597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.451853,0.000000,12.598400>}
box{<0,0,-0.203200><8.474256,0.035000,0.203200> rotate<0,0.000000,0> translate<37.977597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.977597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.785859,0.000000,13.004800>}
box{<0,0,-0.203200><7.808262,0.035000,0.203200> rotate<0,0.000000,0> translate<37.977597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.020791,0.000000,40.557309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.075016,0.000000,40.426397>}
box{<0,0,-0.203200><0.141698,0.035000,0.203200> rotate<0,67.495819,0> translate<38.020791,0.000000,40.557309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.075016,0.000000,40.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.537891,0.000000,40.426397>}
box{<0,0,-0.203200><0.462875,0.035000,0.203200> rotate<0,0.000000,0> translate<38.075016,0.000000,40.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.537891,0.000000,40.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.662728,0.000000,40.441775>}
box{<0,0,-0.203200><0.125781,0.035000,0.203200> rotate<0,-7.022146,0> translate<38.537891,0.000000,40.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,14.376741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.633206,0.000000,14.152688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.540400,0.000000,14.376741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,17.090125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.540400,0.000000,14.376741>}
box{<0,0,-0.203200><2.713384,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.540400,0.000000,14.376741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.633206,0.000000,14.152688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.804688,0.000000,13.981206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<38.633206,0.000000,14.152688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.662728,0.000000,40.441775>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.718263,0.000000,40.426397>}
box{<0,0,-0.203200><0.057624,0.035000,0.203200> rotate<0,15.477018,0> translate<38.662728,0.000000,40.441775> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.718263,0.000000,40.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.775884,0.000000,40.426397>}
box{<0,0,-0.203200><0.057622,0.035000,0.203200> rotate<0,0.000000,0> translate<38.718263,0.000000,40.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.775884,0.000000,40.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.853581,0.000000,40.394213>}
box{<0,0,-0.203200><0.084099,0.035000,0.203200> rotate<0,22.499318,0> translate<38.775884,0.000000,40.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.804688,0.000000,13.981206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.028741,0.000000,13.888400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<38.804688,0.000000,13.981206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.842813,0.000000,5.226050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.405184,0.000000,5.226050>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,0.000000,0> translate<38.842813,0.000000,5.226050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.853581,0.000000,40.394213>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.030741,0.000000,40.467597>}
box{<0,0,-0.203200><0.191757,0.035000,0.203200> rotate<0,-22.499222,0> translate<38.853581,0.000000,40.394213> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.028741,0.000000,13.888400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.471256,0.000000,13.888400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<39.028741,0.000000,13.888400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.030741,0.000000,40.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.473256,0.000000,40.467597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<39.030741,0.000000,40.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.247100,0.000000,8.997947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.405184,0.000000,8.997947>}
box{<0,0,-0.203200><1.158084,0.035000,0.203200> rotate<0,0.000000,0> translate<39.247100,0.000000,8.997947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.247100,0.000000,8.997947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.510756,0.000000,10.261600>}
box{<0,0,-0.203200><1.787078,0.035000,0.203200> rotate<0,-44.996959,0> translate<39.247100,0.000000,8.997947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.356809,0.000000,11.693966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.614031,0.000000,11.951188>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.356809,0.000000,11.693966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.596353,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,9.347200>}
box{<0,0,-0.203200><9.019247,0.035000,0.203200> rotate<0,0.000000,0> translate<39.596353,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.614031,0.000000,11.951188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.950113,0.000000,12.090397>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<39.614031,0.000000,11.951188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.950113,0.000000,12.090397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.880347,0.000000,12.090397>}
box{<0,0,-0.203200><5.930234,0.035000,0.203200> rotate<0,0.000000,0> translate<39.950113,0.000000,12.090397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.002753,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,9.753600>}
box{<0,0,-0.203200><8.612847,0.035000,0.203200> rotate<0,0.000000,0> translate<40.002753,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.405184,0.000000,5.226050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.509947,0.000000,6.330813>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.405184,0.000000,5.226050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.405184,0.000000,8.997947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.509947,0.000000,7.893184>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,44.997030,0> translate<40.405184,0.000000,8.997947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.409153,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,10.160000>}
box{<0,0,-0.203200><8.206447,0.035000,0.203200> rotate<0,0.000000,0> translate<40.409153,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.462331,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.405666,0.000000,8.940800>}
box{<0,0,-0.203200><5.943334,0.035000,0.203200> rotate<0,0.000000,0> translate<40.462331,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.462334,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.405663,0.000000,5.283200>}
box{<0,0,-0.203200><5.943328,0.035000,0.203200> rotate<0,0.000000,0> translate<40.462334,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.471256,0.000000,13.888400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.695309,0.000000,13.981206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<40.471256,0.000000,13.888400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.473256,0.000000,40.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.697309,0.000000,40.374791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<40.473256,0.000000,40.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.510756,0.000000,10.261600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.201150,0.000000,10.261600>}
box{<0,0,-0.203200><5.690394,0.035000,0.203200> rotate<0,0.000000,0> translate<40.510756,0.000000,10.261600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.695309,0.000000,13.981206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.866791,0.000000,14.152688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.695309,0.000000,13.981206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.697309,0.000000,40.374791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.868791,0.000000,40.203309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<40.697309,0.000000,40.374791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.838500,0.000000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,40.233600>}
box{<0,0,-0.203200><6.472300,0.035000,0.203200> rotate<0,0.000000,0> translate<40.838500,0.000000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.866791,0.000000,14.152688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959597,0.000000,14.376741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<40.866791,0.000000,14.152688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.868731,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.999266,0.000000,8.534400>}
box{<0,0,-0.203200><5.130534,0.035000,0.203200> rotate<0,0.000000,0> translate<40.868731,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.868734,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.999263,0.000000,5.689600>}
box{<0,0,-0.203200><5.130528,0.035000,0.203200> rotate<0,0.000000,0> translate<40.868734,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.868791,0.000000,40.203309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,39.979256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<40.868791,0.000000,40.203309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.896328,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.902841,0.000000,14.224000>}
box{<0,0,-0.203200><2.006512,0.035000,0.203200> rotate<0,0.000000,0> translate<40.896328,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959597,0.000000,14.376741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959597,0.000000,16.167247>}
box{<0,0,-0.203200><1.790506,0.035000,0.203200> rotate<0,90.000000,0> translate<40.959597,0.000000,16.167247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.496441,0.000000,14.630400>}
box{<0,0,-0.203200><1.536844,0.035000,0.203200> rotate<0,0.000000,0> translate<40.959597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.090041,0.000000,15.036800>}
box{<0,0,-0.203200><1.130444,0.035000,0.203200> rotate<0,0.000000,0> translate<40.959597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.683641,0.000000,15.443200>}
box{<0,0,-0.203200><0.724044,0.035000,0.203200> rotate<0,0.000000,0> translate<40.959597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.277241,0.000000,15.849600>}
box{<0,0,-0.203200><0.317644,0.035000,0.203200> rotate<0,0.000000,0> translate<40.959597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.959597,0.000000,16.167247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.728031,0.000000,13.398809>}
box{<0,0,-0.203200><3.915160,0.035000,0.203200> rotate<0,44.997063,0> translate<40.959597,0.000000,16.167247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,37.917556>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,39.979256>}
box{<0,0,-0.203200><2.061700,0.035000,0.203200> rotate<0,90.000000,0> translate<40.961597,0.000000,39.979256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,37.917556>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.109553,0.000000,36.769597>}
box{<0,0,-0.203200><1.623458,0.035000,0.203200> rotate<0,44.997108,0> translate<40.961597,0.000000,37.917556> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,38.201600>}
box{<0,0,-0.203200><8.720803,0.035000,0.203200> rotate<0,0.000000,0> translate<40.961597,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.229678,0.000000,38.608000>}
box{<0,0,-0.203200><7.268081,0.035000,0.203200> rotate<0,0.000000,0> translate<40.961597,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.719597,0.000000,39.014400>}
box{<0,0,-0.203200><6.758000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.961597,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.464397,0.000000,39.420800>}
box{<0,0,-0.203200><6.502800,0.035000,0.203200> rotate<0,0.000000,0> translate<40.961597,0.000000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.961597,0.000000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,39.827200>}
box{<0,0,-0.203200><6.349203,0.035000,0.203200> rotate<0,0.000000,0> translate<40.961597,0.000000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.083953,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,37.795200>}
box{<0,0,-0.203200><8.598447,0.035000,0.203200> rotate<0,0.000000,0> translate<41.083953,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.275131,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.592866,0.000000,8.128000>}
box{<0,0,-0.203200><4.317734,0.035000,0.203200> rotate<0,0.000000,0> translate<41.275131,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.275134,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.592863,0.000000,6.096000>}
box{<0,0,-0.203200><4.317728,0.035000,0.203200> rotate<0,0.000000,0> translate<41.275134,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.490353,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,37.388800>}
box{<0,0,-0.203200><8.192047,0.035000,0.203200> rotate<0,0.000000,0> translate<41.490353,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.509947,0.000000,6.330813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.509947,0.000000,7.893184>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,90.000000,0> translate<41.509947,0.000000,7.893184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.509947,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,6.502400>}
box{<0,0,-0.203200><3.848103,0.035000,0.203200> rotate<0,0.000000,0> translate<41.509947,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.509947,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,6.908800>}
box{<0,0,-0.203200><3.848103,0.035000,0.203200> rotate<0,0.000000,0> translate<41.509947,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.509947,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,7.315200>}
box{<0,0,-0.203200><3.848103,0.035000,0.203200> rotate<0,0.000000,0> translate<41.509947,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.509947,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,7.721600>}
box{<0,0,-0.203200><3.848103,0.035000,0.203200> rotate<0,0.000000,0> translate<41.509947,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.896753,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,36.982400>}
box{<0,0,-0.203200><7.785647,0.035000,0.203200> rotate<0,0.000000,0> translate<41.896753,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.109553,0.000000,36.769597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.547256,0.000000,36.769597>}
box{<0,0,-0.203200><0.437703,0.035000,0.203200> rotate<0,0.000000,0> translate<42.109553,0.000000,36.769597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.547256,0.000000,36.769597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.771309,0.000000,36.676791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<42.547256,0.000000,36.769597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.771309,0.000000,36.676791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.942791,0.000000,36.505309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<42.771309,0.000000,36.676791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.872100,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,36.576000>}
box{<0,0,-0.203200><6.810300,0.035000,0.203200> rotate<0,0.000000,0> translate<42.872100,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,32.664397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,34.612294>}
box{<0,0,-0.203200><1.947897,0.035000,0.203200> rotate<0,90.000000,0> translate<42.940397,0.000000,34.612294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,32.664397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.948469,0.000000,32.664397>}
box{<0,0,-0.203200><3.008072,0.035000,0.203200> rotate<0,0.000000,0> translate<42.940397,0.000000,32.664397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.694463,0.000000,32.918400>}
box{<0,0,-0.203200><2.754066,0.035000,0.203200> rotate<0,0.000000,0> translate<42.940397,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,33.324800>}
box{<0,0,-0.203200><2.417653,0.035000,0.203200> rotate<0,0.000000,0> translate<42.940397,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,33.731200>}
box{<0,0,-0.203200><2.417653,0.035000,0.203200> rotate<0,0.000000,0> translate<42.940397,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,34.137600>}
box{<0,0,-0.203200><2.417653,0.035000,0.203200> rotate<0,0.000000,0> translate<42.940397,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,34.544000>}
box{<0,0,-0.203200><2.417653,0.035000,0.203200> rotate<0,0.000000,0> translate<42.940397,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.940397,0.000000,34.612294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.942791,0.000000,34.614688>}
box{<0,0,-0.203200><0.003385,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.940397,0.000000,34.612294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.942791,0.000000,34.614688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.035597,0.000000,34.838741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<42.942791,0.000000,34.614688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.942791,0.000000,36.505309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.035597,0.000000,36.281256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.942791,0.000000,36.505309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.035597,0.000000,34.838741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.035597,0.000000,36.281256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<43.035597,0.000000,36.281256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.035597,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.491266,0.000000,34.950400>}
box{<0,0,-0.203200><2.455669,0.035000,0.203200> rotate<0,0.000000,0> translate<43.035597,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.035597,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.897666,0.000000,35.356800>}
box{<0,0,-0.203200><2.862069,0.035000,0.203200> rotate<0,0.000000,0> translate<43.035597,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.035597,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.304066,0.000000,35.763200>}
box{<0,0,-0.203200><3.268469,0.035000,0.203200> rotate<0,0.000000,0> translate<43.035597,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.035597,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,36.169600>}
box{<0,0,-0.203200><6.646803,0.035000,0.203200> rotate<0,0.000000,0> translate<43.035597,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.728031,0.000000,13.398809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.064113,0.000000,13.259600>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,22.498510,0> translate<43.728031,0.000000,13.398809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.064113,0.000000,13.259600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.427884,0.000000,13.259600>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,0.000000,0> translate<44.064113,0.000000,13.259600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.427884,0.000000,13.259600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.531063,0.000000,13.259600>}
box{<0,0,-0.203200><1.103178,0.035000,0.203200> rotate<0,0.000000,0> translate<44.427884,0.000000,13.259600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,6.330813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.462813,0.000000,5.226050>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,44.997030,0> translate<45.358050,0.000000,6.330813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,7.893184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,6.330813>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.358050,0.000000,6.330813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,7.893184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.462813,0.000000,8.997947>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.358050,0.000000,7.893184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,33.254812>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.948469,0.000000,32.664397>}
box{<0,0,-0.203200><0.834976,0.035000,0.203200> rotate<0,44.996879,0> translate<45.358050,0.000000,33.254812> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,34.817184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,33.254812>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.358050,0.000000,33.254812> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.358050,0.000000,34.817184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.462813,0.000000,35.921947>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.358050,0.000000,34.817184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.531063,0.000000,13.259600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.115259,0.000000,12.675400>}
box{<0,0,-0.203200><0.826181,0.035000,0.203200> rotate<0,44.997183,0> translate<45.531063,0.000000,13.259600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.880347,0.000000,12.090397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.538478,0.000000,12.675400>}
box{<0,0,-0.203200><0.880548,0.035000,0.203200> rotate<0,-41.630673,0> translate<45.880347,0.000000,12.090397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.115259,0.000000,12.675400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.538478,0.000000,12.675400>}
box{<0,0,-0.203200><0.423219,0.035000,0.203200> rotate<0,0.000000,0> translate<46.115259,0.000000,12.675400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.201150,0.000000,10.261600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355875,0.000000,10.252497>}
box{<0,0,-0.203200><0.154993,0.035000,0.203200> rotate<0,3.366849,0> translate<46.201150,0.000000,10.261600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355875,0.000000,10.252497>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.382109,0.000000,10.261600>}
box{<0,0,-0.203200><0.027769,0.035000,0.203200> rotate<0,-19.135115,0> translate<46.355875,0.000000,10.252497> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.382109,0.000000,10.261600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.409884,0.000000,10.261600>}
box{<0,0,-0.203200><0.027775,0.035000,0.203200> rotate<0,0.000000,0> translate<46.382109,0.000000,10.261600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.409884,0.000000,10.261600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.553119,0.000000,10.320931>}
box{<0,0,-0.203200><0.155036,0.035000,0.203200> rotate<0,-22.499071,0> translate<46.409884,0.000000,10.261600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.462813,0.000000,5.226050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.025184,0.000000,5.226050>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,0.000000,0> translate<46.462813,0.000000,5.226050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.462813,0.000000,8.997947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.025184,0.000000,8.997947>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,0.000000,0> translate<46.462813,0.000000,8.997947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.462813,0.000000,35.921947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.025184,0.000000,35.921947>}
box{<0,0,-0.203200><1.562372,0.035000,0.203200> rotate<0,0.000000,0> translate<46.462813,0.000000,35.921947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.553119,0.000000,10.320931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.699550,0.000000,10.371731>}
box{<0,0,-0.203200><0.154993,0.035000,0.203200> rotate<0,-19.131445,0> translate<46.553119,0.000000,10.320931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.699550,0.000000,10.371731>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.720300,0.000000,10.390181>}
box{<0,0,-0.203200><0.027766,0.035000,0.203200> rotate<0,-41.639359,0> translate<46.699550,0.000000,10.371731> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.720300,0.000000,10.390181>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.745966,0.000000,10.400809>}
box{<0,0,-0.203200><0.027779,0.035000,0.203200> rotate<0,-22.492942,0> translate<46.720300,0.000000,10.390181> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.745966,0.000000,10.400809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.855600,0.000000,10.510447>}
box{<0,0,-0.203200><0.155049,0.035000,0.203200> rotate<0,-44.997847,0> translate<46.745966,0.000000,10.400809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.855600,0.000000,10.510447>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,12.074891>}
box{<0,0,-0.203200><2.354800,0.035000,0.203200> rotate<0,-41.630779,0> translate<46.855600,0.000000,10.510447> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.918547,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,10.566400>}
box{<0,0,-0.203200><1.697053,0.035000,0.203200> rotate<0,0.000000,0> translate<46.918547,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,1.437619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.548572,0.000000,0.863597>}
box{<0,0,-0.203200><0.621318,0.035000,0.203200> rotate<0,67.495185,0> translate<47.310800,0.000000,1.437619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,2.118378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,1.437619>}
box{<0,0,-0.203200><0.680759,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.310800,0.000000,1.437619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,2.118378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.571316,0.000000,2.747316>}
box{<0,0,-0.203200><0.680757,0.035000,0.203200> rotate<0,-67.495453,0> translate<47.310800,0.000000,2.118378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,39.791619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.571316,0.000000,39.162681>}
box{<0,0,-0.203200><0.680757,0.035000,0.203200> rotate<0,67.495453,0> translate<47.310800,0.000000,39.791619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,40.472378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,39.791619>}
box{<0,0,-0.203200><0.680759,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.310800,0.000000,39.791619> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310800,0.000000,40.472378>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.548572,0.000000,41.046400>}
box{<0,0,-0.203200><0.621318,0.035000,0.203200> rotate<0,-67.495185,0> translate<47.310800,0.000000,40.472378> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.375747,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,10.972800>}
box{<0,0,-0.203200><1.239853,0.035000,0.203200> rotate<0,0.000000,0> translate<47.375747,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.571316,0.000000,2.747316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.052681,0.000000,3.228681>}
box{<0,0,-0.203200><0.680754,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.571316,0.000000,2.747316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.571316,0.000000,39.162681>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.052681,0.000000,38.681316>}
box{<0,0,-0.203200><0.680754,0.035000,0.203200> rotate<0,44.997030,0> translate<47.571316,0.000000,39.162681> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.832947,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,11.379200>}
box{<0,0,-0.203200><0.782653,0.035000,0.203200> rotate<0,0.000000,0> translate<47.832947,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.025184,0.000000,5.226050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,6.330813>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.025184,0.000000,5.226050> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.025184,0.000000,8.997947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.184897,0.000000,8.838231>}
box{<0,0,-0.203200><0.225870,0.035000,0.203200> rotate<0,44.997591,0> translate<48.025184,0.000000,8.997947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.025184,0.000000,35.921947>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,34.817184>}
box{<0,0,-0.203200><1.562370,0.035000,0.203200> rotate<0,44.997030,0> translate<48.025184,0.000000,35.921947> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.052681,0.000000,3.228681>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.681619,0.000000,3.489197>}
box{<0,0,-0.203200><0.680757,0.035000,0.203200> rotate<0,-22.498607,0> translate<48.052681,0.000000,3.228681> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.052681,0.000000,38.681316>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.681619,0.000000,38.420800>}
box{<0,0,-0.203200><0.680757,0.035000,0.203200> rotate<0,22.498607,0> translate<48.052681,0.000000,38.681316> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.082331,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.338750,0.000000,8.940800>}
box{<0,0,-0.203200><0.256419,0.035000,0.203200> rotate<0,0.000000,0> translate<48.082331,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.082334,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,5.283200>}
box{<0,0,-0.203200><1.600066,0.035000,0.203200> rotate<0,0.000000,0> translate<48.082334,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.183931,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,35.763200>}
box{<0,0,-0.203200><1.498469,0.035000,0.203200> rotate<0,0.000000,0> translate<48.183931,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.184897,0.000000,8.838231>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,9.125369>}
box{<0,0,-0.203200><0.517642,0.035000,0.203200> rotate<0,-33.688036,0> translate<48.184897,0.000000,8.838231> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.290147,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,11.785600>}
box{<0,0,-0.203200><0.325453,0.035000,0.203200> rotate<0,0.000000,0> translate<48.290147,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.488734,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,5.689600>}
box{<0,0,-0.203200><1.193666,0.035000,0.203200> rotate<0,0.000000,0> translate<48.488734,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.590331,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,35.356800>}
box{<0,0,-0.203200><1.092069,0.035000,0.203200> rotate<0,0.000000,0> translate<48.590331,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,12.074891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.615600,0.000000,9.125369>}
box{<0,0,-0.203200><2.949522,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.615600,0.000000,9.125369> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.681619,0.000000,3.489197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.362378,0.000000,3.489197>}
box{<0,0,-0.203200><0.680759,0.035000,0.203200> rotate<0,0.000000,0> translate<48.681619,0.000000,3.489197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.681619,0.000000,38.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.362378,0.000000,38.420800>}
box{<0,0,-0.203200><0.680759,0.035000,0.203200> rotate<0,0.000000,0> translate<48.681619,0.000000,38.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895134,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,6.096000>}
box{<0,0,-0.203200><0.787266,0.035000,0.203200> rotate<0,0.000000,0> translate<48.895134,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.996731,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,34.950400>}
box{<0,0,-0.203200><0.685669,0.035000,0.203200> rotate<0,0.000000,0> translate<48.996731,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,6.330813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,7.270328>}
box{<0,0,-0.203200><0.939516,0.035000,0.203200> rotate<0,90.000000,0> translate<49.129947,0.000000,7.270328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,6.502400>}
box{<0,0,-0.203200><0.552453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.129947,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,6.908800>}
box{<0,0,-0.203200><0.552453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.129947,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,7.270328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,7.638634>}
box{<0,0,-0.203200><0.663968,0.035000,0.203200> rotate<0,-33.688143,0> translate<49.129947,0.000000,7.270328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,33.623669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,34.817184>}
box{<0,0,-0.203200><1.193516,0.035000,0.203200> rotate<0,90.000000,0> translate<49.129947,0.000000,34.817184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,33.623669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,33.255366>}
box{<0,0,-0.203200><0.663967,0.035000,0.203200> rotate<0,33.687919,0> translate<49.129947,0.000000,33.623669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,33.731200>}
box{<0,0,-0.203200><0.552453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.129947,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,34.137600>}
box{<0,0,-0.203200><0.552453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.129947,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.129947,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,34.544000>}
box{<0,0,-0.203200><0.552453,0.035000,0.203200> rotate<0,0.000000,0> translate<49.129947,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.197253,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,7.315200>}
box{<0,0,-0.203200><0.485147,0.035000,0.203200> rotate<0,0.000000,0> translate<49.197253,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.362378,0.000000,3.489197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,3.356638>}
box{<0,0,-0.203200><0.346390,0.035000,0.203200> rotate<0,22.498817,0> translate<49.362378,0.000000,3.489197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.362378,0.000000,38.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,38.553359>}
box{<0,0,-0.203200><0.346390,0.035000,0.203200> rotate<0,-22.498817,0> translate<49.362378,0.000000,38.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.578250,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,33.324800>}
box{<0,0,-0.203200><0.104150,0.035000,0.203200> rotate<0,0.000000,0> translate<49.578250,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,7.638634>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,3.356638>}
box{<0,0,-0.203200><4.281997,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.682400,0.000000,3.356638> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,38.553359>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.682400,0.000000,33.255366>}
box{<0,0,-0.203200><5.297994,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.682400,0.000000,33.255366> }
texture{col_pol}
}
#end
union{
cylinder{<47.244000,0.038000,34.036000><47.244000,-1.538000,34.036000>0.850900}
cylinder{<39.624000,0.038000,34.036000><39.624000,-1.538000,34.036000>0.850900}
cylinder{<4.064000,0.038000,34.036000><4.064000,-1.538000,34.036000>0.850900}
cylinder{<11.684000,0.038000,34.036000><11.684000,-1.538000,34.036000>0.850900}
cylinder{<4.064000,0.038000,7.112000><4.064000,-1.538000,7.112000>0.850900}
cylinder{<11.684000,0.038000,7.112000><11.684000,-1.538000,7.112000>0.850900}
cylinder{<47.244000,0.038000,7.112000><47.244000,-1.538000,7.112000>0.850900}
cylinder{<39.624000,0.038000,7.112000><39.624000,-1.538000,7.112000>0.850900}
cylinder{<46.736000,0.038000,26.974000><46.736000,-1.538000,26.974000>0.508000}
cylinder{<46.736000,0.038000,14.174000><46.736000,-1.538000,14.174000>0.508000}
cylinder{<15.240000,0.038000,3.048000><15.240000,-1.538000,3.048000>0.508000}
cylinder{<17.780000,0.038000,3.048000><17.780000,-1.538000,3.048000>0.508000}
cylinder{<20.320000,0.038000,3.048000><20.320000,-1.538000,3.048000>0.508000}
cylinder{<22.860000,0.038000,3.048000><22.860000,-1.538000,3.048000>0.508000}
cylinder{<8.128000,0.038000,26.924000><8.128000,-1.538000,26.924000>0.508000}
cylinder{<8.128000,0.038000,24.384000><8.128000,-1.538000,24.384000>0.508000}
cylinder{<5.588000,0.038000,26.924000><5.588000,-1.538000,26.924000>0.508000}
cylinder{<5.588000,0.038000,24.384000><5.588000,-1.538000,24.384000>0.508000}
cylinder{<3.048000,0.038000,26.924000><3.048000,-1.538000,26.924000>0.508000}
cylinder{<3.048000,0.038000,24.384000><3.048000,-1.538000,24.384000>0.508000}
cylinder{<15.240000,0.038000,6.350000><15.240000,-1.538000,6.350000>0.508000}
cylinder{<17.780000,0.038000,6.350000><17.780000,-1.538000,6.350000>0.508000}
cylinder{<20.320000,0.038000,6.350000><20.320000,-1.538000,6.350000>0.508000}
cylinder{<22.860000,0.038000,6.350000><22.860000,-1.538000,6.350000>0.508000}
cylinder{<28.448000,0.038000,6.350000><28.448000,-1.538000,6.350000>0.508000}
cylinder{<30.988000,0.038000,6.350000><30.988000,-1.538000,6.350000>0.508000}
cylinder{<33.528000,0.038000,6.350000><33.528000,-1.538000,6.350000>0.508000}
cylinder{<36.068000,0.038000,6.350000><36.068000,-1.538000,6.350000>0.508000}
cylinder{<28.448000,0.038000,3.048000><28.448000,-1.538000,3.048000>0.508000}
cylinder{<30.988000,0.038000,3.048000><30.988000,-1.538000,3.048000>0.508000}
cylinder{<33.528000,0.038000,3.048000><33.528000,-1.538000,3.048000>0.508000}
cylinder{<36.068000,0.038000,3.048000><36.068000,-1.538000,3.048000>0.508000}
cylinder{<5.334000,0.038000,20.574000><5.334000,-1.538000,20.574000>0.508000}
cylinder{<2.794000,0.038000,20.574000><2.794000,-1.538000,20.574000>0.508000}
//Holes(fast)/Vias
cylinder{<25.654000,0.038000,3.810000><25.654000,-1.538000,3.810000>0.300000 }
cylinder{<18.288000,0.038000,14.732000><18.288000,-1.538000,14.732000>0.300000 }
cylinder{<28.448000,0.038000,8.890000><28.448000,-1.538000,8.890000>0.300000 }
cylinder{<33.782000,0.038000,8.890000><33.782000,-1.538000,8.890000>0.300000 }
cylinder{<20.066000,0.038000,11.176000><20.066000,-1.538000,11.176000>0.300000 }
cylinder{<22.606000,0.038000,14.224000><22.606000,-1.538000,14.224000>0.300000 }
cylinder{<21.590000,0.038000,14.986000><21.590000,-1.538000,14.986000>0.300000 }
cylinder{<26.924000,0.038000,18.796000><26.924000,-1.538000,18.796000>0.300000 }
cylinder{<25.654000,0.038000,18.542000><25.654000,-1.538000,18.542000>0.300000 }
cylinder{<24.384000,0.038000,18.542000><24.384000,-1.538000,18.542000>0.300000 }
cylinder{<22.860000,0.038000,18.542000><22.860000,-1.538000,18.542000>0.300000 }
cylinder{<21.590000,0.038000,19.050000><21.590000,-1.538000,19.050000>0.300000 }
cylinder{<21.590000,0.038000,10.160000><21.590000,-1.538000,10.160000>0.300000 }
cylinder{<40.132000,0.038000,18.288000><40.132000,-1.538000,18.288000>0.300000 }
cylinder{<28.575000,0.038000,28.067000><28.575000,-1.538000,28.067000>0.300000 }
cylinder{<28.448000,0.038000,11.430000><28.448000,-1.538000,11.430000>0.300000 }
cylinder{<31.496000,0.038000,27.686000><31.496000,-1.538000,27.686000>0.300000 }
cylinder{<21.336000,0.038000,31.496000><21.336000,-1.538000,31.496000>0.300000 }
cylinder{<19.304000,0.038000,31.496000><19.304000,-1.538000,31.496000>0.300000 }
cylinder{<22.352000,0.038000,29.464000><22.352000,-1.538000,29.464000>0.300000 }
cylinder{<19.304000,0.038000,29.464000><19.304000,-1.538000,29.464000>0.300000 }
cylinder{<25.146000,0.038000,9.144000><25.146000,-1.538000,9.144000>0.300000 }
cylinder{<23.368000,0.038000,27.432000><23.368000,-1.538000,27.432000>0.300000 }
cylinder{<19.304000,0.038000,27.432000><19.304000,-1.538000,27.432000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.008100,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.130969,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<14.008100,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.130969,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.376713,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.130969,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.376713,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.499584,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<14.376713,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.499584,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.499584,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.499584,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.499584,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.376713,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.376713,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.376713,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.253841,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<14.253841,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.376713,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.499584,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<14.376713,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.499584,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.499584,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.499584,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.499584,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.376713,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<14.376713,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.376713,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.130969,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.130969,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.130969,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.008100,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<14.008100,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.756516,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.756516,0.000000,1.045841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.756516,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.756516,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.002256,0.000000,0.800100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<14.756516,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.002256,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.248000,0.000000,1.045841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<15.002256,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.248000,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.248000,0.000000,1.537328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<15.248000,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.504931,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.627800,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<15.504931,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.627800,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.873544,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.627800,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.873544,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.996416,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.873544,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.996416,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.996416,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.996416,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.996416,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.873544,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.873544,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.873544,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.750672,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<15.750672,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.873544,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.996416,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.873544,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.996416,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.996416,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.996416,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.996416,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.873544,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<15.873544,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.873544,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.627800,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.627800,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.627800,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.504931,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<15.504931,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.493247,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370375,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.370375,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370375,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.124631,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.124631,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.124631,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.001763,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<17.001763,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.001763,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.001763,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.001763,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.001763,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.124631,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<17.001763,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.124631,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370375,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.124631,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.370375,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.493247,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<17.370375,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.493247,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.493247,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<17.493247,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.493247,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.247503,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.247503,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.750178,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.750178,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<17.750178,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.750178,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.241663,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<17.750178,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.241663,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.241663,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.241663,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.498594,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.498594,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.498594,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.498594,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.867206,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<18.498594,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.867206,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.990078,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<18.867206,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.990078,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.990078,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<18.990078,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.990078,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.867206,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.867206,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.867206,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.498594,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<18.498594,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.486909,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.364038,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<20.364038,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.364038,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.118294,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<20.118294,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.118294,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.995425,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<19.995425,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.995425,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.995425,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.995425,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.995425,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.118294,0.000000,1.168713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<19.995425,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.118294,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.364038,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<20.118294,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.364038,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.486909,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<20.364038,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.486909,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.486909,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.486909,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.486909,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.364038,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<20.364038,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.364038,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.118294,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<20.118294,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.118294,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.995425,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<19.995425,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.743841,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.743841,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.743841,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.743841,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.112453,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<20.743841,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.112453,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.235325,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<21.112453,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.235325,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.235325,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<21.235325,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.235325,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.112453,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.112453,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.112453,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.743841,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<20.743841,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.492256,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.492256,0.000000,1.291584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<21.492256,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.492256,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.737997,0.000000,1.537328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<21.492256,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.737997,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.983741,0.000000,1.291584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<21.737997,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.983741,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.983741,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.983741,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.492256,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.983741,0.000000,1.168713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<21.492256,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.480572,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.357700,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<23.357700,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.357700,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.111956,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.111956,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.111956,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.989088,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<22.989088,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.989088,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.989088,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.989088,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.989088,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.111956,0.000000,1.168713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<22.989088,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.111956,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.357700,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.111956,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.357700,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.480572,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<23.357700,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.480572,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.480572,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.480572,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.480572,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.357700,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<23.357700,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.357700,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.111956,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.111956,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.111956,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.989088,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<22.989088,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.228988,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.106116,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<24.106116,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.106116,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.860372,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.860372,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.860372,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.737503,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<23.737503,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.737503,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.737503,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.737503,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.737503,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.860372,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<23.737503,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.860372,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.106116,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.860372,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.106116,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.228988,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<24.106116,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.485919,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.485919,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.485919,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.485919,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.977403,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<24.485919,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.516100,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.638969,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<14.516100,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.638969,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.884713,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.638969,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.884713,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.007584,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<14.884713,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.007584,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.007584,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.007584,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.007584,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.884713,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.884713,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.884713,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.761841,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<14.761841,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.884713,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.007584,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<14.884713,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.007584,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.007584,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.007584,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.007584,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.884713,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<14.884713,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.884713,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.638969,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.638969,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.638969,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.516100,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<14.516100,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.264516,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.264516,0.000000,8.157841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.264516,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.264516,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.510256,0.000000,7.912100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<15.264516,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.510256,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.756000,0.000000,8.157841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<15.510256,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.756000,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.756000,0.000000,8.649328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<15.756000,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.012931,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.135800,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<16.012931,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.135800,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.381544,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.135800,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.381544,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.504416,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.381544,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.504416,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.504416,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.504416,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.504416,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.381544,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.381544,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.381544,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.258672,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<16.258672,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.381544,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.504416,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.381544,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.504416,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.504416,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.504416,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.504416,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.381544,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<16.381544,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.381544,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.135800,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.135800,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.135800,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.012931,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<16.012931,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.001247,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.878375,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.878375,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.878375,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.632631,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.632631,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.632631,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.509763,0.000000,8.526456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<17.509763,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.509763,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.509763,0.000000,8.034969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.509763,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.509763,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.632631,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<17.509763,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.632631,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.878375,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.632631,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.878375,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.001247,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<17.878375,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.001247,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.001247,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<18.001247,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.001247,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.755503,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.755503,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.258178,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.258178,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.258178,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.258178,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.749662,0.000000,7.912100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<18.258178,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.749662,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.749662,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.749662,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.006594,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.006594,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.006594,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.006594,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.375206,0.000000,7.912100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<19.006594,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.375206,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.498078,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<19.375206,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.498078,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.498078,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<19.498078,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.498078,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.375206,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<19.375206,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.375206,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.006594,0.000000,8.649328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<19.006594,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.503425,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.503425,0.000000,8.403584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<20.503425,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.503425,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.749166,0.000000,8.649328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<20.503425,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.749166,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.994909,0.000000,8.403584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<20.749166,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.994909,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.994909,0.000000,7.912100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.994909,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.503425,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.994909,0.000000,8.280712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<20.503425,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.743325,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.497581,0.000000,8.526456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<21.497581,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.497581,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.251841,0.000000,8.280712>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<21.251841,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.251841,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.251841,0.000000,8.034969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.251841,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.251841,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.374709,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<21.251841,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.374709,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.620453,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.374709,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.620453,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.743325,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<21.620453,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.743325,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.743325,0.000000,8.157841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<21.743325,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.743325,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.620453,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.620453,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.620453,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.251841,0.000000,8.280712>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<21.251841,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.748672,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.748672,0.000000,8.403584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<22.748672,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.748672,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.994413,0.000000,8.649328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<22.748672,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.994413,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.240156,0.000000,8.403584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<22.994413,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.240156,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.240156,0.000000,7.912100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.240156,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.748672,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.240156,0.000000,8.280712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<22.748672,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.497088,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.988572,0.000000,8.649328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<23.497088,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.988572,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.988572,0.000000,8.526456>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.988572,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.988572,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.497088,0.000000,8.034969>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<23.497088,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.497088,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.497088,0.000000,7.912100>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.497088,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.216100,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.216100,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.216100,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.216100,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.584713,0.000000,7.912100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<27.216100,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.584713,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.707584,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<27.584713,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.707584,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.707584,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<27.707584,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.707584,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.584713,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<27.584713,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.584713,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.216100,0.000000,8.649328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<27.216100,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.456000,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.964516,0.000000,8.649328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<27.964516,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.964516,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.964516,0.000000,8.280712>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.964516,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.964516,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.210256,0.000000,8.403584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,-26.563589,0> translate<27.964516,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.210256,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.333128,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<28.210256,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.333128,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.456000,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<28.333128,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.456000,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.456000,0.000000,8.034969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.456000,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.456000,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.333128,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<28.333128,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.333128,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.087384,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<28.087384,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.087384,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.964516,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<27.964516,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.461347,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.461347,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.461347,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.461347,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.829959,0.000000,7.912100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<29.461347,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.829959,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.952831,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<29.829959,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.952831,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.952831,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<29.952831,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.952831,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.829959,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<29.829959,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.829959,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.461347,0.000000,8.649328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<29.461347,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.701247,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.455503,0.000000,8.526456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<30.455503,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.455503,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.209763,0.000000,8.280712>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<30.209763,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.209763,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.209763,0.000000,8.034969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.209763,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.209763,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.332631,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<30.209763,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.332631,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.578375,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<30.332631,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.578375,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.701247,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<30.578375,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.701247,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.701247,0.000000,8.157841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<30.701247,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.701247,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.578375,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<30.578375,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.578375,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.209763,0.000000,8.280712>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<30.209763,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.694909,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.572038,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<33.572038,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.572038,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.326294,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<33.326294,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.326294,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.203425,0.000000,8.526456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<33.203425,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.203425,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.203425,0.000000,8.034969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.203425,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.203425,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.326294,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<33.203425,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.326294,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.572038,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<33.326294,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.572038,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.694909,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<33.572038,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.694909,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.694909,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<33.694909,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.694909,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.449166,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<33.449166,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.951841,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.951841,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<33.951841,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.951841,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.443325,0.000000,7.912100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<33.951841,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.443325,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.443325,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<34.443325,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.700256,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.700256,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.700256,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.700256,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.068869,0.000000,7.912100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<34.700256,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.068869,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.191741,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<35.068869,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.191741,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.191741,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<35.191741,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.191741,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.068869,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<35.068869,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.068869,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.700256,0.000000,8.649328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<34.700256,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.197088,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.319956,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<36.197088,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.319956,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.565700,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.319956,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.565700,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.688572,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.565700,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.688572,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.688572,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.688572,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.688572,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.565700,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.565700,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.565700,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.442828,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<36.442828,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.565700,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.688572,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.565700,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.688572,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.688572,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.688572,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.688572,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.565700,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<36.565700,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.565700,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.319956,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.319956,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.319956,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.197088,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<36.197088,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.945503,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.945503,0.000000,8.157841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.945503,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.945503,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.191244,0.000000,7.912100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<36.945503,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.191244,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.436988,0.000000,8.157841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<37.191244,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.436988,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.436988,0.000000,8.649328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<37.436988,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.693919,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.816788,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<37.693919,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.816788,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.062531,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<37.816788,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.062531,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.185403,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.062531,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.185403,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.185403,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.185403,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.185403,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.062531,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.062531,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.062531,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.939659,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<37.939659,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.062531,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.185403,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.062531,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.185403,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.185403,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.185403,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.185403,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.062531,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<38.062531,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.062531,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.816788,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<37.816788,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.816788,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.693919,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<37.693919,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.200100,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.200100,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<26.200100,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.200100,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.568713,0.000000,1.537328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<26.200100,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.568713,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.691584,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<26.568713,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.691584,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.691584,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.691584,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.691584,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.568713,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.568713,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.568713,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.691584,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<26.568713,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.691584,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.691584,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.691584,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.691584,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.568713,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<26.568713,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.568713,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.200100,0.000000,0.800100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<26.200100,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.200100,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.568713,0.000000,1.168713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<26.200100,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.948516,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.948516,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<26.948516,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.948516,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.071384,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<26.948516,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.071384,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.317128,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<27.071384,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.317128,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440000,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<27.317128,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440000,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440000,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.440000,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440000,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.317128,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<27.317128,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.317128,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.071384,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<27.071384,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.071384,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.948516,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<26.948516,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.948516,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.440000,0.000000,1.414456>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<26.948516,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.696931,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.188416,0.000000,1.537328>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<27.696931,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.445347,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.445347,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<28.445347,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.445347,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.813959,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<28.445347,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.813959,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.936831,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<28.813959,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.936831,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.936831,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.936831,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.936831,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.813959,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.813959,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.813959,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.445347,0.000000,1.045841>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<28.445347,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.691088,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.936831,0.000000,0.800100>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<28.691088,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.193763,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.685247,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<29.193763,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.685247,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.193763,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<29.193763,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.690594,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.690594,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<30.690594,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.690594,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.059206,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<30.690594,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.059206,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.182078,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<31.059206,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.182078,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.182078,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.182078,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.182078,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.059206,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.059206,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.059206,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.182078,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<31.059206,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.182078,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.182078,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.182078,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.182078,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.059206,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<31.059206,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.059206,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.690594,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<30.690594,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.690594,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.059206,0.000000,1.168713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<30.690594,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.439009,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.684750,0.000000,1.537328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<31.439009,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.684750,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.684750,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.684750,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.439009,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.930494,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<31.439009,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.187425,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.678909,0.000000,1.537328>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<32.187425,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181581,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.181581,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<33.181581,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.935841,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.427325,0.000000,1.537328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<32.935841,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.684256,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.175741,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<33.684256,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.175741,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.684256,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<33.684256,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.672572,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.549700,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<35.549700,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.549700,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.303956,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.303956,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.303956,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.181088,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<35.181088,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.181088,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.181088,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.181088,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.181088,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.303956,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<35.181088,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.303956,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.549700,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.303956,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.549700,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.672572,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<35.549700,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.672572,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.672572,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<35.672572,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.672572,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.426828,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.426828,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.929503,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.929503,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<35.929503,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.929503,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.420988,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<35.929503,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.420988,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.420988,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<36.420988,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.677919,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.677919,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.677919,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.677919,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.046531,0.000000,0.800100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<36.677919,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.046531,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.169403,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<37.046531,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.169403,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.169403,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<37.169403,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.169403,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.046531,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<37.046531,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.046531,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.677919,0.000000,1.537328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<36.677919,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.174750,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.297619,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<38.174750,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.297619,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.543363,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.297619,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.543363,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.666234,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.543363,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.666234,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.666234,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.666234,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.666234,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.543363,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.543363,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.543363,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.420491,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<38.420491,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.543363,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.666234,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.543363,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.666234,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.666234,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.666234,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.666234,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.543363,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<38.543363,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.543363,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.297619,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.297619,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.297619,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.174750,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<38.174750,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.923166,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.923166,0.000000,1.045841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.923166,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.923166,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.168906,0.000000,0.800100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<38.923166,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.168906,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.414650,0.000000,1.045841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<39.168906,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.414650,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.414650,0.000000,1.537328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<39.414650,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.671581,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.794450,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<39.671581,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.794450,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.040194,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.794450,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.040194,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.163066,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.040194,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.163066,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.163066,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.163066,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.163066,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.040194,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.040194,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.040194,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.917322,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<39.917322,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.040194,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.163066,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.040194,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.163066,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.163066,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.163066,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.163066,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.040194,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<40.040194,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.040194,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.794450,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.794450,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.794450,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.671581,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<39.671581,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.832344,0.000000,15.261584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709472,0.000000,15.138713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.709472,0.000000,15.138713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709472,0.000000,15.138713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709472,0.000000,14.892969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.709472,0.000000,14.892969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709472,0.000000,14.892969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.832344,0.000000,14.770100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.709472,0.000000,14.892969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.832344,0.000000,14.770100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,14.770100>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,0.000000,0> translate<42.832344,0.000000,14.770100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,14.770100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,14.892969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.323831,0.000000,14.770100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,14.892969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,15.138713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<43.446700,0.000000,15.138713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,15.138713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,15.261584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<43.323831,0.000000,15.261584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,15.518516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,15.518516>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,15.518516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,15.518516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,15.641384>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.323831,0.000000,15.518516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,15.641384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,16.010000>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<43.446700,0.000000,16.010000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,16.010000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,16.010000>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,16.010000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,16.266931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,16.266931>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,16.266931> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,16.266931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,16.512672>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<42.955216,0.000000,16.512672> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,16.512672>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,16.635544>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,16.635544> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,16.890609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,16.890609>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,16.890609> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,16.890609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,17.136350>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<42.955216,0.000000,17.136350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,17.136350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,17.259222>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,17.259222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,17.882900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,17.637156>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.446700,0.000000,17.637156> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,17.637156>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,17.514288>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.323831,0.000000,17.514288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,17.514288>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,17.514288>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,17.514288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,17.514288>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,17.637156>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.955216,0.000000,17.637156> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,17.637156>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,17.882900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,17.882900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,17.882900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,18.005772>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.955216,0.000000,17.882900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,18.005772>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,18.005772>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,18.005772> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,18.005772>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,17.514288>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.200959,0.000000,17.514288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,18.262703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,18.262703>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,18.262703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,18.262703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,18.631316>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,18.631316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,18.631316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,18.754188>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.955216,0.000000,18.631316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,18.754188>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,18.754188>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,18.754188> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.832344,0.000000,19.133987>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,19.133987>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,0.000000,0> translate<42.832344,0.000000,19.133987> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,19.133987>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,19.256859>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<43.323831,0.000000,19.133987> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,19.011119>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,19.256859>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,19.256859> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,20.504219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709472,0.000000,20.504219>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<42.709472,0.000000,20.504219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709472,0.000000,20.258478>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709472,0.000000,20.749963>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<42.709472,0.000000,20.749963> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,21.006894>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,21.006894>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,21.006894> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,21.006894>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,21.252634>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<42.955216,0.000000,21.252634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,21.252634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,21.375506>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,21.375506> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,21.753441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,21.999184>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,21.999184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,21.999184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,22.122056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.955216,0.000000,21.999184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,22.122056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,22.122056>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,22.122056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,22.122056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,21.753441>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.446700,0.000000,21.753441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,21.753441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,21.630572>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.323831,0.000000,21.630572> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,21.630572>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,21.753441>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<43.200959,0.000000,21.753441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,21.753441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,22.122056>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<43.200959,0.000000,22.122056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,22.378988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,22.378988>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,22.378988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,22.378988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,22.747600>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,22.747600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,22.747600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,22.870472>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.955216,0.000000,22.747600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,22.870472>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,22.870472>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,22.870472> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,23.127403>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,23.496016>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<43.446700,0.000000,23.496016> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,23.496016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,23.618887>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<43.323831,0.000000,23.618887> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,23.618887>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,23.496016>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.200959,0.000000,23.496016> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,23.496016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,23.250272>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.200959,0.000000,23.250272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,23.250272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,23.127403>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<43.078088,0.000000,23.127403> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,23.127403>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,23.250272>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.955216,0.000000,23.250272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,23.250272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,23.618887>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,23.618887> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,23.998688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.832344,0.000000,23.998688>}
box{<0,0,-0.038100><0.614356,0.036000,0.038100> rotate<0,0.000000,0> translate<42.832344,0.000000,23.998688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.832344,0.000000,23.998688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709472,0.000000,24.121559>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.709472,0.000000,24.121559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,23.875819>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,24.121559>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<43.078088,0.000000,24.121559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,24.497631>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,24.743375>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<43.446700,0.000000,24.743375> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,24.743375>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,24.866247>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<43.323831,0.000000,24.866247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,24.866247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,24.866247>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,24.866247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,24.866247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,24.743375>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.955216,0.000000,24.743375> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,24.743375>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,24.497631>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.955216,0.000000,24.497631> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,24.497631>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,24.374763>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.955216,0.000000,24.497631> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,24.374763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,24.374763>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,24.374763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,24.374763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,24.497631>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.323831,0.000000,24.374763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,25.123178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,25.123178>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,25.123178> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,25.123178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,25.368919>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<42.955216,0.000000,25.368919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,25.368919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,25.491791>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,25.491791> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,25.746856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,25.746856>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,25.746856> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,25.746856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,25.869725>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,25.869725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,25.869725>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,25.992597>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.955216,0.000000,25.869725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,25.992597>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,25.992597>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,25.992597> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,25.992597>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,26.115469>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.955216,0.000000,26.115469> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,26.115469>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,26.238341>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.955216,0.000000,26.115469> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,26.238341>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,26.238341>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,26.238341> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,26.863884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,26.618141>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.446700,0.000000,26.618141> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,26.618141>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,26.495272>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.323831,0.000000,26.495272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.323831,0.000000,26.495272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,26.495272>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,26.495272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,26.495272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,26.618141>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.955216,0.000000,26.618141> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,26.618141>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,26.863884>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,26.863884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,26.863884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,26.986756>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.955216,0.000000,26.863884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.078088,0.000000,26.986756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,26.986756>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<43.078088,0.000000,26.986756> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,26.986756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,26.495272>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.200959,0.000000,26.495272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.446700,0.000000,27.243688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,27.243688>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.955216,0.000000,27.243688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.200959,0.000000,27.243688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,27.489428>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<42.955216,0.000000,27.489428> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,27.489428>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.955216,0.000000,27.612300>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<42.955216,0.000000,27.612300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.928672,0.000000,21.997325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.928672,0.000000,21.505841>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.928672,0.000000,21.505841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.928672,0.000000,21.505841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,21.505841>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<43.928672,0.000000,21.505841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,21.505841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,21.751581>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,63.430471,0> translate<44.174416,0.000000,21.751581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,21.751581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,21.874453>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<44.174416,0.000000,21.874453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,21.874453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,21.997325>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.174416,0.000000,21.874453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,21.997325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.543031,0.000000,21.997325>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.297288,0.000000,21.997325> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.543031,0.000000,21.997325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,21.874453>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<44.543031,0.000000,21.997325> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,21.874453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,21.628709>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.665900,0.000000,21.628709> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,21.628709>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.543031,0.000000,21.505841>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.543031,0.000000,21.505841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,22.254256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,22.254256>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<44.174416,0.000000,22.254256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,22.254256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.928672,0.000000,22.499997>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<43.928672,0.000000,22.499997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.928672,0.000000,22.499997>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,22.745741>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.928672,0.000000,22.499997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,22.745741>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,22.745741>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<44.174416,0.000000,22.745741> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,22.254256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,22.745741>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<44.297288,0.000000,22.745741> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,23.751088>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,23.751088>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<44.174416,0.000000,23.751088> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,23.751088>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,23.873956>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<44.174416,0.000000,23.873956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,23.873956>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,23.996828>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.174416,0.000000,23.873956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,23.996828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,23.996828>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<44.297288,0.000000,23.996828> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,23.996828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,24.119700>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<44.174416,0.000000,24.119700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,24.119700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,24.242572>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.174416,0.000000,24.119700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,24.242572>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,24.242572>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<44.297288,0.000000,24.242572> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,24.622372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,24.868116>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<44.174416,0.000000,24.868116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,24.868116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,24.990988>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.174416,0.000000,24.868116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.297288,0.000000,24.990988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,24.990988>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<44.297288,0.000000,24.990988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,24.990988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,24.622372>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.665900,0.000000,24.622372> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,24.622372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.543031,0.000000,24.499503>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.543031,0.000000,24.499503> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.543031,0.000000,24.499503>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.420159,0.000000,24.622372>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<44.420159,0.000000,24.622372> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.420159,0.000000,24.622372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.420159,0.000000,24.990988>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<44.420159,0.000000,24.990988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,25.247919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,25.739403>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.174416,0.000000,25.247919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.665900,0.000000,25.247919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.174416,0.000000,25.739403>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<44.174416,0.000000,25.739403> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.313063,0.000000,3.543300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.313063,0.000000,4.356794>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<5.313063,0.000000,4.356794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.041900,0.000000,4.356794>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.584228,0.000000,4.356794>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<5.041900,0.000000,4.356794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.248581,0.000000,3.543300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.248581,0.000000,4.356794>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<6.248581,0.000000,4.356794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.977419,0.000000,4.356794>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.519747,0.000000,4.356794>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<5.977419,0.000000,4.356794> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.255200,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.255200,-1.536000,40.844197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<35.255200,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.255200,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.865403,-1.536000,40.454397>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<34.865403,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.865403,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.475603,-1.536000,40.844197>}
box{<0,0,-0.050800><0.551260,0.036000,0.050800> rotate<0,44.997030,0> translate<34.475603,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.475603,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.475603,-1.536000,39.674800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.475603,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.085803,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.085803,-1.536000,39.869697>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.085803,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.085803,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.890906,-1.536000,39.674800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.890906,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.890906,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.306206,-1.536000,39.674800>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<33.306206,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.306206,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.306206,-1.536000,39.479903>}
box{<0,0,-0.050800><0.974494,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.306206,-1.536000,39.479903> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.306206,-1.536000,39.479903>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.501106,-1.536000,39.285003>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<33.306206,-1.536000,39.479903> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.501106,-1.536000,39.285003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.696006,-1.536000,39.285003>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<33.501106,-1.536000,39.285003> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.136809,-1.536000,40.649297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.331709,-1.536000,40.844197>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.136809,-1.536000,40.649297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.331709,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.721509,-1.536000,40.844197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<32.331709,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.721509,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.916406,-1.536000,40.649297>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<32.721509,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.916406,-1.536000,40.649297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.916406,-1.536000,40.454397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.916406,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.916406,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.721509,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<32.721509,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.721509,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.331709,-1.536000,40.259497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<32.331709,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.331709,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.136809,-1.536000,40.064597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.136809,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.136809,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.136809,-1.536000,39.869697>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.136809,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.136809,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.331709,-1.536000,39.674800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<32.136809,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.331709,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.721509,-1.536000,39.674800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<32.331709,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.721509,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.916406,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.721509,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.162313,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.552112,-1.536000,39.674800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<31.162313,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.552112,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.747009,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<31.552112,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.747009,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.747009,-1.536000,40.259497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<31.747009,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.747009,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.552112,-1.536000,40.454397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<31.552112,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.552112,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.162313,-1.536000,40.454397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<31.162313,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.162313,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.967413,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<30.967413,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.967413,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.967413,-1.536000,40.064597>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<30.967413,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.967413,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.747009,-1.536000,40.064597>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<30.967413,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.577613,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.577613,-1.536000,40.454397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<30.577613,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.577613,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.992916,-1.536000,40.454397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<29.992916,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.992916,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.798016,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<29.798016,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.798016,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.798016,-1.536000,39.674800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<29.798016,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.408216,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.823519,-1.536000,39.674800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<28.823519,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.823519,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.628619,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<28.628619,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.628619,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.823519,-1.536000,40.064597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<28.628619,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.823519,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.213319,-1.536000,40.064597>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<28.823519,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.213319,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.408216,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<29.213319,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.408216,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.213319,-1.536000,40.454397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<29.213319,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.213319,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.628619,-1.536000,40.454397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<28.628619,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.043922,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.654122,-1.536000,39.674800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<27.654122,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.654122,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.459222,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<27.459222,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.459222,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.459222,-1.536000,40.259497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<27.459222,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.459222,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.654122,-1.536000,40.454397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<27.459222,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.654122,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.043922,-1.536000,40.454397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<27.654122,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.043922,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.238819,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<28.043922,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.238819,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.238819,-1.536000,39.869697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.238819,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.238819,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.043922,-1.536000,39.674800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<28.043922,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.069422,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.069422,-1.536000,40.454397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<27.069422,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.069422,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.679625,-1.536000,40.454397>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.997260,0> translate<26.679625,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.679625,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.484725,-1.536000,40.454397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<26.484725,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.094925,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.510228,-1.536000,39.674800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<25.510228,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.510228,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.315328,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<25.315328,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.315328,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.510228,-1.536000,40.064597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<25.315328,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.510228,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.900028,-1.536000,40.064597>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<25.510228,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.900028,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.094925,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<25.900028,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.094925,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.900028,-1.536000,40.454397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<25.900028,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.900028,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.315328,-1.536000,40.454397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<25.315328,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.756131,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.756131,-1.536000,40.844197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<23.756131,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.756131,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.171434,-1.536000,40.844197>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<23.171434,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.171434,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.976534,-1.536000,40.649297>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.976534,-1.536000,40.649297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.976534,-1.536000,40.649297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.976534,-1.536000,40.259497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.976534,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.976534,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.171434,-1.536000,40.064597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<22.976534,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.171434,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.756131,-1.536000,40.064597>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<23.171434,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.366334,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.976534,-1.536000,39.674800>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.996801,0> translate<22.976534,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.586734,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.586734,-1.536000,40.844197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<22.586734,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.586734,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.807137,-1.536000,40.844197>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<21.807137,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.586734,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.196938,-1.536000,40.259497>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<22.196938,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.417338,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.417338,-1.536000,40.844197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<21.417338,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.417338,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.027541,-1.536000,40.454397>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<21.027541,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.027541,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.637741,-1.536000,40.844197>}
box{<0,0,-0.050800><0.551260,0.036000,0.050800> rotate<0,44.997030,0> translate<20.637741,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.637741,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.637741,-1.536000,39.674800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.637741,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.468344,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.858144,-1.536000,40.649297>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,26.563298,0> translate<19.468344,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.858144,-1.536000,40.649297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.247941,-1.536000,40.259497>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,44.997260,0> translate<19.858144,-1.536000,40.649297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.247941,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.247941,-1.536000,39.869697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.247941,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.247941,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.053044,-1.536000,39.674800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.053044,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.053044,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.663244,-1.536000,39.674800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<19.663244,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.663244,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.468344,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<19.468344,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.468344,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.468344,-1.536000,40.064597>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<19.468344,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.468344,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.663244,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<19.468344,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.663244,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.247941,-1.536000,40.259497>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<19.663244,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.078544,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.883647,-1.536000,39.674800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<18.883647,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.883647,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.493847,-1.536000,39.674800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<18.493847,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.493847,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.298947,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<18.298947,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.298947,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.298947,-1.536000,40.649297>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,90.000000,0> translate<18.298947,-1.536000,40.649297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.298947,-1.536000,40.649297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.493847,-1.536000,40.844197>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<18.298947,-1.536000,40.649297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.493847,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.883647,-1.536000,40.844197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<18.493847,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.883647,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.078544,-1.536000,40.649297>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<18.883647,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.078544,-1.536000,40.649297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.078544,-1.536000,40.454397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.078544,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.078544,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.883647,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<18.883647,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.883647,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.298947,-1.536000,40.259497>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<18.298947,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.739750,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.739750,-1.536000,40.844197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<16.739750,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.739750,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.960153,-1.536000,39.674800>}
box{<0,0,-0.050800><1.405440,0.036000,0.050800> rotate<0,-56.306252,0> translate<15.960153,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.960153,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.960153,-1.536000,40.844197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<15.960153,-1.536000,40.844197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.375456,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.985656,-1.536000,39.674800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<14.985656,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.985656,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.790756,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<14.790756,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.790756,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.790756,-1.536000,40.259497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<14.790756,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.790756,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.985656,-1.536000,40.454397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.790756,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.985656,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.375456,-1.536000,40.454397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<14.985656,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.375456,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.570353,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<15.375456,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.570353,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.570353,-1.536000,39.869697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.570353,-1.536000,39.869697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.570353,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.375456,-1.536000,39.674800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.375456,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.621359,-1.536000,40.844197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.621359,-1.536000,39.674800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.621359,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.621359,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.206059,-1.536000,39.674800>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<13.621359,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.206059,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.400956,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.206059,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.400956,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.400956,-1.536000,40.259497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<14.400956,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.400956,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.206059,-1.536000,40.454397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<14.206059,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.206059,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.621359,-1.536000,40.454397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<13.621359,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.646863,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.036663,-1.536000,39.674800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<12.646863,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.036663,-1.536000,39.674800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.231559,-1.536000,39.869697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.036663,-1.536000,39.674800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.231559,-1.536000,39.869697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.231559,-1.536000,40.259497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<13.231559,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.231559,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.036663,-1.536000,40.454397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<13.036663,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.036663,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.646863,-1.536000,40.454397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<12.646863,-1.536000,40.454397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.646863,-1.536000,40.454397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.451963,-1.536000,40.259497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.451963,-1.536000,40.259497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.451963,-1.536000,40.259497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.451963,-1.536000,40.064597>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.451963,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.451963,-1.536000,40.064597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.231559,-1.536000,40.064597>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<12.451963,-1.536000,40.064597> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,18.004784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<14.449381,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.203641,-1.536000,18.250528>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<14.203641,-1.536000,18.250528> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.203641,-1.536000,18.250528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,18.004784>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.957897,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,17.513300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.957897,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,17.881913>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<13.957897,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,18.004784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<13.700966,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,18.004784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<13.332353,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.209481,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,17.513300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.209481,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,18.127656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,17.636169>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.829681,-1.536000,17.636169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,17.636169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.706809,-1.536000,17.513300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<12.706809,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.706809,-1.536000,18.004784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<12.706809,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.084994,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.330738,-1.536000,17.513300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<12.084994,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.330738,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.453606,-1.536000,17.636169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.330738,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.453606,-1.536000,17.636169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.453606,-1.536000,17.881913>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<12.453606,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.453606,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.330738,-1.536000,18.004784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<12.330738,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.330738,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.084994,-1.536000,18.004784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<12.084994,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.084994,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.962122,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.962122,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.962122,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.962122,-1.536000,17.759041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.962122,-1.536000,17.759041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.962122,-1.536000,17.759041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.453606,-1.536000,17.759041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<11.962122,-1.536000,17.759041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.705191,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.705191,-1.536000,18.004784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<11.705191,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.705191,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.336578,-1.536000,18.004784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<11.336578,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.336578,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.213706,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<11.213706,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.213706,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.213706,-1.536000,17.513300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.213706,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.956775,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.956775,-1.536000,18.004784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<10.956775,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.956775,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.588163,-1.536000,18.004784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<10.588163,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.588163,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.465291,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.465291,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.465291,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.465291,-1.536000,17.513300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.465291,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.085491,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.839747,-1.536000,18.004784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<9.839747,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.839747,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.716875,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.716875,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.716875,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.716875,-1.536000,17.513300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.716875,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.716875,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.085491,-1.536000,17.513300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<9.716875,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.085491,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.208359,-1.536000,17.636169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.085491,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.208359,-1.536000,17.636169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.085491,-1.536000,17.759041>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<10.085491,-1.536000,17.759041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.085491,-1.536000,17.759041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.716875,-1.536000,17.759041>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<9.716875,-1.536000,17.759041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.711528,-1.536000,18.250528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.711528,-1.536000,17.513300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.711528,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.711528,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.220044,-1.536000,17.513300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<8.220044,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.594500,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.840244,-1.536000,17.513300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<7.594500,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.840244,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.963113,-1.536000,17.636169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.840244,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.963113,-1.536000,17.636169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.963113,-1.536000,17.881913>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<7.963113,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.963113,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.840244,-1.536000,18.004784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<7.840244,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.840244,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.594500,-1.536000,18.004784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<7.594500,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.594500,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.471628,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.471628,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.471628,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.471628,-1.536000,17.759041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.471628,-1.536000,17.759041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.471628,-1.536000,17.759041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.963113,-1.536000,17.759041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.471628,-1.536000,17.759041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.214697,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.214697,-1.536000,18.004784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<7.214697,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.214697,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.846084,-1.536000,18.004784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<6.846084,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.846084,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.723213,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.723213,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.723213,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.723213,-1.536000,17.513300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.723213,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.220541,-1.536000,17.267559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.097669,-1.536000,17.267559>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<6.097669,-1.536000,17.267559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.097669,-1.536000,17.267559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.974797,-1.536000,17.390431>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<5.974797,-1.536000,17.390431> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.974797,-1.536000,17.390431>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.974797,-1.536000,18.004784>}
box{<0,0,-0.038100><0.614353,0.036000,0.038100> rotate<0,90.000000,0> translate<5.974797,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.974797,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.343413,-1.536000,18.004784>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<5.974797,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.343413,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.466281,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<6.343413,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.466281,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.466281,-1.536000,17.636169>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.466281,-1.536000,17.636169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.466281,-1.536000,17.636169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.343413,-1.536000,17.513300>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.343413,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.343413,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.974797,-1.536000,17.513300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<5.974797,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.594997,-1.536000,18.127656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.594997,-1.536000,17.636169>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.594997,-1.536000,17.636169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.594997,-1.536000,17.636169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.472125,-1.536000,17.513300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<5.472125,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.717866,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.472125,-1.536000,18.004784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<5.472125,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.218922,-1.536000,18.250528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.218922,-1.536000,17.513300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.218922,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.218922,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.096053,-1.536000,18.004784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<5.096053,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.096053,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.850309,-1.536000,18.004784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<4.850309,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.850309,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.727438,-1.536000,17.881913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.727438,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.727438,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.727438,-1.536000,17.513300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.727438,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470506,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347638,-1.536000,18.004784>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<4.347638,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347638,-1.536000,18.004784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347638,-1.536000,17.881913>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.347638,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347638,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470506,-1.536000,17.881913>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<4.347638,-1.536000,17.881913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470506,-1.536000,17.881913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470506,-1.536000,18.004784>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<4.470506,-1.536000,18.004784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470506,-1.536000,17.636169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347638,-1.536000,17.636169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<4.347638,-1.536000,17.636169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347638,-1.536000,17.636169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347638,-1.536000,17.513300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.347638,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347638,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470506,-1.536000,17.513300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<4.347638,-1.536000,17.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470506,-1.536000,17.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.470506,-1.536000,17.636169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<4.470506,-1.536000,17.636169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,17.031328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<14.080769,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,16.662713>}
box{<0,0,-0.038100><0.521299,0.036000,0.038100> rotate<0,44.997273,0> translate<14.080769,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,16.662713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<13.957897,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,16.908456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.578097,-1.536000,17.031328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<13.578097,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.578097,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,17.031328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<13.332353,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,16.908456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.209481,-1.536000,16.908456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,16.908456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,16.785584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.209481,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,16.662713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.209481,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.455225,-1.536000,16.662713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<13.332353,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,16.539841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.209481,-1.536000,16.539841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,16.539841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,16.416969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.209481,-1.536000,16.416969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,16.416969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,16.294100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<13.209481,-1.536000,16.416969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.578097,-1.536000,16.294100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<13.332353,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.578097,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,16.416969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.578097,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,16.908456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,17.031328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<12.829681,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,17.031328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<12.583938,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,16.908456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.461066,-1.536000,16.908456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,16.908456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,16.785584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.461066,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,16.662713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.461066,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.706809,-1.536000,16.662713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<12.583938,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,16.539841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.461066,-1.536000,16.539841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,16.539841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,16.416969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.461066,-1.536000,16.416969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,16.416969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,16.294100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<12.461066,-1.536000,16.416969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,16.294100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<12.583938,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,16.416969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.829681,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,17.031328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<11.455719,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.209978,-1.536000,16.785584>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<11.209978,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.209978,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,17.031328>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<10.964234,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,16.294100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.964234,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,17.031328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<10.707303,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,16.662713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<10.215819,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,16.294100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.215819,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,16.785584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<9.467403,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,16.294100>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<9.467403,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,16.294100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<9.467403,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.462056,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.970572,-1.536000,16.662713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.970572,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.713641,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.222156,-1.536000,16.662713>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<7.222156,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.222156,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.713641,-1.536000,16.294100>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<7.222156,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.216809,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.971069,-1.536000,17.031328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<5.971069,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.971069,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.971069,-1.536000,16.294100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.971069,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.216809,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.725325,-1.536000,16.294100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<5.725325,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.222653,-1.536000,16.908456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<4.976909,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.222653,-1.536000,16.908456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,16.662713>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<5.222653,-1.536000,16.908456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,16.416969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.468394,-1.536000,16.416969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,16.416969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,16.294100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.345525,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,16.294100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<5.099781,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,16.416969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<4.976909,-1.536000,16.416969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,16.416969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,16.539841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<4.976909,-1.536000,16.539841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,16.539841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,16.662713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.976909,-1.536000,16.539841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,16.662713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<5.099781,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,17.031328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<4.228494,-1.536000,17.031328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,17.031328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,16.662713>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.719978,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.474238,-1.536000,16.785584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<4.474238,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.474238,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,16.785584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<4.351366,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,16.662713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.228494,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,16.416969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.228494,-1.536000,16.416969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,16.416969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,16.294100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<4.228494,-1.536000,16.416969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,16.294100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<4.351366,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,16.416969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.597109,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,16.785584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<3.223147,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.100278,-1.536000,16.785584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<3.100278,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.100278,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,16.662713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.977406,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,16.294100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.977406,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.854534,-1.536000,16.785584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.854534,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.854534,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,16.662713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.731663,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,16.294100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.731663,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,16.294100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,16.785584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<2.474731,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.351863,-1.536000,16.785584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<2.351863,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.351863,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,16.662713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.228991,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,16.294100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.228991,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.106119,-1.536000,16.785584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.106119,-1.536000,16.785584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.106119,-1.536000,16.785584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,16.662713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.983247,-1.536000,16.662713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,16.662713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,16.294100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.983247,-1.536000,16.294100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,15.689256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,15.812128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<14.326513,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,15.812128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.080769,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,15.689256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.957897,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,15.689256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,15.566384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.957897,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.957897,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,15.320641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.957897,-1.536000,15.320641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,15.320641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,15.197769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.957897,-1.536000,15.197769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,15.197769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,15.074900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<13.957897,-1.536000,15.197769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,15.074900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.080769,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,15.197769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.326513,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,15.197769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,15.320641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<14.449381,-1.536000,15.320641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,15.320641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<14.326513,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,15.566384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<14.326513,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,15.689256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<14.449381,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,15.443513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.080769,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.455225,-1.536000,15.689256>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<13.209481,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.455225,-1.536000,15.689256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,15.443513>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<13.455225,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,15.197769>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.700966,-1.536000,15.197769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,15.197769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.578097,-1.536000,15.074900>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.578097,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.578097,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,15.074900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<13.332353,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,15.197769>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<13.209481,-1.536000,15.197769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,15.197769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,15.320641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<13.209481,-1.536000,15.320641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,15.320641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.209481,-1.536000,15.320641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.332353,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,15.443513>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<13.332353,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,15.689256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,15.812128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<12.829681,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,15.812128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<12.583938,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,15.689256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.461066,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,15.689256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,15.566384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.461066,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.461066,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,15.320641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.461066,-1.536000,15.320641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,15.320641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,15.197769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.461066,-1.536000,15.197769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,15.197769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,15.074900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<12.461066,-1.536000,15.197769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,15.074900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<12.583938,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,15.197769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.829681,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,15.197769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,15.320641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<12.952550,-1.536000,15.320641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,15.320641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<12.829681,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,15.566384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<12.829681,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,15.689256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<12.952550,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,15.443513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<12.583938,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,15.812128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<11.455719,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.209978,-1.536000,15.566384>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<11.209978,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.209978,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,15.812128>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<10.964234,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,15.074900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.964234,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,15.812128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<10.707303,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,15.443513>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<10.215819,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,15.074900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.215819,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,15.566384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<9.467403,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,15.074900>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<9.467403,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,15.074900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<9.467403,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.462056,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.970572,-1.536000,15.443513>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.970572,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.713641,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.222156,-1.536000,15.443513>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<7.222156,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.222156,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.713641,-1.536000,15.074900>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<7.222156,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,15.689256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,15.812128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<5.345525,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,15.812128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<5.099781,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,15.689256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.976909,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,15.689256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,15.566384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.976909,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<4.976909,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,15.320641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.976909,-1.536000,15.320641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,15.320641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,15.197769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.976909,-1.536000,15.197769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,15.197769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,15.074900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<4.976909,-1.536000,15.197769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,15.074900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<5.099781,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,15.197769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.345525,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,15.197769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,15.320641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<5.468394,-1.536000,15.320641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,15.320641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<5.345525,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,15.566384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<5.345525,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,15.689256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<5.468394,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.345525,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.099781,-1.536000,15.443513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<5.099781,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,15.074900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<4.228494,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,15.566384>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<4.228494,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,15.689256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<4.228494,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,15.689256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,15.812128>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.228494,-1.536000,15.689256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,15.812128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<4.351366,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,15.812128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,15.689256>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<4.597109,-1.536000,15.812128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,15.566384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<3.223147,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.100278,-1.536000,15.566384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<3.100278,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.100278,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.977406,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,15.074900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.977406,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.854534,-1.536000,15.566384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.854534,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.854534,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.731663,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,15.074900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.731663,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,15.074900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,15.566384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<2.474731,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.351863,-1.536000,15.566384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<2.351863,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.351863,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.228991,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,15.074900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.228991,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.106119,-1.536000,15.566384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.106119,-1.536000,15.566384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.106119,-1.536000,15.566384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,15.443513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.983247,-1.536000,15.443513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,15.443513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,15.074900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.983247,-1.536000,15.074900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,13.978569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,13.855700>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.326513,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,13.855700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.080769,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,13.978569>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<13.957897,-1.536000,13.978569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,13.978569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,14.470056>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<13.957897,-1.536000,14.470056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,14.470056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,14.592928>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<13.957897,-1.536000,14.470056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.080769,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,14.592928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.080769,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,14.470056>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<14.326513,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,14.470056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,14.347184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.449381,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.449381,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,14.224312>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<14.326513,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.326513,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.957897,-1.536000,14.224312>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<13.957897,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.455225,-1.536000,14.592928>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<13.455225,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.455225,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.455225,-1.536000,13.855700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.455225,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.700966,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.209481,-1.536000,13.855700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<13.209481,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,14.592928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<12.461066,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,14.224312>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.952550,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.706809,-1.536000,14.347184>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<12.706809,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.706809,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,14.347184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<12.583938,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,14.224312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.461066,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,13.978569>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.461066,-1.536000,13.978569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.461066,-1.536000,13.978569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,13.855700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<12.461066,-1.536000,13.978569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.583938,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,13.855700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<12.583938,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829681,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.952550,-1.536000,13.978569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.829681,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,14.592928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<11.455719,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.455719,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.209978,-1.536000,14.347184>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<11.209978,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.209978,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,14.592928>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<10.964234,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.964234,-1.536000,13.855700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.964234,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,14.592928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<10.707303,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707303,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,14.224312>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<10.215819,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.215819,-1.536000,13.855700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.215819,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,14.347184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<9.467403,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,13.855700>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<9.467403,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.958888,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.467403,-1.536000,13.855700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<9.467403,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.462056,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.970572,-1.536000,14.224312>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.970572,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.713641,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.222156,-1.536000,14.224312>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<7.222156,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.222156,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.713641,-1.536000,13.855700>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<7.222156,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,14.592928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<4.976909,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,14.470056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.976909,-1.536000,14.470056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.976909,-1.536000,14.470056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,13.978569>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,44.997212,0> translate<4.976909,-1.536000,14.470056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,13.978569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.468394,-1.536000,13.855700>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.468394,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,14.470056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,14.592928>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<4.597109,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,14.592928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<4.351366,-1.536000,14.592928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,14.592928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,14.470056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.228494,-1.536000,14.470056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,14.470056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,14.347184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.228494,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,14.224312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<4.228494,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,14.101441>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.228494,-1.536000,14.101441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,14.101441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,13.978569>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.228494,-1.536000,13.978569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.228494,-1.536000,13.978569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,13.855700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<4.228494,-1.536000,13.978569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,13.855700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<4.351366,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,13.978569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.597109,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,13.978569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,14.101441>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<4.719978,-1.536000,14.101441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,14.101441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,14.224312>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<4.597109,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,14.347184>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<4.597109,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.719978,-1.536000,14.470056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<4.719978,-1.536000,14.470056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.597109,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.351366,-1.536000,14.224312>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<4.351366,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,14.347184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<3.223147,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.223147,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.100278,-1.536000,14.347184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<3.100278,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.100278,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,14.224312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.977406,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,13.855700>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.977406,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.977406,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.854534,-1.536000,14.347184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.854534,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.854534,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,14.224312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.731663,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.731663,-1.536000,13.855700>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.731663,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,13.855700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,14.347184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<2.474731,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.474731,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.351863,-1.536000,14.347184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<2.351863,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.351863,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,14.224312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.228991,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,13.855700>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.228991,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.228991,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.106119,-1.536000,14.347184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<2.106119,-1.536000,14.347184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.106119,-1.536000,14.347184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,14.224312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.983247,-1.536000,14.224312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,14.224312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.983247,-1.536000,13.855700>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<1.983247,-1.536000,13.855700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.844800,0.000000,18.669497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.624397,0.000000,18.669497>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<2.844800,0.000000,18.669497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.234597,0.000000,19.059297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.234597,0.000000,18.279697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<3.234597,0.000000,18.279697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.183594,0.000000,18.669497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.963191,0.000000,18.669497>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<5.183594,0.000000,18.669497> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,9.182100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,9.182100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<29.704672,0.000000,9.182100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,9.182100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,9.550713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<29.704672,0.000000,9.550713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,9.550713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.827544,0.000000,9.673584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.704672,0.000000,9.550713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.827544,0.000000,9.673584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,9.673584>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<29.827544,0.000000,9.673584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,9.673584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.196159,0.000000,9.550713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<30.073288,0.000000,9.673584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.196159,0.000000,9.550713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.196159,0.000000,9.182100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.196159,0.000000,9.182100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.196159,0.000000,9.427841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,9.673584>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<30.196159,0.000000,9.427841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,9.930516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,9.930516>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<29.704672,0.000000,9.930516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,9.930516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,10.422000>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<29.704672,0.000000,10.422000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,9.930516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,10.176256>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<30.073288,0.000000,10.176256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.564769,0.000000,10.678931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.564769,0.000000,11.170416>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<30.564769,0.000000,11.170416> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,11.427347>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,11.427347>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<29.704672,0.000000,11.427347> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,11.427347>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,11.918831>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<30.441900,0.000000,11.918831> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,12.667247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,12.175763>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.704672,0.000000,12.175763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,12.175763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,12.175763>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<29.704672,0.000000,12.175763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,12.175763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,12.667247>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<30.441900,0.000000,12.667247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,12.175763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,12.421503>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<30.073288,0.000000,12.421503> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,12.924178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,12.924178>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<29.704672,0.000000,12.924178> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,12.924178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,13.292791>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,90.000000,0> translate<30.441900,0.000000,13.292791> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,13.292791>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.319031,0.000000,13.415662>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<30.319031,0.000000,13.415662> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.319031,0.000000,13.415662>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.827544,0.000000,13.415662>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,0.000000,0> translate<29.827544,0.000000,13.415662> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.827544,0.000000,13.415662>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,13.292791>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.704672,0.000000,13.292791> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,13.292791>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,12.924178>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.704672,0.000000,12.924178> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,13.672594>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,13.672594>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<29.704672,0.000000,13.672594> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,13.922066>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,13.922066>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<29.704672,0.000000,13.922066> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,13.922066>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,14.290678>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<30.441900,0.000000,14.290678> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,14.290678>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.319031,0.000000,14.413550>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<30.319031,0.000000,14.413550> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.319031,0.000000,14.413550>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.827544,0.000000,14.413550>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,0.000000,0> translate<29.827544,0.000000,14.413550> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.827544,0.000000,14.413550>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,14.290678>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.704672,0.000000,14.290678> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,14.290678>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,13.922066>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.704672,0.000000,13.922066> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.704672,0.000000,15.161966>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.827544,0.000000,14.916222>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,63.430762,0> translate<29.704672,0.000000,15.161966> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.827544,0.000000,14.916222>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,14.670481>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<29.827544,0.000000,14.916222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,14.670481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.319031,0.000000,14.670481>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<30.073288,0.000000,14.670481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.319031,0.000000,14.670481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,14.793350>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.319031,0.000000,14.670481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,14.793350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,15.039094>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<30.441900,0.000000,15.039094> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.441900,0.000000,15.039094>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.319031,0.000000,15.161966>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<30.319031,0.000000,15.161966> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.319031,0.000000,15.161966>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.196159,0.000000,15.161966>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<30.196159,0.000000,15.161966> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.196159,0.000000,15.161966>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,15.039094>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.073288,0.000000,15.039094> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,15.039094>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.073288,0.000000,14.670481>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.073288,0.000000,14.670481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.444416,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.567287,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.444416,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.567287,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.813031,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.567287,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.813031,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.935900,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<45.813031,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.935900,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.935900,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.935900,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.935900,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.813031,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.813031,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.813031,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.567287,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.567287,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.567287,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.444416,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<45.444416,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.187484,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.187484,-1.536000,22.750456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<45.187484,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.187484,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.064616,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<45.064616,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.064616,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.818872,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.818872,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.818872,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.696000,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.696000,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.696000,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.696000,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.696000,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.696000,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.818872,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<44.696000,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.818872,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.064616,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.818872,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.064616,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.187484,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.064616,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.187484,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.696000,-1.536000,22.750456>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,44.997212,0> translate<44.696000,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.439069,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.439069,-1.536000,22.136100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.439069,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.698113,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.820984,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.698113,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.820984,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.066728,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.820984,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.066728,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.189597,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<44.066728,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.189597,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.189597,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.189597,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.189597,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.066728,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.066728,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.066728,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.820984,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.820984,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.820984,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.698113,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<43.698113,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.441181,-1.536000,22.627584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.195441,-1.536000,22.873328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<43.195441,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.195441,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.195441,-1.536000,22.136100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.195441,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.441181,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.949697,-1.536000,22.136100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.949697,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.692766,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.692766,-1.536000,22.136100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.692766,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.951809,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.074681,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.951809,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.074681,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.320425,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.074681,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.320425,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.443294,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<42.320425,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.443294,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.443294,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.443294,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.443294,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.320425,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.320425,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.320425,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.074681,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.074681,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.074681,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.951809,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<41.951809,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.203394,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.694878,-1.536000,22.136100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<41.203394,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.694878,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.203394,-1.536000,22.627584>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<41.203394,-1.536000,22.627584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.203394,-1.536000,22.627584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.203394,-1.536000,22.750456>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<41.203394,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.203394,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.326266,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.203394,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.326266,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.572009,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.326266,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.572009,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.694878,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<41.572009,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.946463,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.946463,-1.536000,22.136100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.946463,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.205506,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.328378,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.205506,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.328378,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.574122,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.328378,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.574122,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.696991,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<40.574122,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.696991,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.696991,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.696991,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.696991,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.574122,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.574122,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.574122,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.328378,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.328378,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.328378,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.205506,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<40.205506,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.948575,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.825706,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<39.825706,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.825706,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.579963,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.579963,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.579963,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.457091,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.457091,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.457091,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.457091,-1.536000,22.627584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.457091,-1.536000,22.627584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.457091,-1.536000,22.627584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.579963,-1.536000,22.504713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<39.457091,-1.536000,22.627584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.579963,-1.536000,22.504713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.702834,-1.536000,22.504713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<39.579963,-1.536000,22.504713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.579963,-1.536000,22.504713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.457091,-1.536000,22.381841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.457091,-1.536000,22.381841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.457091,-1.536000,22.381841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.457091,-1.536000,22.258969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.457091,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.457091,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.579963,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<39.457091,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.579963,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.825706,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.579963,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.825706,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.948575,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.825706,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.200159,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.200159,-1.536000,22.136100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.200159,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.459203,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.582075,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.459203,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.582075,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.827819,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.582075,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.827819,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.950688,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<38.827819,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.950688,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.950688,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.950688,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.950688,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.827819,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.827819,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.827819,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.582075,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.582075,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.582075,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.459203,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<38.459203,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.833659,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.833659,-1.536000,22.873328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.833659,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.833659,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.202272,-1.536000,22.504713>}
box{<0,0,-0.038100><0.521299,0.036000,0.038100> rotate<0,44.997273,0> translate<37.833659,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.202272,-1.536000,22.504713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.710788,-1.536000,22.504713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<37.710788,-1.536000,22.504713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.453856,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.453856,-1.536000,22.136100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.453856,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.712900,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.835772,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.712900,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.835772,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.081516,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.835772,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.081516,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.204384,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<37.081516,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.204384,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.204384,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.204384,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.204384,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.081516,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.081516,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.081516,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.835772,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.835772,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.835772,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.712900,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<36.712900,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.964484,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455969,-1.536000,22.873328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.964484,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455969,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455969,-1.536000,22.504713>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.455969,-1.536000,22.504713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455969,-1.536000,22.504713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.210228,-1.536000,22.627584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<36.210228,-1.536000,22.627584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.210228,-1.536000,22.627584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.087356,-1.536000,22.627584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<36.087356,-1.536000,22.627584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.087356,-1.536000,22.627584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.964484,-1.536000,22.504713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.964484,-1.536000,22.504713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.964484,-1.536000,22.504713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.964484,-1.536000,22.258969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.964484,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.964484,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.087356,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<35.964484,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.087356,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.333100,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.087356,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.333100,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.455969,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.333100,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.707553,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.707553,-1.536000,22.136100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.707553,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.966597,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.089469,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.966597,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.089469,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.335213,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.089469,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.335213,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.458081,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<35.335213,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.458081,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.458081,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.458081,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.458081,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.335213,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.335213,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.335213,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.089469,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.089469,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.089469,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.966597,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<34.966597,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.218181,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.463925,-1.536000,22.750456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<34.218181,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.463925,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.709666,-1.536000,22.504713>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<34.463925,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.709666,-1.536000,22.504713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.709666,-1.536000,22.258969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.709666,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.709666,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.586797,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.586797,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.586797,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.341053,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.341053,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.341053,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.218181,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<34.218181,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.218181,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.218181,-1.536000,22.381841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<34.218181,-1.536000,22.381841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.218181,-1.536000,22.381841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.341053,-1.536000,22.504713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.218181,-1.536000,22.381841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.341053,-1.536000,22.504713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.709666,-1.536000,22.504713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<34.341053,-1.536000,22.504713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.961250,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.961250,-1.536000,22.136100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.961250,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.220294,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.343166,-1.536000,22.873328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.220294,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.343166,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.588909,-1.536000,22.873328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<33.343166,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.588909,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.711778,-1.536000,22.750456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<33.588909,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.711778,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.711778,-1.536000,22.258969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.711778,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.711778,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.588909,-1.536000,22.136100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.588909,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.588909,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.343166,-1.536000,22.136100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<33.343166,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.343166,-1.536000,22.136100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.220294,-1.536000,22.258969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<33.220294,-1.536000,22.258969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.963363,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.471878,-1.536000,22.873328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<32.471878,-1.536000,22.873328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.471878,-1.536000,22.873328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.471878,-1.536000,22.750456>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.471878,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.471878,-1.536000,22.750456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.963363,-1.536000,22.258969>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,44.997212,0> translate<32.471878,-1.536000,22.750456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.963363,-1.536000,22.258969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.963363,-1.536000,22.136100>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.963363,-1.536000,22.136100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075288,-1.536000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.321031,-1.536000,24.905328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<46.075288,-1.536000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.321031,-1.536000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.443900,-1.536000,24.782456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<46.321031,-1.536000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.443900,-1.536000,24.782456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.443900,-1.536000,24.290969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.443900,-1.536000,24.290969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.443900,-1.536000,24.290969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.321031,-1.536000,24.168100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<46.321031,-1.536000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.321031,-1.536000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075288,-1.536000,24.168100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<46.075288,-1.536000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075288,-1.536000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.952416,-1.536000,24.290969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<45.952416,-1.536000,24.290969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.952416,-1.536000,24.290969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.952416,-1.536000,24.782456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<45.952416,-1.536000,24.782456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.952416,-1.536000,24.782456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075288,-1.536000,24.905328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.952416,-1.536000,24.782456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.695484,-1.536000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.695484,-1.536000,24.905328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<45.695484,-1.536000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.695484,-1.536000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.204000,-1.536000,24.168100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<45.204000,-1.536000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.204000,-1.536000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.204000,-1.536000,24.905328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<45.204000,-1.536000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075288,-1.536000,18.809328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.321031,-1.536000,18.809328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<46.075288,-1.536000,18.809328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.321031,-1.536000,18.809328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.443900,-1.536000,18.686456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<46.321031,-1.536000,18.809328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.443900,-1.536000,18.686456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.443900,-1.536000,18.194969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.443900,-1.536000,18.194969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.443900,-1.536000,18.194969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.321031,-1.536000,18.072100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<46.321031,-1.536000,18.072100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.321031,-1.536000,18.072100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075288,-1.536000,18.072100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<46.075288,-1.536000,18.072100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075288,-1.536000,18.072100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.952416,-1.536000,18.194969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<45.952416,-1.536000,18.194969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.952416,-1.536000,18.194969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.952416,-1.536000,18.686456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<45.952416,-1.536000,18.686456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.952416,-1.536000,18.686456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.075288,-1.536000,18.809328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.952416,-1.536000,18.686456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.695484,-1.536000,18.072100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.695484,-1.536000,18.809328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<45.695484,-1.536000,18.809328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.695484,-1.536000,18.809328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.204000,-1.536000,18.809328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<45.204000,-1.536000,18.809328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.695484,-1.536000,18.440713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.449744,-1.536000,18.440713>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<45.449744,-1.536000,18.440713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.947069,-1.536000,18.072100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.947069,-1.536000,18.809328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<44.947069,-1.536000,18.809328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.947069,-1.536000,18.809328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.455584,-1.536000,18.809328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<44.455584,-1.536000,18.809328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.947069,-1.536000,18.440713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.701328,-1.536000,18.440713>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<44.701328,-1.536000,18.440713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.649900,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.649900,-1.536000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<43.649900,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.649900,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.158416,-1.536000,25.184100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<43.158416,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.158416,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.158416,-1.536000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<43.158416,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.778616,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.532872,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.532872,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.532872,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.410000,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.410000,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.410000,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.410000,-1.536000,25.552713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.410000,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.410000,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.532872,-1.536000,25.675584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.410000,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.532872,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.778616,-1.536000,25.675584>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.532872,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.778616,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.901484,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<42.778616,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.901484,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.901484,-1.536000,25.306969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.901484,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.901484,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.778616,-1.536000,25.184100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.778616,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.661584,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.661584,-1.536000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.661584,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.661584,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.030200,-1.536000,25.184100>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<41.661584,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.030200,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.153069,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.030200,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.153069,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.153069,-1.536000,25.552713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.153069,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.153069,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.030200,-1.536000,25.675584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<42.030200,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.030200,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.661584,-1.536000,25.675584>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<41.661584,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.036041,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.281784,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.036041,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.281784,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.404653,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.281784,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.404653,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.404653,-1.536000,25.552713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<41.404653,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.404653,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.281784,-1.536000,25.675584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<41.281784,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.281784,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.036041,-1.536000,25.675584>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.036041,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.036041,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.913169,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.913169,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.913169,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.913169,-1.536000,25.429841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.913169,-1.536000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.913169,-1.536000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.404653,-1.536000,25.429841>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.913169,-1.536000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.907822,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.662081,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<39.662081,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.784953,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.784953,-1.536000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<39.784953,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.907822,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.662081,-1.536000,25.921328>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<39.662081,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.408878,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.408878,-1.536000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.408878,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.408878,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.040266,-1.536000,25.184100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<39.040266,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.040266,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.917394,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<38.917394,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.917394,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.917394,-1.536000,25.798456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<38.917394,-1.536000,25.798456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.917394,-1.536000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.040266,-1.536000,25.921328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.917394,-1.536000,25.798456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.040266,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.408878,-1.536000,25.921328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<39.040266,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.420563,-1.536000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.543434,-1.536000,25.921328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.420563,-1.536000,25.798456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.543434,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.789178,-1.536000,25.921328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<37.543434,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.789178,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.912047,-1.536000,25.798456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<37.789178,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.912047,-1.536000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.912047,-1.536000,25.306969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.912047,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.912047,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.789178,-1.536000,25.184100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.789178,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.789178,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.543434,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<37.543434,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.543434,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.420563,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<37.420563,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.040762,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.795019,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.795019,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.795019,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.672147,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<36.672147,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.672147,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.672147,-1.536000,25.552713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<36.672147,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.672147,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.795019,-1.536000,25.675584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.672147,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.795019,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.040762,-1.536000,25.675584>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.795019,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.040762,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.163631,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<37.040762,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.163631,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.163631,-1.536000,25.306969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.163631,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.163631,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.040762,-1.536000,25.184100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.040762,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.923731,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.923731,-1.536000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.923731,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.923731,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.292347,-1.536000,25.184100>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<35.923731,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.292347,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.415216,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.292347,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.415216,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.415216,-1.536000,25.552713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<36.415216,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.415216,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.292347,-1.536000,25.675584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.292347,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.292347,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.923731,-1.536000,25.675584>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<35.923731,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.298188,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.543931,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.298188,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.543931,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.666800,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.543931,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.666800,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.666800,-1.536000,25.552713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<35.666800,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.666800,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.543931,-1.536000,25.675584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<35.543931,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.543931,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.298188,-1.536000,25.675584>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.298188,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.298188,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.175316,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.175316,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.175316,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.175316,-1.536000,25.429841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.175316,-1.536000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.175316,-1.536000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.666800,-1.536000,25.429841>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.175316,-1.536000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.583900,-1.536000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.583900,-1.536000,8.539169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<23.583900,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.583900,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.270366,-1.536000,8.852703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<23.270366,-1.536000,8.852703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.270366,-1.536000,8.852703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.956831,-1.536000,8.539169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.956831,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.956831,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.956831,-1.536000,7.912100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.956831,-1.536000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.583900,-1.536000,8.382400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.956831,-1.536000,8.382400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<22.956831,-1.536000,8.382400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.648381,-1.536000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.648381,-1.536000,8.539169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<22.648381,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.648381,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.334847,-1.536000,8.852703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<22.334847,-1.536000,8.852703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.334847,-1.536000,8.852703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.021313,-1.536000,8.539169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.021313,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.021313,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.021313,-1.536000,7.912100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.021313,-1.536000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.648381,-1.536000,8.382400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.021313,-1.536000,8.382400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<22.021313,-1.536000,8.382400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.712862,-1.536000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.712862,-1.536000,8.539169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<21.712862,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.712862,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.399328,-1.536000,8.852703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<21.399328,-1.536000,8.852703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.399328,-1.536000,8.852703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.085794,-1.536000,8.539169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<21.085794,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.085794,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.085794,-1.536000,7.912100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.085794,-1.536000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.712862,-1.536000,8.382400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.085794,-1.536000,8.382400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<21.085794,-1.536000,8.382400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.528291,-1.536000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.528291,-1.536000,8.852703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<19.528291,-1.536000,8.852703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.841825,-1.536000,8.852703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.214756,-1.536000,8.852703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<19.214756,-1.536000,8.852703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.906306,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.906306,-1.536000,8.068866>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.906306,-1.536000,8.068866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.906306,-1.536000,8.068866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.749541,-1.536000,7.912100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.749541,-1.536000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.749541,-1.536000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.279238,-1.536000,7.912100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<18.279238,-1.536000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.279238,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.279238,-1.536000,7.755334>}
box{<0,0,-0.038100><0.783834,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.279238,-1.536000,7.755334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.279238,-1.536000,7.755334>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.436006,-1.536000,7.598566>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<18.279238,-1.536000,7.755334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.436006,-1.536000,7.598566>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.592772,-1.536000,7.598566>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<18.436006,-1.536000,7.598566> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.970788,-1.536000,7.598566>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.970788,-1.536000,8.539169>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<17.970788,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.970788,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.500488,-1.536000,8.539169>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.500488,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.500488,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.343719,-1.536000,8.382400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.343719,-1.536000,8.382400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.343719,-1.536000,8.382400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.343719,-1.536000,8.068866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.343719,-1.536000,8.068866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.343719,-1.536000,8.068866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.500488,-1.536000,7.912100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<17.343719,-1.536000,8.068866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.500488,-1.536000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.970788,-1.536000,7.912100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<17.500488,-1.536000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.564969,-1.536000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.878503,-1.536000,7.912100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<16.564969,-1.536000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.878503,-1.536000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.035269,-1.536000,8.068866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.878503,-1.536000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.035269,-1.536000,8.068866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.035269,-1.536000,8.382400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<17.035269,-1.536000,8.382400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.035269,-1.536000,8.382400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.878503,-1.536000,8.539169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<16.878503,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.878503,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.564969,-1.536000,8.539169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<16.564969,-1.536000,8.539169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.564969,-1.536000,8.539169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.408200,-1.536000,8.382400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.408200,-1.536000,8.382400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.408200,-1.536000,8.382400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.408200,-1.536000,8.225634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.408200,-1.536000,8.225634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.408200,-1.536000,8.225634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.035269,-1.536000,8.225634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<16.408200,-1.536000,8.225634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.013900,-1.536000,34.836100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.013900,-1.536000,35.463169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<35.013900,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.013900,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.700366,-1.536000,35.776703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<34.700366,-1.536000,35.776703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.700366,-1.536000,35.776703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386831,-1.536000,35.463169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.386831,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386831,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386831,-1.536000,34.836100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.386831,-1.536000,34.836100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.013900,-1.536000,35.306400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386831,-1.536000,35.306400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<34.386831,-1.536000,35.306400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.078381,-1.536000,34.836100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.078381,-1.536000,35.463169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<34.078381,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.078381,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.764847,-1.536000,35.776703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<33.764847,-1.536000,35.776703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.764847,-1.536000,35.776703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.451313,-1.536000,35.463169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.451313,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.451313,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.451313,-1.536000,34.836100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.451313,-1.536000,34.836100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.078381,-1.536000,35.306400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.451313,-1.536000,35.306400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<33.451313,-1.536000,35.306400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.142862,-1.536000,34.836100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.142862,-1.536000,35.463169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<33.142862,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.142862,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.829328,-1.536000,35.776703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<32.829328,-1.536000,35.776703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.829328,-1.536000,35.776703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.515794,-1.536000,35.463169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.515794,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.515794,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.515794,-1.536000,34.836100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.515794,-1.536000,34.836100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.142862,-1.536000,35.306400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.515794,-1.536000,35.306400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<32.515794,-1.536000,35.306400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.958291,-1.536000,34.836100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.958291,-1.536000,35.776703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<30.958291,-1.536000,35.776703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.271825,-1.536000,35.776703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644756,-1.536000,35.776703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<30.644756,-1.536000,35.776703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.336306,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.336306,-1.536000,34.992866>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.336306,-1.536000,34.992866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.336306,-1.536000,34.992866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.179541,-1.536000,34.836100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.179541,-1.536000,34.836100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.179541,-1.536000,34.836100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.709238,-1.536000,34.836100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<29.709238,-1.536000,34.836100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.709238,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.709238,-1.536000,34.679334>}
box{<0,0,-0.038100><0.783834,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.709238,-1.536000,34.679334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.709238,-1.536000,34.679334>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.866006,-1.536000,34.522566>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<29.709238,-1.536000,34.679334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.866006,-1.536000,34.522566>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.022772,-1.536000,34.522566>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<29.866006,-1.536000,34.522566> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.400787,-1.536000,34.522566>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.400787,-1.536000,35.463169>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<29.400787,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.400787,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.930488,-1.536000,35.463169>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.930488,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.930488,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.773719,-1.536000,35.306400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.773719,-1.536000,35.306400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.773719,-1.536000,35.306400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.773719,-1.536000,34.992866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.773719,-1.536000,34.992866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.773719,-1.536000,34.992866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.930488,-1.536000,34.836100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<28.773719,-1.536000,34.992866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.930488,-1.536000,34.836100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.400787,-1.536000,34.836100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.930488,-1.536000,34.836100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.994969,-1.536000,34.836100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.308503,-1.536000,34.836100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<27.994969,-1.536000,34.836100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.308503,-1.536000,34.836100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.465269,-1.536000,34.992866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.308503,-1.536000,34.836100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.465269,-1.536000,34.992866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.465269,-1.536000,35.306400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<28.465269,-1.536000,35.306400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.465269,-1.536000,35.306400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.308503,-1.536000,35.463169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<28.308503,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.308503,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.994969,-1.536000,35.463169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<27.994969,-1.536000,35.463169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.994969,-1.536000,35.463169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.838200,-1.536000,35.306400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.838200,-1.536000,35.306400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.838200,-1.536000,35.306400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.838200,-1.536000,35.149634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.838200,-1.536000,35.149634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.838200,-1.536000,35.149634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.465269,-1.536000,35.149634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<27.838200,-1.536000,35.149634> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.004000,-1.536000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.482000,-1.536000,23.622000>}
box{<0,0,-0.152400><14.478000,0.036000,0.152400> rotate<0,0.000000,0> translate<32.004000,-1.536000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.482000,-1.536000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.482000,-1.536000,21.336000>}
box{<0,0,-0.152400><2.286000,0.036000,0.152400> rotate<0,-90.000000,0> translate<46.482000,-1.536000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.482000,-1.536000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.482000,-1.536000,19.304000>}
box{<0,0,-0.152400><2.032000,0.036000,0.152400> rotate<0,-90.000000,0> translate<46.482000,-1.536000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.482000,-1.536000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.004000,-1.536000,19.304000>}
box{<0,0,-0.152400><14.478000,0.036000,0.152400> rotate<0,0.000000,0> translate<32.004000,-1.536000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.004000,-1.536000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.004000,-1.536000,21.336000>}
box{<0,0,-0.152400><2.032000,0.036000,0.152400> rotate<0,90.000000,0> translate<32.004000,-1.536000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.004000,-1.536000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.004000,-1.536000,23.622000>}
box{<0,0,-0.152400><2.286000,0.036000,0.152400> rotate<0,90.000000,0> translate<32.004000,-1.536000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<32.004000,-1.536000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.482000,-1.536000,21.336000>}
box{<0,0,-0.152400><14.478000,0.036000,0.152400> rotate<0,0.000000,0> translate<32.004000,-1.536000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.798000,-1.536000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<34.798000,-1.536000,19.812000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<34.798000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<36.576000,-1.536000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<36.576000,-1.536000,19.812000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<36.576000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<38.354000,-1.536000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<38.354000,-1.536000,19.812000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<38.354000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.132000,-1.536000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<40.132000,-1.536000,19.812000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<40.132000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.910000,-1.536000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<41.910000,-1.536000,19.812000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<41.910000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.688000,-1.536000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<43.688000,-1.536000,19.812000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<43.688000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<45.466000,-1.536000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<45.466000,-1.536000,19.812000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<45.466000,-1.536000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,-1.536000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<33.020000,-1.536000,19.812000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<33.020000,-1.536000,19.812000> }
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-90.000000,0> translate<4.362450,0.000000,1.733550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-90.000000,0> translate<4.362450,0.000000,2.368550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-90.000000,0> translate<4.362450,0.000000,3.003550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-90.000000,0> translate<7.537450,0.000000,1.733550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-90.000000,0> translate<7.537450,0.000000,2.368550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-90.000000,0> translate<7.537450,0.000000,3.003550>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-180.000000,0> translate<5.949950,0.000000,2.368550>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-0.000000,0> translate<5.924550,0.000000,4.845050>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-0.000000,0> translate<5.924550,0.000000,1.098550>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-270.000000,0> translate<8.763000,0.000000,2.971800>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-270.000000,0> translate<3.098800,0.000000,2.971800>}
//BAT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,-1.536000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,-1.536000,37.846000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,90.000000,0> translate<11.684000,-1.536000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,-1.536000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,-1.536000,37.846000>}
box{<0,0,-0.063500><9.525000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.159000,-1.536000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,-1.536000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,-1.536000,30.226000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.159000,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.159000,-1.536000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,-1.536000,30.226000>}
box{<0,0,-0.063500><9.525000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.159000,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.098200,-1.536000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.624000,-1.536000,30.226000>}
box{<0,0,-0.063500><9.474200,0.036000,0.063500> rotate<0,0.000000,0> translate<39.624000,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.624000,-1.536000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.624000,-1.536000,37.846000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,90.000000,0> translate<39.624000,-1.536000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.624000,-1.536000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.098200,-1.536000,37.846000>}
box{<0,0,-0.063500><9.474200,0.036000,0.063500> rotate<0,0.000000,0> translate<39.624000,-1.536000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.098200,-1.536000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.098200,-1.536000,30.226000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.098200,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.098200,-1.536000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.624000,-1.536000,30.226000>}
box{<0,0,-0.127000><9.474200,0.036000,0.127000> rotate<0,0.000000,0> translate<39.624000,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.624000,-1.536000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.098200,-1.536000,37.846000>}
box{<0,0,-0.127000><9.474200,0.036000,0.127000> rotate<0,0.000000,0> translate<39.624000,-1.536000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.098200,-1.536000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.098200,-1.536000,30.226000>}
box{<0,0,-0.127000><7.620000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.098200,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,-1.536000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.209800,-1.536000,37.846000>}
box{<0,0,-0.127000><9.474200,0.036000,0.127000> rotate<0,0.000000,0> translate<2.209800,-1.536000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.209800,-1.536000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.209800,-1.536000,30.226000>}
box{<0,0,-0.127000><7.620000,0.036000,0.127000> rotate<0,-90.000000,0> translate<2.209800,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.209800,-1.536000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,-1.536000,30.226000>}
box{<0,0,-0.127000><9.474200,0.036000,0.127000> rotate<0,0.000000,0> translate<2.209800,-1.536000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.814000,-1.536000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,31.496000>}
box{<0,0,-0.203200><19.050000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.764000,-1.536000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,33.451800>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,90.000000,0> translate<16.764000,-1.536000,33.451800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,33.451800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,34.721800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<16.764000,-1.536000,34.721800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,34.721800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,36.576000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,90.000000,0> translate<16.764000,-1.536000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.814000,-1.536000,36.576000>}
box{<0,0,-0.203200><19.050000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.764000,-1.536000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.814000,-1.536000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.814000,-1.536000,31.496000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,-90.000000,0> translate<35.814000,-1.536000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,33.451800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.494000,-1.536000,33.451800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<15.494000,-1.536000,33.451800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.494000,-1.536000,33.451800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.494000,-1.536000,34.721800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<15.494000,-1.536000,34.721800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.494000,-1.536000,34.721800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.764000,-1.536000,34.721800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<15.494000,-1.536000,34.721800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<33.909000,-1.536000,34.036000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<32.639000,-1.536000,34.036000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<32.639000,-1.536000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.939000,-1.536000,34.036000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.669000,-1.536000,34.036000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<18.669000,-1.536000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.304000,-1.536000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.304000,-1.536000,34.671000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<19.304000,-1.536000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.794000,-1.536000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.514000,-1.536000,28.956000>}
box{<0,0,-0.063500><45.720000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.794000,-1.536000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.794000,-1.536000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.514000,-1.536000,39.116000>}
box{<0,0,-0.063500><45.720000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.794000,-1.536000,39.116000> }
//BAT4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.624000,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.624000,-1.536000,3.302000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.624000,-1.536000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.624000,-1.536000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,-1.536000,3.302000>}
box{<0,0,-0.063500><9.525000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.624000,-1.536000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,-1.536000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,-1.536000,10.922000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.149000,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.149000,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.624000,-1.536000,10.922000>}
box{<0,0,-0.063500><9.525000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.624000,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.209800,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,-1.536000,10.922000>}
box{<0,0,-0.063500><9.474200,0.036000,0.063500> rotate<0,0.000000,0> translate<2.209800,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,-1.536000,3.302000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.684000,-1.536000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,-1.536000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.209800,-1.536000,3.302000>}
box{<0,0,-0.063500><9.474200,0.036000,0.063500> rotate<0,0.000000,0> translate<2.209800,-1.536000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.209800,-1.536000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.209800,-1.536000,10.922000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,90.000000,0> translate<2.209800,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.209800,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,-1.536000,10.922000>}
box{<0,0,-0.127000><9.474200,0.036000,0.127000> rotate<0,0.000000,0> translate<2.209800,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,-1.536000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.209800,-1.536000,3.302000>}
box{<0,0,-0.127000><9.474200,0.036000,0.127000> rotate<0,0.000000,0> translate<2.209800,-1.536000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.209800,-1.536000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.209800,-1.536000,10.922000>}
box{<0,0,-0.127000><7.620000,0.036000,0.127000> rotate<0,90.000000,0> translate<2.209800,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.624000,-1.536000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.098200,-1.536000,3.302000>}
box{<0,0,-0.127000><9.474200,0.036000,0.127000> rotate<0,0.000000,0> translate<39.624000,-1.536000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.098200,-1.536000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.098200,-1.536000,10.922000>}
box{<0,0,-0.127000><7.620000,0.036000,0.127000> rotate<0,90.000000,0> translate<49.098200,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.098200,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.624000,-1.536000,10.922000>}
box{<0,0,-0.127000><9.474200,0.036000,0.127000> rotate<0,0.000000,0> translate<39.624000,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.494000,-1.536000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,9.652000>}
box{<0,0,-0.203200><19.050000,0.036000,0.203200> rotate<0,0.000000,0> translate<15.494000,-1.536000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,-90.000000,0> translate<34.544000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,6.426200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<34.544000,-1.536000,6.426200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,6.426200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,4.572000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,-90.000000,0> translate<34.544000,-1.536000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.494000,-1.536000,4.572000>}
box{<0,0,-0.203200><19.050000,0.036000,0.203200> rotate<0,0.000000,0> translate<15.494000,-1.536000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.494000,-1.536000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.494000,-1.536000,9.652000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,90.000000,0> translate<15.494000,-1.536000,9.652000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.814000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<34.544000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.814000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.814000,-1.536000,6.426200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<35.814000,-1.536000,6.426200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.814000,-1.536000,6.426200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.544000,-1.536000,6.426200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<34.544000,-1.536000,6.426200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.399000,-1.536000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.669000,-1.536000,7.112000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.399000,-1.536000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<31.369000,-1.536000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<32.639000,-1.536000,7.112000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<31.369000,-1.536000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<32.004000,-1.536000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<32.004000,-1.536000,6.477000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<32.004000,-1.536000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.514000,-1.536000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.794000,-1.536000,12.192000>}
box{<0,0,-0.063500><45.720000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.794000,-1.536000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.514000,-1.536000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.794000,-1.536000,2.032000>}
box{<0,0,-0.063500><45.720000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.794000,-1.536000,2.032000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.856000,0.000000,11.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.856000,0.000000,11.384000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.856000,0.000000,11.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.656000,0.000000,11.984000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.656000,0.000000,11.384000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.656000,0.000000,11.384000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.200000,0.000000,14.148000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.500000,0.000000,14.148000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.500000,0.000000,14.148000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.500000,0.000000,14.148000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.500000,0.000000,17.298000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,90.000000,0> translate<35.500000,0.000000,17.298000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.500000,0.000000,17.298000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.200000,0.000000,17.298000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.500000,0.000000,17.298000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.100000,0.000000,14.198000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.300000,0.000000,14.198000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.100000,0.000000,14.198000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.300000,0.000000,14.198000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.700000,0.000000,14.548000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<40.300000,0.000000,14.198000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.700000,0.000000,14.548000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.700000,0.000000,16.998000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,90.000000,0> translate<40.700000,0.000000,16.998000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.700000,0.000000,16.998000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.300000,0.000000,17.298000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<40.300000,0.000000,17.298000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.300000,0.000000,17.298000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.100000,0.000000,17.298000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.100000,0.000000,17.298000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.300000,0.000000,17.298000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.100000,0.000000,17.298000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.100000,0.000000,17.298000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.709000,0.000000,17.059000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.709000,0.000000,14.462000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.709000,0.000000,14.462000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.464000,0.000000,16.856000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.064000,0.000000,16.856000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.464000,0.000000,16.856000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.464000,0.000000,15.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.064000,0.000000,15.656000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.464000,0.000000,15.656000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.626000,0.000000,36.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.226000,0.000000,36.160000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.626000,0.000000,36.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.626000,0.000000,34.960000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.226000,0.000000,34.960000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.626000,0.000000,34.960000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.302000,0.000000,40.208000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.002000,0.000000,40.208000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.302000,0.000000,40.208000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.002000,0.000000,40.208000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.002000,0.000000,37.058000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<44.002000,0.000000,37.058000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.002000,0.000000,37.058000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.302000,0.000000,37.058000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.302000,0.000000,37.058000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.402000,0.000000,40.158000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.202000,0.000000,40.158000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.202000,0.000000,40.158000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.202000,0.000000,40.158000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.802000,0.000000,39.808000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<38.802000,0.000000,39.808000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.802000,0.000000,39.808000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.802000,0.000000,37.358000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.802000,0.000000,37.358000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.802000,0.000000,37.358000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.202000,0.000000,37.058000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<38.802000,0.000000,37.358000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.202000,0.000000,37.058000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.402000,0.000000,37.058000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.202000,0.000000,37.058000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.202000,0.000000,37.058000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.402000,0.000000,37.058000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.202000,0.000000,37.058000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.793000,0.000000,37.297000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.793000,0.000000,39.894000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<40.793000,0.000000,39.894000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.558000,0.000000,14.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.958000,0.000000,14.894000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.958000,0.000000,14.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.558000,0.000000,16.094000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.958000,0.000000,16.094000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.958000,0.000000,16.094000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.964000,0.000000,12.522000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.664000,0.000000,12.522000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.964000,0.000000,12.522000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.664000,0.000000,12.522000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.664000,0.000000,9.372000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<6.664000,0.000000,9.372000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.664000,0.000000,9.372000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.964000,0.000000,9.372000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.964000,0.000000,9.372000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.064000,0.000000,12.472000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.864000,0.000000,12.472000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.864000,0.000000,12.472000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.864000,0.000000,12.472000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.464000,0.000000,12.122000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<1.464000,0.000000,12.122000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.464000,0.000000,12.122000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.464000,0.000000,9.672000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<1.464000,0.000000,9.672000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.464000,0.000000,9.672000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.864000,0.000000,9.372000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<1.464000,0.000000,9.672000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.864000,0.000000,9.372000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.064000,0.000000,9.372000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.864000,0.000000,9.372000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.864000,0.000000,9.372000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.064000,0.000000,9.372000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.864000,0.000000,9.372000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.455000,0.000000,9.611000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.455000,0.000000,12.208000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<3.455000,0.000000,12.208000> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.808000,0.000000,11.546000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.808000,0.000000,9.846000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.808000,0.000000,9.846000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.808000,0.000000,9.846000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.658000,0.000000,9.846000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.658000,0.000000,9.846000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.658000,0.000000,9.846000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.658000,0.000000,11.546000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<11.658000,0.000000,11.546000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.758000,0.000000,13.446000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.758000,0.000000,14.646000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.758000,0.000000,14.646000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.758000,0.000000,14.646000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.408000,0.000000,15.046000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,48.810853,0> translate<14.408000,0.000000,15.046000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.408000,0.000000,15.046000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.958000,0.000000,15.046000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.958000,0.000000,15.046000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.958000,0.000000,15.046000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.658000,0.000000,14.646000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-53.126596,0> translate<11.658000,0.000000,14.646000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.658000,0.000000,14.646000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.658000,0.000000,13.446000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<11.658000,0.000000,13.446000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.658000,0.000000,14.646000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.658000,0.000000,13.446000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<11.658000,0.000000,13.446000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.897000,0.000000,13.055000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.494000,0.000000,13.055000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.897000,0.000000,13.055000> }
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.558000,0.000000,16.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.958000,0.000000,16.926000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.958000,0.000000,16.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.558000,0.000000,18.126000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.958000,0.000000,18.126000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.958000,0.000000,18.126000> }
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.444000,0.000000,10.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.844000,0.000000,10.068000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.844000,0.000000,10.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.444000,0.000000,11.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.844000,0.000000,11.268000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.844000,0.000000,11.268000> }
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.464000,0.000000,19.142000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.064000,0.000000,19.142000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.464000,0.000000,19.142000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.464000,0.000000,17.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.064000,0.000000,17.942000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.464000,0.000000,17.942000> }
//CT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.936400,0.000000,28.981400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.936400,0.000000,12.192000>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.936400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.936400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.214800,0.000000,12.192000>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<42.214800,0.000000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.214800,0.000000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.214800,0.000000,28.981400>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,90.000000,0> translate<42.214800,0.000000,28.981400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.214800,0.000000,28.981400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.936400,0.000000,28.981400>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<42.214800,0.000000,28.981400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.276000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.196000,0.000000,20.574000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<44.196000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.276000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,21.844000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,44.997030,0> translate<48.006000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,19.304000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.006000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.006000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.276000,0.000000,20.574000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,-44.997030,0> translate<48.006000,0.000000,19.304000> }
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.238000,0.000000,9.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.238000,0.000000,10.160000>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,90.000000,0> translate<36.238000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.238000,0.000000,10.620000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.238000,0.000000,10.160000>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.238000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.238000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.928000,0.000000,9.926200>}
box{<0,0,-0.101600><0.388281,0.036000,0.101600> rotate<0,-37.020919,0> translate<35.928000,0.000000,9.926200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.222600,0.000000,10.185400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.928000,0.000000,10.378400>}
box{<0,0,-0.101600><0.352191,0.036000,0.101600> rotate<0,33.227641,0> translate<35.928000,0.000000,10.378400> }
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.848000,0.000000,13.498000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.948000,0.000000,13.498000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.848000,0.000000,13.498000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.948000,0.000000,13.498000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.948000,0.000000,17.998000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<10.948000,0.000000,17.998000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.948000,0.000000,17.998000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.848000,0.000000,17.998000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.848000,0.000000,17.998000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.848000,0.000000,17.998000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.848000,0.000000,13.498000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<7.848000,0.000000,13.498000> }
difference{
cylinder{<8.398000,0,14.048000><8.398000,0.036000,14.048000>0.287100 translate<0,0.000000,0>}
cylinder{<8.398000,-0.1,14.048000><8.398000,0.135000,14.048000>0.160100 translate<0,0.000000,0>}}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<9.723000,0.000000,18.498000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<9.073000,0.000000,18.498000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<10.373000,0.000000,18.498000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<8.423000,0.000000,18.498000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<8.423000,0.000000,12.998000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<9.073000,0.000000,12.998000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<9.723000,0.000000,12.998000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<10.373000,0.000000,12.998000>}
//JP1 silk screen
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,4.318000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.050000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.955000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.590000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.955000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,2.413000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.050000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<15.875000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.875000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,4.318000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.510000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.415000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.415000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,2.413000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.510000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.970000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<13.970000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.495000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.130000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.495000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.590000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.590000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,1.778000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.320000,0.000000,3.048000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.780000,0.000000,3.048000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.240000,0.000000,3.048000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.860000,0.000000,3.048000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.398000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.763000,0.000000,28.194000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<8.763000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.493000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.858000,0.000000,27.559000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.858000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.858000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.223000,0.000000,28.194000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<6.223000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.953000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.318000,0.000000,27.559000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.318000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.318000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.683000,0.000000,28.194000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<3.683000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.413000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.778000,0.000000,27.559000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<1.778000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.398000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.398000,0.000000,23.749000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,-90.000000,0> translate<9.398000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.398000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.763000,0.000000,23.114000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.763000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.763000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.493000,0.000000,23.114000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.493000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.493000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.858000,0.000000,23.749000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<6.858000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.858000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.223000,0.000000,23.114000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.223000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.223000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.953000,0.000000,23.114000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.953000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.953000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.318000,0.000000,23.749000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.318000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.318000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.683000,0.000000,23.114000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<3.683000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.683000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.413000,0.000000,23.114000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.413000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.413000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.778000,0.000000,23.749000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<1.778000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.858000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.858000,0.000000,27.559000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<6.858000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.318000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.318000,0.000000,27.559000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.318000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.778000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.778000,0.000000,27.559000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,90.000000,0> translate<1.778000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.683000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.413000,0.000000,28.194000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.413000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.223000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.953000,0.000000,28.194000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.953000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.763000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.493000,0.000000,28.194000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.493000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.493000,0.000000,28.529000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.763000,0.000000,28.529000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.493000,0.000000,28.529000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<8.128000,0.000000,26.924000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<8.128000,0.000000,24.384000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.588000,0.000000,24.384000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.588000,0.000000,26.924000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<3.048000,0.000000,24.384000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<3.048000,0.000000,26.924000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,7.620000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.050000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,7.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.955000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.590000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.955000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.050000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,7.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<15.875000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.875000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,7.620000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.510000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,7.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.415000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.415000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.510000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.970000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<13.970000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,7.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.495000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.130000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.495000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.590000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.590000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,5.080000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.320000,0.000000,6.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.780000,0.000000,6.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.240000,0.000000,6.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.860000,0.000000,6.350000>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,7.620000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.258000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,7.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.893000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.163000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.798000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.163000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.893000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<32.258000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,7.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.813000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.083000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.718000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.083000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,7.620000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.718000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,7.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.353000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.623000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.258000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.623000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.353000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.718000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.178000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.178000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<27.178000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.813000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,7.620000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.433000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.703000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,5.715000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.338000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.703000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.798000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,5.080000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.798000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,5.080000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.433000,0.000000,5.080000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<33.528000,0.000000,6.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.988000,0.000000,6.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<28.448000,0.000000,6.350000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.068000,0.000000,6.350000>}
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,4.318000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.258000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.893000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.163000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.798000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.163000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.893000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,2.413000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<32.258000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.813000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.083000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.718000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.083000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,4.318000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.718000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.353000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.623000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.258000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.258000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.623000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.623000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.353000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.353000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.718000,0.000000,2.413000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.718000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.178000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.178000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.178000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<27.178000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.083000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.813000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,4.318000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.433000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.703000,0.000000,4.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,3.683000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,2.413000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.338000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.703000,0.000000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,4.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,3.683000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.798000,0.000000,3.683000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.798000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,1.778000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.798000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.433000,0.000000,1.778000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.433000,0.000000,1.778000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<33.528000,0.000000,3.048000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.988000,0.000000,3.048000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<28.448000,0.000000,3.048000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.068000,0.000000,3.048000>}
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,0.000000,19.304000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.699000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,19.939000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.064000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,21.209000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.064000,0.000000,21.209000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,0.000000,21.844000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.064000,0.000000,21.209000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,21.209000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.604000,0.000000,21.209000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,19.939000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.969000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,21.844000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<5.969000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.699000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,21.844000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.699000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,19.304000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<3.429000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,0.000000,19.304000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.159000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.524000,0.000000,19.939000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<1.524000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.524000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.524000,0.000000,21.209000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<1.524000,0.000000,21.209000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.524000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,0.000000,21.844000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<1.524000,0.000000,21.209000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.159000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,21.844000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<2.159000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.429000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.064000,0.000000,21.209000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<3.429000,0.000000,21.844000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.334000,0.000000,20.574000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<2.794000,0.000000,20.574000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.032000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.096000,0.000000,13.462000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.032000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.032000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.096000,0.000000,18.034000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.032000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.006600,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.006600,0.000000,13.665200>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<2.006600,0.000000,13.665200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.096000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.096000,0.000000,13.665200>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<6.096000,0.000000,13.665200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.032000,0.000000,17.830800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.032000,0.000000,18.034000>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<2.032000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.096000,0.000000,17.830800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.096000,0.000000,18.034000>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<6.096000,0.000000,18.034000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.130000,0.000000,20.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.530000,0.000000,20.990000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.530000,0.000000,20.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.130000,0.000000,22.190000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.530000,0.000000,22.190000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.530000,0.000000,22.190000> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.530000,0.000000,19.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.130000,0.000000,19.650000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.530000,0.000000,19.650000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.530000,0.000000,18.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.130000,0.000000,18.450000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.530000,0.000000,18.450000> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.792000,0.000000,25.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.792000,0.000000,25.354000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.792000,0.000000,25.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.592000,0.000000,25.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.592000,0.000000,25.354000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.592000,0.000000,25.354000> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.254000,0.000000,6.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.254000,0.000000,6.304000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.254000,0.000000,6.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.054000,0.000000,6.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.054000,0.000000,6.304000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.054000,0.000000,6.304000> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.768000,0.000000,13.046000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.368000,0.000000,13.046000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.768000,0.000000,13.046000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.768000,0.000000,11.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.368000,0.000000,11.846000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.768000,0.000000,11.846000> }
//RB1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.786000,0.000000,20.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.786000,0.000000,20.874000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.786000,0.000000,20.874000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.986000,0.000000,20.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.986000,0.000000,20.874000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.986000,0.000000,20.874000> }
//RB2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.786000,0.000000,25.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.786000,0.000000,26.208000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.786000,0.000000,26.208000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.986000,0.000000,25.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.986000,0.000000,26.208000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.986000,0.000000,26.208000> }
//SJ1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,8.509000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,8.509000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<31.242000,0.000000,12.827000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<31.242000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.766000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.766000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,13.081000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.242000,0.000000,13.081000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.242000,0.000000,13.081000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.242000,0.000000,8.255000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.242000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.988000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.988000,0.000000,12.827000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.988000,0.000000,12.827000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,12.954000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.004000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,8.382000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.004000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.242000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.988000,0.000000,10.668000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.988000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,10.668000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,10.668000> }
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<32.004000,0.000000,11.684000>}
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<32.004000,0.000000,9.652000>}
box{<-0.508000,0,-0.762000><0.508000,0.036000,0.762000> rotate<0,-90.000000,0> translate<32.004000,0.000000,10.668000>}
//SJ2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,0.000000,22.860000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,0.000000,22.860000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.287000,0.000000,21.082000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.081000,0.000000,21.082000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.081000,0.000000,22.606000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.287000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.033000,0.000000,21.082000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.033000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,21.082000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.335000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,20.828000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.287000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,21.844000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.208000,0.000000,21.844000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.700000,0.000000,21.844000> }
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<11.938000,0.000000,21.844000>}
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<11.430000,0.000000,21.844000>}
//SW2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.972000,-1.536000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,-1.536000,18.161000>}
box{<0,0,-0.101600><11.684000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.288000,-1.536000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,-1.536000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.972000,-1.536000,22.987000>}
box{<0,0,-0.101600><11.684000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.288000,-1.536000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.972000,-1.536000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.972000,-1.536000,22.225000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.972000,-1.536000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.972000,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.972000,-1.536000,18.161000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.972000,-1.536000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.972000,-1.536000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.972000,-1.536000,18.923000>}
box{<0,0,-0.101600><3.302000,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.972000,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,-1.536000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,-1.536000,18.923000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<18.288000,-1.536000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,-1.536000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,-1.536000,22.987000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<18.288000,-1.536000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,-1.536000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,-1.536000,22.225000>}
box{<0,0,-0.101600><3.302000,0.036000,0.101600> rotate<0,90.000000,0> translate<18.288000,-1.536000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.032200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.032200,-1.536000,18.669000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<29.032200,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.032200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<28.117800,-1.536000,22.479000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<28.117800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<28.117800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<28.117800,-1.536000,22.479000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<28.117800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.117800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.032200,-1.536000,18.669000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<28.117800,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.762200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.762200,-1.536000,18.669000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<27.762200,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<27.762200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.847800,-1.536000,22.479000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<26.847800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.847800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.847800,-1.536000,22.479000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<26.847800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.847800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.762200,-1.536000,18.669000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<26.847800,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.492200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.492200,-1.536000,18.669000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<26.492200,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<26.492200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.577800,-1.536000,22.479000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<25.577800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.577800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.577800,-1.536000,22.479000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<25.577800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.577800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.492200,-1.536000,18.669000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<25.577800,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.222200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.222200,-1.536000,18.669000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<25.222200,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.222200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.307800,-1.536000,22.479000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<24.307800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.307800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.307800,-1.536000,22.479000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<24.307800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.307800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.222200,-1.536000,18.669000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<24.307800,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.952200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.952200,-1.536000,18.669000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<23.952200,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.952200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.037800,-1.536000,22.479000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<23.037800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.037800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.037800,-1.536000,22.479000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<23.037800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.037800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.952200,-1.536000,18.669000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<23.037800,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.682200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.682200,-1.536000,18.669000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<22.682200,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.682200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.767800,-1.536000,22.479000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<21.767800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.767800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.767800,-1.536000,22.479000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<21.767800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.767800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.682200,-1.536000,18.669000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<21.767800,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.412200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.412200,-1.536000,18.669000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<21.412200,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.412200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.497800,-1.536000,22.479000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<20.497800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.497800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.497800,-1.536000,22.479000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<20.497800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.497800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.412200,-1.536000,18.669000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<20.497800,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.142200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.142200,-1.536000,18.669000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<20.142200,-1.536000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.142200,-1.536000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.227800,-1.536000,22.479000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<19.227800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.227800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.227800,-1.536000,22.479000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<19.227800,-1.536000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.227800,-1.536000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.142200,-1.536000,18.669000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<19.227800,-1.536000,18.669000> }
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<28.575000,-1.536000,20.383500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<28.575000,-1.536000,19.748500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<28.575000,-1.536000,19.113500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<27.305000,-1.536000,20.383500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<27.305000,-1.536000,19.748500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<27.305000,-1.536000,19.113500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<26.035000,-1.536000,20.383500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<26.035000,-1.536000,19.748500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<26.035000,-1.536000,19.113500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<24.765000,-1.536000,20.383500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<24.765000,-1.536000,19.748500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<24.765000,-1.536000,19.113500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<23.495000,-1.536000,20.383500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<23.495000,-1.536000,19.748500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<23.495000,-1.536000,19.113500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<22.225000,-1.536000,20.383500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<22.225000,-1.536000,19.748500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<22.225000,-1.536000,19.113500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<20.955000,-1.536000,20.383500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<20.955000,-1.536000,19.748500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<20.955000,-1.536000,19.113500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<19.685000,-1.536000,20.383500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<19.685000,-1.536000,19.748500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<19.685000,-1.536000,19.113500>}
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.625000,0.000000,13.005000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.625000,0.000000,20.015000>}
box{<0,0,-0.101600><7.010000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.625000,0.000000,20.015000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.625000,0.000000,20.015000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.635000,0.000000,20.015000>}
box{<0,0,-0.076200><7.010000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.625000,0.000000,20.015000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.635000,0.000000,20.015000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.635000,0.000000,13.360000>}
box{<0,0,-0.101600><6.655000,0.036000,0.101600> rotate<0,-90.000000,0> translate<27.635000,0.000000,13.360000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.280000,0.000000,13.005000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.625000,0.000000,13.005000>}
box{<0,0,-0.101600><6.655000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.625000,0.000000,13.005000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.280000,0.000000,13.005000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.635000,0.000000,13.360000>}
box{<0,0,-0.101600><0.502046,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.280000,0.000000,13.005000> }
difference{
cylinder{<27.787600,0,12.827000><27.787600,0.036000,12.827000>0.254000 translate<0,0.000000,0>}
cylinder{<27.787600,-0.1,12.827000><27.787600,0.135000,12.827000>0.050800 translate<0,0.000000,0>}}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<28.181300,0.000000,13.710000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<28.181300,0.000000,14.510000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<28.181300,0.000000,15.310000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<28.181300,0.000000,16.110000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<28.181300,0.000000,16.910000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<28.181300,0.000000,17.710000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<28.181300,0.000000,18.510000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<28.181300,0.000000,19.310000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<26.930000,0.000000,20.561300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<26.130000,0.000000,20.561300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<25.330000,0.000000,20.561300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<24.530000,0.000000,20.561300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<23.730000,0.000000,20.561300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<22.930000,0.000000,20.561300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<22.130000,0.000000,20.561300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<21.330000,0.000000,20.561300>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<20.078700,0.000000,19.310000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<20.078700,0.000000,18.510000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<20.078700,0.000000,17.710000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<20.078700,0.000000,16.910000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<20.078700,0.000000,16.110000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<20.078700,0.000000,15.310000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<20.078700,0.000000,14.510000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<20.078700,0.000000,13.710000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<21.330000,0.000000,12.458700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<22.130000,0.000000,12.458700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<22.930000,0.000000,12.458700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<23.730000,0.000000,12.458700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<24.530000,0.000000,12.458700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<25.330000,0.000000,12.458700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<26.130000,0.000000,12.458700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<26.930000,0.000000,12.458700>}
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.504000,0.000000,24.512000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.804000,0.000000,24.512000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.804000,0.000000,24.512000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.504000,0.000000,40.512000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.804000,0.000000,40.512000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.804000,0.000000,40.512000> }
difference{
cylinder{<32.639000,0,25.527000><32.639000,0.036000,25.527000>0.444500 translate<0,0.000000,0>}
cylinder{<32.639000,-0.1,25.527000><32.639000,0.135000,25.527000>0.317500 translate<0,0.000000,0>}}
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.238000,0.000000,22.844000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.238000,0.000000,20.844000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.238000,0.000000,20.844000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.088000,0.000000,20.844000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.238000,0.000000,20.844000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.088000,0.000000,20.844000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.088000,0.000000,22.844000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.238000,0.000000,22.844000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.088000,0.000000,22.844000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.738000,0.000000,22.844000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.738000,0.000000,20.844000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<28.738000,0.000000,20.844000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.738000,0.000000,20.844000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.888000,0.000000,20.844000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.738000,0.000000,20.844000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.738000,0.000000,22.844000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.888000,0.000000,22.844000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.738000,0.000000,22.844000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.238000,0.000000,20.844000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.738000,0.000000,20.844000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.738000,0.000000,20.844000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.738000,0.000000,20.844000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.738000,0.000000,22.844000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<28.738000,0.000000,22.844000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.738000,0.000000,22.844000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.238000,0.000000,22.844000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.738000,0.000000,22.844000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.238000,0.000000,22.844000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.238000,0.000000,20.844000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.238000,0.000000,20.844000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  M328P_RFM69_NODE(-25.146000,0,-20.955000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//BAT3	1.5V - AA	BATTERY-AAA-KIT
//BAT4	1.5V - AA	BATTERY-AAA-KIT
//CT1	MUTUAL	MUTUAL
//JP1	ANTENNA	LUXEON-PAD
//SW2	Node ID	DIPSWITCH-08-50MIL
