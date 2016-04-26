//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/Work/AVR_Playground/sensors_network/hardware/eagle/node/m328p_rfm69_node.brd
//4/26/16 4:02 PM

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
#local cam_y = 209;
#local cam_z = -91;
#local cam_a = 25;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 45;
#local pcb_rotate_z = 0;

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

#local lgt1_pos_x = 24;
#local lgt1_pos_y = 37;
#local lgt1_pos_z = 21;
#local lgt1_intense = 0.737333;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 37;
#local lgt2_pos_z = 21;
#local lgt2_intense = 0.737333;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 37;
#local lgt3_pos_z = -14;
#local lgt3_intense = 0.737333;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 37;
#local lgt4_pos_z = -14;
#local lgt4_intense = 0.737333;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 65.532000;
#declare pcb_y_size = 39.878000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(746);
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
	//translate<-32.766000,0,-19.939000>
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
box{<65.786000,0,39.878000><0.254000,-1.500000,0.000000> texture{col_brd}}

//Holes(real)/Parts
//Holes(real)/Board
cylinder{<2.286000,1,37.846000><2.286000,-5,37.846000>1.500000 texture{col_hls}}
cylinder{<2.286000,1,2.032000><2.286000,-5,2.032000>1.500000 texture{col_hls}}
cylinder{<63.754000,1,2.032000><63.754000,-5,2.032000>1.500000 texture{col_hls}}
cylinder{<63.754000,1,37.846000><63.754000,-5,37.846000>1.500000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<21.590000,0.000000,16.002000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100n 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<49.022000,0.000000,15.494000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C2 10uF EIA3528
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.130000,0.000000,11.176000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C4 100n 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<53.086000,0.000000,32.258000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<52.578000,0.000000,35.560000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C6 10uF EIA3528
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.878000,0.000000,10.668000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C7 100n 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.620000,0.000000,17.780000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C8 47uF EIA3528
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<18.288000,0.000000,15.494000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C9 47uF EIA3528
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.878000,0.000000,12.954000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C10 100n 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.716000,0.000000,13.208000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 100n 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.130000,0.000000,13.208000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_LED_SMD_SIDE(Green,0.500000,0.000000,)translate<0,-0.25,0> rotate<-90,90.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<43.688000,0.000000,15.240000>}#end		//Diskrete 3MM LED D1 ACTIVITY LED-0603
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_TSSOP8("L6920","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.716000,0.000000,18.542000>translate<0,0.035000,0> }#end		//TSSOP8 IC2 L6920 TSSOP8
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.336000,0.000000,3.302000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP2 HTU21D 1X04
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<18.542000,0.000000,30.480000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) JP3 ISP 2X3-NS
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.336000,0.000000,6.096000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP4 OTHER 1X04
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<42.418000,0.000000,6.096000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP5 OTHER 1X04
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<42.418000,0.000000,3.302000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP6 OTHER 1X04
#ifndef(pack_JP7) #declare global_pack_JP7=yes; object {CON_PH_1X2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.112000,0.000000,21.844000>}#end		//Header 2,54mm Grid 2Pin 1Row (jumper.lib) JP7 Ammeter probe 1X02
#ifndef(pack_L1) #declare global_pack_L1=yes; object {SPC_L_MURATA_2012_LQH3C("10uH",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<7.366000,0.000000,12.954000>}#end		//Inductor MURATA Chip Coil L1 10uH DLJ-4018
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<50.800000,0.000000,22.860000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 100K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<50.800000,0.000000,19.558000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 100K 0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<20.320000,0.000000,23.622000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R3 10K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<32.004000,0.000000,2.794000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("681",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<43.688000,0.000000,11.684000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 680 0805
#ifndef(pack_RB1) #declare global_pack_RB1=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.848000,0.000000,15.748000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB1 470 0805
#ifndef(pack_RB2) #declare global_pack_RB2=yes; object {RES_SMD_CHIP_0805("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.848000,0.000000,22.352000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB2 330 0805
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ2 VB_EN_DIS
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("M328P","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<31.750000,0.000000,10.414000>translate<0,0.035000,0> }#end		//TQFP-32 U1 M328P TQFP32-08
#ifndef(pack_U2) #declare global_pack_U2=yes; object {RFM69HW_SMD("RFM69W",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<35.052000,0.000000,28.194000>}#end		//RFM69HW SMD U2 RFM69W RFM69W
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {RESONATOR_SMD("8MHz",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<37.592000,0.000000,17.018000>}#end		//RESONATOR SMD Y1 8MHz RESONATOR-SMD_MED
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<56.642000,0,31.496000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<49.530000,0,31.496000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<6.350000,0,31.496000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.462000,0,31.496000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<6.350000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.462000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<56.642000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.530000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.590000,0.000000,16.902000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.590000,0.000000,15.102000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.672000,0.000000,15.494000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.372000,0.000000,15.494000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.230000,0.000000,11.176000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.030000,0.000000,11.176000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.186000,0.000000,32.258000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<53.986000,0.000000,32.258000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.928000,0.000000,35.560000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<54.228000,0.000000,35.560000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.778000,0.000000,10.668000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.978000,0.000000,10.668000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<5.970000,0.000000,17.780000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.270000,0.000000,17.780000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.288000,0.000000,17.144000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.288000,0.000000,13.844000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.778000,0.000000,12.954000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.978000,0.000000,12.954000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.716000,0.000000,14.108000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.716000,0.000000,12.308000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.230000,0.000000,13.208000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.030000,0.000000,13.208000>}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<61.976000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<61.976000,0,13.920000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,30) rotate<0,-0.000000,0> texture{col_pds} translate<43.688000,0.000000,14.363000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,30) rotate<0,-0.000000,0> texture{col_pds} translate<43.688000,0.000000,16.117000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.741000,0.000000,15.642000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.391000,0.000000,15.642000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.041000,0.000000,15.642000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.691000,0.000000,15.642000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.691000,0.000000,21.442000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.041000,0.000000,21.442000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.391000,0.000000,21.442000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.741000,0.000000,21.442000>}
object{TOOLS_PCB_SMD(3.900000,2.400000,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<9.906000,0.000000,37.338000>}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<17.526000,0,3.302000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<20.066000,0,3.302000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<22.606000,0,3.302000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<25.146000,0,3.302000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.812000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.272000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.812000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.272000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<19.812000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.272000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<17.526000,0,6.096000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<20.066000,0,6.096000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<22.606000,0,6.096000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<25.146000,0,6.096000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<38.608000,0,6.096000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<41.148000,0,6.096000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<43.688000,0,6.096000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<46.228000,0,6.096000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<38.608000,0,3.302000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<41.148000,0,3.302000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<43.688000,0,3.302000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<46.228000,0,3.302000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-270.000000,0>translate<8.382000,0,21.844000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-270.000000,0>translate<5.842000,0,21.844000> texture{col_thl}}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.866000,0.000000,12.954000>}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.866000,0.000000,12.954000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.700000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.900000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.900000,0.000000,19.558000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.700000,0.000000,19.558000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.220000,0.000000,23.622000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.420000,0.000000,23.622000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.004000,0.000000,3.694000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.004000,0.000000,1.894000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.688000,0.000000,10.784000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.688000,0.000000,12.584000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.848000,0.000000,14.848000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.848000,0.000000,16.648000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.848000,0.000000,21.452000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.848000,0.000000,23.252000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.304000,0.000000,20.828000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.780000,0.000000,20.828000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.005000,-1.537000,16.112000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.735000,-1.537000,16.112000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.465000,-1.537000,16.112000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.195000,-1.537000,16.112000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<34.925000,-1.537000,16.112000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.655000,-1.537000,16.112000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.385000,-1.537000,16.112000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.115000,-1.537000,16.112000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.115000,-1.537000,23.512000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<32.385000,-1.537000,23.512000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.655000,-1.537000,23.512000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<34.925000,-1.537000,23.512000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<36.195000,-1.537000,23.512000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<37.465000,-1.537000,23.512000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.735000,-1.537000,23.512000>}
object{TOOLS_PCB_SMD(1.270000,0.762000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.005000,-1.537000,23.512000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.042600,0.000000,7.614000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.042600,0.000000,8.414000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.042600,0.000000,9.214000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.042600,0.000000,10.014000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.042600,0.000000,10.814000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.042600,0.000000,11.614000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.042600,0.000000,12.414000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.042600,0.000000,13.214000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.550000,0.000000,14.706600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.750000,0.000000,14.706600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.950000,0.000000,14.706600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.150000,0.000000,14.706600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.350000,0.000000,14.706600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.550000,0.000000,14.706600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.750000,0.000000,14.706600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.950000,0.000000,14.706600>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.457400,0.000000,13.214000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.457400,0.000000,12.414000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.457400,0.000000,11.614000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.457400,0.000000,10.814000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.457400,0.000000,10.014000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.457400,0.000000,9.214000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.457400,0.000000,8.414000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.457400,0.000000,7.614000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.950000,0.000000,6.121400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.750000,0.000000,6.121400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.550000,0.000000,6.121400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.350000,0.000000,6.121400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.150000,0.000000,6.121400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.950000,0.000000,6.121400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.750000,0.000000,6.121400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.550000,0.000000,6.121400>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.902000,0.000000,21.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.902000,0.000000,23.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.902000,0.000000,25.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.902000,0.000000,27.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.902000,0.000000,29.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.902000,0.000000,31.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.902000,0.000000,33.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.902000,0.000000,35.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.202000,0.000000,35.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.202000,0.000000,33.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.202000,0.000000,31.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.202000,0.000000,29.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.202000,0.000000,27.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.202000,0.000000,25.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.202000,0.000000,23.194000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.202000,0.000000,21.194000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.092000,0.000000,17.018000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.592000,0.000000,17.018000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.092000,0.000000,17.018000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.210000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<16.764000,0,23.114000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.178000,0,6.096000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.210000,0,8.890000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.956000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<34.798000,0,21.082000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<34.544000,0,13.208000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<33.274000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<32.004000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<30.734000,0,13.208000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<30.988000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<43.688000,0,9.398000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<36.322000,0,26.416000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<36.322000,0,6.096000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<48.260000,0,23.114000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.442000,0,19.310000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.448000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.496000,0,21.050000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.464000,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<32.258000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<32.258000,0,21.082000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.432000,0,14.986000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.048000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.048000,0.000000,32.258000>}
box{<0,0,-0.304800><25.908000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.048000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.048000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,0.000000,34.290000>}
box{<0,0,-0.304800><2.873682,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.048000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.048000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.842000,0.000000,3.556000>}
box{<0,0,-0.304800><3.951313,0.035000,0.304800> rotate<0,44.997030,0> translate<3.048000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<5.842000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<5.842000,0.000000,30.988000>}
box{<0,0,-0.635000><9.144000,0.035000,0.635000> rotate<0,90.000000,0> translate<5.842000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.866000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.970000,0.000000,17.780000>}
box{<0,0,-0.406400><4.827120,0.035000,0.406400> rotate<0,-88.759612,0> translate<5.866000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.970000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.970000,0.000000,19.432000>}
box{<0,0,-0.406400><1.652000,0.035000,0.406400> rotate<0,90.000000,0> translate<5.970000,0.000000,19.432000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<5.842000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.350000,0.000000,31.496000>}
box{<0,0,-0.635000><0.718420,0.035000,0.635000> rotate<0,-44.997030,0> translate<5.842000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.874000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.874000,0.000000,13.946000>}
box{<0,0,-0.228600><5.358000,0.035000,0.228600> rotate<0,-90.000000,0> translate<7.874000,0.000000,13.946000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.970000,0.000000,19.432000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.382000,0.000000,21.844000>}
box{<0,0,-0.406400><3.411083,0.035000,0.406400> rotate<0,-44.997030,0> translate<5.970000,0.000000,19.432000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.874000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.819000,0.000000,20.249000>}
box{<0,0,-0.228600><1.336432,0.035000,0.228600> rotate<0,-44.997030,0> translate<7.874000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<7.874000,0.000000,13.946000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.866000,0.000000,12.954000>}
box{<0,0,-0.228600><1.402900,0.035000,0.228600> rotate<0,44.997030,0> translate<7.874000,0.000000,13.946000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.350000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.144000,0.000000,8.382000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,0.000000,0> translate<6.350000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.382000,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.652000,-1.535000,23.114000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.382000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<9.270000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<11.430000,0.000000,17.780000>}
box{<0,0,-0.228600><2.160000,0.035000,0.228600> rotate<0,0.000000,0> translate<9.270000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,0.000000,17.780000>}
box{<0,0,-0.304800><4.064000,0.035000,0.304800> rotate<0,90.000000,0> translate<11.430000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<11.430000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.192000,0.000000,17.780000>}
box{<0,0,-0.228600><0.762000,0.035000,0.228600> rotate<0,0.000000,0> translate<11.430000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,15.642000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,16.805000>}
box{<0,0,-0.203200><1.163000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.741000,0.000000,16.805000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,21.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,22.393000>}
box{<0,0,-0.203200><0.951000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.741000,0.000000,22.393000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.838000,0.000000,12.308000>}
box{<0,0,-0.304800><1.991213,0.035000,0.304800> rotate<0,44.997030,0> translate<11.430000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,16.805000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.954000,0.000000,17.018000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.741000,0.000000,16.805000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,22.393000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.954000,0.000000,22.606000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.741000,0.000000,22.393000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.144000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.070000,0.000000,12.308000>}
box{<0,0,-0.406400><5.552202,0.035000,0.406400> rotate<0,-44.997030,0> translate<9.144000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<8.819000,0.000000,20.249000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.391000,0.000000,20.249000>}
box{<0,0,-0.228600><4.572000,0.035000,0.228600> rotate<0,0.000000,0> translate<8.819000,0.000000,20.249000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.391000,0.000000,21.442000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.391000,0.000000,20.249000>}
box{<0,0,-0.228600><1.193000,0.035000,0.228600> rotate<0,-90.000000,0> translate<13.391000,0.000000,20.249000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.838000,0.000000,12.308000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.716000,0.000000,12.308000>}
box{<0,0,-0.406400><0.878000,0.035000,0.406400> rotate<0,0.000000,0> translate<12.838000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.070000,0.000000,12.308000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.716000,0.000000,12.308000>}
box{<0,0,-0.406400><0.646000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.070000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,14.108000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.832000,0.000000,14.224000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.716000,0.000000,14.108000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.192000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<14.041000,0.000000,19.629000>}
box{<0,0,-0.228600><2.614881,0.035000,0.228600> rotate<0,-44.997030,0> translate<12.192000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<14.041000,0.000000,21.442000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<14.041000,0.000000,19.629000>}
box{<0,0,-0.228600><1.813000,0.035000,0.228600> rotate<0,-90.000000,0> translate<14.041000,0.000000,19.629000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.832000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.478000,0.000000,14.224000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.832000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.954000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.478000,0.000000,22.606000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.954000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.478000,0.000000,34.290000>}
box{<0,0,-0.304800><9.398000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.080000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.478000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,14.437000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.478000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,15.642000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,14.437000>}
box{<0,0,-0.203200><1.205000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.691000,0.000000,14.437000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.478000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,22.393000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,44.997030,0> translate<14.478000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,21.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,22.393000>}
box{<0,0,-0.203200><0.951000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.691000,0.000000,22.393000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.691000,0.000000,25.867000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.691000,0.000000,22.393000>}
box{<0,0,-0.304800><3.474000,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.691000,0.000000,22.393000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,29.210000>}
box{<0,0,-0.304800><3.048000,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.748000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.478000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,32.258000>}
box{<0,0,-0.304800><2.396231,0.035000,0.304800> rotate<0,57.990789,0> translate<14.478000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.716000,0.000000,12.308000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.990000,0.000000,12.308000>}
box{<0,0,-0.406400><2.274000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.716000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.652000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,-1.535000,23.114000>}
box{<0,0,-0.304800><7.112000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.652000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.842000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,3.556000>}
box{<0,0,-0.304800><11.430000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.842000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.691000,0.000000,25.867000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,27.940000>}
box{<0,0,-0.304800><3.310421,0.035000,0.304800> rotate<0,-38.768073,0> translate<14.691000,0.000000,25.867000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,27.940000>}
box{<0,0,-0.304800><1.983803,0.035000,0.304800> rotate<0,39.802944,0> translate<15.748000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,24.754000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,27.940000>}
box{<0,0,-0.304800><3.186000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.272000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,2.032000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.526000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,3.302000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<17.272000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,6.096000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.526000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.272000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,28.448000>}
box{<0,0,-0.203200><0.567961,0.035000,0.203200> rotate<0,-63.430762,0> translate<17.272000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.764000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,0.000000,22.098000>}
box{<0,0,-0.406400><1.436841,0.035000,0.406400> rotate<0,44.997030,0> translate<16.764000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,0.000000,22.098000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,90.000000,0> translate<17.780000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.954000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.162000,0.000000,17.018000>}
box{<0,0,-0.203200><5.208000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.954000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,1.270000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<17.526000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.990000,0.000000,12.308000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,0.000000,13.844000>}
box{<0,0,-0.406400><2.764073,0.035000,0.406400> rotate<0,-33.756829,0> translate<15.990000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.162000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,17.144000>}
box{<0,0,-0.203200><0.178191,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.162000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,17.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.542000,0.000000,16.890000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<18.288000,0.000000,17.144000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,0.000000,26.416000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,-90.000000,0> translate<18.542000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.272000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,0.000000,29.210000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<17.272000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.272000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,0.000000,31.750000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<17.272000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,17.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.304000,0.000000,18.160000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.288000,0.000000,17.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.304000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.304000,0.000000,18.160000>}
box{<0,0,-0.304800><2.668000,0.035000,0.304800> rotate<0,-90.000000,0> translate<19.304000,0.000000,18.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,37.338000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.906000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.304000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.420000,0.000000,20.944000>}
box{<0,0,-0.304800><0.164049,0.035000,0.304800> rotate<0,-44.997030,0> translate<19.304000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.420000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.420000,0.000000,20.944000>}
box{<0,0,-0.304800><2.678000,0.035000,0.304800> rotate<0,-90.000000,0> translate<19.420000,0.000000,20.944000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,24.754000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.420000,0.000000,23.622000>}
box{<0,0,-0.304800><2.428030,0.035000,0.304800> rotate<0,27.787480,0> translate<17.272000,0.000000,24.754000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.066000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.066000,0.000000,3.302000>}
box{<0,0,-0.406400><2.794000,0.035000,0.406400> rotate<0,-90.000000,0> translate<20.066000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,0.000000,25.146000>}
box{<0,0,-0.152400><2.839806,0.035000,0.152400> rotate<0,26.563298,0> translate<18.542000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.542000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.348000,0.000000,16.890000>}
box{<0,0,-0.304800><2.806000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.542000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.220000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.474000,0.000000,23.194000>}
box{<0,0,-0.203200><0.497695,0.035000,0.203200> rotate<0,59.308737,0> translate<21.220000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.574000,0.000000,27.194000>}
box{<0,0,-0.203200><1.913416,0.035000,0.203200> rotate<0,22.945436,0> translate<19.812000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,0.000000,15.102000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,0.000000,14.098000>}
box{<0,0,-0.406400><1.004000,0.035000,0.406400> rotate<0,-90.000000,0> translate<21.590000,0.000000,14.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.348000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,16.902000>}
box{<0,0,-0.203200><0.242297,0.035000,0.203200> rotate<0,-2.838600,0> translate<21.348000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,0.000000,16.902000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.706000,0.000000,17.018000>}
box{<0,0,-0.304800><0.164049,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.590000,0.000000,16.902000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.288000,0.000000,13.844000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.844000,0.000000,13.844000>}
box{<0,0,-0.406400><3.556000,0.035000,0.406400> rotate<0,0.000000,0> translate<18.288000,0.000000,13.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,14.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,0.000000,13.844000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<21.590000,0.000000,14.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,29.210000>}
box{<0,0,-0.203200><2.615090,0.035000,0.203200> rotate<0,29.052687,0> translate<19.812000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.542000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,0.000000,31.750000>}
box{<0,0,-0.152400><3.556000,0.035000,0.152400> rotate<0,0.000000,0> translate<18.542000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.706000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,17.018000>}
box{<0,0,-0.304800><1.154000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.706000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.918000,0.000000,13.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.918000,0.000000,13.774000>}
box{<0,0,-0.203200><0.070000,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.918000,0.000000,13.774000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.844000,0.000000,13.844000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.918000,0.000000,13.844000>}
box{<0,0,-0.406400><1.074000,0.035000,0.406400> rotate<0,0.000000,0> translate<21.844000,0.000000,13.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,6.096000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.606000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,31.242000>}
box{<0,0,-0.152400><1.135923,0.035000,0.152400> rotate<0,26.563298,0> translate<22.098000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.066000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.230000,0.000000,9.260000>}
box{<0,0,-0.406400><4.474572,0.035000,0.406400> rotate<0,-44.997030,0> translate<20.066000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.230000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.230000,0.000000,9.260000>}
box{<0,0,-0.406400><0.138000,0.035000,0.406400> rotate<0,-90.000000,0> translate<23.230000,0.000000,9.260000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.230000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.230000,0.000000,9.398000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,-90.000000,0> translate<23.230000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.230000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.230000,0.000000,11.176000>}
box{<0,0,-0.406400><2.032000,0.035000,0.406400> rotate<0,-90.000000,0> translate<23.230000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.918000,0.000000,13.774000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.230000,0.000000,13.462000>}
box{<0,0,-0.406400><0.441235,0.035000,0.406400> rotate<0,44.997030,0> translate<22.918000,0.000000,13.774000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.230000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.230000,0.000000,13.462000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.230000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.448000,0.000000,33.194000>}
box{<0,0,-0.203200><5.860501,0.035000,0.203200> rotate<0,44.997030,0> translate<19.304000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,0.000000,4.572000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.606000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,4.826000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<23.114000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.030000,0.000000,14.848000>}
box{<0,0,-0.304800><3.068843,0.035000,0.304800> rotate<0,44.997030,0> translate<22.860000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.030000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.030000,0.000000,14.848000>}
box{<0,0,-0.304800><1.640000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.030000,0.000000,14.848000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,6.096000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.146000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.154000,0.000000,25.146000>}
box{<0,0,-0.152400><4.072000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.082000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.154000,0.000000,31.242000>}
box{<0,0,-0.152400><2.040000,0.035000,0.152400> rotate<0,0.000000,0> translate<23.114000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.186000,0.000000,29.210000>}
box{<0,0,-0.203200><3.088000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.098000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.474000,0.000000,23.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,23.194000>}
box{<0,0,-0.203200><3.728000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.474000,0.000000,23.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.154000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.202000,0.000000,25.194000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.154000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.574000,0.000000,27.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,27.194000>}
box{<0,0,-0.203200><3.628000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.574000,0.000000,27.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.186000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,29.194000>}
box{<0,0,-0.203200><0.022627,0.035000,0.203200> rotate<0,44.997030,0> translate<25.186000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.154000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.202000,0.000000,31.194000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,44.997030,0> translate<25.154000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.448000,0.000000,33.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,33.194000>}
box{<0,0,-0.203200><1.754000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.448000,0.000000,33.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,27.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218000,0.000000,27.178000>}
box{<0,0,-0.203200><0.022627,0.035000,0.203200> rotate<0,44.997030,0> translate<25.202000,0.000000,27.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,25.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.250000,0.000000,25.146000>}
box{<0,0,-0.203200><0.067882,0.035000,0.203200> rotate<0,44.997030,0> translate<25.202000,0.000000,25.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,31.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.250000,0.000000,31.242000>}
box{<0,0,-0.203200><0.067882,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.202000,0.000000,31.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,23.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.282000,0.000000,23.114000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,44.997030,0> translate<25.202000,0.000000,23.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.030000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.392000,0.000000,10.814000>}
box{<0,0,-0.203200><0.511945,0.035000,0.203200> rotate<0,44.997030,0> translate<25.030000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.230000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,9.398000>}
box{<0,0,-0.304800><2.170000,0.035000,0.304800> rotate<0,0.000000,0> translate<23.230000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.030000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.824000,0.000000,12.414000>}
box{<0,0,-0.304800><1.122886,0.035000,0.304800> rotate<0,44.997030,0> translate<25.030000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.016000,0.000000,10.014000>}
box{<0,0,-0.304800><0.871156,0.035000,0.304800> rotate<0,-44.997030,0> translate<25.400000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.486000,0.000000,9.214000>}
box{<0,0,-0.203200><1.895046,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.146000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.898600,-1.535000,6.629400>}
box{<0,0,-0.304800><19.350766,0.035000,0.304800> rotate<0,58.413277,0> translate<16.764000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.898600,-1.535000,6.629400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.178000,-1.535000,6.096000>}
box{<0,0,-0.304800><0.602146,0.035000,0.304800> rotate<0,62.349910,0> translate<26.898600,-1.535000,6.629400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.178000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.203400,0.000000,6.121400>}
box{<0,0,-0.304800><0.035921,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.178000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,13.239400>}
box{<0,0,-0.203200><1.746600,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.432000,0.000000,13.239400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.486000,0.000000,9.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,9.214000>}
box{<0,0,-0.203200><0.971400,0.035000,0.203200> rotate<0,0.000000,0> translate<26.486000,0.000000,9.214000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.016000,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.457400,0.000000,10.014000>}
box{<0,0,-0.304800><1.441400,0.035000,0.304800> rotate<0,0.000000,0> translate<26.016000,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.392000,0.000000,10.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,10.814000>}
box{<0,0,-0.203200><2.065400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.392000,0.000000,10.814000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.824000,0.000000,12.414000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.457400,0.000000,12.414000>}
box{<0,0,-0.304800><1.633400,0.035000,0.304800> rotate<0,0.000000,0> translate<25.824000,0.000000,12.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,13.239400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,13.214000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<27.432000,0.000000,13.239400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,12.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.489400,0.000000,12.446000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.457400,0.000000,12.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.384000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,4.826000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.384000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,9.906000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.686000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,8.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.226000,0.000000,8.414000>}
box{<0,0,-0.203200><0.768600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.457400,0.000000,8.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,35.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.306000,0.000000,35.194000>}
box{<0,0,-0.203200><3.104000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.202000,0.000000,35.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.442000,-1.535000,19.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.442000,-1.535000,27.172000>}
box{<0,0,-0.203200><7.862000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.442000,-1.535000,27.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,5.588000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.686000,-1.535000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,6.604000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<27.686000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,5.588000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,6.604000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.448000,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,27.178000>}
box{<0,0,-0.203200><3.230000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.218000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.442000,-1.535000,27.172000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,27.178000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.442000,-1.535000,27.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.226000,0.000000,8.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,0.000000,8.890000>}
box{<0,0,-0.203200><0.673166,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.226000,0.000000,8.414000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.203400,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.950000,0.000000,6.121400>}
box{<0,0,-0.304800><1.746600,0.035000,0.304800> rotate<0,0.000000,0> translate<27.203400,0.000000,6.121400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,7.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,7.614000>}
box{<0,0,-0.203200><1.492600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.457400,0.000000,7.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.442000,0.000000,19.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,18.548000>}
box{<0,0,-0.203200><0.915810,0.035000,0.203200> rotate<0,56.306216,0> translate<28.442000,0.000000,19.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,18.548000>}
box{<0,0,-0.203200><3.841400,0.035000,0.203200> rotate<0,90.000000,0> translate<28.950000,0.000000,18.548000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,7.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,7.620000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.950000,0.000000,7.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.250000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,31.242000>}
box{<0,0,-0.203200><3.706000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.250000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,29.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.972000,0.000000,29.194000>}
box{<0,0,-0.203200><3.770000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.202000,0.000000,29.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,11.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.026000,0.000000,11.614000>}
box{<0,0,-0.203200><1.568600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.457400,0.000000,11.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.702000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,8.890000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.702000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,11.430000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.686000,-1.535000,9.906000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.026000,0.000000,11.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,0.000000,11.430000>}
box{<0,0,-0.203200><0.260215,0.035000,0.203200> rotate<0,44.997030,0> translate<29.026000,0.000000,11.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,7.620000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.956000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,8.890000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.210000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,21.082000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.464000,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.282000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,23.114000>}
box{<0,0,-0.203200><4.182000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.282000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.250000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,25.146000>}
box{<0,0,-0.203200><4.214000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.250000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,31.750000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.956000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,31.750000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.464000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.306000,0.000000,35.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,34.036000>}
box{<0,0,-0.203200><1.637659,0.035000,0.203200> rotate<0,44.997030,0> translate<28.306000,0.000000,35.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496000,-1.535000,21.050000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<29.464000,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,3.302000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.146000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,6.153400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,6.858000>}
box{<0,0,-0.203200><0.704600,0.035000,0.203200> rotate<0,90.000000,0> translate<29.718000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.489400,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,12.446000>}
box{<0,0,-0.203200><2.228600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.489400,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,6.153400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,6.121400>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<29.718000,0.000000,6.153400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496000,0.000000,21.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,20.796000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<29.496000,0.000000,21.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,20.796000>}
box{<0,0,-0.203200><6.089400,0.035000,0.203200> rotate<0,90.000000,0> translate<29.750000,0.000000,20.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,0.000000,4.572000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.876000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,7.620000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.718000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.550000,0.000000,5.150000>}
box{<0,0,-0.203200><0.817415,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.972000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.550000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.550000,0.000000,5.150000>}
box{<0,0,-0.203200><0.971400,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.550000,0.000000,5.150000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.550000,0.000000,22.028000>}
box{<0,0,-0.203200><1.535836,0.035000,0.203200> rotate<0,44.997030,0> translate<29.464000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.550000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.550000,0.000000,22.028000>}
box{<0,0,-0.203200><7.321400,0.035000,0.203200> rotate<0,90.000000,0> translate<30.550000,0.000000,22.028000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.626000,0.000000,10.014000>}
box{<0,0,-0.203200><3.168600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.457400,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.804000,0.000000,11.614000>}
box{<0,0,-0.203200><1.368072,0.035000,0.203200> rotate<0,37.453766,0> translate<29.718000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,6.604000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.988000,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,0.000000,7.620000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.480000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,4.934000>}
box{<0,0,-0.203200><2.307997,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.718000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,4.934000>}
box{<0,0,-0.203200><1.187400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.350000,0.000000,4.934000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,13.824000>}
box{<0,0,-0.203200><0.871156,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.734000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,13.824000>}
box{<0,0,-0.203200><0.882600,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.350000,0.000000,13.824000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.626000,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.426000,0.000000,10.814000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.626000,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.626000,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,0.000000,9.144000>}
box{<0,0,-0.203200><1.230366,0.035000,0.203200> rotate<0,44.997030,0> translate<30.626000,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,-1.535000,9.652000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.464000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.270000>}
box{<0,0,-0.304800><13.716000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.288000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.894000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.270000>}
box{<0,0,-0.304800><0.624000,0.035000,0.304800> rotate<0,-90.000000,0> translate<32.004000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,11.430000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.464000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,3.694000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.120000,0.000000,3.810000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.004000,0.000000,3.694000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.120000,0.000000,6.091400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.120000,0.000000,3.810000>}
box{<0,0,-0.203200><2.281400,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.120000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.120000,0.000000,6.091400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,6.121400>}
box{<0,0,-0.203200><0.042426,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.120000,0.000000,6.091400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,7.512000>}
box{<0,0,-0.203200><1.390600,0.035000,0.203200> rotate<0,90.000000,0> translate<32.150000,0.000000,7.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,12.846000>}
box{<0,0,-0.203200><0.206475,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.004000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,-1.535000,12.846000>}
box{<0,0,-0.203200><0.206475,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.004000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,-1.535000,12.846000>}
box{<0,0,-0.203200><0.616000,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.150000,-1.535000,12.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,12.846000>}
box{<0,0,-0.203200><1.860600,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.150000,0.000000,12.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,7.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,7.620000>}
box{<0,0,-0.203200><0.152735,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.150000,0.000000,7.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,-1.535000,21.082000>}
box{<0,0,-0.203200><7.775056,0.035000,0.203200> rotate<0,-51.629107,0> translate<27.432000,-1.535000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.972000,0.000000,29.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,25.908000>}
box{<0,0,-0.203200><4.647106,0.035000,0.203200> rotate<0,44.997030,0> translate<28.972000,0.000000,29.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,25.908000>}
box{<0,0,-0.203200><4.826000,0.035000,0.203200> rotate<0,90.000000,0> translate<32.258000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.734000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,14.859000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.734000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,16.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,14.859000>}
box{<0,0,-0.203200><1.253000,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.385000,-1.535000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.115000,-1.535000,23.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,23.512000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.115000,-1.535000,23.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,4.896000>}
box{<0,0,-0.203200><1.225400,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.950000,0.000000,4.896000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,13.532000>}
box{<0,0,-0.203200><1.174600,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.950000,0.000000,13.532000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,0.000000,12.700000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.274000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,12.700000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.274000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,13.532000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,0.000000,13.208000>}
box{<0,0,-0.203200><0.458205,0.035000,0.203200> rotate<0,44.997030,0> translate<32.950000,0.000000,13.532000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,33.020000>}
box{<0,0,-0.203200><13.462000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.812000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,14.967000>}
box{<0,0,-0.203200><2.128391,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.150000,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,16.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,14.967000>}
box{<0,0,-0.203200><1.145000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.655000,-1.535000,14.967000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.385000,-1.535000,23.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,23.512000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.385000,-1.535000,23.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,5.112000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.750000,0.000000,5.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,14.002000>}
box{<0,0,-0.203200><0.704600,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.750000,0.000000,14.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,4.896000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,0.000000,3.810000>}
box{<0,0,-0.203200><1.535836,0.035000,0.203200> rotate<0,44.997030,0> translate<32.950000,0.000000,4.896000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,5.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,0.000000,4.826000>}
box{<0,0,-0.203200><0.404465,0.035000,0.203200> rotate<0,44.997030,0> translate<33.750000,0.000000,5.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,14.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,13.208000>}
box{<0,0,-0.203200><1.122886,0.035000,0.203200> rotate<0,44.997030,0> translate<33.750000,0.000000,14.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,6.090000>}
box{<0,0,-0.203200><0.031400,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.550000,0.000000,6.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,20.834000>}
box{<0,0,-0.203200><6.127400,0.035000,0.203200> rotate<0,90.000000,0> translate<34.550000,0.000000,20.834000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,20.834000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,21.082000>}
box{<0,0,-0.203200><0.350725,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.550000,0.000000,20.834000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,15.113000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.274000,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,16.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,15.113000>}
box{<0,0,-0.203200><0.999000,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.925000,-1.535000,15.113000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.655000,-1.535000,23.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,23.512000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.655000,-1.535000,23.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,11.430000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.004000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,-1.535000,9.652000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.496000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,7.620000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.258000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.972600,0.000000,9.144000>}
box{<0,0,-0.203200><4.476600,0.035000,0.203200> rotate<0,0.000000,0> translate<31.496000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.972600,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,9.214000>}
box{<0,0,-0.203200><0.098995,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.972600,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.426000,0.000000,10.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,10.814000>}
box{<0,0,-0.203200><4.616600,0.035000,0.203200> rotate<0,0.000000,0> translate<31.426000,0.000000,10.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.804000,0.000000,11.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,11.614000>}
box{<0,0,-0.203200><5.238600,0.035000,0.203200> rotate<0,0.000000,0> translate<30.804000,0.000000,11.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,13.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,16.968600>}
box{<0,0,-0.203200><3.754600,0.035000,0.203200> rotate<0,90.000000,0> translate<36.042600,0.000000,16.968600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,16.968600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.092000,0.000000,17.018000>}
box{<0,0,-0.203200><0.069862,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.042600,0.000000,16.968600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,14.859000>}
box{<0,0,-0.203200><2.334867,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.544000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,16.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,14.859000>}
box{<0,0,-0.203200><1.253000,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.195000,-1.535000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.925000,-1.535000,23.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,23.512000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.925000,-1.535000,23.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,23.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,26.289000>}
box{<0,0,-0.203200><2.777000,0.035000,0.203200> rotate<0,90.000000,0> translate<36.195000,-1.535000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,6.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.316000,0.000000,6.090000>}
box{<0,0,-0.203200><1.766000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.550000,0.000000,6.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.988000,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,1.270000>}
box{<0,0,-0.203200><7.543415,0.035000,0.203200> rotate<0,44.997030,0> translate<30.988000,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.316000,0.000000,6.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,0.000000,6.096000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.316000,0.000000,6.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,26.416000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.195000,-1.535000,26.289000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,12.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.052000,0.000000,12.414000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,12.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,7.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.090000,0.000000,7.614000>}
box{<0,0,-0.203200><1.047400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,7.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,31.242000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.956000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,18.669000>}
box{<0,0,-0.203200><3.596590,0.035000,0.203200> rotate<0,42.134814,0> translate<34.798000,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,16.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,18.669000>}
box{<0,0,-0.203200><2.557000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.465000,-1.535000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,23.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,23.512000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.195000,-1.535000,23.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.052000,0.000000,12.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,12.954000>}
box{<0,0,-0.203200><0.763675,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.052000,0.000000,12.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,14.478000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.592000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,26.416000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.322000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,26.416000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.592000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,30.988000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<37.338000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,30.988000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.592000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,35.306000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.592000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,11.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.638000,0.000000,11.614000>}
box{<0,0,-0.203200><1.595400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,11.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,0.000000,3.810000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.036000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.324000,0.000000,10.014000>}
box{<0,0,-0.203200><2.281400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,3.302000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<38.100000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.090000,0.000000,7.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,6.096000>}
box{<0,0,-0.203200><2.146776,0.035000,0.203200> rotate<0,44.997030,0> translate<37.090000,0.000000,7.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,14.986000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.052000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,16.493000>}
box{<0,0,-0.203200><1.507000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.608000,-1.535000,16.493000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,16.493000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.735000,-1.535000,16.112000>}
box{<0,0,-0.203200><0.401609,0.035000,0.203200> rotate<0,71.560328,0> translate<38.608000,-1.535000,16.493000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.465000,-1.535000,23.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.735000,-1.535000,23.512000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.465000,-1.535000,23.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,8.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.830000,0.000000,8.414000>}
box{<0,0,-0.203200><2.787400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,8.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,6.096000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.608000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.324000,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,10.668000>}
box{<0,0,-0.203200><0.924896,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.324000,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,10.668000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.978000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,12.562000>}
box{<0,0,-0.203200><0.392000,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.978000,0.000000,12.562000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.638000,0.000000,11.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,12.954000>}
box{<0,0,-0.203200><1.895046,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.638000,0.000000,11.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,13.324000>}
box{<0,0,-0.203200><0.370000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.978000,0.000000,13.324000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,16.002000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.592000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.092000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,16.994000>}
box{<0,0,-0.203200><0.033941,0.035000,0.203200> rotate<0,44.997030,0> translate<39.092000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,0.000000,16.994000>}
box{<0,0,-0.203200><0.992000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.116000,0.000000,16.994000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,4.826000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.036000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,9.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.694000,0.000000,9.214000>}
box{<0,0,-0.203200><3.651400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,9.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.306000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.005000,-1.535000,14.351000>}
box{<0,0,-0.203200><6.645390,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.306000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.005000,-1.535000,16.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.005000,-1.535000,14.351000>}
box{<0,0,-0.203200><1.761000,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.005000,-1.535000,14.351000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.735000,-1.535000,23.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.005000,-1.535000,23.512000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.735000,-1.535000,23.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,0.000000,37.846000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.592000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.694000,0.000000,9.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,10.160000>}
box{<0,0,-0.203200><1.337846,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.694000,0.000000,9.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,10.530000>}
box{<0,0,-0.203200><0.370000,0.035000,0.203200> rotate<0,90.000000,0> translate<40.640000,0.000000,10.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,10.530000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778000,0.000000,10.668000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.640000,0.000000,10.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778000,0.000000,10.668000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.778000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,3.302000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<39.624000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.830000,0.000000,8.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.148000,0.000000,6.096000>}
box{<0,0,-0.203200><3.278147,0.035000,0.203200> rotate<0,44.997030,0> translate<38.830000,0.000000,8.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,13.970000>}
box{<0,0,-0.203200><8.802484,0.035000,0.203200> rotate<0,-46.166092,0> translate<35.560000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.274000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,24.638000>}
box{<0,0,-0.203200><11.853938,0.035000,0.203200> rotate<0,44.997030,0> translate<33.274000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.656000,-1.535000,24.638000>}
box{<0,0,-0.203200><10.668000,0.035000,0.203200> rotate<0,90.000000,0> translate<41.656000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,-1.535000,9.398000>}
box{<0,0,-0.203200><4.493719,0.035000,0.203200> rotate<0,-47.287489,0> translate<38.862000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,3.302000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.688000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,7.112000>}
box{<0,0,-0.203200><4.310523,0.035000,0.203200> rotate<0,44.997030,0> translate<40.640000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,7.112000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,90.000000,0> translate<43.688000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,-1.535000,9.398000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<41.910000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,10.784000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,9.398000>}
box{<0,0,-0.203200><1.386000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.688000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,14.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,12.584000>}
box{<0,0,-0.203200><1.779000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.688000,0.000000,12.584000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,13.324000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.704000,0.000000,19.050000>}
box{<0,0,-0.203200><8.097787,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.978000,0.000000,13.324000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.822000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.902000,0.000000,23.194000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.822000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.958000,0.000000,1.270000>}
box{<0,0,-0.304800><12.954000,0.035000,0.304800> rotate<0,0.000000,0> translate<32.004000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.958000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,2.540000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<44.958000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,2.540000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.228000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,3.302000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.228000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.704000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.736000,0.000000,19.050000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.704000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,16.117000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.749000,0.000000,16.117000>}
box{<0,0,-0.203200><3.061000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.688000,0.000000,16.117000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.749000,0.000000,16.117000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.372000,0.000000,15.494000>}
box{<0,0,-0.203200><0.881055,0.035000,0.203200> rotate<0,44.997030,0> translate<46.749000,0.000000,16.117000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,9.906000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.688000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,12.954000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<47.498000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.372000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,15.368000>}
box{<0,0,-0.203200><0.178191,0.035000,0.203200> rotate<0,44.997030,0> translate<47.372000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,15.368000>}
box{<0,0,-0.203200><2.414000,0.035000,0.203200> rotate<0,90.000000,0> translate<47.498000,0.000000,15.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.902000,0.000000,23.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.180000,0.000000,23.194000>}
box{<0,0,-0.203200><3.278000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.902000,0.000000,23.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,18.034000>}
box{<0,0,-0.203200><16.882882,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.322000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.180000,0.000000,23.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,23.114000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,44.997030,0> translate<48.180000,0.000000,23.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,-1.535000,23.114000>}
box{<0,0,-0.203200><5.080000,0.035000,0.203200> rotate<0,90.000000,0> translate<48.260000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.372000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,18.022000>}
box{<0,0,-0.203200><3.575132,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.372000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,18.022000>}
box{<0,0,-0.203200><1.536000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.900000,0.000000,18.022000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.736000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,22.214000>}
box{<0,0,-0.203200><4.474572,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.736000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,22.214000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.900000,0.000000,22.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,22.998000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.900000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,22.998000>}
box{<0,0,-0.203200><1.386000,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.038000,0.000000,22.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.902000,0.000000,35.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.562000,0.000000,35.194000>}
box{<0,0,-0.203200><5.660000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.902000,0.000000,35.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.562000,0.000000,35.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.928000,0.000000,35.560000>}
box{<0,0,-0.203200><0.517602,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.562000,0.000000,35.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.672000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,16.522000>}
box{<0,0,-0.203200><1.453812,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.672000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,16.522000>}
box{<0,0,-0.203200><3.036000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.700000,0.000000,16.522000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,19.558000>}
box{<0,0,-0.203200><3.302000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.700000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.092000,0.000000,23.252000>}
box{<0,0,-0.203200><0.554372,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.700000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,26.532000>}
box{<0,0,-0.203200><3.037731,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.038000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,26.532000>}
box{<0,0,-0.203200><5.726000,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.186000,0.000000,26.532000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.928000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,34.302000>}
box{<0,0,-0.203200><1.779081,0.035000,0.203200> rotate<0,44.997030,0> translate<50.928000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,34.302000>}
box{<0,0,-0.203200><2.044000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.186000,0.000000,34.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,21.452000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,16.648000>}
box{<0,0,-0.203200><4.804000,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.848000,0.000000,16.648000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.092000,0.000000,23.252000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,23.252000>}
box{<0,0,-0.203200><1.756000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.092000,0.000000,23.252000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.986000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.986000,0.000000,35.318000>}
box{<0,0,-0.203200><3.060000,0.035000,0.203200> rotate<0,90.000000,0> translate<53.986000,0.000000,35.318000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,37.846000>}
box{<0,0,-0.203200><13.970000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.132000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.986000,0.000000,35.318000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,35.560000>}
box{<0,0,-0.203200><0.342240,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.986000,0.000000,35.318000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,37.720000>}
box{<0,0,-0.203200><0.178191,0.035000,0.203200> rotate<0,44.997030,0> translate<54.102000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,37.720000>}
box{<0,0,-0.203200><2.160000,0.035000,0.203200> rotate<0,90.000000,0> translate<54.228000,0.000000,37.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,1.270000>}
box{<0,0,-0.203200><18.288000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.322000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,0.000000,37.846000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.102000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.642000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.642000,-1.535000,8.382000>}
box{<0,0,-0.635000><23.114000,0.035000,0.635000> rotate<0,-90.000000,0> translate<56.642000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,23.252000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.316000,0.000000,26.720000>}
box{<0,0,-0.203200><4.904493,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.848000,0.000000,23.252000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.912000,0.000000,12.954000>}
box{<0,0,-0.203200><10.414000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.498000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.912000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.182000,0.000000,11.684000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<57.912000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,14.848000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.048000,0.000000,14.848000>}
box{<0,0,-0.203200><7.200000,0.035000,0.203200> rotate<0,0.000000,0> translate<53.848000,0.000000,14.848000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.976000,-1.535000,8.636000>}
box{<0,0,-0.203200><10.417097,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.610000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.976000,-1.535000,13.920000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.976000,-1.535000,8.636000>}
box{<0,0,-0.203200><5.284000,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.976000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.048000,0.000000,14.848000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.976000,0.000000,13.920000>}
box{<0,0,-0.203200><1.312390,0.035000,0.203200> rotate<0,44.997030,0> translate<61.048000,0.000000,14.848000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.316000,0.000000,26.720000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.976000,0.000000,26.720000>}
box{<0,0,-0.203200><4.660000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.316000,0.000000,26.720000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.182000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,11.684000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<59.182000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.500000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,12.954000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<63.500000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,12.954000>}
box{<0,0,-0.203200><16.256000,0.035000,0.203200> rotate<0,-90.000000,0> translate<64.770000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,29.210000>}
box{<0,0,-0.203200><12.213148,0.035000,0.203200> rotate<0,44.997030,0> translate<56.134000,0.000000,37.846000> }
//Text
//Rect
union{
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<37.592000,0.000000,15.968000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<37.592000,0.000000,18.068000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<39.092000,0.000000,15.968000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<39.092000,0.000000,18.068000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<36.092000,0.000000,15.968000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<36.092000,0.000000,18.068000>}
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,3.941413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,35.936584>}
box{<0,0,-0.203200><31.995172,0.035000,0.203200> rotate<0,90.000000,0> translate<1.117597,0.000000,35.936584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,3.941413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.846163,0.000000,4.243197>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-22.498690,0> translate<1.117597,0.000000,3.941413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.413547,0.000000,4.064000>}
box{<0,0,-0.203200><0.295950,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.634444,0.000000,4.470400>}
box{<0,0,-0.203200><2.516847,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.228044,0.000000,4.876800>}
box{<0,0,-0.203200><2.110447,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.821644,0.000000,5.283200>}
box{<0,0,-0.203200><1.704047,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415241,0.000000,5.689600>}
box{<0,0,-0.203200><1.297644,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.163469,0.000000,6.096000>}
box{<0,0,-0.203200><1.045872,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,6.502400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,6.908800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,7.315200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,7.721600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,8.128000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,8.534400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,8.940800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,9.347200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,9.753600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,10.160000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,10.566400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,10.972800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,11.379200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,11.785600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,12.192000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,12.598400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,13.004800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,13.411200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,13.817600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,14.224000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,14.630400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,15.036800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,15.443200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,15.849600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,16.256000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,16.662400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,17.068800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,17.475200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,17.881600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,18.288000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,18.694400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,19.100800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,19.507200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,19.913600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,20.320000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,20.726400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,21.132800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,21.539200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,21.945600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,22.352000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,22.758400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,23.164800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,23.571200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,23.977600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,24.384000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,24.790400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,25.196800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,25.603200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,26.009600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,26.416000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,26.822400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,27.228800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,27.635200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,28.041600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,28.448000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,28.854400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,29.260800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,29.667200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,30.073600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,30.480000>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,30.886400>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,31.292800>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,31.699200>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,32.105600>}
box{<0,0,-0.203200><1.016003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.163472,0.000000,32.512000>}
box{<0,0,-0.203200><1.045875,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415244,0.000000,32.918400>}
box{<0,0,-0.203200><1.297647,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.821647,0.000000,33.324800>}
box{<0,0,-0.203200><1.704050,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.228047,0.000000,33.731200>}
box{<0,0,-0.203200><2.110450,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.634447,0.000000,34.137600>}
box{<0,0,-0.203200><2.516850,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.040847,0.000000,34.544000>}
box{<0,0,-0.203200><2.923250,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.447247,0.000000,34.950400>}
box{<0,0,-0.203200><3.329650,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.135725,0.000000,35.356800>}
box{<0,0,-0.203200><19.018128,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.536178,0.000000,35.763200>}
box{<0,0,-0.203200><0.418581,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,35.936584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.846163,0.000000,35.634800>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,22.498690,0> translate<1.117597,0.000000,35.936584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.846163,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.725834,0.000000,4.243197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<1.846163,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.846163,0.000000,35.634800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.725834,0.000000,35.634800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<1.846163,0.000000,35.634800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,6.168113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.272809,0.000000,5.832031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<2.133600,0.000000,6.168113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,32.439884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,6.168113>}
box{<0,0,-0.203200><26.271772,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.133600,0.000000,6.168113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,32.439884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.272809,0.000000,32.775966>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-67.495551,0> translate<2.133600,0.000000,32.439884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.272809,0.000000,5.832031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530031,0.000000,5.574809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<2.272809,0.000000,5.832031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.272809,0.000000,32.775966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530031,0.000000,33.033188>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.272809,0.000000,32.775966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530031,0.000000,5.574809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530034,0.000000,5.574809>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.530031,0.000000,5.574809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530031,0.000000,33.033188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530034,0.000000,33.033188>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.530031,0.000000,33.033188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530034,0.000000,5.574809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.066809,0.000000,3.038034>}
box{<0,0,-0.203200><3.587542,0.035000,0.203200> rotate<0,44.997030,0> translate<2.530034,0.000000,5.574809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530034,0.000000,33.033188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.562031,0.000000,35.065188>}
box{<0,0,-0.203200><2.873680,0.035000,0.203200> rotate<0,-44.997074,0> translate<2.530034,0.000000,33.033188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.725834,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.538544,0.000000,3.906563>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<2.725834,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.725834,0.000000,35.634800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.538544,0.000000,35.971434>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<2.725834,0.000000,35.634800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.035819,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.644431,0.000000,35.763200>}
box{<0,0,-0.203200><4.608612,0.035000,0.203200> rotate<0,0.000000,0> translate<3.035819,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.158456,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.040844,0.000000,4.064000>}
box{<0,0,-0.203200><0.882388,0.035000,0.203200> rotate<0,0.000000,0> translate<3.158456,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.538544,0.000000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.160563,0.000000,3.284544>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<3.538544,0.000000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.538544,0.000000,35.971434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.160563,0.000000,36.593453>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.538544,0.000000,35.971434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.736709,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.382628,0.000000,36.169600>}
box{<0,0,-0.203200><3.645919,0.035000,0.203200> rotate<0,0.000000,0> translate<3.736709,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.787506,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.447244,0.000000,3.657600>}
box{<0,0,-0.203200><0.659737,0.035000,0.203200> rotate<0,0.000000,0> translate<3.787506,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,6.728753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,31.879244>}
box{<0,0,-0.203200><25.150491,0.035000,0.203200> rotate<0,90.000000,0> translate<3.962397,0.000000,31.879244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,6.728753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.220753,0.000000,4.470397>}
box{<0,0,-0.203200><3.193798,0.035000,0.203200> rotate<0,44.997030,0> translate<3.962397,0.000000,6.728753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.106419,0.000000,6.908800>}
box{<0,0,-0.203200><8.144022,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.700019,0.000000,7.315200>}
box{<0,0,-0.203200><7.737622,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,7.721600>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,8.128000>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,8.534400>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,8.940800>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.598422,0.000000,9.347200>}
box{<0,0,-0.203200><7.636025,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.004822,0.000000,9.753600>}
box{<0,0,-0.203200><8.042425,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.411222,0.000000,10.160000>}
box{<0,0,-0.203200><8.448825,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.391494,0.000000,10.566400>}
box{<0,0,-0.203200><0.429097,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,10.972800>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,11.379200>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,11.785600>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,12.192000>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,12.598400>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,13.004800>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,13.411200>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,13.817600>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,14.224000>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,14.630400>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,15.036800>}
box{<0,0,-0.203200><0.294003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.493097,0.000000,15.443200>}
box{<0,0,-0.203200><0.530700,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.912169,0.000000,15.849600>}
box{<0,0,-0.203200><0.949772,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.823666,0.000000,16.256000>}
box{<0,0,-0.203200><0.861269,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,16.662400>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,17.068800>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,17.475200>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,17.881600>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,18.288000>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,18.694400>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,19.100800>}
box{<0,0,-0.203200><0.798003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.954000,0.000000,19.507200>}
box{<0,0,-0.203200><0.991603,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.069775,0.000000,19.913600>}
box{<0,0,-0.203200><1.107378,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.421163,0.000000,20.320000>}
box{<0,0,-0.203200><1.458766,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.019866,0.000000,20.726400>}
box{<0,0,-0.203200><1.057469,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.613466,0.000000,21.132800>}
box{<0,0,-0.203200><0.651069,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.470400,0.000000,21.539200>}
box{<0,0,-0.203200><0.508003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.470400,0.000000,21.945600>}
box{<0,0,-0.203200><0.508003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.470400,0.000000,22.352000>}
box{<0,0,-0.203200><0.508003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,22.758400>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,23.164800>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,23.571200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,23.977600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,24.384000>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,24.790400>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,25.196800>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,25.603200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,26.009600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,26.416000>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,26.822400>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,27.228800>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,27.635200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,28.041600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,28.448000>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,28.854400>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,29.260800>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,29.667200>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,30.073600>}
box{<0,0,-0.203200><0.635003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.537219,0.000000,30.480000>}
box{<0,0,-0.203200><0.574822,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,30.886400>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,31.292800>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,31.699200>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,31.879244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,32.266597>}
box{<0,0,-0.203200><0.547800,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.962397,0.000000,31.879244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.143109,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,36.576000>}
box{<0,0,-0.203200><3.203291,0.035000,0.203200> rotate<0,0.000000,0> translate<4.143109,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.160563,0.000000,3.284544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,2.471834>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<4.160563,0.000000,3.284544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.160563,0.000000,36.593453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,37.406163>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<4.160563,0.000000,36.593453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.174375,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.853644,0.000000,3.251200>}
box{<0,0,-0.203200><0.679269,0.035000,0.203200> rotate<0,0.000000,0> translate<4.174375,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.188750,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.512819,0.000000,6.502400>}
box{<0,0,-0.203200><8.324069,0.035000,0.203200> rotate<0,0.000000,0> translate<4.188750,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.188753,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,32.105600>}
box{<0,0,-0.203200><0.160997,0.035000,0.203200> rotate<0,0.000000,0> translate<4.188753,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.195412,0.000000,0.863597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,1.592163>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-67.495370,0> translate<4.195412,0.000000,0.863597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.195412,0.000000,0.863597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.401247,0.000000,0.863597>}
box{<0,0,-0.203200><13.205834,0.035000,0.203200> rotate<0,0.000000,0> translate<4.195412,0.000000,0.863597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.195412,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,38.285834>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,67.495370,0> translate<4.195412,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.195412,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.753509,0.000000,39.014400>}
box{<0,0,-0.203200><3.558097,0.035000,0.203200> rotate<0,0.000000,0> translate<4.195412,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,10.832741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349206,0.000000,10.608688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<4.256400,0.000000,10.832741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,15.075256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,10.832741>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.256400,0.000000,10.832741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.256400,0.000000,15.075256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349206,0.000000,15.299309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<4.256400,0.000000,15.075256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.321669,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,36.982400>}
box{<0,0,-0.203200><3.024731,0.035000,0.203200> rotate<0,0.000000,0> translate<4.321669,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.342709,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.045641,0.000000,1.219200>}
box{<0,0,-0.203200><12.702931,0.035000,0.203200> rotate<0,0.000000,0> translate<4.342709,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.342713,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.260041,0.000000,2.844800>}
box{<0,0,-0.203200><0.917328,0.035000,0.203200> rotate<0,0.000000,0> translate<4.342713,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349206,0.000000,10.608688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.520688,0.000000,10.437206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<4.349206,0.000000,10.608688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349206,0.000000,15.299309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.520688,0.000000,15.470791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.349206,0.000000,15.299309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,30.667469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,30.419819>}
box{<0,0,-0.203200><0.350230,0.035000,0.203200> rotate<0,44.997030,0> translate<4.349750,0.000000,30.667469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,32.266597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,30.667469>}
box{<0,0,-0.203200><1.599128,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.349750,0.000000,30.667469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.363753,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.424716,0.000000,38.608000>}
box{<0,0,-0.203200><3.060962,0.035000,0.203200> rotate<0,0.000000,0> translate<4.363753,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.470400,0.000000,21.275866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.273866,0.000000,20.472400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<4.470400,0.000000,21.275866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.470400,0.000000,22.412131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.470400,0.000000,21.275866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.470400,0.000000,21.275866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.470400,0.000000,22.412131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,22.539131>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.470400,0.000000,22.412131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490003,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,37.388800>}
box{<0,0,-0.203200><2.856397,0.035000,0.203200> rotate<0,0.000000,0> translate<4.490003,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,1.592163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,2.471834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<4.497197,0.000000,2.471834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.704594,0.000000,1.625600>}
box{<0,0,-0.203200><12.207397,0.035000,0.203200> rotate<0,0.000000,0> translate<4.497197,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,2.032000>}
box{<0,0,-0.203200><12.114403,0.035000,0.203200> rotate<0,0.000000,0> translate<4.497197,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.449869,0.000000,2.438400>}
box{<0,0,-0.203200><11.952672,0.035000,0.203200> rotate<0,0.000000,0> translate<4.497197,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,37.406163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,38.285834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<4.497197,0.000000,38.285834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,37.795200>}
box{<0,0,-0.203200><2.849203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.497197,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,38.201600>}
box{<0,0,-0.203200><2.849203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.497197,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.520688,0.000000,10.437206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.744741,0.000000,10.344400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<4.520688,0.000000,10.437206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.520688,0.000000,15.470791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.744741,0.000000,15.563597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<4.520688,0.000000,15.470791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.562031,0.000000,35.065188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898112,0.000000,35.204397>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<4.562031,0.000000,35.065188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.595150,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,6.096000>}
box{<0,0,-0.203200><11.559250,0.035000,0.203200> rotate<0,0.000000,0> translate<4.595150,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,30.419819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.597400,0.000000,22.539131>}
box{<0,0,-0.203200><7.880688,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.597400,0.000000,22.539131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.744741,0.000000,10.344400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.987256,0.000000,10.344400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<4.744741,0.000000,10.344400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.744741,0.000000,15.563597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.906003,0.000000,15.563597>}
box{<0,0,-0.203200><0.161262,0.035000,0.203200> rotate<0,0.000000,0> translate<4.744741,0.000000,15.563597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,16.408741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.853206,0.000000,16.184687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<4.760400,0.000000,16.408741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,19.151256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,16.408741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.760400,0.000000,16.408741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.760400,0.000000,19.151256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.853206,0.000000,19.375309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<4.760400,0.000000,19.151256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.853206,0.000000,16.184687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.917991,0.000000,16.119906>}
box{<0,0,-0.203200><0.091617,0.035000,0.203200> rotate<0,44.995648,0> translate<4.853206,0.000000,16.184687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.853206,0.000000,19.375309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.954000,0.000000,19.476103>}
box{<0,0,-0.203200><0.142544,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.853206,0.000000,19.375309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.898112,0.000000,35.204397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.401978,0.000000,35.204397>}
box{<0,0,-0.203200><9.503866,0.035000,0.203200> rotate<0,0.000000,0> translate<4.898112,0.000000,35.204397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.906003,0.000000,15.563597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.917991,0.000000,16.119906>}
box{<0,0,-0.203200><0.556439,0.035000,0.203200> rotate<0,-88.759708,0> translate<4.906003,0.000000,15.563597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.954000,0.000000,19.634094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.954000,0.000000,19.476103>}
box{<0,0,-0.203200><0.157991,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.954000,0.000000,19.476103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.954000,0.000000,19.634094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.108675,0.000000,20.007516>}
box{<0,0,-0.203200><0.404188,0.035000,0.203200> rotate<0,-67.495729,0> translate<4.954000,0.000000,19.634094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.001550,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,5.689600>}
box{<0,0,-0.203200><11.152850,0.035000,0.203200> rotate<0,0.000000,0> translate<5.001550,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.066809,0.000000,3.038031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.324031,0.000000,2.780809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<5.066809,0.000000,3.038031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.066809,0.000000,3.038034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.066809,0.000000,3.038031>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.066809,0.000000,3.038031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.108675,0.000000,20.007516>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.573563,0.000000,20.472400>}
box{<0,0,-0.203200><0.657448,0.035000,0.203200> rotate<0,-44.996838,0> translate<5.108675,0.000000,20.007516> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.273866,0.000000,20.472400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.573563,0.000000,20.472400>}
box{<0,0,-0.203200><0.299697,0.035000,0.203200> rotate<0,0.000000,0> translate<5.273866,0.000000,20.472400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.324031,0.000000,2.780809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.660113,0.000000,2.641600>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,22.498510,0> translate<5.324031,0.000000,2.780809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.407950,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.399066,0.000000,5.283200>}
box{<0,0,-0.203200><10.991116,0.035000,0.203200> rotate<0,0.000000,0> translate<5.407950,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.660113,0.000000,2.641600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.246669,0.000000,2.641600>}
box{<0,0,-0.203200><10.586556,0.035000,0.203200> rotate<0,0.000000,0> translate<5.660113,0.000000,2.641600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.814350,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,4.876800>}
box{<0,0,-0.203200><10.797250,0.035000,0.203200> rotate<0,0.000000,0> translate<5.814350,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.220750,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,4.470400>}
box{<0,0,-0.203200><10.390850,0.035000,0.203200> rotate<0,0.000000,0> translate<6.220750,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.220753,0.000000,4.470397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,4.470397>}
box{<0,0,-0.203200><10.390847,0.035000,0.203200> rotate<0,0.000000,0> translate<6.220753,0.000000,4.470397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.987256,0.000000,10.344400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.211309,0.000000,10.437206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<6.987256,0.000000,10.344400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.211309,0.000000,10.437206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,10.591897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.211309,0.000000,10.437206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.340503,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.391494,0.000000,10.566400>}
box{<0,0,-0.203200><0.050991,0.035000,0.203200> rotate<0,0.000000,0> translate<7.340503,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,36.257066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.484878,0.000000,35.922753>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<7.346400,0.000000,36.257066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,38.418931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,36.257066>}
box{<0,0,-0.203200><2.161866,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.346400,0.000000,36.257066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,38.418931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.484878,0.000000,38.753244>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<7.346400,0.000000,38.418931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.366000,0.000000,10.591897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.520688,0.000000,10.437206>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<7.366000,0.000000,10.591897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.484878,0.000000,35.922753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.740753,0.000000,35.666878>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<7.484878,0.000000,35.922753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.484878,0.000000,38.753244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.740753,0.000000,39.009119>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.484878,0.000000,38.753244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.520688,0.000000,10.437206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.744741,0.000000,10.344400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<7.520688,0.000000,10.437206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.740753,0.000000,35.666878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.075066,0.000000,35.528400>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,22.498713,0> translate<7.740753,0.000000,35.666878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.740753,0.000000,39.009119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.753509,0.000000,39.014400>}
box{<0,0,-0.203200><0.013806,0.035000,0.203200> rotate<0,-22.488694,0> translate<7.740753,0.000000,39.009119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.744741,0.000000,10.344400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.987256,0.000000,10.344400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<7.744741,0.000000,10.344400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.075066,0.000000,35.528400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.736931,0.000000,35.528400>}
box{<0,0,-0.203200><3.661866,0.035000,0.203200> rotate<0,0.000000,0> translate<8.075066,0.000000,35.528400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,15.563597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,18.956806>}
box{<0,0,-0.203200><3.393209,0.035000,0.203200> rotate<0,90.000000,0> translate<8.712197,0.000000,18.956806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,15.563597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.987256,0.000000,15.563597>}
box{<0,0,-0.203200><1.275059,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,15.563597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,15.849600>}
box{<0,0,-0.203200><3.216003,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,16.256000>}
box{<0,0,-0.203200><3.216003,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,16.662400>}
box{<0,0,-0.203200><3.216003,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.970503,0.000000,17.068800>}
box{<0,0,-0.203200><3.258306,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.261728,0.000000,17.475200>}
box{<0,0,-0.203200><3.549531,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.435172,0.000000,17.881600>}
box{<0,0,-0.203200><7.722975,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.758378,0.000000,18.288000>}
box{<0,0,-0.203200><8.046181,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.389600,0.000000,18.694400>}
box{<0,0,-0.203200><9.677403,0.035000,0.203200> rotate<0,0.000000,0> translate<8.712197,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.712197,0.000000,18.956806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.166191,0.000000,19.410800>}
box{<0,0,-0.203200><0.642044,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.712197,0.000000,18.956806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.856191,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.389600,0.000000,19.100800>}
box{<0,0,-0.203200><9.533409,0.035000,0.203200> rotate<0,0.000000,0> translate<8.856191,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.166191,0.000000,19.410800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.557728,0.000000,19.410800>}
box{<0,0,-0.203200><4.391538,0.035000,0.203200> rotate<0,0.000000,0> translate<9.166191,0.000000,19.410800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.987256,0.000000,10.344400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.211309,0.000000,10.437206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<9.987256,0.000000,10.344400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.987256,0.000000,15.563597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.211309,0.000000,15.470791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<9.987256,0.000000,15.563597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.211309,0.000000,10.437206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.382791,0.000000,10.608688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.211309,0.000000,10.437206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.211309,0.000000,15.470791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.382791,0.000000,15.299309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<10.211309,0.000000,15.470791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.238900,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.443200>}
box{<0,0,-0.203200><1.692500,0.035000,0.203200> rotate<0,0.000000,0> translate<10.238900,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.340503,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,10.566400>}
box{<0,0,-0.203200><13.679897,0.035000,0.203200> rotate<0,0.000000,0> translate<10.340503,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.382791,0.000000,10.608688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,10.832741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<10.382791,0.000000,10.608688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.382791,0.000000,15.299309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,15.075256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<10.382791,0.000000,15.299309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,10.832741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,15.075256>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,90.000000,0> translate<10.475597,0.000000,15.075256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,10.972800>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,11.379200>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,11.785600>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.183897,0.000000,12.192000>}
box{<0,0,-0.203200><13.708300,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,12.598400>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,13.004800>}
box{<0,0,-0.203200><13.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.579109,0.000000,13.411200>}
box{<0,0,-0.203200><2.103512,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,13.817600>}
box{<0,0,-0.203200><2.030803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,14.224000>}
box{<0,0,-0.203200><2.030803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.303856,0.000000,14.630400>}
box{<0,0,-0.203200><1.828259,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.475597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.945456,0.000000,15.036800>}
box{<0,0,-0.203200><1.469859,0.035000,0.203200> rotate<0,0.000000,0> translate<10.475597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<11.461750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.461750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.461750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.736931,0.000000,35.528400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.071244,0.000000,35.666878>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-22.498713,0> translate<11.736931,0.000000,35.528400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,15.480322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.472597>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<11.928200,0.000000,15.480322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,16.966675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,15.480322>}
box{<0,0,-0.203200><1.486353,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.928200,0.000000,15.480322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,16.966675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.051941,0.000000,17.265413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<11.928200,0.000000,16.966675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.070741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.024206,0.000000,14.846688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<11.931400,0.000000,15.070741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.472597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.070741>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.931400,0.000000,15.070741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.024206,0.000000,14.846688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.195688,0.000000,14.675206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<12.024206,0.000000,14.846688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.051941,0.000000,17.265413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.264941,0.000000,17.478413>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.051941,0.000000,17.265413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.058488,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.071244,0.000000,39.009119>}
box{<0,0,-0.203200><0.013806,0.035000,0.203200> rotate<0,22.488694,0> translate<12.058488,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.058488,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.844584,0.000000,39.014400>}
box{<0,0,-0.203200><49.786097,0.035000,0.203200> rotate<0,0.000000,0> translate<12.058488,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.071244,0.000000,35.666878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.327119,0.000000,35.922753>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.071244,0.000000,35.666878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.071244,0.000000,39.009119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.327119,0.000000,38.753244>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<12.071244,0.000000,39.009119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.167566,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.729325,0.000000,35.763200>}
box{<0,0,-0.203200><7.561759,0.035000,0.203200> rotate<0,0.000000,0> translate<12.167566,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.195688,0.000000,14.675206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.419741,0.000000,14.582400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<12.195688,0.000000,14.675206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.264941,0.000000,17.478413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.493584,0.000000,17.707056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.264941,0.000000,17.478413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.327119,0.000000,35.922753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,36.257066>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<12.327119,0.000000,35.922753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.327119,0.000000,38.753244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,38.418931>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<12.327119,0.000000,38.753244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.387284,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.676247,0.000000,38.608000>}
box{<0,0,-0.203200><49.288963,0.035000,0.203200> rotate<0,0.000000,0> translate<12.387284,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.419741,0.000000,14.582400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,14.582400>}
box{<0,0,-0.203200><0.086659,0.035000,0.203200> rotate<0,0.000000,0> translate<12.419741,0.000000,14.582400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.429366,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.322925,0.000000,36.169600>}
box{<0,0,-0.203200><6.893559,0.035000,0.203200> rotate<0,0.000000,0> translate<12.429366,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,36.257066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,36.525200>}
box{<0,0,-0.203200><0.268134,0.035000,0.203200> rotate<0,90.000000,0> translate<12.465597,0.000000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,36.525200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.967325,0.000000,36.525200>}
box{<0,0,-0.203200><6.501728,0.035000,0.203200> rotate<0,0.000000,0> translate<12.465597,0.000000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,38.150797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,38.418931>}
box{<0,0,-0.203200><0.268134,0.035000,0.203200> rotate<0,90.000000,0> translate<12.465597,0.000000,38.418931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,38.150797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.465675,0.000000,38.150797>}
box{<0,0,-0.203200><7.000078,0.035000,0.203200> rotate<0,0.000000,0> translate<12.465597,0.000000,38.150797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.465597,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,38.201600>}
box{<0,0,-0.203200><49.077203,0.035000,0.203200> rotate<0,0.000000,0> translate<12.465597,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.493584,0.000000,17.707056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.792322,0.000000,17.830797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<12.493584,0.000000,17.707056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,13.586741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.599206,0.000000,13.362687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<12.506400,0.000000,13.586741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,14.582400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,13.586741>}
box{<0,0,-0.203200><0.995659,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.506400,0.000000,13.586741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.599206,0.000000,13.362687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.770688,0.000000,13.191206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<12.599206,0.000000,13.362687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<12.633469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<12.633469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.770688,0.000000,13.191206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.994741,0.000000,13.098400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<12.770688,0.000000,13.191206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.792322,0.000000,17.830797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.428400,0.000000,17.830797>}
box{<0,0,-0.203200><3.636078,0.035000,0.203200> rotate<0,0.000000,0> translate<12.792322,0.000000,17.830797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.994741,0.000000,13.098400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437256,0.000000,13.098400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<12.994741,0.000000,13.098400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.557728,0.000000,19.410800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.865800,0.000000,19.538409>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-22.498805,0> translate<13.557728,0.000000,19.410800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.790453,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.859916,0.000000,19.507200>}
box{<0,0,-0.203200><3.069462,0.035000,0.203200> rotate<0,0.000000,0> translate<13.790453,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.865800,0.000000,19.538409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.101588,0.000000,19.774197>}
box{<0,0,-0.203200><0.333454,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.865800,0.000000,19.538409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.101588,0.000000,19.774197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.229197,0.000000,20.082269>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-67.495255,0> translate<14.101588,0.000000,19.774197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.159328,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,19.913600>}
box{<0,0,-0.203200><2.426872,0.035000,0.203200> rotate<0,0.000000,0> translate<14.159328,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.229197,0.000000,20.082269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.229197,0.000000,20.440616>}
box{<0,0,-0.203200><0.358347,0.035000,0.203200> rotate<0,90.000000,0> translate<14.229197,0.000000,20.440616> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.229197,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,20.320000>}
box{<0,0,-0.203200><2.357003,0.035000,0.203200> rotate<0,0.000000,0> translate<14.229197,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.229197,0.000000,20.440616>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.369741,0.000000,20.382400>}
box{<0,0,-0.203200><0.152124,0.035000,0.203200> rotate<0,22.498688,0> translate<14.229197,0.000000,20.440616> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.290528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<14.290528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.369741,0.000000,20.382400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.012256,0.000000,20.382400>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<14.369741,0.000000,20.382400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.401978,0.000000,35.204397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.506384,0.000000,35.221878>}
box{<0,0,-0.203200><0.105860,0.035000,0.203200> rotate<0,-9.504516,0> translate<14.401978,0.000000,35.204397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.411178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,6.502400>}
box{<0,0,-0.203200><1.743222,0.035000,0.203200> rotate<0,0.000000,0> translate<14.411178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437256,0.000000,13.098400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.661309,0.000000,13.191206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<14.437256,0.000000,13.098400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.506384,0.000000,35.221878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.582134,0.000000,35.204397>}
box{<0,0,-0.203200><0.077741,0.035000,0.203200> rotate<0,12.994104,0> translate<14.506384,0.000000,35.221878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.512775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.183894,0.000000,10.160000>}
box{<0,0,-0.203200><9.671119,0.035000,0.203200> rotate<0,0.000000,0> translate<14.512775,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.582134,0.000000,35.204397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.659884,0.000000,35.204397>}
box{<0,0,-0.203200><0.077750,0.035000,0.203200> rotate<0,0.000000,0> translate<14.582134,0.000000,35.204397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.659884,0.000000,35.204397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757688,0.000000,35.163884>}
box{<0,0,-0.203200><0.105862,0.035000,0.203200> rotate<0,22.499075,0> translate<14.659884,0.000000,35.204397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.661309,0.000000,13.191206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.832791,0.000000,13.362687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.661309,0.000000,13.191206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.757688,0.000000,35.163884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.860838,0.000000,35.140081>}
box{<0,0,-0.203200><0.105861,0.035000,0.203200> rotate<0,12.993379,0> translate<14.757688,0.000000,35.163884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.817578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.399069,0.000000,6.908800>}
box{<0,0,-0.203200><1.581491,0.035000,0.203200> rotate<0,0.000000,0> translate<14.817578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.832791,0.000000,13.362687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.897041,0.000000,13.517806>}
box{<0,0,-0.203200><0.167898,0.035000,0.203200> rotate<0,-67.496267,0> translate<14.832791,0.000000,13.362687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.852884,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,13.411200>}
box{<0,0,-0.203200><9.167516,0.035000,0.203200> rotate<0,0.000000,0> translate<14.852884,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.860838,0.000000,35.140081>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.924134,0.000000,35.094938>}
box{<0,0,-0.203200><0.077746,0.035000,0.203200> rotate<0,35.494374,0> translate<14.860838,0.000000,35.140081> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.897041,0.000000,13.517806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.938413,0.000000,13.534941>}
box{<0,0,-0.203200><0.044780,0.035000,0.203200> rotate<0,-22.495658,0> translate<14.897041,0.000000,13.517806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.919175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.876128,0.000000,9.753600>}
box{<0,0,-0.203200><10.956953,0.035000,0.203200> rotate<0,0.000000,0> translate<14.919175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.924134,0.000000,35.094938>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.995966,0.000000,35.065188>}
box{<0,0,-0.203200><0.077748,0.035000,0.203200> rotate<0,22.496147,0> translate<14.924134,0.000000,35.094938> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.938413,0.000000,13.534941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.167056,0.000000,13.763584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.938413,0.000000,13.534941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.995966,0.000000,35.065188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.070816,0.000000,34.990334>}
box{<0,0,-0.203200><0.105856,0.035000,0.203200> rotate<0,44.998226,0> translate<14.995966,0.000000,35.065188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.012256,0.000000,20.382400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.236309,0.000000,20.475206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<15.012256,0.000000,20.382400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.070816,0.000000,34.990334>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.157009,0.000000,34.928869>}
box{<0,0,-0.203200><0.105865,0.035000,0.203200> rotate<0,35.490705,0> translate<15.070816,0.000000,34.990334> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.126819,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542125,0.000000,34.950400>}
box{<0,0,-0.203200><5.415306,0.035000,0.203200> rotate<0,0.000000,0> translate<15.126819,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.157009,0.000000,34.928869>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.198216,0.000000,34.862934>}
box{<0,0,-0.203200><0.077752,0.035000,0.203200> rotate<0,57.992498,0> translate<15.157009,0.000000,34.928869> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.167056,0.000000,13.763584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.380056,0.000000,13.976584>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.167056,0.000000,13.763584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.198216,0.000000,34.862934>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.253188,0.000000,34.807966>}
box{<0,0,-0.203200><0.077740,0.035000,0.203200> rotate<0,44.995402,0> translate<15.198216,0.000000,34.862934> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.221072,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,13.817600>}
box{<0,0,-0.203200><8.799328,0.035000,0.203200> rotate<0,0.000000,0> translate<15.221072,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.223978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.805469,0.000000,7.315200>}
box{<0,0,-0.203200><1.581491,0.035000,0.203200> rotate<0,0.000000,0> translate<15.223978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.236309,0.000000,20.475206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.407791,0.000000,20.646688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.236309,0.000000,20.475206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.253188,0.000000,34.807966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.293694,0.000000,34.710169>}
box{<0,0,-0.203200><0.105854,0.035000,0.203200> rotate<0,67.496816,0> translate<15.253188,0.000000,34.807966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.293694,0.000000,34.710169>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.468209,0.000000,32.830944>}
box{<0,0,-0.203200><2.216072,0.035000,0.203200> rotate<0,57.990789,0> translate<15.293694,0.000000,34.710169> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.325575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.469728,0.000000,9.347200>}
box{<0,0,-0.203200><10.144153,0.035000,0.203200> rotate<0,0.000000,0> translate<15.325575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.380056,0.000000,13.976584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,14.275322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<15.380056,0.000000,13.976584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.397550,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.144822,0.000000,34.544000>}
box{<0,0,-0.203200><3.747272,0.035000,0.203200> rotate<0,0.000000,0> translate<15.397550,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.407791,0.000000,20.646688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,20.870741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<15.407791,0.000000,20.646688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.440806,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,20.726400>}
box{<0,0,-0.203200><1.145394,0.035000,0.203200> rotate<0,0.000000,0> translate<15.440806,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<15.462247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.333200,0.000000,7.721600>}
box{<0,0,-0.203200><8.870953,0.035000,0.203200> rotate<0,0.000000,0> translate<15.462247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.371444,0.000000,8.128000>}
box{<0,0,-0.203200><8.909197,0.035000,0.203200> rotate<0,0.000000,0> translate<15.462247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.656928,0.000000,8.534400>}
box{<0,0,-0.203200><9.194681,0.035000,0.203200> rotate<0,0.000000,0> translate<15.462247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.063328,0.000000,8.940800>}
box{<0,0,-0.203200><9.601081,0.035000,0.203200> rotate<0,0.000000,0> translate<15.462247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.482538,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.224000>}
box{<0,0,-0.203200><8.633062,0.035000,0.203200> rotate<0,0.000000,0> translate<15.482538,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,15.811400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,16.205200>}
box{<0,0,-0.203200><0.393800,0.035000,0.203200> rotate<0,90.000000,0> translate<15.500597,0.000000,16.205200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,15.811400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,15.803675>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<15.500597,0.000000,15.811400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.735241,0.000000,15.849600>}
box{<0,0,-0.203200><7.234644,0.035000,0.203200> rotate<0,0.000000,0> translate<15.500597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,16.205200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.518509,0.000000,16.205200>}
box{<0,0,-0.203200><1.017912,0.035000,0.203200> rotate<0,0.000000,0> translate<15.500597,0.000000,16.205200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,20.870741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,21.272597>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,90.000000,0> translate<15.500597,0.000000,21.272597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,21.132800>}
box{<0,0,-0.203200><1.085603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.500597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,21.272597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.280322>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,-67.494278,0> translate<15.500597,0.000000,21.272597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,14.275322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,15.803675>}
box{<0,0,-0.203200><1.528353,0.035000,0.203200> rotate<0,90.000000,0> translate<15.503797,0.000000,15.803675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.954441,0.000000,14.630400>}
box{<0,0,-0.203200><8.450644,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.548041,0.000000,15.036800>}
box{<0,0,-0.203200><8.044244,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.141641,0.000000,15.443200>}
box{<0,0,-0.203200><7.637844,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.280322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.965831>}
box{<0,0,-0.203200><0.685509,0.035000,0.203200> rotate<0,90.000000,0> translate<15.503797,0.000000,21.965831> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,21.539200>}
box{<0,0,-0.203200><1.082403,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.495556,0.000000,21.945600>}
box{<0,0,-0.203200><0.991759,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.965831>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,22.211113>}
box{<0,0,-0.203200><0.265491,0.035000,0.203200> rotate<0,-67.495310,0> translate<15.503797,0.000000,21.965831> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,22.211113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,25.428603>}
box{<0,0,-0.203200><3.217491,0.035000,0.203200> rotate<0,90.000000,0> translate<15.605397,0.000000,25.428603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.780013,0.000000,22.352000>}
box{<0,0,-0.203200><0.174616,0.035000,0.203200> rotate<0,0.000000,0> translate<15.605397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.702000,0.000000,22.758400>}
box{<0,0,-0.203200><0.096603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.605397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.702000,0.000000,23.164800>}
box{<0,0,-0.203200><0.096603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.605397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.702000,0.000000,23.571200>}
box{<0,0,-0.203200><0.096603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.605397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.860697,0.000000,23.977600>}
box{<0,0,-0.203200><0.255300,0.035000,0.203200> rotate<0,0.000000,0> translate<15.605397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.429347,0.000000,24.384000>}
box{<0,0,-0.203200><0.823950,0.035000,0.203200> rotate<0,0.000000,0> translate<15.605397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357059,0.000000,24.790400>}
box{<0,0,-0.203200><0.751663,0.035000,0.203200> rotate<0,0.000000,0> translate<15.605397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,25.196800>}
box{<0,0,-0.203200><0.752203,0.035000,0.203200> rotate<0,0.000000,0> translate<15.605397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.605397,0.000000,25.428603>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,26.032756>}
box{<0,0,-0.203200><0.964785,0.035000,0.203200> rotate<0,-38.768111,0> translate<15.605397,0.000000,25.428603> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.651550,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.738422,0.000000,34.137600>}
box{<0,0,-0.203200><3.086872,0.035000,0.203200> rotate<0,0.000000,0> translate<15.651550,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.702000,0.000000,22.540341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.794806,0.000000,22.316288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<15.702000,0.000000,22.540341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.702000,0.000000,23.687656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.702000,0.000000,22.540341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.702000,0.000000,22.540341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.702000,0.000000,23.687656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.794806,0.000000,23.911709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<15.702000,0.000000,23.687656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.794806,0.000000,22.316288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.966287,0.000000,22.144806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<15.794806,0.000000,22.316288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.794806,0.000000,23.911709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.966287,0.000000,24.083191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.794806,0.000000,23.911709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.822778,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,25.603200>}
box{<0,0,-0.203200><0.534822,0.035000,0.203200> rotate<0,0.000000,0> translate<15.822778,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.905550,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.332022,0.000000,33.731200>}
box{<0,0,-0.203200><2.426472,0.035000,0.203200> rotate<0,0.000000,0> translate<15.905550,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.966287,0.000000,22.144806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.190341,0.000000,22.052000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<15.966287,0.000000,22.144806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.966287,0.000000,24.083191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.190341,0.000000,24.175997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<15.966287,0.000000,24.083191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,5.527866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,5.070666>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<16.154400,0.000000,5.527866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,6.664131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,5.527866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.154400,0.000000,5.527866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,6.664131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.957866,0.000000,7.467597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.154400,0.000000,6.664131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.159550,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.262600,0.000000,33.324800>}
box{<0,0,-0.203200><2.103050,0.035000,0.203200> rotate<0,0.000000,0> translate<16.159550,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.190341,0.000000,22.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.389156,0.000000,22.052000>}
box{<0,0,-0.203200><0.198816,0.035000,0.203200> rotate<0,0.000000,0> translate<16.190341,0.000000,22.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.190341,0.000000,24.175997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.556847,0.000000,24.175997>}
box{<0,0,-0.203200><0.366506,0.035000,0.203200> rotate<0,0.000000,0> translate<16.190341,0.000000,24.175997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.246669,0.000000,2.641600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,2.276669>}
box{<0,0,-0.203200><0.516091,0.035000,0.203200> rotate<0,44.997030,0> translate<16.246669,0.000000,2.641600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.328769,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,26.009600>}
box{<0,0,-0.203200><0.028831,0.035000,0.203200> rotate<0,0.000000,0> translate<16.328769,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.344725,0.000000,24.657181>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,24.615619>}
box{<0,0,-0.203200><0.043511,0.035000,0.203200> rotate<0,72.783552,0> translate<16.344725,0.000000,24.657181> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.344725,0.000000,24.657181>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,24.796250>}
box{<0,0,-0.203200><0.139663,0.035000,0.203200> rotate<0,-84.705037,0> translate<16.344725,0.000000,24.657181> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,24.572113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.411044,0.000000,24.443091>}
box{<0,0,-0.203200><0.139653,0.035000,0.203200> rotate<0,67.495113,0> translate<16.357600,0.000000,24.572113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,24.615619>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,24.572113>}
box{<0,0,-0.203200><0.043506,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.357600,0.000000,24.572113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,26.032756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357600,0.000000,24.796250>}
box{<0,0,-0.203200><1.236506,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.357600,0.000000,24.796250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.389156,0.000000,22.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.617131,0.000000,21.824028>}
box{<0,0,-0.203200><0.322403,0.035000,0.203200> rotate<0,44.996638,0> translate<16.389156,0.000000,22.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.411044,0.000000,24.443091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.452362,0.000000,24.309700>}
box{<0,0,-0.203200><0.139643,0.035000,0.203200> rotate<0,72.784436,0> translate<16.411044,0.000000,24.443091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.413550,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.262600,0.000000,32.918400>}
box{<0,0,-0.203200><1.849050,0.035000,0.203200> rotate<0,0.000000,0> translate<16.413550,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.428400,0.000000,17.865256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.428400,0.000000,17.830797>}
box{<0,0,-0.203200><0.034459,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.428400,0.000000,17.830797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.428400,0.000000,17.865256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.521206,0.000000,18.089309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<16.428400,0.000000,17.865256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.452362,0.000000,24.309700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.480156,0.000000,24.276234>}
box{<0,0,-0.203200><0.043502,0.035000,0.203200> rotate<0,50.286494,0> translate<16.452362,0.000000,24.309700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.468209,0.000000,32.830944>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.523188,0.000000,32.775966>}
box{<0,0,-0.203200><0.077751,0.035000,0.203200> rotate<0,44.997030,0> translate<16.468209,0.000000,32.830944> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.480156,0.000000,24.276234>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.496809,0.000000,24.236031>}
box{<0,0,-0.203200><0.043516,0.035000,0.203200> rotate<0,67.495004,0> translate<16.480156,0.000000,24.276234> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.496809,0.000000,24.236031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.556847,0.000000,24.175997>}
box{<0,0,-0.203200><0.084904,0.035000,0.203200> rotate<0,44.995539,0> translate<16.496809,0.000000,24.236031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.518509,0.000000,16.205200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.521206,0.000000,16.198688>}
box{<0,0,-0.203200><0.007049,0.035000,0.203200> rotate<0,67.500733,0> translate<16.518509,0.000000,16.205200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.521206,0.000000,16.198688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692688,0.000000,16.027206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<16.521206,0.000000,16.198688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.521206,0.000000,18.089309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692688,0.000000,18.260791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.521206,0.000000,18.089309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.523188,0.000000,32.775966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.563700,0.000000,32.678156>}
box{<0,0,-0.203200><0.105868,0.035000,0.203200> rotate<0,67.496280,0> translate<16.523188,0.000000,32.775966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.563700,0.000000,32.678156>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.619806,0.000000,32.588391>}
box{<0,0,-0.203200><0.105857,0.035000,0.203200> rotate<0,57.989534,0> translate<16.563700,0.000000,32.678156> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,19.906641>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.679006,0.000000,19.682588>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<16.586200,0.000000,19.906641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,21.749356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,19.906641>}
box{<0,0,-0.203200><1.842716,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.586200,0.000000,19.906641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.586200,0.000000,21.749356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.617131,0.000000,21.824028>}
box{<0,0,-0.203200><0.080825,0.035000,0.203200> rotate<0,-67.494794,0> translate<16.586200,0.000000,21.749356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,1.850113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.750809,0.000000,1.514031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<16.611600,0.000000,1.850113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,2.276669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,1.850113>}
box{<0,0,-0.203200><0.426556,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.611600,0.000000,1.850113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,5.070666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,4.470397>}
box{<0,0,-0.203200><0.600269,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.611600,0.000000,4.470397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.619806,0.000000,32.588391>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.632644,0.000000,32.511716>}
box{<0,0,-0.203200><0.077742,0.035000,0.203200> rotate<0,80.489959,0> translate<16.619806,0.000000,32.588391> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.632597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.262600,0.000000,32.512000>}
box{<0,0,-0.203200><1.630003,0.035000,0.203200> rotate<0,0.000000,0> translate<16.632597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.632644,0.000000,32.511716>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.439884>}
box{<0,0,-0.203200><0.077749,0.035000,0.203200> rotate<0,67.495786,0> translate<16.632644,0.000000,32.511716> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.029397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.153866>}
box{<0,0,-0.203200><0.124469,0.035000,0.203200> rotate<0,90.000000,0> translate<16.662397,0.000000,32.153866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.029397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.913778,0.000000,32.029397>}
box{<0,0,-0.203200><1.251381,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662397,0.000000,32.029397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.535219,0.000000,32.105600>}
box{<0,0,-0.203200><1.872822,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662397,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.153866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.679878,0.000000,32.229613>}
box{<0,0,-0.203200><0.077738,0.035000,0.203200> rotate<0,-76.999438,0> translate<16.662397,0.000000,32.153866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.334013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.439884>}
box{<0,0,-0.203200><0.105872,0.035000,0.203200> rotate<0,90.000000,0> translate<16.662397,0.000000,32.439884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,32.334013>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.679878,0.000000,32.229613>}
box{<0,0,-0.203200><0.105853,0.035000,0.203200> rotate<0,80.488985,0> translate<16.662397,0.000000,32.334013> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.679006,0.000000,19.682588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.850487,0.000000,19.511106>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<16.679006,0.000000,19.682588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692688,0.000000,16.027206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916741,0.000000,15.934400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<16.692688,0.000000,16.027206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692688,0.000000,18.260791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916741,0.000000,18.353597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<16.692688,0.000000,18.260791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.750809,0.000000,1.514031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.401247,0.000000,0.863597>}
box{<0,0,-0.203200><0.919855,0.035000,0.203200> rotate<0,44.996893,0> translate<16.750809,0.000000,1.514031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.850487,0.000000,19.511106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.074541,0.000000,19.418300>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<16.850487,0.000000,19.511106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916741,0.000000,15.934400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.659256,0.000000,15.934400>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,0.000000,0> translate<16.916741,0.000000,15.934400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916741,0.000000,18.353597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.204441,0.000000,18.353597>}
box{<0,0,-0.203200><1.287700,0.035000,0.203200> rotate<0,0.000000,0> translate<16.916741,0.000000,18.353597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.957866,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.094131,0.000000,7.467597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<16.957866,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.074541,0.000000,19.418300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.389600,0.000000,19.418300>}
box{<0,0,-0.203200><1.315059,0.035000,0.203200> rotate<0,0.000000,0> translate<17.074541,0.000000,19.418300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.913778,0.000000,32.029397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,0.000000,31.401175>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<17.913778,0.000000,32.029397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.094131,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,6.664131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<18.094131,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.204441,0.000000,18.353597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.389600,0.000000,18.538756>}
box{<0,0,-0.203200><0.261855,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.204441,0.000000,18.353597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.243975,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.840025,0.000000,31.699200>}
box{<0,0,-0.203200><0.596050,0.035000,0.203200> rotate<0,0.000000,0> translate<18.243975,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.246528,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.885469,0.000000,7.315200>}
box{<0,0,-0.203200><3.638941,0.035000,0.203200> rotate<0,0.000000,0> translate<18.246528,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.262600,0.000000,32.378219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.890822,0.000000,31.749997>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<18.262600,0.000000,32.378219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.262600,0.000000,33.661778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.262600,0.000000,32.378219>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.262600,0.000000,32.378219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.262600,0.000000,33.661778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.170219,0.000000,34.569397>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.262600,0.000000,33.661778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.389600,0.000000,19.418300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.389600,0.000000,18.538756>}
box{<0,0,-0.203200><0.879544,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.389600,0.000000,18.538756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,4.327328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,5.070666>}
box{<0,0,-0.203200><0.743337,0.035000,0.203200> rotate<0,90.000000,0> translate<18.440397,0.000000,5.070666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,4.327328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,3.870131>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<18.440397,0.000000,4.327328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.834669,0.000000,4.470400>}
box{<0,0,-0.203200><3.394272,0.035000,0.203200> rotate<0,0.000000,0> translate<18.440397,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.885466,0.000000,4.876800>}
box{<0,0,-0.203200><3.445069,0.035000,0.203200> rotate<0,0.000000,0> translate<18.440397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,5.070666>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,5.527866>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.440397,0.000000,5.070666> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.507441,0.000000,2.343713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.666756,0.000000,2.184397>}
box{<0,0,-0.203200><0.225306,0.035000,0.203200> rotate<0,44.997030,0> translate<18.507441,0.000000,2.343713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.507441,0.000000,2.343713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,2.733866>}
box{<0,0,-0.203200><0.551762,0.035000,0.203200> rotate<0,-44.996801,0> translate<18.507441,0.000000,2.343713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,0.000000,31.401175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.890822,0.000000,31.749997>}
box{<0,0,-0.203200><0.493309,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.542000,0.000000,31.401175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.602128,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.529866,0.000000,2.438400>}
box{<0,0,-0.203200><2.927737,0.035000,0.203200> rotate<0,0.000000,0> translate<18.602128,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.652928,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.479069,0.000000,6.908800>}
box{<0,0,-0.203200><2.826141,0.035000,0.203200> rotate<0,0.000000,0> translate<18.652928,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.652931,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.479066,0.000000,5.283200>}
box{<0,0,-0.203200><2.826134,0.035000,0.203200> rotate<0,0.000000,0> translate<18.652931,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.666756,0.000000,2.184397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783872,0.000000,2.184397>}
box{<0,0,-0.203200><3.117116,0.035000,0.203200> rotate<0,0.000000,0> translate<18.666756,0.000000,2.184397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.703728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.428269,0.000000,4.064000>}
box{<0,0,-0.203200><2.724541,0.035000,0.203200> rotate<0,0.000000,0> translate<18.703728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,2.733866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,3.870131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<18.897597,0.000000,3.870131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,3.251200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897597,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,3.657600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897597,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,5.527866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,6.664131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<18.897597,0.000000,6.664131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,5.689600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,6.096000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,6.502400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.967325,0.000000,36.525200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.592400,0.000000,32.900125>}
box{<0,0,-0.203200><5.126630,0.035000,0.203200> rotate<0,44.997030,0> translate<18.967325,0.000000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.170219,0.000000,34.569397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.453778,0.000000,34.569397>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,0.000000,0> translate<19.170219,0.000000,34.569397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.465675,0.000000,38.150797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.764413,0.000000,38.027056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<19.465675,0.000000,38.150797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.659256,0.000000,15.934400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.758722,0.000000,15.975600>}
box{<0,0,-0.203200><0.107661,0.035000,0.203200> rotate<0,-22.498510,0> translate<19.659256,0.000000,15.934400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.758722,0.000000,15.975600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.667878,0.000000,15.975600>}
box{<0,0,-0.203200><0.909156,0.035000,0.203200> rotate<0,0.000000,0> translate<19.758722,0.000000,15.975600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.764413,0.000000,38.027056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.993056,0.000000,37.798413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<19.764413,0.000000,38.027056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.993056,0.000000,37.798413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.287872,0.000000,34.503597>}
box{<0,0,-0.203200><4.659573,0.035000,0.203200> rotate<0,44.997030,0> translate<19.993056,0.000000,37.798413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.996269,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,37.795200>}
box{<0,0,-0.203200><41.546531,0.035000,0.203200> rotate<0,0.000000,0> translate<19.996269,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.402669,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.132394,0.000000,37.388800>}
box{<0,0,-0.203200><29.729725,0.035000,0.203200> rotate<0,0.000000,0> translate<20.402669,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.453778,0.000000,34.569397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,33.661778>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,44.997030,0> translate<20.453778,0.000000,34.569397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.479175,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.948525,0.000000,34.544000>}
box{<0,0,-0.203200><0.469350,0.035000,0.203200> rotate<0,0.000000,0> translate<20.479175,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.667878,0.000000,15.975600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.868741,0.000000,15.892400>}
box{<0,0,-0.203200><0.217412,0.035000,0.203200> rotate<0,22.498522,0> translate<20.667878,0.000000,15.975600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.733175,0.000000,31.749997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,31.121778>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,44.996888,0> translate<20.733175,0.000000,31.749997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.733175,0.000000,31.749997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,32.378219>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.733175,0.000000,31.749997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.783975,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,31.699200>}
box{<0,0,-0.203200><21.508425,0.035000,0.203200> rotate<0,0.000000,0> translate<20.783975,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.809069,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.739587,0.000000,36.982400>}
box{<0,0,-0.203200><28.930519,0.035000,0.203200> rotate<0,0.000000,0> translate<20.809069,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.868741,0.000000,15.892400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.311256,0.000000,15.892400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<20.868741,0.000000,15.892400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.885575,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.354925,0.000000,34.137600>}
box{<0,0,-0.203200><0.469350,0.035000,0.203200> rotate<0,0.000000,0> translate<20.885575,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.088778,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.728294,0.000000,32.105600>}
box{<0,0,-0.203200><1.639516,0.035000,0.203200> rotate<0,0.000000,0> translate<21.088778,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.190375,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,31.292800>}
box{<0,0,-0.203200><21.102025,0.035000,0.203200> rotate<0,0.000000,0> translate<21.190375,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.215469,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.576000>}
box{<0,0,-0.203200><28.502931,0.035000,0.203200> rotate<0,0.000000,0> translate<21.215469,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,2.733866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783872,0.000000,2.184397>}
box{<0,0,-0.203200><0.777068,0.035000,0.203200> rotate<0,44.996867,0> translate<21.234400,0.000000,2.733866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,3.870131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,2.733866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.234400,0.000000,2.733866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,3.870131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,0.000000,4.673597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.234400,0.000000,3.870131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,5.527866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,0.000000,4.724400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<21.234400,0.000000,5.527866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,6.664131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,5.527866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.234400,0.000000,5.527866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,0.000000,6.664131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,0.000000,7.467597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.234400,0.000000,6.664131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.291975,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.761325,0.000000,33.731200>}
box{<0,0,-0.203200><0.469350,0.035000,0.203200> rotate<0,0.000000,0> translate<21.291975,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,30.549028>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,31.121778>}
box{<0,0,-0.203200><0.572750,0.035000,0.203200> rotate<0,90.000000,0> translate<21.361397,0.000000,31.121778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,30.549028>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.308616,0.000000,30.022797>}
box{<0,0,-0.203200><1.083579,0.035000,0.203200> rotate<0,29.052622,0> translate<21.361397,0.000000,30.549028> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,30.886400>}
box{<0,0,-0.203200><20.931003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.361397,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,32.378219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,33.661778>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,90.000000,0> translate<21.361397,0.000000,33.661778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.592400,0.000000,32.512000>}
box{<0,0,-0.203200><1.231003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.361397,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.574125,0.000000,32.918400>}
box{<0,0,-0.203200><1.212728,0.035000,0.203200> rotate<0,0.000000,0> translate<21.361397,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.361397,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.167725,0.000000,33.324800>}
box{<0,0,-0.203200><0.806328,0.035000,0.203200> rotate<0,0.000000,0> translate<21.361397,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.485650,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.023775,0.000000,30.480000>}
box{<0,0,-0.203200><1.538125,0.035000,0.203200> rotate<0,0.000000,0> translate<21.485650,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.621869,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.356334,0.000000,36.169600>}
box{<0,0,-0.203200><20.734466,0.035000,0.203200> rotate<0,0.000000,0> translate<21.621869,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.028269,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,35.763200>}
box{<0,0,-0.203200><20.264131,0.035000,0.203200> rotate<0,0.000000,0> translate<22.028269,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,0.000000,4.673597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.828125,0.000000,4.673597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<22.037866,0.000000,4.673597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,0.000000,4.724400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.878931,0.000000,4.724400>}
box{<0,0,-0.203200><0.841066,0.035000,0.203200> rotate<0,0.000000,0> translate<22.037866,0.000000,4.724400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.174131,0.000000,7.467597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<22.037866,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.217172,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.616569,0.000000,30.073600>}
box{<0,0,-0.203200><0.399397,0.035000,0.203200> rotate<0,0.000000,0> translate<22.217172,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.308616,0.000000,30.022797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.595525,0.000000,30.022797>}
box{<0,0,-0.203200><0.286909,0.035000,0.203200> rotate<0,0.000000,0> translate<22.308616,0.000000,30.022797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.311256,0.000000,15.892400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.535309,0.000000,15.985206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<22.311256,0.000000,15.892400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.434669,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,35.356800>}
box{<0,0,-0.203200><19.857731,0.035000,0.203200> rotate<0,0.000000,0> translate<22.434669,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.535309,0.000000,15.985206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.567472,0.000000,16.017372>}
box{<0,0,-0.203200><0.045487,0.035000,0.203200> rotate<0,-44.999813,0> translate<22.535309,0.000000,15.985206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.567472,0.000000,16.017372>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.469241>}
box{<0,0,-0.203200><2.189386,0.035000,0.203200> rotate<0,44.997088,0> translate<22.567472,0.000000,16.017372> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.592400,0.000000,32.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.685206,0.000000,32.148688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<22.592400,0.000000,32.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.592400,0.000000,32.900125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.592400,0.000000,32.372741>}
box{<0,0,-0.203200><0.527384,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.592400,0.000000,32.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.595525,0.000000,30.022797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.685206,0.000000,30.239309>}
box{<0,0,-0.203200><0.234351,0.035000,0.203200> rotate<0,-67.495808,0> translate<22.595525,0.000000,30.022797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.685206,0.000000,30.239309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.856687,0.000000,30.410791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.685206,0.000000,30.239309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.685206,0.000000,32.148688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.856687,0.000000,31.977206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<22.685206,0.000000,32.148688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.828125,0.000000,4.673597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.878931,0.000000,4.724400>}
box{<0,0,-0.203200><0.071849,0.035000,0.203200> rotate<0,-44.995268,0> translate<22.828125,0.000000,4.673597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.841069,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,34.950400>}
box{<0,0,-0.203200><19.451331,0.035000,0.203200> rotate<0,0.000000,0> translate<22.841069,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.856687,0.000000,30.410791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.080741,0.000000,30.503597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<22.856687,0.000000,30.410791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.856687,0.000000,31.977206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.080741,0.000000,31.884400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<22.856687,0.000000,31.977206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.080741,0.000000,30.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.323256,0.000000,30.503597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<23.080741,0.000000,30.503597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.080741,0.000000,31.884400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.323256,0.000000,31.884400>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<23.080741,0.000000,31.884400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.174131,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.875997,0.000000,6.765728>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,44.997158,0> translate<23.174131,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.247469,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,34.544000>}
box{<0,0,-0.203200><19.044931,0.035000,0.203200> rotate<0,0.000000,0> translate<23.247469,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.287872,0.000000,34.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.323256,0.000000,34.503597>}
box{<0,0,-0.203200><4.035384,0.035000,0.203200> rotate<0,0.000000,0> translate<23.287872,0.000000,34.503597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.326528,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.333200,0.000000,7.315200>}
box{<0,0,-0.203200><1.006672,0.035000,0.203200> rotate<0,0.000000,0> translate<23.326528,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.732928,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.019069,0.000000,6.908800>}
box{<0,0,-0.203200><0.286141,0.035000,0.203200> rotate<0,0.000000,0> translate<23.732928,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.875997,0.000000,6.765728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.333200,0.000000,7.222931>}
box{<0,0,-0.203200><0.646583,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.875997,0.000000,6.765728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,10.454741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,10.230688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<24.020400,0.000000,10.454741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,11.897256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,10.454741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.020400,0.000000,10.454741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,11.897256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,12.121309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<24.020400,0.000000,11.897256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,12.486741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,12.262688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<24.020400,0.000000,12.486741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,13.929256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,12.486741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.020400,0.000000,12.486741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,13.929256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,14.153309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<24.020400,0.000000,13.929256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,10.230688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.284688,0.000000,10.059206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<24.113206,0.000000,10.230688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,12.121309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.183897,0.000000,12.192000>}
box{<0,0,-0.203200><0.099972,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.113206,0.000000,12.121309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,12.262688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.183897,0.000000,12.192000>}
box{<0,0,-0.203200><0.099969,0.035000,0.203200> rotate<0,44.995764,0> translate<24.113206,0.000000,12.262688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,14.153309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.155703>}
box{<0,0,-0.203200><0.003385,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.113206,0.000000,14.153309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.469241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.155703>}
box{<0,0,-0.203200><0.313538,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.115600,0.000000,14.155703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.284688,0.000000,10.059206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.508741,0.000000,9.966400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<24.284688,0.000000,10.059206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.333200,0.000000,8.035675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.333200,0.000000,7.222931>}
box{<0,0,-0.203200><0.812744,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.333200,0.000000,7.222931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.333200,0.000000,8.035675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.456941,0.000000,8.334413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<24.333200,0.000000,8.035675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.456941,0.000000,8.334413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.685584,0.000000,8.563056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.456941,0.000000,8.334413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.508741,0.000000,9.966400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.551256,0.000000,9.966400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<24.508741,0.000000,9.966400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.685584,0.000000,8.563056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.025584,0.000000,9.903056>}
box{<0,0,-0.203200><1.895046,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.685584,0.000000,8.563056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.551256,0.000000,9.966400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.635269,0.000000,10.001200>}
box{<0,0,-0.203200><0.090935,0.035000,0.203200> rotate<0,-22.499029,0> translate<25.551256,0.000000,9.966400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.635269,0.000000,10.001200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.262531,0.000000,10.001200>}
box{<0,0,-0.203200><0.627263,0.035000,0.203200> rotate<0,0.000000,0> translate<25.635269,0.000000,10.001200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.025584,0.000000,9.903056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.262531,0.000000,10.001200>}
box{<0,0,-0.203200><0.256468,0.035000,0.203200> rotate<0,-22.497925,0> translate<26.025584,0.000000,9.903056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.323256,0.000000,30.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.547309,0.000000,30.410791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<27.323256,0.000000,30.503597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.323256,0.000000,31.884400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.547309,0.000000,31.977206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<27.323256,0.000000,31.884400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.323256,0.000000,34.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.547309,0.000000,34.410791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<27.323256,0.000000,34.503597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.380225,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,30.480000>}
box{<0,0,-0.203200><14.912175,0.035000,0.203200> rotate<0,0.000000,0> translate<27.380225,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.547309,0.000000,30.410791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718791,0.000000,30.239309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<27.547309,0.000000,30.410791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.547309,0.000000,31.977206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718791,0.000000,32.148688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.547309,0.000000,31.977206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.547309,0.000000,34.410791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718791,0.000000,34.239309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<27.547309,0.000000,34.410791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.675703,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.329825,0.000000,32.105600>}
box{<0,0,-0.203200><14.654122,0.035000,0.203200> rotate<0,0.000000,0> translate<27.675703,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718791,0.000000,30.239309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,30.015256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<27.718791,0.000000,30.239309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718791,0.000000,32.148688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,32.372741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<27.718791,0.000000,32.148688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718791,0.000000,34.239309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,34.015256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<27.718791,0.000000,34.239309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.760922,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.343081,0.000000,34.137600>}
box{<0,0,-0.203200><14.582159,0.035000,0.203200> rotate<0,0.000000,0> translate<27.760922,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.787431,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.316569,0.000000,30.073600>}
box{<0,0,-0.203200><14.529138,0.035000,0.203200> rotate<0,0.000000,0> translate<27.787431,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,30.006797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,30.015256>}
box{<0,0,-0.203200><0.008459,0.035000,0.203200> rotate<0,90.000000,0> translate<27.811597,0.000000,30.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,30.006797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.133675,0.000000,30.006797>}
box{<0,0,-0.203200><1.322078,0.035000,0.203200> rotate<0,0.000000,0> translate<27.811597,0.000000,30.006797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,32.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,34.015256>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,90.000000,0> translate<27.811597,0.000000,34.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,32.512000>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<27.811597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,32.918400>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<27.811597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,33.324800>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<27.811597,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.811597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,33.731200>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<27.811597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.428513,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.437709,0.000000,10.010191>}
box{<0,0,-0.203200><0.009955,0.035000,0.203200> rotate<0,22.498008,0> translate<28.428513,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.428513,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.437709,0.000000,10.017806>}
box{<0,0,-0.203200><0.009953,0.035000,0.203200> rotate<0,-22.481390,0> translate<28.428513,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.437709,0.000000,10.010191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.537038,0.000000,9.910863>}
box{<0,0,-0.203200><0.140471,0.035000,0.203200> rotate<0,44.997030,0> translate<28.437709,0.000000,10.010191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.437709,0.000000,10.017806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.609191,0.000000,10.189288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.437709,0.000000,10.017806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.537038,0.000000,9.910863>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.636341,0.000000,9.951997>}
box{<0,0,-0.203200><0.107486,0.035000,0.203200> rotate<0,-22.499339,0> translate<28.537038,0.000000,9.910863> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579903,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,10.160000>}
box{<0,0,-0.203200><6.218097,0.035000,0.203200> rotate<0,0.000000,0> translate<28.579903,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.609191,0.000000,10.189288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.683216,0.000000,10.368000>}
box{<0,0,-0.203200><0.193437,0.035000,0.203200> rotate<0,-67.495584,0> translate<28.609191,0.000000,10.189288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.636341,0.000000,9.951997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.783656,0.000000,9.951997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<28.636341,0.000000,9.951997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.683216,0.000000,10.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.783656,0.000000,10.368000>}
box{<0,0,-0.203200><1.100441,0.035000,0.203200> rotate<0,0.000000,0> translate<28.683216,0.000000,10.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.133675,0.000000,30.006797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.432413,0.000000,29.883056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<29.133675,0.000000,30.006797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.432413,0.000000,29.883056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.947056,0.000000,26.368413>}
box{<0,0,-0.203200><4.970457,0.035000,0.203200> rotate<0,44.997030,0> translate<29.432413,0.000000,29.883056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.648269,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,29.667200>}
box{<0,0,-0.203200><12.644131,0.035000,0.203200> rotate<0,0.000000,0> translate<29.648269,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.783656,0.000000,9.951997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.007709,0.000000,9.859191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<29.783656,0.000000,9.951997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.783656,0.000000,10.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.007709,0.000000,10.460806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.783656,0.000000,10.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.007709,0.000000,9.859191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.179191,0.000000,9.687709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<30.007709,0.000000,9.859191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.007709,0.000000,10.460806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.179191,0.000000,10.632288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.007709,0.000000,10.460806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.054669,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,29.260800>}
box{<0,0,-0.203200><12.237731,0.035000,0.203200> rotate<0,0.000000,0> translate<30.054669,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.113300,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,9.753600>}
box{<0,0,-0.203200><4.684700,0.035000,0.203200> rotate<0,0.000000,0> translate<30.113300,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.113303,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.860856,0.000000,10.566400>}
box{<0,0,-0.203200><4.747553,0.035000,0.203200> rotate<0,0.000000,0> translate<30.113303,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.179191,0.000000,9.687709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,9.463656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<30.179191,0.000000,9.687709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.179191,0.000000,10.632288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,10.856341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<30.179191,0.000000,10.632288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,8.623034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,9.463656>}
box{<0,0,-0.203200><0.840622,0.035000,0.203200> rotate<0,90.000000,0> translate<30.271997,0.000000,9.463656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,8.623034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.414341,0.000000,8.681997>}
box{<0,0,-0.203200><0.154072,0.035000,0.203200> rotate<0,-22.499129,0> translate<30.271997,0.000000,8.623034> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.850253,0.000000,8.940800>}
box{<0,0,-0.203200><4.578256,0.035000,0.203200> rotate<0,0.000000,0> translate<30.271997,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.932894,0.000000,9.347200>}
box{<0,0,-0.203200><4.660897,0.035000,0.203200> rotate<0,0.000000,0> translate<30.271997,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,10.856341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,10.996531>}
box{<0,0,-0.203200><0.140191,0.035000,0.203200> rotate<0,90.000000,0> translate<30.271997,0.000000,10.996531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.295725,0.000000,10.972800>}
box{<0,0,-0.203200><0.023728,0.035000,0.203200> rotate<0,0.000000,0> translate<30.271997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.271997,0.000000,10.996531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.343584,0.000000,10.924941>}
box{<0,0,-0.203200><0.101242,0.035000,0.203200> rotate<0,44.998281,0> translate<30.271997,0.000000,10.996531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.343584,0.000000,10.924941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.394384,0.000000,10.903900>}
box{<0,0,-0.203200><0.054985,0.035000,0.203200> rotate<0,22.497144,0> translate<30.343584,0.000000,10.924941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.394384,0.000000,10.903900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.438031,0.000000,10.870459>}
box{<0,0,-0.203200><0.054985,0.035000,0.203200> rotate<0,37.455532,0> translate<30.394384,0.000000,10.903900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.414341,0.000000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.561656,0.000000,8.681997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<30.414341,0.000000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.438031,0.000000,10.870459>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.542466,0.000000,10.842562>}
box{<0,0,-0.203200><0.108096,0.035000,0.203200> rotate<0,14.954864,0> translate<30.438031,0.000000,10.870459> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.461069,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,28.854400>}
box{<0,0,-0.203200><11.831331,0.035000,0.203200> rotate<0,0.000000,0> translate<30.461069,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.542466,0.000000,10.842562>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.642322,0.000000,10.801200>}
box{<0,0,-0.203200><0.108084,0.035000,0.203200> rotate<0,22.498852,0> translate<30.542466,0.000000,10.842562> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.642322,0.000000,10.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.697306,0.000000,10.801200>}
box{<0,0,-0.203200><0.054984,0.035000,0.203200> rotate<0,0.000000,0> translate<30.642322,0.000000,10.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.697306,0.000000,10.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.750428,0.000000,10.787009>}
box{<0,0,-0.203200><0.054985,0.035000,0.203200> rotate<0,14.955392,0> translate<30.697306,0.000000,10.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.750428,0.000000,10.787009>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.857588,0.000000,10.801200>}
box{<0,0,-0.203200><0.108095,0.035000,0.203200> rotate<0,-7.543028,0> translate<30.750428,0.000000,10.787009> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.857588,0.000000,10.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.053300,0.000000,10.801200>}
box{<0,0,-0.203200><4.195712,0.035000,0.203200> rotate<0,0.000000,0> translate<30.857588,0.000000,10.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.867469,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,28.448000>}
box{<0,0,-0.203200><11.424931,0.035000,0.203200> rotate<0,0.000000,0> translate<30.867469,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.273869,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.303316,0.000000,28.041600>}
box{<0,0,-0.203200><11.029447,0.035000,0.203200> rotate<0,0.000000,0> translate<31.273869,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,15.951197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,20.210300>}
box{<0,0,-0.203200><4.259103,0.035000,0.203200> rotate<0,90.000000,0> translate<31.362797,0.000000,20.210300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,15.951197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,15.951197>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,15.951197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,16.256000>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,16.662400>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,17.068800>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,17.475200>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,17.881600>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,18.288000>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,18.694400>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,19.100800>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,19.507200>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,19.913600>}
box{<0,0,-0.203200><2.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,20.210300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.460287,0.000000,20.112806>}
box{<0,0,-0.203200><0.137875,0.035000,0.203200> rotate<0,44.997948,0> translate<31.362797,0.000000,20.210300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.460287,0.000000,20.112806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.684341,0.000000,20.020000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<31.460287,0.000000,20.112806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.561656,0.000000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.623000,0.000000,8.656588>}
box{<0,0,-0.203200><0.066398,0.035000,0.203200> rotate<0,22.498485,0> translate<31.561656,0.000000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.623000,0.000000,8.656588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.684341,0.000000,8.681997>}
box{<0,0,-0.203200><0.066395,0.035000,0.203200> rotate<0,-22.499517,0> translate<31.623000,0.000000,8.656588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.680269,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,27.635200>}
box{<0,0,-0.203200><10.612131,0.035000,0.203200> rotate<0,0.000000,0> translate<31.680269,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.684341,0.000000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.831656,0.000000,8.681997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<31.684341,0.000000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.684341,0.000000,20.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.831656,0.000000,20.020000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<31.684341,0.000000,20.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.086669,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,27.228800>}
box{<0,0,-0.203200><10.205731,0.035000,0.203200> rotate<0,0.000000,0> translate<32.086669,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.493069,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.822400>}
box{<0,0,-0.203200><9.799331,0.035000,0.203200> rotate<0,0.000000,0> translate<32.493069,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.831656,0.000000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.055709,0.000000,8.589191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<32.831656,0.000000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.831656,0.000000,20.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.055709,0.000000,20.112806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<32.831656,0.000000,20.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.899469,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.416000>}
box{<0,0,-0.203200><9.392931,0.035000,0.203200> rotate<0,0.000000,0> translate<32.899469,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.947056,0.000000,26.368413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,26.069675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<32.947056,0.000000,26.368413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.055709,0.000000,8.589191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.227191,0.000000,8.417709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<33.055709,0.000000,8.589191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.055709,0.000000,20.112806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.227191,0.000000,20.284288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.055709,0.000000,20.112806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,22.036100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,26.069675>}
box{<0,0,-0.203200><4.033575,0.035000,0.203200> rotate<0,90.000000,0> translate<33.070797,0.000000,26.069675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,22.036100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.227191,0.000000,21.879709>}
box{<0,0,-0.203200><0.221172,0.035000,0.203200> rotate<0,44.996458,0> translate<33.070797,0.000000,22.036100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.300991,0.000000,22.352000>}
box{<0,0,-0.203200><9.230194,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,22.758400>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,23.164800>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,23.571200>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,23.977600>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.384000>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.790400>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,25.196800>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,25.603200>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.070797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.009600>}
box{<0,0,-0.203200><9.221603,0.035000,0.203200> rotate<0,0.000000,0> translate<33.070797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.110500,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,8.534400>}
box{<0,0,-0.203200><1.687500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.110500,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.161300,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.894697,0.000000,21.945600>}
box{<0,0,-0.203200><0.733397,0.035000,0.203200> rotate<0,0.000000,0> translate<33.161300,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.227191,0.000000,8.417709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,8.193656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.227191,0.000000,8.417709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.227191,0.000000,20.284288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,20.508341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.227191,0.000000,20.284288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.227191,0.000000,21.879709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,21.655656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.227191,0.000000,21.879709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.241981,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,20.320000>}
box{<0,0,-0.203200><0.495219,0.035000,0.203200> rotate<0,0.000000,0> translate<33.241981,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,8.193656>}
box{<0,0,-0.203200><0.827659,0.035000,0.203200> rotate<0,90.000000,0> translate<33.319997,0.000000,8.193656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.350656,0.000000,7.365997>}
box{<0,0,-0.203200><0.030659,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,7.365997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,7.721600>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,8.128000>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,20.508341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,21.655656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<33.319997,0.000000,21.655656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.736000,0.000000,20.726400>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.736000,0.000000,21.132800>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.736000,0.000000,21.539200>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.350656,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.149341,0.000000,7.365997>}
box{<0,0,-0.203200><0.798684,0.035000,0.203200> rotate<0,0.000000,0> translate<33.350656,0.000000,7.365997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.736000,0.000000,20.508341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,20.505444>}
box{<0,0,-0.203200><0.003136,0.035000,0.203200> rotate<0,67.494278,0> translate<33.736000,0.000000,20.508341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.736000,0.000000,21.655656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.736000,0.000000,20.508341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.736000,0.000000,20.508341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.736000,0.000000,21.655656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.828806,0.000000,21.879709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.736000,0.000000,21.655656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,20.505444>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.737200,0.000000,15.951197>}
box{<0,0,-0.203200><4.554247,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.737200,0.000000,15.951197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.828806,0.000000,21.879709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.000287,0.000000,22.051191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.828806,0.000000,21.879709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.000287,0.000000,22.051191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.224341,0.000000,22.143997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<34.000287,0.000000,22.051191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.149341,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,7.365997>}
box{<0,0,-0.203200><0.648659,0.035000,0.203200> rotate<0,0.000000,0> translate<34.149341,0.000000,7.365997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.224341,0.000000,22.143997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.371656,0.000000,22.143997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<34.224341,0.000000,22.143997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,8.814656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,7.365997>}
box{<0,0,-0.203200><1.448659,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.798000,0.000000,7.365997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,8.814656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.890806,0.000000,9.038709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<34.798000,0.000000,8.814656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,9.613341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.890806,0.000000,9.389288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<34.798000,0.000000,9.613341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,10.414656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,9.613341>}
box{<0,0,-0.203200><0.801316,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.798000,0.000000,9.613341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,10.414656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.890806,0.000000,10.638709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<34.798000,0.000000,10.414656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.890806,0.000000,9.038709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.062288,0.000000,9.210191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.890806,0.000000,9.038709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.890806,0.000000,9.389288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.062288,0.000000,9.217806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<34.890806,0.000000,9.389288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.890806,0.000000,10.638709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.053300,0.000000,10.801200>}
box{<0,0,-0.203200><0.229799,0.035000,0.203200> rotate<0,-44.996479,0> translate<34.890806,0.000000,10.638709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.062288,0.000000,9.210191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.071484,0.000000,9.213997>}
box{<0,0,-0.203200><0.009953,0.035000,0.203200> rotate<0,-22.481390,0> translate<35.062288,0.000000,9.210191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.062288,0.000000,9.217806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.071484,0.000000,9.213997>}
box{<0,0,-0.203200><0.009955,0.035000,0.203200> rotate<0,22.498008,0> translate<35.062288,0.000000,9.217806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.362797,0.000000,18.841463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.362797,0.000000,20.020000>}
box{<0,0,-0.203200><1.178537,0.035000,0.203200> rotate<0,90.000000,0> translate<35.362797,0.000000,20.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.362797,0.000000,18.841463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.570741,0.000000,18.927597>}
box{<0,0,-0.203200><0.225077,0.035000,0.203200> rotate<0,-22.498810,0> translate<35.362797,0.000000,18.841463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.362797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.605331,0.000000,19.100800>}
box{<0,0,-0.203200><8.242534,0.035000,0.203200> rotate<0,0.000000,0> translate<35.362797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.362797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.011731,0.000000,19.507200>}
box{<0,0,-0.203200><8.648934,0.035000,0.203200> rotate<0,0.000000,0> translate<35.362797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.362797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.710244,0.000000,19.913600>}
box{<0,0,-0.203200><7.347447,0.035000,0.203200> rotate<0,0.000000,0> translate<35.362797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.362797,0.000000,20.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.371656,0.000000,20.020000>}
box{<0,0,-0.203200><0.008859,0.035000,0.203200> rotate<0,0.000000,0> translate<35.362797,0.000000,20.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.371656,0.000000,20.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.595709,0.000000,20.112806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.371656,0.000000,20.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.371656,0.000000,22.143997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.595709,0.000000,22.051191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<35.371656,0.000000,22.143997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.570741,0.000000,18.927597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.613256,0.000000,18.927597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.570741,0.000000,18.927597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.595709,0.000000,20.112806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.767191,0.000000,20.284288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.595709,0.000000,20.112806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.595709,0.000000,22.051191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.767191,0.000000,21.879709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<35.595709,0.000000,22.051191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.701300,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,21.945600>}
box{<0,0,-0.203200><6.591100,0.035000,0.203200> rotate<0,0.000000,0> translate<35.701300,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.767191,0.000000,20.284288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.859997,0.000000,20.508341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<35.767191,0.000000,20.284288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.767191,0.000000,21.879709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.859997,0.000000,21.655656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<35.767191,0.000000,21.879709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.781981,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.314244,0.000000,20.320000>}
box{<0,0,-0.203200><6.532263,0.035000,0.203200> rotate<0,0.000000,0> translate<35.781981,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.859997,0.000000,20.508341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.859997,0.000000,21.655656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<35.859997,0.000000,21.655656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.859997,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,20.726400>}
box{<0,0,-0.203200><6.432403,0.035000,0.203200> rotate<0,0.000000,0> translate<35.859997,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.859997,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,21.132800>}
box{<0,0,-0.203200><6.432403,0.035000,0.203200> rotate<0,0.000000,0> translate<35.859997,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.859997,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,21.539200>}
box{<0,0,-0.203200><6.432403,0.035000,0.203200> rotate<0,0.000000,0> translate<35.859997,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.613256,0.000000,18.927597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.837309,0.000000,18.834791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<36.613256,0.000000,18.927597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.837309,0.000000,18.834791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.842000,0.000000,18.830100>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,44.997030,0> translate<36.837309,0.000000,18.834791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.842000,0.000000,18.830100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.846688,0.000000,18.834791>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,-45.016121,0> translate<36.842000,0.000000,18.830100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.846688,0.000000,18.834791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.070741,0.000000,18.927597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.846688,0.000000,18.834791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.901597,0.000000,16.757534>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.901597,0.000000,16.848600>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,90.000000,0> translate<36.901597,0.000000,16.848600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.901597,0.000000,16.757534>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.070741,0.000000,16.827597>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,-22.498765,0> translate<36.901597,0.000000,16.757534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.901597,0.000000,16.848600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.904797,0.000000,16.856322>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-67.486080,0> translate<36.901597,0.000000,16.848600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.901597,0.000000,17.187397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.901597,0.000000,17.278462>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,90.000000,0> translate<36.901597,0.000000,17.278462> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.901597,0.000000,17.187397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.904797,0.000000,17.179675>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<36.901597,0.000000,17.187397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.901597,0.000000,17.278462>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.070741,0.000000,17.208400>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,22.498765,0> translate<36.901597,0.000000,17.278462> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.904797,0.000000,16.856322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.904797,0.000000,17.179675>}
box{<0,0,-0.203200><0.323353,0.035000,0.203200> rotate<0,90.000000,0> translate<36.904797,0.000000,17.179675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.904797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.279200,0.000000,17.068800>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<36.904797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.070741,0.000000,16.827597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.113256,0.000000,16.827597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<37.070741,0.000000,16.827597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.070741,0.000000,17.208400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.113256,0.000000,17.208400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<37.070741,0.000000,17.208400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.070741,0.000000,18.927597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.113256,0.000000,18.927597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<37.070741,0.000000,18.927597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.113256,0.000000,16.827597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,16.757534>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,22.498765,0> translate<38.113256,0.000000,16.827597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.113256,0.000000,17.208400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,17.278462>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,-22.498765,0> translate<38.113256,0.000000,17.208400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.113256,0.000000,18.927597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.337309,0.000000,18.834791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<38.113256,0.000000,18.927597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.279200,0.000000,16.856322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,16.848600>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<38.279200,0.000000,16.856322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.279200,0.000000,17.179675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.279200,0.000000,16.856322>}
box{<0,0,-0.203200><0.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.279200,0.000000,16.856322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.279200,0.000000,17.179675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,17.187397>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-67.486080,0> translate<38.279200,0.000000,17.179675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,16.848600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,16.757534>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.282400,0.000000,16.757534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,17.278462>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,17.187397>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.282400,0.000000,17.187397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.337309,0.000000,18.834791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.341997,0.000000,18.830100>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,45.016121,0> translate<38.337309,0.000000,18.834791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.341997,0.000000,18.830100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.346688,0.000000,18.834791>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.341997,0.000000,18.830100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.346688,0.000000,18.834791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.570741,0.000000,18.927597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<38.346688,0.000000,18.834791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.547466,0.000000,9.226797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.784413,0.000000,9.324941>}
box{<0,0,-0.203200><0.256468,0.035000,0.203200> rotate<0,-22.497925,0> translate<38.547466,0.000000,9.226797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.547466,0.000000,9.226797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.991675,0.000000,9.226797>}
box{<0,0,-0.203200><0.444209,0.035000,0.203200> rotate<0,0.000000,0> translate<38.547466,0.000000,9.226797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.570741,0.000000,18.927597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.613256,0.000000,18.927597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<38.570741,0.000000,18.927597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.784413,0.000000,9.324941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.917872,0.000000,9.458400>}
box{<0,0,-0.203200><0.188740,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.784413,0.000000,9.324941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.806672,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.626000,0.000000,9.347200>}
box{<0,0,-0.203200><3.819328,0.035000,0.203200> rotate<0,0.000000,0> translate<38.806672,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.917872,0.000000,9.458400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.499256,0.000000,9.458400>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,0.000000,0> translate<38.917872,0.000000,9.458400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.991675,0.000000,9.226797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.290413,0.000000,9.103056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<38.991675,0.000000,9.226797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.290413,0.000000,9.103056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.925872,0.000000,7.467597>}
box{<0,0,-0.203200><2.312889,0.035000,0.203200> rotate<0,44.997030,0> translate<39.290413,0.000000,9.103056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.452669,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.626000,0.000000,8.940800>}
box{<0,0,-0.203200><3.173331,0.035000,0.203200> rotate<0,0.000000,0> translate<39.452669,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.499256,0.000000,9.458400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.723309,0.000000,9.551206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<39.499256,0.000000,9.458400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.613256,0.000000,18.927597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.837309,0.000000,18.834791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<39.613256,0.000000,18.927597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.723309,0.000000,9.551206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,9.722688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.723309,0.000000,9.551206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.717300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.904697>}
box{<0,0,-0.203200><0.187397,0.035000,0.203200> rotate<0,90.000000,0> translate<39.790797,0.000000,11.904697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.717300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,11.613309>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<39.790797,0.000000,11.717300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.624294,0.000000,11.785600>}
box{<0,0,-0.203200><2.833497,0.035000,0.203200> rotate<0,0.000000,0> translate<39.790797,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.904697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,12.008688>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<39.790797,0.000000,11.904697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.837309,0.000000,18.834791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.008791,0.000000,18.663309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<39.837309,0.000000,18.834791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.859069,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.784694,0.000000,8.534400>}
box{<0,0,-0.203200><2.925625,0.035000,0.203200> rotate<0,0.000000,0> translate<39.859069,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,9.722688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,9.946741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.894791,0.000000,9.722688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,11.613309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,11.389256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<39.894791,0.000000,11.613309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,12.008688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,12.232741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.894791,0.000000,12.008688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.901597,0.000000,17.221341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.901597,0.000000,17.365494>}
box{<0,0,-0.203200><0.144153,0.035000,0.203200> rotate<0,90.000000,0> translate<39.901597,0.000000,17.365494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.901597,0.000000,17.221341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.928797,0.000000,17.155675>}
box{<0,0,-0.203200><0.071076,0.035000,0.203200> rotate<0,67.495242,0> translate<39.901597,0.000000,17.221341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.901597,0.000000,17.365494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.008791,0.000000,17.472687>}
box{<0,0,-0.203200><0.151595,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.901597,0.000000,17.365494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.907594,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.626000,0.000000,9.753600>}
box{<0,0,-0.203200><2.718406,0.035000,0.203200> rotate<0,0.000000,0> translate<39.907594,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.928797,0.000000,16.643303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.928797,0.000000,17.155675>}
box{<0,0,-0.203200><0.512372,0.035000,0.203200> rotate<0,90.000000,0> translate<39.928797,0.000000,17.155675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.928797,0.000000,16.643303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.008791,0.000000,16.563309>}
box{<0,0,-0.203200><0.113128,0.035000,0.203200> rotate<0,44.997030,0> translate<39.928797,0.000000,16.643303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.928797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.166931,0.000000,16.662400>}
box{<0,0,-0.203200><1.238134,0.035000,0.203200> rotate<0,0.000000,0> translate<39.928797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.928797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.573331,0.000000,17.068800>}
box{<0,0,-0.203200><1.644534,0.035000,0.203200> rotate<0,0.000000,0> translate<39.928797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.970719,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,12.192000>}
box{<0,0,-0.203200><2.507681,0.035000,0.203200> rotate<0,0.000000,0> translate<39.970719,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.977700,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.198931,0.000000,18.694400>}
box{<0,0,-0.203200><3.221231,0.035000,0.203200> rotate<0,0.000000,0> translate<39.977700,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,9.946741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,11.389256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<39.987597,0.000000,11.389256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.520956,0.000000,10.160000>}
box{<0,0,-0.203200><2.533359,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,10.566400>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,10.972800>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.509031,0.000000,11.379200>}
box{<0,0,-0.203200><2.521434,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,12.232741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,13.184125>}
box{<0,0,-0.203200><0.951384,0.035000,0.203200> rotate<0,90.000000,0> translate<39.987597,0.000000,13.184125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,12.598400>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,13.004800>}
box{<0,0,-0.203200><2.490803,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,13.184125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.040672,0.000000,18.237200>}
box{<0,0,-0.203200><7.146127,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.987597,0.000000,13.184125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.008791,0.000000,16.563309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,16.339256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<40.008791,0.000000,16.563309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.008791,0.000000,17.472687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,17.696741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<40.008791,0.000000,17.472687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.008791,0.000000,18.663309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,18.439256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<40.008791,0.000000,18.663309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.009831,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.979731,0.000000,17.475200>}
box{<0,0,-0.203200><1.969900,0.035000,0.203200> rotate<0,0.000000,0> translate<40.009831,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,15.597066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,16.339256>}
box{<0,0,-0.203200><0.742191,0.035000,0.203200> rotate<0,90.000000,0> translate<40.101597,0.000000,16.339256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,15.597066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.014941,0.000000,19.510413>}
box{<0,0,-0.203200><5.534306,0.035000,0.203200> rotate<0,-44.997053,0> translate<40.101597,0.000000,15.597066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.354131,0.000000,15.849600>}
box{<0,0,-0.203200><0.252534,0.035000,0.203200> rotate<0,0.000000,0> translate<40.101597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.760531,0.000000,16.256000>}
box{<0,0,-0.203200><0.658934,0.035000,0.203200> rotate<0,0.000000,0> translate<40.101597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,17.696741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,18.439256>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,90.000000,0> translate<40.101597,0.000000,18.439256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.386131,0.000000,17.881600>}
box{<0,0,-0.203200><2.284534,0.035000,0.203200> rotate<0,0.000000,0> translate<40.101597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.101597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.792531,0.000000,18.288000>}
box{<0,0,-0.203200><2.690934,0.035000,0.203200> rotate<0,0.000000,0> translate<40.101597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.214672,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.653097,0.000000,13.411200>}
box{<0,0,-0.203200><2.438425,0.035000,0.203200> rotate<0,0.000000,0> translate<40.214672,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.265469,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,8.128000>}
box{<0,0,-0.203200><7.264281,0.035000,0.203200> rotate<0,0.000000,0> translate<40.265469,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.621072,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.596750,0.000000,13.817600>}
box{<0,0,-0.203200><1.975678,0.035000,0.203200> rotate<0,0.000000,0> translate<40.621072,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.671869,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,7.721600>}
box{<0,0,-0.203200><6.857881,0.035000,0.203200> rotate<0,0.000000,0> translate<40.671869,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.875066,0.000000,4.724400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.925872,0.000000,4.673597>}
box{<0,0,-0.203200><0.071849,0.035000,0.203200> rotate<0,44.995268,0> translate<40.875066,0.000000,4.724400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.875066,0.000000,4.724400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.716131,0.000000,4.724400>}
box{<0,0,-0.203200><0.841066,0.035000,0.203200> rotate<0,0.000000,0> translate<40.875066,0.000000,4.724400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.925872,0.000000,4.673597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.716131,0.000000,4.673597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<40.925872,0.000000,4.673597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.925872,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.716131,0.000000,7.467597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<40.925872,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.027472,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.578400,0.000000,14.224000>}
box{<0,0,-0.203200><1.550928,0.035000,0.203200> rotate<0,0.000000,0> translate<41.027472,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.433872,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.578400,0.000000,14.630400>}
box{<0,0,-0.203200><1.144528,0.035000,0.203200> rotate<0,0.000000,0> translate<41.433872,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.716131,0.000000,4.673597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,3.870131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<41.716131,0.000000,4.673597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.716131,0.000000,4.724400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,5.527866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.716131,0.000000,4.724400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.716131,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,6.664131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<41.716131,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.840272,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.649938,0.000000,15.036800>}
box{<0,0,-0.203200><0.809666,0.035000,0.203200> rotate<0,0.000000,0> translate<41.840272,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.868528,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.507469,0.000000,7.315200>}
box{<0,0,-0.203200><3.638941,0.035000,0.203200> rotate<0,0.000000,0> translate<41.868528,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.868531,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,0.000000,4.876800>}
box{<0,0,-0.203200><3.445069,0.035000,0.203200> rotate<0,0.000000,0> translate<41.868531,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.919328,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,0.000000,4.470400>}
box{<0,0,-0.203200><3.394272,0.035000,0.203200> rotate<0,0.000000,0> translate<41.919328,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.970125,0.000000,2.184397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,2.733866>}
box{<0,0,-0.203200><0.777068,0.035000,0.203200> rotate<0,-44.996867,0> translate<41.970125,0.000000,2.184397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.970125,0.000000,2.184397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.579241,0.000000,2.184397>}
box{<0,0,-0.203200><2.609116,0.035000,0.203200> rotate<0,0.000000,0> translate<41.970125,0.000000,2.184397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.224128,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.833244,0.000000,2.438400>}
box{<0,0,-0.203200><2.609116,0.035000,0.203200> rotate<0,0.000000,0> translate<42.224128,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.246672,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.115934,0.000000,15.443200>}
box{<0,0,-0.203200><0.869262,0.035000,0.203200> rotate<0,0.000000,0> translate<42.246672,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.274928,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.101069,0.000000,6.908800>}
box{<0,0,-0.203200><2.826141,0.035000,0.203200> rotate<0,0.000000,0> translate<42.274928,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.274931,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.101066,0.000000,5.283200>}
box{<0,0,-0.203200><2.826134,0.035000,0.203200> rotate<0,0.000000,0> translate<42.274931,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,20.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.385206,0.000000,20.148688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.292400,0.000000,20.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,22.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,20.372741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,20.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,22.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,22.193997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.292400,0.000000,22.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,22.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,22.193997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.292400,0.000000,22.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,22.372741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,22.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,24.193997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.292400,0.000000,24.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,24.193997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.292400,0.000000,24.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.372741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,24.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,26.193997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.292400,0.000000,26.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,26.193997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.292400,0.000000,26.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,28.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.372741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,26.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,28.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,28.193997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.292400,0.000000,28.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,28.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,28.193997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.292400,0.000000,28.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,30.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,28.372741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,28.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,30.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,30.193997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.292400,0.000000,30.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,30.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,30.193997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.292400,0.000000,30.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,32.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,30.372741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,30.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,32.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,32.193997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.292400,0.000000,32.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,32.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,32.193997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.292400,0.000000,32.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,34.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,32.372741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,32.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,34.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,34.193997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<42.292400,0.000000,34.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,34.372741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,34.193997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<42.292400,0.000000,34.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,36.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,34.372741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,34.372741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,36.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.385206,0.000000,36.239309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<42.292400,0.000000,36.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.325728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.050272,0.000000,4.064000>}
box{<0,0,-0.203200><2.724544,0.035000,0.203200> rotate<0,0.000000,0> translate<42.325728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.385206,0.000000,20.148688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.556688,0.000000,19.977206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<42.385206,0.000000,20.148688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.385206,0.000000,36.239309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.556688,0.000000,36.410791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.385206,0.000000,36.239309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,10.262741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571206,0.000000,10.038687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.478400,0.000000,10.262741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,11.305256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,10.262741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.478400,0.000000,10.262741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,11.305256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571206,0.000000,11.529309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<42.478400,0.000000,11.305256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,12.062741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571206,0.000000,11.838688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.478400,0.000000,12.062741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,13.105256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,12.062741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.478400,0.000000,12.062741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.478400,0.000000,13.105256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571206,0.000000,13.329309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<42.478400,0.000000,13.105256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,2.733866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,3.870131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<42.519597,0.000000,3.870131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.519597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,3.251200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.519597,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,3.657600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.519597,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,5.527866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,6.664131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<42.519597,0.000000,6.664131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,5.689600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.519597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,6.096000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.519597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.519597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,6.502400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<42.519597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.556688,0.000000,19.977206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.780741,0.000000,19.884400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<42.556688,0.000000,19.977206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.556688,0.000000,36.410791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.780741,0.000000,36.503597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<42.556688,0.000000,36.410791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571206,0.000000,10.038687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.629587,0.000000,9.980309>}
box{<0,0,-0.203200><0.082561,0.035000,0.203200> rotate<0,44.995497,0> translate<42.571206,0.000000,10.038687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571206,0.000000,11.529309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.725897,0.000000,11.683997>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,-44.996451,0> translate<42.571206,0.000000,11.529309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571206,0.000000,11.838688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.725897,0.000000,11.683997>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,44.997030,0> translate<42.571206,0.000000,11.838688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571206,0.000000,13.329309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.742688,0.000000,13.500791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.571206,0.000000,13.329309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.578400,0.000000,13.861903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.694041,0.000000,13.582719>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,67.495778,0> translate<42.578400,0.000000,13.861903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.578400,0.000000,14.864094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.578400,0.000000,13.861903>}
box{<0,0,-0.203200><1.002191,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.578400,0.000000,13.861903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.578400,0.000000,14.864094>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.694041,0.000000,15.143278>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,-67.495778,0> translate<42.578400,0.000000,14.864094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.626000,0.000000,8.824341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.718806,0.000000,8.600288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<42.626000,0.000000,8.824341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.626000,0.000000,9.971656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.626000,0.000000,8.824341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.626000,0.000000,8.824341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.626000,0.000000,9.971656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.629587,0.000000,9.980309>}
box{<0,0,-0.203200><0.009367,0.035000,0.203200> rotate<0,-67.477134,0> translate<42.626000,0.000000,9.971656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.653072,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,15.849600>}
box{<0,0,-0.203200><6.809328,0.035000,0.203200> rotate<0,0.000000,0> translate<42.653072,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.694041,0.000000,13.582719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.766225,0.000000,13.510537>}
box{<0,0,-0.203200><0.102082,0.035000,0.203200> rotate<0,44.995790,0> translate<42.694041,0.000000,13.582719> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.694041,0.000000,15.143278>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.907719,0.000000,15.356956>}
box{<0,0,-0.203200><0.302187,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.694041,0.000000,15.143278> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.718806,0.000000,8.600288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.890287,0.000000,8.428806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<42.718806,0.000000,8.600288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.742688,0.000000,13.500791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.766225,0.000000,13.510537>}
box{<0,0,-0.203200><0.025476,0.035000,0.203200> rotate<0,-22.492954,0> translate<42.742688,0.000000,13.500791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.780741,0.000000,19.884400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.420931,0.000000,19.884400>}
box{<0,0,-0.203200><3.640191,0.035000,0.203200> rotate<0,0.000000,0> translate<42.780741,0.000000,19.884400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.780741,0.000000,36.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.023256,0.000000,36.503597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<42.780741,0.000000,36.503597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.890287,0.000000,8.428806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.114341,0.000000,8.336000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<42.890287,0.000000,8.428806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.907719,0.000000,15.356956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.186903,0.000000,15.472597>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,-22.498282,0> translate<42.907719,0.000000,15.356956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.059472,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,16.256000>}
box{<0,0,-0.203200><6.402928,0.035000,0.203200> rotate<0,0.000000,0> translate<43.059472,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.114341,0.000000,8.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.261656,0.000000,8.336000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<43.114341,0.000000,8.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.186903,0.000000,15.472597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.189094,0.000000,15.472597>}
box{<0,0,-0.203200><1.002191,0.035000,0.203200> rotate<0,0.000000,0> translate<43.186903,0.000000,15.472597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.465872,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,16.662400>}
box{<0,0,-0.203200><5.996528,0.035000,0.203200> rotate<0,0.000000,0> translate<43.465872,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.872272,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.546713,0.000000,17.068800>}
box{<0,0,-0.203200><5.674441,0.035000,0.203200> rotate<0,0.000000,0> translate<43.872272,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.014941,0.000000,19.510413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.243584,0.000000,19.739056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.014941,0.000000,19.510413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.189094,0.000000,15.472597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.468278,0.000000,15.356956>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,22.498282,0> translate<44.189094,0.000000,15.472597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.243584,0.000000,19.739056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.542322,0.000000,19.862797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<44.243584,0.000000,19.739056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.260066,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,15.443200>}
box{<0,0,-0.203200><5.202334,0.035000,0.203200> rotate<0,0.000000,0> translate<44.260066,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.261656,0.000000,8.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.485709,0.000000,8.428806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<44.261656,0.000000,8.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.278672,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,17.475200>}
box{<0,0,-0.203200><6.608528,0.035000,0.203200> rotate<0,0.000000,0> translate<44.278672,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.468278,0.000000,15.356956>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.681956,0.000000,15.143278>}
box{<0,0,-0.203200><0.302187,0.035000,0.203200> rotate<0,44.997030,0> translate<44.468278,0.000000,15.356956> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.485709,0.000000,8.428806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.657191,0.000000,8.600288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.485709,0.000000,8.428806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.542322,0.000000,19.862797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.399325,0.000000,19.862797>}
box{<0,0,-0.203200><1.857003,0.035000,0.203200> rotate<0,0.000000,0> translate<44.542322,0.000000,19.862797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.579241,0.000000,2.184397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.992556,0.000000,2.597713>}
box{<0,0,-0.203200><0.584517,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.579241,0.000000,2.184397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.591303,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,8.534400>}
box{<0,0,-0.203200><2.938447,0.035000,0.203200> rotate<0,0.000000,0> translate<44.591303,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.609772,0.000000,13.510537>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.633309,0.000000,13.500791>}
box{<0,0,-0.203200><0.025476,0.035000,0.203200> rotate<0,22.492954,0> translate<44.609772,0.000000,13.510537> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.609772,0.000000,13.510537>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.681956,0.000000,13.582719>}
box{<0,0,-0.203200><0.102082,0.035000,0.203200> rotate<0,-44.995790,0> translate<44.609772,0.000000,13.510537> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.633309,0.000000,13.500791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.804791,0.000000,13.329309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<44.633309,0.000000,13.500791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.650100,0.000000,11.683997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.804791,0.000000,11.529309>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.996451,0> translate<44.650100,0.000000,11.683997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.650100,0.000000,11.683997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.804791,0.000000,11.838688>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.650100,0.000000,11.683997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.657191,0.000000,8.600288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.749997,0.000000,8.824341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<44.657191,0.000000,8.600288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.681956,0.000000,13.582719>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.797597,0.000000,13.861903>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,-67.495778,0> translate<44.681956,0.000000,13.582719> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.681956,0.000000,15.143278>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.797597,0.000000,14.864094>}
box{<0,0,-0.203200><0.302186,0.035000,0.203200> rotate<0,67.495778,0> translate<44.681956,0.000000,15.143278> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.685072,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,17.881600>}
box{<0,0,-0.203200><6.202128,0.035000,0.203200> rotate<0,0.000000,0> translate<44.685072,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.722900,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,13.411200>}
box{<0,0,-0.203200><15.754500,0.035000,0.203200> rotate<0,0.000000,0> translate<44.722900,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.726063,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,15.036800>}
box{<0,0,-0.203200><4.736337,0.035000,0.203200> rotate<0,0.000000,0> translate<44.726063,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.746409,0.000000,9.980309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.749997,0.000000,9.971656>}
box{<0,0,-0.203200><0.009367,0.035000,0.203200> rotate<0,67.477134,0> translate<44.746409,0.000000,9.980309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.746409,0.000000,9.980309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.804791,0.000000,10.038687>}
box{<0,0,-0.203200><0.082561,0.035000,0.203200> rotate<0,-44.995497,0> translate<44.746409,0.000000,9.980309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.749997,0.000000,8.824341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.749997,0.000000,9.971656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<44.749997,0.000000,9.971656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.749997,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,8.940800>}
box{<0,0,-0.203200><2.779753,0.035000,0.203200> rotate<0,0.000000,0> translate<44.749997,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.749997,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.666422,0.000000,9.347200>}
box{<0,0,-0.203200><2.916425,0.035000,0.203200> rotate<0,0.000000,0> translate<44.749997,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.749997,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.072822,0.000000,9.753600>}
box{<0,0,-0.203200><3.322825,0.035000,0.203200> rotate<0,0.000000,0> translate<44.749997,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.751703,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,11.785600>}
box{<0,0,-0.203200><20.170697,0.035000,0.203200> rotate<0,0.000000,0> translate<44.751703,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.779244,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.636294,0.000000,13.817600>}
box{<0,0,-0.203200><4.857050,0.035000,0.203200> rotate<0,0.000000,0> translate<44.779244,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.797597,0.000000,13.861903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.797597,0.000000,14.864094>}
box{<0,0,-0.203200><1.002191,0.035000,0.203200> rotate<0,90.000000,0> translate<44.797597,0.000000,14.864094> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.797597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,14.224000>}
box{<0,0,-0.203200><4.664803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.797597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.797597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,14.630400>}
box{<0,0,-0.203200><4.664803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.797597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.804791,0.000000,10.038687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,10.262741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<44.804791,0.000000,10.038687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.804791,0.000000,11.529309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,11.305256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<44.804791,0.000000,11.529309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.804791,0.000000,11.838688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,12.062741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<44.804791,0.000000,11.838688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.804791,0.000000,13.329309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,13.105256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<44.804791,0.000000,13.329309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.855038,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.479222,0.000000,10.160000>}
box{<0,0,-0.203200><3.624184,0.035000,0.203200> rotate<0,0.000000,0> translate<44.855038,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,2.733866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.992556,0.000000,2.597713>}
box{<0,0,-0.203200><0.192552,0.035000,0.203200> rotate<0,44.996373,0> translate<44.856400,0.000000,2.733866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,3.870131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,2.733866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.856400,0.000000,2.733866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,3.870131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,0.000000,4.327328>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<44.856400,0.000000,3.870131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,5.527866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,0.000000,5.070669>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<44.856400,0.000000,5.527866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,6.664131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,5.527866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.856400,0.000000,5.527866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.856400,0.000000,6.664131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.659866,0.000000,7.467597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.856400,0.000000,6.664131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.866969,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,11.379200>}
box{<0,0,-0.203200><20.055431,0.035000,0.203200> rotate<0,0.000000,0> translate<44.866969,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,10.262741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,11.305256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<44.897597,0.000000,11.305256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,10.566400>}
box{<0,0,-0.203200><20.024803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.897597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,10.972800>}
box{<0,0,-0.203200><20.024803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.897597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,12.062741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,13.105256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<44.897597,0.000000,13.105256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,12.192000>}
box{<0,0,-0.203200><20.024803,0.035000,0.203200> rotate<0,0.000000,0> translate<44.897597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.178259,0.000000,12.598400>}
box{<0,0,-0.203200><16.280662,0.035000,0.203200> rotate<0,0.000000,0> translate<44.897597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.897597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.771859,0.000000,13.004800>}
box{<0,0,-0.203200><15.874263,0.035000,0.203200> rotate<0,0.000000,0> translate<44.897597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.040672,0.000000,18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.897675,0.000000,18.237200>}
box{<0,0,-0.203200><1.857003,0.035000,0.203200> rotate<0,0.000000,0> translate<45.040672,0.000000,18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,0.000000,5.070669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,0.000000,4.327328>}
box{<0,0,-0.203200><0.743341,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.313600,0.000000,4.327328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.659866,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.796131,0.000000,7.467597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<45.659866,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.844750,0.000000,0.863597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.003188,0.000000,2.022031>}
box{<0,0,-0.203200><1.638276,0.035000,0.203200> rotate<0,-44.996953,0> translate<45.844750,0.000000,0.863597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.844750,0.000000,0.863597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.844584,0.000000,0.863597>}
box{<0,0,-0.203200><15.999834,0.035000,0.203200> rotate<0,0.000000,0> translate<45.844750,0.000000,0.863597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.200353,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.697284,0.000000,1.219200>}
box{<0,0,-0.203200><15.496931,0.035000,0.203200> rotate<0,0.000000,0> translate<46.200353,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.399325,0.000000,19.862797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.420931,0.000000,19.884400>}
box{<0,0,-0.203200><0.030554,0.035000,0.203200> rotate<0,-44.992887,0> translate<46.399325,0.000000,19.862797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.606753,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,1.625600>}
box{<0,0,-0.203200><14.936047,0.035000,0.203200> rotate<0,0.000000,0> translate<46.606753,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.796131,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,6.664131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<46.796131,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.897675,0.000000,18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.196413,0.000000,18.360941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<46.897675,0.000000,18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.948528,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.768019,0.000000,7.315200>}
box{<0,0,-0.203200><0.819491,0.035000,0.203200> rotate<0,0.000000,0> translate<46.948528,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.003188,0.000000,2.022031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.084803,0.000000,2.219075>}
box{<0,0,-0.203200><0.213278,0.035000,0.203200> rotate<0,-67.496183,0> translate<47.003188,0.000000,2.022031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.007316,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,2.032000>}
box{<0,0,-0.203200><14.535484,0.035000,0.203200> rotate<0,0.000000,0> translate<47.007316,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.020316,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,18.288000>}
box{<0,0,-0.203200><3.866884,0.035000,0.203200> rotate<0,0.000000,0> translate<47.020316,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.023256,0.000000,36.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.247309,0.000000,36.410791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<47.023256,0.000000,36.503597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.084803,0.000000,2.219075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,2.733866>}
box{<0,0,-0.203200><0.728026,0.035000,0.203200> rotate<0,-44.996856,0> translate<47.084803,0.000000,2.219075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142397,0.000000,4.327328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142397,0.000000,5.070669>}
box{<0,0,-0.203200><0.743341,0.035000,0.203200> rotate<0,90.000000,0> translate<47.142397,0.000000,5.070669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142397,0.000000,4.327328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,3.870131>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<47.142397,0.000000,4.327328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142397,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,4.470400>}
box{<0,0,-0.203200><17.780003,0.035000,0.203200> rotate<0,0.000000,0> translate<47.142397,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,4.876800>}
box{<0,0,-0.203200><17.780003,0.035000,0.203200> rotate<0,0.000000,0> translate<47.142397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.142397,0.000000,5.070669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,5.527866>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<47.142397,0.000000,5.070669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.196413,0.000000,18.360941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.425056,0.000000,18.589584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.196413,0.000000,18.360941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.247309,0.000000,36.410791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.418791,0.000000,36.239309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<47.247309,0.000000,36.410791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.304128,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,2.438400>}
box{<0,0,-0.203200><14.238672,0.035000,0.203200> rotate<0,0.000000,0> translate<47.304128,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.354928,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,5.283200>}
box{<0,0,-0.203200><17.567472,0.035000,0.203200> rotate<0,0.000000,0> translate<47.354928,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.354928,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.174419,0.000000,6.908800>}
box{<0,0,-0.203200><0.819491,0.035000,0.203200> rotate<0,0.000000,0> translate<47.354928,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.405728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.881544,0.000000,4.064000>}
box{<0,0,-0.203200><15.475816,0.035000,0.203200> rotate<0,0.000000,0> translate<47.405728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.418791,0.000000,36.239309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.511597,0.000000,36.015256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<47.418791,0.000000,36.239309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.425056,0.000000,18.589584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.531562,0.000000,21.696091>}
box{<0,0,-0.203200><4.393263,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.425056,0.000000,18.589584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.447666,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.169600>}
box{<0,0,-0.203200><2.270734,0.035000,0.203200> rotate<0,0.000000,0> translate<47.447666,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.511597,0.000000,36.006797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.511597,0.000000,36.015256>}
box{<0,0,-0.203200><0.008459,0.035000,0.203200> rotate<0,90.000000,0> translate<47.511597,0.000000,36.015256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.511597,0.000000,36.006797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.006797>}
box{<0,0,-0.203200><2.206803,0.035000,0.203200> rotate<0,0.000000,0> translate<47.511597,0.000000,36.006797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<47.529750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.529750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.529750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529872,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.749359,0.000000,18.694400>}
box{<0,0,-0.203200><3.219487,0.035000,0.203200> rotate<0,0.000000,0> translate<47.529872,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,2.733866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,3.870131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<47.599597,0.000000,3.870131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.697288,0.000000,2.844800>}
box{<0,0,-0.203200><14.097691,0.035000,0.203200> rotate<0,0.000000,0> translate<47.599597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.865625,0.000000,3.251200>}
box{<0,0,-0.203200><14.266028,0.035000,0.203200> rotate<0,0.000000,0> translate<47.599597,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.252491,0.000000,3.657600>}
box{<0,0,-0.203200><14.652894,0.035000,0.203200> rotate<0,0.000000,0> translate<47.599597,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,5.527866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,6.664131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<47.599597,0.000000,6.664131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,5.689600>}
box{<0,0,-0.203200><17.322803,0.035000,0.203200> rotate<0,0.000000,0> translate<47.599597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,6.096000>}
box{<0,0,-0.203200><17.322803,0.035000,0.203200> rotate<0,0.000000,0> translate<47.599597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.580819,0.000000,6.502400>}
box{<0,0,-0.203200><0.981222,0.035000,0.203200> rotate<0,0.000000,0> translate<47.599597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.936272,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,19.100800>}
box{<0,0,-0.203200><2.754128,0.035000,0.203200> rotate<0,0.000000,0> translate<47.936272,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.342672,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,19.507200>}
box{<0,0,-0.203200><2.347728,0.035000,0.203200> rotate<0,0.000000,0> translate<48.342672,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.358528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<48.701469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.358528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<48.701469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.749072,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,19.913600>}
box{<0,0,-0.203200><1.941328,0.035000,0.203200> rotate<0,0.000000,0> translate<48.749072,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.155472,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.707278,0.000000,20.320000>}
box{<0,0,-0.203200><1.551806,0.035000,0.203200> rotate<0,0.000000,0> translate<49.155472,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,14.122741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.555206,0.000000,13.898688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<49.462400,0.000000,14.122741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,16.865256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,14.122741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.462400,0.000000,14.122741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,16.865256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.555206,0.000000,17.089309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<49.462400,0.000000,16.865256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.555206,0.000000,13.898688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.726688,0.000000,13.727206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<49.555206,0.000000,13.898688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.555206,0.000000,17.089309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.726688,0.000000,17.260791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.555206,0.000000,17.089309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.561872,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,20.726400>}
box{<0,0,-0.203200><1.325328,0.035000,0.203200> rotate<0,0.000000,0> translate<49.561872,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.931256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.006797>}
box{<0,0,-0.203200><0.924459,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.718400,0.000000,36.006797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.931256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.811206,0.000000,37.155309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<49.718400,0.000000,36.931256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.726688,0.000000,13.727206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.950741,0.000000,13.634400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<49.726688,0.000000,13.727206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.726688,0.000000,17.260791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.950741,0.000000,17.353597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.726688,0.000000,17.260791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.811206,0.000000,37.155309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.982688,0.000000,37.326791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.811206,0.000000,37.155309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.950741,0.000000,13.634400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393256,0.000000,13.634400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<49.950741,0.000000,13.634400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.950741,0.000000,17.353597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,17.353597>}
box{<0,0,-0.203200><0.936459,0.035000,0.203200> rotate<0,0.000000,0> translate<49.950741,0.000000,17.353597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.968272,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.132800>}
box{<0,0,-0.203200><0.918928,0.035000,0.203200> rotate<0,0.000000,0> translate<49.968272,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.982688,0.000000,37.326791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.206741,0.000000,37.419597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.982688,0.000000,37.326791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.206741,0.000000,37.419597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649256,0.000000,37.419597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<50.206741,0.000000,37.419597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.358528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.358528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.358528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<50.358528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.374672,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.539200>}
box{<0,0,-0.203200><0.512528,0.035000,0.203200> rotate<0,0.000000,0> translate<50.374672,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.479178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692819,0.000000,6.502400>}
box{<0,0,-0.203200><5.213641,0.035000,0.203200> rotate<0,0.000000,0> translate<50.479178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.531562,0.000000,21.696091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.645309,0.000000,21.743206>}
box{<0,0,-0.203200><0.123119,0.035000,0.203200> rotate<0,-22.498570,0> translate<50.531562,0.000000,21.696091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.580775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.591222,0.000000,10.160000>}
box{<0,0,-0.203200><5.010447,0.035000,0.203200> rotate<0,0.000000,0> translate<50.580775,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.645309,0.000000,21.743206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,21.897897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.645309,0.000000,21.743206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,18.836741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783206,0.000000,18.612687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<50.690400,0.000000,18.836741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,20.279256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,18.836741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.690400,0.000000,18.836741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,20.279256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783206,0.000000,20.503309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.690400,0.000000,20.279256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783206,0.000000,18.612687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,18.508697>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<50.783206,0.000000,18.612687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783206,0.000000,20.503309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,20.607300>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<50.783206,0.000000,20.503309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,21.897897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.810697>}
box{<0,0,-0.203200><0.123319,0.035000,0.203200> rotate<0,44.997030,0> translate<50.800000,0.000000,21.897897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.850797,0.000000,23.872897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.850797,0.000000,24.047325>}
box{<0,0,-0.203200><0.174428,0.035000,0.203200> rotate<0,90.000000,0> translate<50.850797,0.000000,24.047325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.850797,0.000000,23.872897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.954688,0.000000,23.976791>}
box{<0,0,-0.203200><0.146926,0.035000,0.203200> rotate<0,-44.997892,0> translate<50.850797,0.000000,23.872897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.850797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.956644,0.000000,23.977600>}
box{<0,0,-0.203200><0.105847,0.035000,0.203200> rotate<0,0.000000,0> translate<50.850797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.850797,0.000000,24.047325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.875056,0.000000,26.071584>}
box{<0,0,-0.203200><2.862735,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.850797,0.000000,24.047325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.885578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.286419,0.000000,6.908800>}
box{<0,0,-0.203200><4.400841,0.035000,0.203200> rotate<0,0.000000,0> translate<50.885578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,18.508697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,17.353597>}
box{<0,0,-0.203200><1.155100,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.887200,0.000000,17.353597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.810697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,20.607300>}
box{<0,0,-0.203200><1.203397,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.887200,0.000000,20.607300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.954688,0.000000,23.976791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.178741,0.000000,24.069597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<50.954688,0.000000,23.976791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.987175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.184822,0.000000,9.753600>}
box{<0,0,-0.203200><4.197647,0.035000,0.203200> rotate<0,0.000000,0> translate<50.987175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.178741,0.000000,24.069597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.221256,0.000000,24.069597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<51.178741,0.000000,24.069597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.187472,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.830528,0.000000,24.384000>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<51.187472,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.291978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.880019,0.000000,7.315200>}
box{<0,0,-0.203200><3.588041,0.035000,0.203200> rotate<0,0.000000,0> translate<51.291978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393256,0.000000,13.634400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.617309,0.000000,13.727206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<51.393256,0.000000,13.634400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.778422,0.000000,9.347200>}
box{<0,0,-0.203200><3.384847,0.035000,0.203200> rotate<0,0.000000,0> translate<51.393575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<51.530247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,7.721600>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.530247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,8.128000>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.530247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,8.534400>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.530247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,8.940800>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.530247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.593872,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.236928,0.000000,24.790400>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<51.593872,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.617309,0.000000,13.727206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.788791,0.000000,13.898688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.617309,0.000000,13.727206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649256,0.000000,37.419597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.873309,0.000000,37.326791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<51.649256,0.000000,37.419597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.707703,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,13.817600>}
box{<0,0,-0.203200><8.769697,0.035000,0.203200> rotate<0,0.000000,0> translate<51.707703,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.723606,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.549991,0.000000,37.388800>}
box{<0,0,-0.203200><9.826384,0.035000,0.203200> rotate<0,0.000000,0> translate<51.723606,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.788791,0.000000,13.898688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,14.122741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<51.788791,0.000000,13.898688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.873309,0.000000,37.326791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.044791,0.000000,37.155309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<51.873309,0.000000,37.326791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,14.122741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,15.554125>}
box{<0,0,-0.203200><1.431384,0.035000,0.203200> rotate<0,90.000000,0> translate<51.881597,0.000000,15.554125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.680956,0.000000,14.224000>}
box{<0,0,-0.203200><0.799359,0.035000,0.203200> rotate<0,0.000000,0> translate<51.881597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,14.630400>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<51.881597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,15.036800>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<51.881597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.669031,0.000000,15.443200>}
box{<0,0,-0.203200><0.787434,0.035000,0.203200> rotate<0,0.000000,0> translate<51.881597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,15.554125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.389056,0.000000,16.061584>}
box{<0,0,-0.203200><0.717656,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.881597,0.000000,15.554125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.000272,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.643328,0.000000,25.196800>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<52.000272,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.044791,0.000000,37.155309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.931256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.044791,0.000000,37.155309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.116413,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.718325,0.000000,36.982400>}
box{<0,0,-0.203200><9.601912,0.035000,0.203200> rotate<0,0.000000,0> translate<52.116413,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,35.499872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.931256>}
box{<0,0,-0.203200><1.431384,0.035000,0.203200> rotate<0,90.000000,0> translate<52.137597,0.000000,36.931256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,35.499872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.875056,0.000000,34.762413>}
box{<0,0,-0.203200><1.042925,0.035000,0.203200> rotate<0,44.997030,0> translate<52.137597,0.000000,35.499872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.004175,0.000000,35.763200>}
box{<0,0,-0.203200><10.866578,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.303288,0.000000,36.169600>}
box{<0,0,-0.203200><10.165691,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.896888,0.000000,36.576000>}
box{<0,0,-0.203200><9.759291,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.177072,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.784294,0.000000,15.849600>}
box{<0,0,-0.203200><0.607222,0.035000,0.203200> rotate<0,0.000000,0> translate<52.177072,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.221256,0.000000,24.069597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.232841,0.000000,24.064797>}
box{<0,0,-0.203200><0.012539,0.035000,0.203200> rotate<0,22.505247,0> translate<52.221256,0.000000,24.069597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.232841,0.000000,24.064797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.798697,0.000000,24.064797>}
box{<0,0,-0.203200><0.565856,0.035000,0.203200> rotate<0,0.000000,0> translate<52.232841,0.000000,24.064797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.280669,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,35.356800>}
box{<0,0,-0.203200><12.641731,0.035000,0.203200> rotate<0,0.000000,0> translate<52.280669,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.389056,0.000000,16.061584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,16.360322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<52.389056,0.000000,16.061584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.406672,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.049728,0.000000,25.603200>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<52.406672,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.469584,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,16.256000>}
box{<0,0,-0.203200><0.168816,0.035000,0.203200> rotate<0,0.000000,0> translate<52.469584,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,16.360322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,18.508697>}
box{<0,0,-0.203200><2.148375,0.035000,0.203200> rotate<0,90.000000,0> translate<52.512797,0.000000,18.508697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,16.662400>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,17.068800>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.813097,0.000000,17.475200>}
box{<0,0,-0.203200><0.300300,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,17.881600>}
box{<0,0,-0.203200><0.522403,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,18.288000>}
box{<0,0,-0.203200><0.522403,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,18.508697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.616791,0.000000,18.612687>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<52.512797,0.000000,18.508697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,20.607300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,21.810697>}
box{<0,0,-0.203200><1.203397,0.035000,0.203200> rotate<0,90.000000,0> translate<52.512797,0.000000,21.810697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,20.607300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.616791,0.000000,20.503309>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<52.512797,0.000000,20.607300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.723041,0.000000,20.726400>}
box{<0,0,-0.203200><0.210244,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,21.132800>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,21.539200>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,21.810697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.616791,0.000000,21.914687>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<52.512797,0.000000,21.810697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.616791,0.000000,18.612687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,18.836741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<52.616791,0.000000,18.612687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.616791,0.000000,20.503309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,20.279256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.616791,0.000000,20.503309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.616791,0.000000,21.914687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,21.966866>}
box{<0,0,-0.203200><0.056476,0.035000,0.203200> rotate<0,-67.498837,0> translate<52.616791,0.000000,21.914687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.629591,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,21.945600>}
box{<0,0,-0.203200><0.008809,0.035000,0.203200> rotate<0,0.000000,0> translate<52.629591,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,14.326741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,14.102688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.638400,0.000000,14.326741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,15.369256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,14.326741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.638400,0.000000,14.326741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,15.369256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,15.593309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<52.638400,0.000000,15.369256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,16.126741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,15.902688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.638400,0.000000,16.126741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,17.169256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,16.126741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.638400,0.000000,16.126741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,17.169256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,17.393309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<52.638400,0.000000,17.169256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,20.930741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,20.706688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.638400,0.000000,20.930741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,21.966866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.638400,0.000000,20.930741>}
box{<0,0,-0.203200><1.036125,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.638400,0.000000,20.930741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.650634,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,18.694400>}
box{<0,0,-0.203200><0.384566,0.035000,0.203200> rotate<0,0.000000,0> translate<52.650634,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.687069,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,34.950400>}
box{<0,0,-0.203200><12.235331,0.035000,0.203200> rotate<0,0.000000,0> translate<52.687069,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.692722,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,20.320000>}
box{<0,0,-0.203200><0.342478,0.035000,0.203200> rotate<0,0.000000,0> translate<52.692722,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,18.836741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,20.279256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<52.709597,0.000000,20.279256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,19.100800>}
box{<0,0,-0.203200><0.325603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.709597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,19.507200>}
box{<0,0,-0.203200><0.325603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.709597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,19.913600>}
box{<0,0,-0.203200><0.325603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.709597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,14.102688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,13.931206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<52.731206,0.000000,14.102688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,15.593309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.885897,0.000000,15.747997>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,-44.996451,0> translate<52.731206,0.000000,15.593309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,15.902688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.885897,0.000000,15.747997>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,44.997030,0> translate<52.731206,0.000000,15.902688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,17.393309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,17.564791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.731206,0.000000,17.393309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,20.706688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,20.535206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<52.731206,0.000000,20.706688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.798697,0.000000,24.064797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,24.168791>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.997891,0> translate<52.798697,0.000000,24.064797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.813072,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.456128,0.000000,26.009600>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<52.813072,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.875056,0.000000,26.071584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,26.370322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<52.875056,0.000000,26.071584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.875056,0.000000,34.762413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,34.463675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<52.875056,0.000000,34.762413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,13.931206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.126741,0.000000,13.838400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<52.902688,0.000000,13.931206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,17.564791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,17.619678>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,-22.498155,0> translate<52.902688,0.000000,17.564791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,20.535206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,20.480319>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,22.498155,0> translate<52.902688,0.000000,20.535206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,24.168791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.126741,0.000000,24.261597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<52.902688,0.000000,24.168791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.965528,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,34.544000>}
box{<0,0,-0.203200><11.956872,0.035000,0.203200> rotate<0,0.000000,0> translate<52.965528,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,26.370322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,31.208694>}
box{<0,0,-0.203200><4.838372,0.035000,0.203200> rotate<0,90.000000,0> translate<52.998797,0.000000,31.208694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.862528,0.000000,26.416000>}
box{<0,0,-0.203200><2.863731,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.268928,0.000000,26.822400>}
box{<0,0,-0.203200><3.270131,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.675328,0.000000,27.228800>}
box{<0,0,-0.203200><3.676531,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.771863,0.000000,27.635200>}
box{<0,0,-0.203200><7.773066,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.178263,0.000000,28.041600>}
box{<0,0,-0.203200><8.179466,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,28.448000>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,28.854400>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,29.260800>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.642019,0.000000,29.667200>}
box{<0,0,-0.203200><2.643222,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.235619,0.000000,30.073600>}
box{<0,0,-0.203200><2.236822,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.829219,0.000000,30.480000>}
box{<0,0,-0.203200><1.830422,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,30.886400>}
box{<0,0,-0.203200><1.642953,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,31.208694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102791,0.000000,31.312688>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.998797,0.000000,31.208694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,33.307303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,34.463675>}
box{<0,0,-0.203200><1.156372,0.035000,0.203200> rotate<0,90.000000,0> translate<52.998797,0.000000,34.463675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,33.307303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102791,0.000000,33.203309>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,44.997030,0> translate<52.998797,0.000000,33.307303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.642022,0.000000,33.324800>}
box{<0,0,-0.203200><2.643225,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,33.731200>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,34.137600>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,20.480319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,17.619678>}
box{<0,0,-0.203200><2.860641,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.035200,0.000000,17.619678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.082903,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,31.292800>}
box{<0,0,-0.203200><1.558847,0.035000,0.203200> rotate<0,0.000000,0> translate<53.082903,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102791,0.000000,31.312688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,31.536741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<53.102791,0.000000,31.312688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102791,0.000000,33.203309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,32.979256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<53.102791,0.000000,33.203309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.126741,0.000000,13.838400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.569256,0.000000,13.838400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<53.126741,0.000000,13.838400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.126741,0.000000,24.261597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.708125,0.000000,24.261597>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,0.000000,0> translate<53.126741,0.000000,24.261597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,31.536741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,32.979256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<53.195597,0.000000,32.979256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,31.699200>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<53.195597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,32.105600>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<53.195597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.829222,0.000000,32.512000>}
box{<0,0,-0.203200><1.633625,0.035000,0.203200> rotate<0,0.000000,0> translate<53.195597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.235622,0.000000,32.918400>}
box{<0,0,-0.203200><2.040025,0.035000,0.203200> rotate<0,0.000000,0> translate<53.195597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.708125,0.000000,24.261597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.626941,0.000000,27.180413>}
box{<0,0,-0.203200><4.127829,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.708125,0.000000,24.261597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.569256,0.000000,13.838400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.793309,0.000000,13.931206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<54.569256,0.000000,13.838400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<54.641750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.641750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.641750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,30.667469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,29.495750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<54.641750,0.000000,30.667469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,32.324528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,30.667469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.641750,0.000000,30.667469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,32.324528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,33.496247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.641750,0.000000,32.324528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,17.619678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,20.480319>}
box{<0,0,-0.203200><2.860641,0.035000,0.203200> rotate<0,90.000000,0> translate<54.660797,0.000000,20.480319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,17.619678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.793309,0.000000,17.564791>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,22.498155,0> translate<54.660797,0.000000,17.619678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,17.881600>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<54.660797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,18.288000>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<54.660797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,18.694400>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<54.660797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,19.100800>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<54.660797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,19.507200>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<54.660797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,19.913600>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<54.660797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,20.320000>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<54.660797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.660797,0.000000,20.480319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.793309,0.000000,20.535206>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,-22.498155,0> translate<54.660797,0.000000,20.480319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.793309,0.000000,13.931206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.897300,0.000000,14.035200>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.997891,0> translate<54.793309,0.000000,13.931206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.793309,0.000000,17.564791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,17.393309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<54.793309,0.000000,17.564791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.793309,0.000000,20.535206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,20.706688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.793309,0.000000,20.535206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.810100,0.000000,15.747997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.897300,0.000000,15.660797>}
box{<0,0,-0.203200><0.123319,0.035000,0.203200> rotate<0,44.997030,0> translate<54.810100,0.000000,15.747997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.810100,0.000000,15.747997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,15.902688>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.810100,0.000000,15.747997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.810100,0.000000,22.351997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,22.197309>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.996451,0> translate<54.810100,0.000000,22.351997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.810100,0.000000,22.351997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,22.506688>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.810100,0.000000,22.351997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.810103,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,22.352000>}
box{<0,0,-0.203200><10.112297,0.035000,0.203200> rotate<0,0.000000,0> translate<54.810103,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.882900,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,17.475200>}
box{<0,0,-0.203200><10.039500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.882900,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.897300,0.000000,14.035200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,14.035200>}
box{<0,0,-0.203200><5.580100,0.035000,0.203200> rotate<0,0.000000,0> translate<54.897300,0.000000,14.035200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.897300,0.000000,15.660797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.209675,0.000000,15.660797>}
box{<0,0,-0.203200><6.312375,0.035000,0.203200> rotate<0,0.000000,0> translate<54.897300,0.000000,15.660797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.911703,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,15.849600>}
box{<0,0,-0.203200><10.010697,0.035000,0.203200> rotate<0,0.000000,0> translate<54.911703,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,15.902688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,16.126741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<54.964791,0.000000,15.902688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,17.393309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,17.169256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<54.964791,0.000000,17.393309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,20.706688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,20.930741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<54.964791,0.000000,20.706688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,22.197309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,21.973256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<54.964791,0.000000,22.197309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.964791,0.000000,22.506688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,22.730741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<54.964791,0.000000,22.506688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.972953,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,20.726400>}
box{<0,0,-0.203200><9.949447,0.035000,0.203200> rotate<0,0.000000,0> translate<54.972953,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,16.126741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,17.169256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<55.057597,0.000000,17.169256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,16.256000>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<55.057597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,16.662400>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<55.057597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,17.068800>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<55.057597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,20.930741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,21.973256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<55.057597,0.000000,21.973256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,21.132800>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<55.057597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,21.539200>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<55.057597,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,21.945600>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<55.057597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,22.730741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,23.312125>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,90.000000,0> translate<55.057597,0.000000,23.312125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,22.758400>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<55.057597,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,23.164800>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<55.057597,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.057597,0.000000,23.312125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.652672,0.000000,25.907200>}
box{<0,0,-0.203200><3.669990,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.057597,0.000000,23.312125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.316672,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,23.571200>}
box{<0,0,-0.203200><9.605728,0.035000,0.203200> rotate<0,0.000000,0> translate<55.316672,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.723072,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,23.977600>}
box{<0,0,-0.203200><9.199328,0.035000,0.203200> rotate<0,0.000000,0> translate<55.723072,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,29.495750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,29.495750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813469,0.000000,29.495750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,33.496247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,33.496247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813469,0.000000,33.496247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.129472,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,24.384000>}
box{<0,0,-0.203200><8.792928,0.035000,0.203200> rotate<0,0.000000,0> translate<56.129472,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.535872,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,24.790400>}
box{<0,0,-0.203200><8.386528,0.035000,0.203200> rotate<0,0.000000,0> translate<56.535872,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.626941,0.000000,27.180413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.855584,0.000000,27.409056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.626941,0.000000,27.180413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.855584,0.000000,27.409056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.154322,0.000000,27.532797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<56.855584,0.000000,27.409056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.942272,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,25.196800>}
box{<0,0,-0.203200><7.980128,0.035000,0.203200> rotate<0,0.000000,0> translate<56.942272,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.154322,0.000000,27.532797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.669459,0.000000,27.532797>}
box{<0,0,-0.203200><3.515138,0.035000,0.203200> rotate<0,0.000000,0> translate<57.154322,0.000000,27.532797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.348672,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.973459,0.000000,25.603200>}
box{<0,0,-0.203200><3.624788,0.035000,0.203200> rotate<0,0.000000,0> translate<57.348672,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.470528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<57.470528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,29.495750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,30.667469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.470528,0.000000,29.495750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,33.496247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,32.324528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<57.470528,0.000000,33.496247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.591178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,6.502400>}
box{<0,0,-0.203200><7.331222,0.035000,0.203200> rotate<0,0.000000,0> translate<57.591178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.641975,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,33.324800>}
box{<0,0,-0.203200><7.280425,0.035000,0.203200> rotate<0,0.000000,0> translate<57.641975,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.641978,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,29.667200>}
box{<0,0,-0.203200><7.280422,0.035000,0.203200> rotate<0,0.000000,0> translate<57.641978,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.652672,0.000000,25.907200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.669459,0.000000,25.907200>}
box{<0,0,-0.203200><3.016787,0.035000,0.203200> rotate<0,0.000000,0> translate<57.652672,0.000000,25.907200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.692775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,10.160000>}
box{<0,0,-0.203200><7.229625,0.035000,0.203200> rotate<0,0.000000,0> translate<57.692775,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.997578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,6.908800>}
box{<0,0,-0.203200><6.924822,0.035000,0.203200> rotate<0,0.000000,0> translate<57.997578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.048375,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,32.918400>}
box{<0,0,-0.203200><6.874025,0.035000,0.203200> rotate<0,0.000000,0> translate<58.048375,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.048378,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,30.073600>}
box{<0,0,-0.203200><6.874022,0.035000,0.203200> rotate<0,0.000000,0> translate<58.048378,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.099175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,9.753600>}
box{<0,0,-0.203200><6.823225,0.035000,0.203200> rotate<0,0.000000,0> translate<58.099175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.403978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,7.315200>}
box{<0,0,-0.203200><6.518422,0.035000,0.203200> rotate<0,0.000000,0> translate<58.403978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.454775,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,32.512000>}
box{<0,0,-0.203200><6.467625,0.035000,0.203200> rotate<0,0.000000,0> translate<58.454775,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.454778,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,30.480000>}
box{<0,0,-0.203200><6.467622,0.035000,0.203200> rotate<0,0.000000,0> translate<58.454778,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.505575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,9.347200>}
box{<0,0,-0.203200><6.416825,0.035000,0.203200> rotate<0,0.000000,0> translate<58.505575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<58.642247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,7.721600>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,8.128000>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,8.534400>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,8.940800>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,30.667469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,32.324528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<58.642247,0.000000,32.324528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,30.886400>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,31.292800>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,31.699200>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,32.105600>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,13.299259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,12.421400>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<60.477400,0.000000,13.299259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,14.035200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,13.299259>}
box{<0,0,-0.203200><0.735941,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.477400,0.000000,13.299259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.669459,0.000000,25.907200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,25.221400>}
box{<0,0,-0.203200><0.969868,0.035000,0.203200> rotate<0,44.997030,0> translate<60.669459,0.000000,25.907200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.669459,0.000000,27.532797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,28.218597>}
box{<0,0,-0.203200><0.969868,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.669459,0.000000,27.532797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.209675,0.000000,15.660797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.508413,0.000000,15.537056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<61.209675,0.000000,15.660797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,12.421400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.596738,0.000000,12.421400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<61.355259,0.000000,12.421400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,25.221400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.596738,0.000000,25.221400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<61.355259,0.000000,25.221400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,28.218597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.596738,0.000000,28.218597>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<61.355259,0.000000,28.218597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.508413,0.000000,15.537056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.626872,0.000000,15.418597>}
box{<0,0,-0.203200><0.167527,0.035000,0.203200> rotate<0,44.997030,0> translate<61.508413,0.000000,15.537056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,1.592163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.844584,0.000000,0.863597>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,67.495370,0> translate<61.542800,0.000000,1.592163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,2.471834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,1.592163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.542800,0.000000,1.592163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,2.471834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.879434,0.000000,3.284544>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<61.542800,0.000000,2.471834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,37.406163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.879434,0.000000,36.593453>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<61.542800,0.000000,37.406163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,38.285834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,37.406163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<61.542800,0.000000,37.406163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,38.285834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.844584,0.000000,39.014400>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-67.495370,0> translate<61.542800,0.000000,38.285834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.602269,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,15.443200>}
box{<0,0,-0.203200><3.320131,0.035000,0.203200> rotate<0,0.000000,0> translate<61.602269,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.626872,0.000000,15.418597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.596738,0.000000,15.418597>}
box{<0,0,-0.203200><0.969866,0.035000,0.203200> rotate<0,0.000000,0> translate<61.626872,0.000000,15.418597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.879434,0.000000,3.284544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.501453,0.000000,3.906563>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.879434,0.000000,3.284544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.879434,0.000000,36.593453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.501453,0.000000,35.971434>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<61.879434,0.000000,36.593453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.501453,0.000000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.314163,0.000000,4.243197>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<62.501453,0.000000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.501453,0.000000,35.971434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.314163,0.000000,35.634800>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<62.501453,0.000000,35.971434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.596738,0.000000,12.421400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,13.299259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.596738,0.000000,12.421400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.596738,0.000000,15.418597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,14.540738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<62.596738,0.000000,15.418597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.596738,0.000000,25.221400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,26.099259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<62.596738,0.000000,25.221400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.596738,0.000000,28.218597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,27.340738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<62.596738,0.000000,28.218597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.773734,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,28.041600>}
box{<0,0,-0.203200><2.148666,0.035000,0.203200> rotate<0,0.000000,0> translate<62.773734,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.773738,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,12.598400>}
box{<0,0,-0.203200><2.148662,0.035000,0.203200> rotate<0,0.000000,0> translate<62.773738,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.978534,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,15.036800>}
box{<0,0,-0.203200><1.943866,0.035000,0.203200> rotate<0,0.000000,0> translate<62.978534,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.978538,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,25.603200>}
box{<0,0,-0.203200><1.943862,0.035000,0.203200> rotate<0,0.000000,0> translate<62.978538,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.180134,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,27.635200>}
box{<0,0,-0.203200><1.742266,0.035000,0.203200> rotate<0,0.000000,0> translate<63.180134,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.180138,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,13.004800>}
box{<0,0,-0.203200><1.742262,0.035000,0.203200> rotate<0,0.000000,0> translate<63.180138,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.314163,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.193834,0.000000,4.243197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<63.314163,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.314163,0.000000,35.634800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.193834,0.000000,35.634800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<63.314163,0.000000,35.634800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.384934,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,14.630400>}
box{<0,0,-0.203200><1.537466,0.035000,0.203200> rotate<0,0.000000,0> translate<63.384934,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.384937,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,26.009600>}
box{<0,0,-0.203200><1.537462,0.035000,0.203200> rotate<0,0.000000,0> translate<63.384937,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,13.299259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,14.540738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<63.474597,0.000000,14.540738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,13.411200>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.474597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,13.817600>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.474597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,14.224000>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.474597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,26.099259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,27.340738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<63.474597,0.000000,27.340738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,26.416000>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.474597,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,26.822400>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.474597,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.474597,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,27.228800>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<63.474597,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.193834,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,3.941413>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,22.498690,0> translate<64.193834,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.193834,0.000000,35.634800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,35.936584>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-22.498690,0> translate<64.193834,0.000000,35.634800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.503816,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,35.763200>}
box{<0,0,-0.203200><0.418584,0.035000,0.203200> rotate<0,0.000000,0> translate<64.503816,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.626453,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,4.064000>}
box{<0,0,-0.203200><0.295947,0.035000,0.203200> rotate<0,0.000000,0> translate<64.626453,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,35.936584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,3.941413>}
box{<0,0,-0.203200><31.995172,0.035000,0.203200> rotate<0,-90.000000,0> translate<64.922400,0.000000,3.941413> }
texture{col_pol}
}
#end
union{
cylinder{<56.642000,0.038000,31.496000><56.642000,-1.538000,31.496000>0.927100}
cylinder{<49.530000,0.038000,31.496000><49.530000,-1.538000,31.496000>0.927100}
cylinder{<6.350000,0.038000,31.496000><6.350000,-1.538000,31.496000>0.927100}
cylinder{<13.462000,0.038000,31.496000><13.462000,-1.538000,31.496000>0.927100}
cylinder{<6.350000,0.038000,8.382000><6.350000,-1.538000,8.382000>0.927100}
cylinder{<13.462000,0.038000,8.382000><13.462000,-1.538000,8.382000>0.927100}
cylinder{<56.642000,0.038000,8.382000><56.642000,-1.538000,8.382000>0.927100}
cylinder{<49.530000,0.038000,8.382000><49.530000,-1.538000,8.382000>0.927100}
cylinder{<61.976000,0.038000,26.720000><61.976000,-1.538000,26.720000>0.508000}
cylinder{<61.976000,0.038000,13.920000><61.976000,-1.538000,13.920000>0.508000}
cylinder{<17.526000,0.038000,3.302000><17.526000,-1.538000,3.302000>0.508000}
cylinder{<20.066000,0.038000,3.302000><20.066000,-1.538000,3.302000>0.508000}
cylinder{<22.606000,0.038000,3.302000><22.606000,-1.538000,3.302000>0.508000}
cylinder{<25.146000,0.038000,3.302000><25.146000,-1.538000,3.302000>0.508000}
cylinder{<19.812000,0.038000,27.940000><19.812000,-1.538000,27.940000>0.508000}
cylinder{<17.272000,0.038000,27.940000><17.272000,-1.538000,27.940000>0.508000}
cylinder{<19.812000,0.038000,30.480000><19.812000,-1.538000,30.480000>0.508000}
cylinder{<17.272000,0.038000,30.480000><17.272000,-1.538000,30.480000>0.508000}
cylinder{<19.812000,0.038000,33.020000><19.812000,-1.538000,33.020000>0.508000}
cylinder{<17.272000,0.038000,33.020000><17.272000,-1.538000,33.020000>0.508000}
cylinder{<17.526000,0.038000,6.096000><17.526000,-1.538000,6.096000>0.508000}
cylinder{<20.066000,0.038000,6.096000><20.066000,-1.538000,6.096000>0.508000}
cylinder{<22.606000,0.038000,6.096000><22.606000,-1.538000,6.096000>0.508000}
cylinder{<25.146000,0.038000,6.096000><25.146000,-1.538000,6.096000>0.508000}
cylinder{<38.608000,0.038000,6.096000><38.608000,-1.538000,6.096000>0.508000}
cylinder{<41.148000,0.038000,6.096000><41.148000,-1.538000,6.096000>0.508000}
cylinder{<43.688000,0.038000,6.096000><43.688000,-1.538000,6.096000>0.508000}
cylinder{<46.228000,0.038000,6.096000><46.228000,-1.538000,6.096000>0.508000}
cylinder{<38.608000,0.038000,3.302000><38.608000,-1.538000,3.302000>0.508000}
cylinder{<41.148000,0.038000,3.302000><41.148000,-1.538000,3.302000>0.508000}
cylinder{<43.688000,0.038000,3.302000><43.688000,-1.538000,3.302000>0.508000}
cylinder{<46.228000,0.038000,3.302000><46.228000,-1.538000,3.302000>0.508000}
cylinder{<8.382000,0.038000,21.844000><8.382000,-1.538000,21.844000>0.508000}
cylinder{<5.842000,0.038000,21.844000><5.842000,-1.538000,21.844000>0.508000}
//Holes(fast)/Vias
cylinder{<29.210000,0.038000,11.430000><29.210000,-1.538000,11.430000>0.300000 }
cylinder{<16.764000,0.038000,23.114000><16.764000,-1.538000,23.114000>0.300000 }
cylinder{<27.178000,0.038000,6.096000><27.178000,-1.538000,6.096000>0.300000 }
cylinder{<29.210000,0.038000,8.890000><29.210000,-1.538000,8.890000>0.300000 }
cylinder{<28.956000,0.038000,7.620000><28.956000,-1.538000,7.620000>0.300000 }
cylinder{<34.798000,0.038000,21.082000><34.798000,-1.538000,21.082000>0.300000 }
cylinder{<34.544000,0.038000,13.208000><34.544000,-1.538000,13.208000>0.300000 }
cylinder{<33.274000,0.038000,12.700000><33.274000,-1.538000,12.700000>0.300000 }
cylinder{<32.004000,0.038000,12.700000><32.004000,-1.538000,12.700000>0.300000 }
cylinder{<30.734000,0.038000,13.208000><30.734000,-1.538000,13.208000>0.300000 }
cylinder{<30.988000,0.038000,7.620000><30.988000,-1.538000,7.620000>0.300000 }
cylinder{<43.688000,0.038000,9.398000><43.688000,-1.538000,9.398000>0.300000 }
cylinder{<36.322000,0.038000,26.416000><36.322000,-1.538000,26.416000>0.300000 }
cylinder{<36.322000,0.038000,6.096000><36.322000,-1.538000,6.096000>0.300000 }
cylinder{<48.260000,0.038000,23.114000><48.260000,-1.538000,23.114000>0.300000 }
cylinder{<28.442000,0.038000,19.310000><28.442000,-1.538000,19.310000>0.300000 }
cylinder{<28.448000,0.038000,27.178000><28.448000,-1.538000,27.178000>0.300000 }
cylinder{<29.496000,0.038000,21.050000><29.496000,-1.538000,21.050000>0.300000 }
cylinder{<29.464000,0.038000,25.146000><29.464000,-1.538000,25.146000>0.300000 }
cylinder{<32.258000,0.038000,7.620000><32.258000,-1.538000,7.620000>0.300000 }
cylinder{<32.258000,0.038000,21.082000><32.258000,-1.538000,21.082000>0.300000 }
cylinder{<27.432000,0.038000,14.986000><27.432000,-1.538000,14.986000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.278100,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.400969,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<15.278100,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.400969,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.400969,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.646713,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.769584,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.646713,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523841,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<15.523841,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.646713,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.769584,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<15.646713,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.646713,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.400969,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.400969,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.400969,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.278100,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<15.278100,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.026516,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.026516,0.000000,1.045841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.026516,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.026516,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.272256,0.000000,0.800100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<16.026516,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.272256,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.045841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<16.272256,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.537328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<16.518000,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.774931,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.897800,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<16.774931,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.897800,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.897800,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.143544,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.266416,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.143544,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.020672,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<17.020672,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.143544,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.266416,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<17.143544,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.143544,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.897800,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.897800,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.897800,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.774931,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<16.774931,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.640375,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.640375,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.640375,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.394631,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.394631,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.394631,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.271763,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<18.271763,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.271763,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.271763,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.271763,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.271763,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.394631,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<18.271763,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.394631,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.640375,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.394631,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.640375,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<18.640375,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<18.763247,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.763247,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.517503,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.517503,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.020178,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<19.020178,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.511662,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.768594,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.137206,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<19.768594,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.137206,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<20.137206,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<20.260078,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.137206,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<20.137206,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.137206,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<19.768594,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.634038,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.634038,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.634038,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.388294,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.388294,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.388294,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<21.265425,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.265425,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.388294,0.000000,1.168713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<21.265425,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.388294,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.634038,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.388294,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.634038,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.634038,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.756909,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.756909,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.634038,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<21.634038,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.634038,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.388294,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.388294,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.388294,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.265425,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<21.265425,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.013841,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<22.013841,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<22.382453,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<22.505325,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<22.382453,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<22.013841,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.762256,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.762256,0.000000,1.291584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<22.762256,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.762256,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.007997,0.000000,1.537328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<22.762256,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.007997,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.253741,0.000000,1.291584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<23.007997,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.253741,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.253741,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.253741,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.762256,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.253741,0.000000,1.168713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<22.762256,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.627700,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<24.627700,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.627700,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.381956,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.381956,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.381956,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<24.259087,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.259087,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.381956,0.000000,1.168713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<24.259087,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.381956,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.627700,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.381956,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.627700,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<24.627700,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.750572,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.750572,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.627700,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<24.627700,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.627700,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.381956,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.381956,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.381956,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.259087,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<24.259087,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.498988,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.376116,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<25.376116,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.376116,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.130372,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<25.130372,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.130372,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.007503,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<25.007503,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.007503,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.007503,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.007503,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.007503,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.130372,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<25.007503,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.130372,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.376116,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<25.130372,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.376116,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.498988,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<25.376116,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.755919,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.755919,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.755919,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.755919,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.247403,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<25.755919,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.532100,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.654969,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<15.532100,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.654969,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.900713,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.654969,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.900713,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.900713,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.023584,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.900713,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<15.900713,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.900713,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.777841,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<15.777841,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.900713,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.900713,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.023584,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.900713,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<15.900713,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.900713,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.654969,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.654969,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.654969,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.532100,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<15.532100,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.280516,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.280516,0.000000,8.157841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.280516,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.280516,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.526256,0.000000,7.912100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<16.280516,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.526256,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.157841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<16.526256,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.649328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<16.772000,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.028931,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.151800,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<17.028931,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.151800,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.397544,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.151800,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.397544,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.397544,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.520416,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.397544,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.397544,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.397544,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.274672,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<17.274672,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.397544,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.397544,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.520416,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.397544,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<17.397544,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.397544,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.151800,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.151800,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.151800,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.028931,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<17.028931,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.017247,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.894375,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.894375,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.894375,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.648631,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.648631,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.648631,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.525763,0.000000,8.526456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<18.525763,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.525763,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.525763,0.000000,8.034969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.525763,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.525763,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.648631,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<18.525763,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.648631,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.894375,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.648631,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.894375,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.017247,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<18.894375,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.017247,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.017247,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<19.017247,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.017247,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.771503,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<18.771503,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.274178,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.274178,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.274178,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.274178,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.765663,0.000000,7.912100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<19.274178,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.765663,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.765663,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.765663,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.022594,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.022594,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.022594,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.022594,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.391206,0.000000,7.912100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<20.022594,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.391206,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.514078,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<20.391206,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.514078,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.514078,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<20.514078,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.514078,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.391206,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<20.391206,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.391206,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.022594,0.000000,8.649328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<20.022594,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.519425,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.519425,0.000000,8.403584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<21.519425,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.519425,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.765166,0.000000,8.649328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<21.519425,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.765166,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.010909,0.000000,8.403584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<21.765166,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.010909,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.010909,0.000000,7.912100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.010909,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.519425,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.010909,0.000000,8.280712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<21.519425,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.513581,0.000000,8.526456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<22.513581,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.513581,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,8.280712>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<22.267841,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,8.034969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.267841,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.390709,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<22.267841,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.390709,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.636453,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<22.390709,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.636453,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<22.636453,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,8.157841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<22.759325,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.636453,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<22.636453,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.636453,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,8.280712>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<22.267841,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.764672,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.764672,0.000000,8.403584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<23.764672,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.764672,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.010413,0.000000,8.649328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<23.764672,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.010413,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.256156,0.000000,8.403584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<24.010413,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.256156,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.256156,0.000000,7.912100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.256156,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.764672,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.256156,0.000000,8.280712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<23.764672,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.513088,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.004572,0.000000,8.649328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<24.513088,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.004572,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.004572,0.000000,8.526456>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.004572,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.004572,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.513088,0.000000,8.034969>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<24.513088,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.513088,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.513088,0.000000,7.912100>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.513088,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.630100,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.630100,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.630100,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.630100,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.998713,0.000000,7.912100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<37.630100,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.998713,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.121584,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<37.998713,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.121584,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.121584,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<38.121584,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.121584,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.998713,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<37.998713,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.998713,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.630100,0.000000,8.649328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<37.630100,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.870000,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378516,0.000000,8.649328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<38.378516,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378516,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378516,0.000000,8.280712>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.378516,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378516,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.624256,0.000000,8.403584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,-26.563589,0> translate<38.378516,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.624256,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.747128,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<38.624256,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.747128,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.870000,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.747128,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.870000,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.870000,0.000000,8.034969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.870000,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.870000,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.747128,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<38.747128,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.747128,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.501384,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.501384,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.501384,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378516,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<38.378516,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.875347,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.875347,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.875347,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.875347,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.243959,0.000000,7.912100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<39.875347,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.243959,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.366831,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<40.243959,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.366831,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.366831,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<40.366831,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.366831,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.243959,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.243959,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.243959,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.875347,0.000000,8.649328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<39.875347,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.115247,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.869503,0.000000,8.526456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<40.869503,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.869503,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.623763,0.000000,8.280712>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<40.623763,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.623763,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.623763,0.000000,8.034969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.623763,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.623763,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.746631,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<40.623763,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.746631,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.992375,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.746631,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.992375,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.115247,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<40.992375,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.115247,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.115247,0.000000,8.157841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<41.115247,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.115247,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.992375,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.992375,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.992375,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.623763,0.000000,8.280712>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<40.623763,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.612078,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.489206,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.489206,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.489206,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.243462,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.243462,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.243462,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.120594,0.000000,8.526456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<42.120594,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.120594,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.120594,0.000000,8.034969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.120594,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.120594,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.243462,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<42.120594,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.243462,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.489206,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.243462,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.489206,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.612078,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<42.489206,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.612078,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.612078,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.612078,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.612078,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.366334,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.366334,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.869009,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.869009,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.869009,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.869009,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.360494,0.000000,7.912100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<42.869009,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.360494,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.360494,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<43.360494,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.617425,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.617425,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.617425,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.617425,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.986038,0.000000,7.912100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<43.617425,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.986038,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.108909,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<43.986038,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.108909,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.108909,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<44.108909,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.108909,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.986038,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<43.986038,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.986038,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.617425,0.000000,8.649328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<43.617425,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.114256,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.237125,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<45.114256,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.237125,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.482869,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.237125,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.482869,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.482869,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.605741,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.482869,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.482869,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.482869,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.359997,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<45.359997,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.482869,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.482869,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.605741,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.482869,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<45.482869,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.482869,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.237125,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.237125,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.237125,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.114256,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<45.114256,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.862672,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.862672,0.000000,8.157841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.862672,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.862672,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.108413,0.000000,7.912100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<45.862672,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.108413,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.157841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<46.108413,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.649328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<46.354156,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.611088,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.733956,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<46.611088,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.733956,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.979700,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<46.733956,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.979700,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<46.979700,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.102572,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.979700,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<46.979700,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.979700,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.856828,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<46.856828,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.979700,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<46.979700,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.102572,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.979700,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<46.979700,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.979700,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.733956,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<46.733956,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.733956,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.611088,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<46.611088,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<35.852100,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<35.852100,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.220713,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.343584,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.220713,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.220713,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.343584,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<36.220713,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<35.852100,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,1.168713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<35.852100,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<36.600516,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.723384,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<36.600516,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.723384,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.969128,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.723384,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.969128,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.969128,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.092000,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.969128,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<36.969128,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.969128,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.723384,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.723384,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.723384,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<36.600516,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,1.414456>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<36.600516,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.348931,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.840416,0.000000,1.537328>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<37.348931,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.097347,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.097347,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<38.097347,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.097347,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.465959,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<38.097347,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.465959,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.465959,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.588831,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.465959,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.465959,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.465959,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.097347,0.000000,1.045841>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<38.097347,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.343088,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,0.800100>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<38.343088,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.845762,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.337247,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<38.845762,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.337247,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.845762,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<38.845762,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<40.342594,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<40.342594,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.711206,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.834078,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.711206,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.711206,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.834078,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<40.711206,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<40.342594,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,1.168713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<40.342594,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.091009,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.336750,0.000000,1.537328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<41.091009,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.336750,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.336750,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.336750,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.091009,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.582494,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<41.091009,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.839425,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.330909,0.000000,1.537328>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<41.839425,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.833581,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.833581,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.833581,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.587841,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.079325,0.000000,1.537328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.587841,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.336256,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.827741,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<43.336256,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.827741,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.336256,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,-56.306272,0> translate<43.336256,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.324572,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.201700,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.201700,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.201700,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.955956,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.955956,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.955956,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.833088,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<44.833088,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.833088,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.833088,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.833088,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.833088,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.955956,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<44.833088,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.955956,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.201700,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.955956,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.201700,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.324572,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<45.201700,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.324572,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.324572,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<45.324572,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.324572,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.078828,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.078828,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.581503,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.581503,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<45.581503,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.581503,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<45.581503,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<46.072988,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.329919,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.329919,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.329919,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.329919,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.698531,0.000000,0.800100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<46.329919,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.698531,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.821403,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<46.698531,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.821403,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.821403,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<46.821403,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.821403,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.698531,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<46.698531,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.698531,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.329919,0.000000,1.537328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<46.329919,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.826750,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.949619,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<47.826750,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.949619,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.195363,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<47.949619,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.195363,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.318234,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<48.195363,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.318234,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.318234,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<48.318234,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.318234,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.195363,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<48.195363,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.195363,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.072491,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<48.072491,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.195363,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.318234,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<48.195363,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.318234,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.318234,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<48.318234,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.318234,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.195363,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<48.195363,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.195363,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.949619,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<47.949619,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.949619,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.826750,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<47.826750,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.575166,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.575166,0.000000,1.045841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<48.575166,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.575166,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.820906,0.000000,0.800100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<48.575166,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<48.820906,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.066650,0.000000,1.045841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<48.820906,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.066650,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.066650,0.000000,1.537328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<49.066650,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.323581,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.446450,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<49.323581,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.446450,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.692194,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<49.446450,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.692194,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.815066,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<49.692194,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.815066,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.815066,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.815066,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.815066,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.692194,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.692194,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.692194,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.569322,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<49.569322,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.692194,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.815066,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<49.692194,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.815066,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.815066,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.815066,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.815066,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.692194,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<49.692194,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.692194,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.446450,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<49.446450,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.446450,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.323581,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<49.323581,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.818344,0.000000,15.769584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.695472,0.000000,15.646713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.695472,0.000000,15.646713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.695472,0.000000,15.646713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.695472,0.000000,15.400969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.695472,0.000000,15.400969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.695472,0.000000,15.400969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.818344,0.000000,15.278100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.695472,0.000000,15.400969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.818344,0.000000,15.278100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,15.278100>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,0.000000,0> translate<57.818344,0.000000,15.278100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,15.278100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,15.400969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.309831,0.000000,15.278100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,15.400969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,15.646713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<58.432700,0.000000,15.646713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,15.646713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,15.769584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<58.309831,0.000000,15.769584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,16.026516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,16.026516>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,16.026516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,16.026516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,16.149384>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.309831,0.000000,16.026516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,16.149384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,16.518000>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<58.432700,0.000000,16.518000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,16.518000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,16.518000>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,16.518000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,16.774931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,16.774931>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,16.774931> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,16.774931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,17.020672>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.941216,0.000000,17.020672> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,17.020672>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,17.143544>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,17.143544> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,17.398609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,17.398609>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,17.398609> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,17.398609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,17.644350>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.941216,0.000000,17.644350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,17.644350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,17.767222>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,17.767222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,18.390900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,18.145156>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.432700,0.000000,18.145156> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,18.145156>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,18.022288>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.309831,0.000000,18.022288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,18.022288>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,18.022288>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,18.022288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,18.022288>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,18.145156>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.941216,0.000000,18.145156> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,18.145156>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,18.390900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,18.390900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,18.390900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,18.513772>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.941216,0.000000,18.390900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,18.513772>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,18.513772>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,18.513772> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,18.513772>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,18.022288>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.186959,0.000000,18.022288> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,18.770703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,18.770703>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,18.770703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,18.770703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,19.139316>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,19.139316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,19.139316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,19.262187>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.941216,0.000000,19.139316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,19.262187>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,19.262187>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,19.262187> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.818344,0.000000,19.641988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,19.641988>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,0.000000,0> translate<57.818344,0.000000,19.641988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,19.641988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,19.764859>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<58.309831,0.000000,19.641988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,19.519119>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,19.764859>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,19.764859> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,21.012219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.695472,0.000000,21.012219>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<57.695472,0.000000,21.012219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.695472,0.000000,20.766478>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.695472,0.000000,21.257963>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<57.695472,0.000000,21.257963> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,21.514894>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,21.514894>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,21.514894> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,21.514894>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,21.760634>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.941216,0.000000,21.760634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,21.760634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,21.883506>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,21.883506> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,22.261441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,22.507184>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,22.507184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,22.507184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,22.630056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.941216,0.000000,22.507184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,22.630056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,22.630056>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,22.630056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,22.630056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,22.261441>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.432700,0.000000,22.261441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,22.261441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,22.138572>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.309831,0.000000,22.138572> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,22.138572>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,22.261441>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<58.186959,0.000000,22.261441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,22.261441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,22.630056>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<58.186959,0.000000,22.630056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,22.886988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,22.886988>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,22.886988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,22.886988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,23.255600>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,23.255600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,23.255600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,23.378472>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.941216,0.000000,23.255600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,23.378472>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,23.378472>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,23.378472> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,23.635403>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,24.004016>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<58.432700,0.000000,24.004016> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,24.004016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,24.126888>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<58.309831,0.000000,24.126888> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,24.126888>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,24.004016>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.186959,0.000000,24.004016> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,24.004016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,23.758272>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.186959,0.000000,23.758272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,23.758272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,23.635403>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<58.064087,0.000000,23.635403> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,23.635403>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,23.758272>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.941216,0.000000,23.758272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,23.758272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,24.126888>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,24.126888> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,24.506688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.818344,0.000000,24.506688>}
box{<0,0,-0.038100><0.614356,0.036000,0.038100> rotate<0,0.000000,0> translate<57.818344,0.000000,24.506688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.818344,0.000000,24.506688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.695472,0.000000,24.629559>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<57.695472,0.000000,24.629559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,24.383819>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,24.629559>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<58.064087,0.000000,24.629559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,25.005631>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,25.251375>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<58.432700,0.000000,25.251375> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,25.251375>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,25.374247>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<58.309831,0.000000,25.374247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,25.374247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,25.374247>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,25.374247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,25.374247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,25.251375>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.941216,0.000000,25.251375> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,25.251375>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,25.005631>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.941216,0.000000,25.005631> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,25.005631>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,24.882763>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.941216,0.000000,25.005631> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,24.882763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,24.882763>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,24.882763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,24.882763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,25.005631>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.309831,0.000000,24.882763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,25.631178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,25.631178>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,25.631178> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,25.631178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,25.876919>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.941216,0.000000,25.876919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,25.876919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,25.999791>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,25.999791> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,26.254856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,26.254856>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,26.254856> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,26.254856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,26.377725>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,26.377725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,26.377725>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,26.500597>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.941216,0.000000,26.377725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,26.500597>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,26.500597>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,26.500597> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,26.500597>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,26.623469>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<57.941216,0.000000,26.623469> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,26.623469>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,26.746341>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.941216,0.000000,26.623469> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,26.746341>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,26.746341>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,26.746341> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,27.371884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,27.126141>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.432700,0.000000,27.126141> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,27.126141>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,27.003272>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.309831,0.000000,27.003272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.309831,0.000000,27.003272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,27.003272>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,27.003272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,27.003272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,27.126141>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.941216,0.000000,27.126141> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,27.126141>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,27.371884>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,27.371884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,27.371884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,27.494756>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.941216,0.000000,27.371884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.064087,0.000000,27.494756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,27.494756>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<58.064087,0.000000,27.494756> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,27.494756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,27.003272>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.186959,0.000000,27.003272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.432700,0.000000,27.751688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,27.751688>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.941216,0.000000,27.751688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.186959,0.000000,27.751688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,27.997428>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.941216,0.000000,27.997428> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,27.997428>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.941216,0.000000,28.120300>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.941216,0.000000,28.120300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.914672,0.000000,22.505325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.914672,0.000000,22.013841>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<58.914672,0.000000,22.013841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.914672,0.000000,22.013841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,22.013841>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<58.914672,0.000000,22.013841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,22.013841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,22.259581>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,63.430471,0> translate<59.160416,0.000000,22.259581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,22.259581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,22.382453>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<59.160416,0.000000,22.382453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,22.382453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,22.505325>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.160416,0.000000,22.382453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,22.505325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.529031,0.000000,22.505325>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<59.283288,0.000000,22.505325> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.529031,0.000000,22.505325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,22.382453>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<59.529031,0.000000,22.505325> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,22.382453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,22.136709>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.651900,0.000000,22.136709> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,22.136709>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.529031,0.000000,22.013841>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.529031,0.000000,22.013841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,22.762256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,22.762256>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<59.160416,0.000000,22.762256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,22.762256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.914672,0.000000,23.007997>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<58.914672,0.000000,23.007997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<58.914672,0.000000,23.007997>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,23.253741>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<58.914672,0.000000,23.007997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,23.253741>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,23.253741>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<59.160416,0.000000,23.253741> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,22.762256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,23.253741>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<59.283288,0.000000,23.253741> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,24.259087>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,24.259087>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<59.160416,0.000000,24.259087> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,24.259087>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,24.381956>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<59.160416,0.000000,24.381956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,24.381956>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,24.504828>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.160416,0.000000,24.381956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,24.504828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,24.504828>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<59.283288,0.000000,24.504828> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,24.504828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,24.627700>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<59.160416,0.000000,24.627700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,24.627700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,24.750572>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.160416,0.000000,24.627700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,24.750572>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,24.750572>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<59.283288,0.000000,24.750572> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,25.130372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,25.376116>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<59.160416,0.000000,25.376116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,25.376116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,25.498988>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.160416,0.000000,25.376116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.283288,0.000000,25.498988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,25.498988>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<59.283288,0.000000,25.498988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,25.498988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,25.130372>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.651900,0.000000,25.130372> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,25.130372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.529031,0.000000,25.007503>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.529031,0.000000,25.007503> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.529031,0.000000,25.007503>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.406159,0.000000,25.130372>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<59.406159,0.000000,25.130372> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.406159,0.000000,25.130372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.406159,0.000000,25.498988>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<59.406159,0.000000,25.498988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,25.755919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,26.247403>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.160416,0.000000,25.755919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.651900,0.000000,25.755919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.160416,0.000000,26.247403>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<59.160416,0.000000,26.247403> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.746575,0.000000,2.019300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.746575,0.000000,2.832794>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<57.746575,0.000000,2.832794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.017738,0.000000,2.832794>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.475409,0.000000,2.832794>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<57.475409,0.000000,2.832794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.811056,0.000000,2.019300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.811056,0.000000,2.832794>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<56.811056,0.000000,2.832794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.082219,0.000000,2.832794>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.539891,0.000000,2.832794>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<56.539891,0.000000,2.832794> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.633900,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.633900,-1.536000,37.808703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<42.633900,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.633900,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.320366,-1.536000,37.495169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.320366,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.320366,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.006831,-1.536000,37.808703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<42.006831,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.006831,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.006831,-1.536000,36.868100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.006831,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.698381,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.698381,-1.536000,37.024866>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.698381,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.698381,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.541616,-1.536000,36.868100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.541616,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.541616,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.071313,-1.536000,36.868100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<41.071313,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.071313,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.071313,-1.536000,36.711334>}
box{<0,0,-0.038100><0.783834,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.071313,-1.536000,36.711334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.071313,-1.536000,36.711334>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.228081,-1.536000,36.554566>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<41.071313,-1.536000,36.711334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.228081,-1.536000,36.554566>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.384847,-1.536000,36.554566>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<41.228081,-1.536000,36.554566> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.135794,-1.536000,37.651934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.292563,-1.536000,37.808703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.135794,-1.536000,37.651934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.292563,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.606097,-1.536000,37.808703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<40.292563,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.606097,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.762863,-1.536000,37.651934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<40.606097,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.762863,-1.536000,37.651934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.762863,-1.536000,37.495169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.762863,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.762863,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.606097,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<40.606097,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.606097,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.292563,-1.536000,37.338400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<40.292563,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.292563,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.135794,-1.536000,37.181634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<40.135794,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.135794,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.135794,-1.536000,37.024866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.135794,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.135794,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.292563,-1.536000,36.868100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<40.135794,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.292563,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.606097,-1.536000,36.868100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<40.292563,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.606097,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.762863,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.606097,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.357044,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.670578,-1.536000,36.868100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<39.357044,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.670578,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.827344,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.670578,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.827344,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.827344,-1.536000,37.338400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<39.827344,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.827344,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.670578,-1.536000,37.495169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<39.670578,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.670578,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.357044,-1.536000,37.495169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<39.357044,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.357044,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.200275,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.200275,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.200275,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.200275,-1.536000,37.181634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.200275,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.200275,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.827344,-1.536000,37.181634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<39.200275,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.891825,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.891825,-1.536000,37.495169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<38.891825,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.891825,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.421525,-1.536000,37.495169>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<38.421525,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.421525,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.264756,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.264756,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.264756,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.264756,-1.536000,36.868100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.264756,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.956306,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.486006,-1.536000,36.868100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<37.486006,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.486006,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.329238,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<37.329238,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.329238,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.486006,-1.536000,37.181634>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.329238,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.486006,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.799541,-1.536000,37.181634>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<37.486006,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.799541,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.956306,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.799541,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.956306,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.799541,-1.536000,37.495169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<37.799541,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.799541,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.329238,-1.536000,37.495169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<37.329238,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.864022,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.550488,-1.536000,36.868100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<36.550488,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.550488,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.393719,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<36.393719,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.393719,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.393719,-1.536000,37.338400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<36.393719,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.393719,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.550488,-1.536000,37.495169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.393719,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.550488,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.864022,-1.536000,37.495169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<36.550488,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.864022,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.020788,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<36.864022,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.020788,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.020788,-1.536000,37.024866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.020788,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.020788,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.864022,-1.536000,36.868100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.864022,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.085269,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.085269,-1.536000,37.495169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<36.085269,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.085269,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.771734,-1.536000,37.495169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<35.771734,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.771734,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.614969,-1.536000,37.495169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<35.614969,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.305672,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.835372,-1.536000,36.868100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<34.835372,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.835372,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.678603,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<34.678603,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.678603,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.835372,-1.536000,37.181634>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.678603,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.835372,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.148906,-1.536000,37.181634>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<34.835372,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.148906,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.305672,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.148906,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.305672,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.148906,-1.536000,37.495169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<35.148906,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.148906,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.678603,-1.536000,37.495169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<34.678603,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.434634,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.434634,-1.536000,37.808703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<33.434634,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.434634,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.964334,-1.536000,37.808703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.964334,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.964334,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.807566,-1.536000,37.651934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.807566,-1.536000,37.651934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.807566,-1.536000,37.651934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.807566,-1.536000,37.338400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.807566,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.807566,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.964334,-1.536000,37.181634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<32.807566,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.964334,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.434634,-1.536000,37.181634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<32.964334,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.121100,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.807566,-1.536000,36.868100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.807566,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.499116,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.499116,-1.536000,37.808703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<32.499116,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.499116,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.872047,-1.536000,37.808703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<31.872047,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.499116,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.185581,-1.536000,37.338400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<32.185581,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.563597,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.563597,-1.536000,37.808703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<31.563597,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.563597,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.250063,-1.536000,37.495169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.250063,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.250063,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.936528,-1.536000,37.808703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<30.936528,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.936528,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.936528,-1.536000,36.868100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.936528,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.001009,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.314544,-1.536000,37.651934>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,26.563526,0> translate<30.001009,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.314544,-1.536000,37.651934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.628078,-1.536000,37.338400>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<30.314544,-1.536000,37.651934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.628078,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.628078,-1.536000,37.024866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.628078,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.628078,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.471312,-1.536000,36.868100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.471312,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.471312,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.157778,-1.536000,36.868100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<30.157778,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.157778,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.001009,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<30.001009,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.001009,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.001009,-1.536000,37.181634>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<30.001009,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.001009,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.157778,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<30.001009,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.157778,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.628078,-1.536000,37.338400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<30.157778,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.692559,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.535794,-1.536000,36.868100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.535794,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.535794,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.222259,-1.536000,36.868100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<29.222259,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.222259,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.065491,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<29.065491,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.065491,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.065491,-1.536000,37.651934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<29.065491,-1.536000,37.651934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.065491,-1.536000,37.651934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.222259,-1.536000,37.808703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.065491,-1.536000,37.651934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.222259,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.535794,-1.536000,37.808703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<29.222259,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.535794,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.692559,-1.536000,37.651934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<29.535794,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.692559,-1.536000,37.651934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.692559,-1.536000,37.495169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.692559,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.692559,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.535794,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<29.535794,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.535794,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.065491,-1.536000,37.338400>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<29.065491,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.821522,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.821522,-1.536000,37.808703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<27.821522,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.821522,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.194453,-1.536000,36.868100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,-56.306216,0> translate<27.194453,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.194453,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.194453,-1.536000,37.808703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<27.194453,-1.536000,37.808703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.729237,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.415703,-1.536000,36.868100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<26.415703,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.415703,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.258934,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<26.258934,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.258934,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.258934,-1.536000,37.338400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<26.258934,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.258934,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.415703,-1.536000,37.495169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.258934,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.415703,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.729237,-1.536000,37.495169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<26.415703,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.729237,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.886003,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<26.729237,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.886003,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.886003,-1.536000,37.024866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.886003,-1.536000,37.024866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.886003,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.729237,-1.536000,36.868100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.729237,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.323416,-1.536000,37.808703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.323416,-1.536000,36.868100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.323416,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.323416,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.793719,-1.536000,36.868100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<25.323416,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.793719,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.950484,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<25.793719,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.950484,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.950484,-1.536000,37.338400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<25.950484,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.950484,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.793719,-1.536000,37.495169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<25.793719,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.793719,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.323416,-1.536000,37.495169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<25.323416,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.544666,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.858200,-1.536000,36.868100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<24.544666,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.858200,-1.536000,36.868100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.014966,-1.536000,37.024866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.858200,-1.536000,36.868100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.014966,-1.536000,37.024866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.014966,-1.536000,37.338400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<25.014966,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.014966,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.858200,-1.536000,37.495169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<24.858200,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.858200,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.544666,-1.536000,37.495169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<24.544666,-1.536000,37.495169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.544666,-1.536000,37.495169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.387897,-1.536000,37.338400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.387897,-1.536000,37.338400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.387897,-1.536000,37.338400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.387897,-1.536000,37.181634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.387897,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.387897,-1.536000,37.181634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.014966,-1.536000,37.181634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<24.387897,-1.536000,37.181634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,33.498784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<40.865381,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.619641,-1.536000,33.744528>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<40.619641,-1.536000,33.744528> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.619641,-1.536000,33.744528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,33.498784>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.373897,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,33.007300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.373897,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,33.375912>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.373897,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,33.498784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<40.116966,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,33.498784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<39.748353,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.625481,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,33.007300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.625481,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,33.621656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,33.130169>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.245681,-1.536000,33.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,33.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.122809,-1.536000,33.007300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<39.122809,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.122809,-1.536000,33.498784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<39.122809,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.500994,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.746738,-1.536000,33.007300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.500994,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.746738,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.869606,-1.536000,33.130169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.746738,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.869606,-1.536000,33.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.869606,-1.536000,33.375912>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<38.869606,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.869606,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.746738,-1.536000,33.498784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<38.746738,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.746738,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.500994,-1.536000,33.498784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.500994,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.500994,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378122,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.378122,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378122,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378122,-1.536000,33.253041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.378122,-1.536000,33.253041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.378122,-1.536000,33.253041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.869606,-1.536000,33.253041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<38.378122,-1.536000,33.253041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.121191,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.121191,-1.536000,33.498784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<38.121191,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.121191,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.752578,-1.536000,33.498784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<37.752578,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.752578,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.629706,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.629706,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.629706,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.629706,-1.536000,33.007300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.629706,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.372775,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.372775,-1.536000,33.498784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<37.372775,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.372775,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.004162,-1.536000,33.498784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<37.004162,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.004162,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.881291,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.881291,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.881291,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.881291,-1.536000,33.007300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.881291,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.501491,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.255747,-1.536000,33.498784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.255747,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.255747,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.132875,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.132875,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.132875,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.132875,-1.536000,33.007300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.132875,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.132875,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.501491,-1.536000,33.007300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<36.132875,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.501491,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.624359,-1.536000,33.130169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.501491,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.624359,-1.536000,33.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.501491,-1.536000,33.253041>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.501491,-1.536000,33.253041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.501491,-1.536000,33.253041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.132875,-1.536000,33.253041>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<36.132875,-1.536000,33.253041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.127528,-1.536000,33.744528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.127528,-1.536000,33.007300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.127528,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.127528,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.636044,-1.536000,33.007300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<34.636044,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.010500,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.256244,-1.536000,33.007300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.010500,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.256244,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.379113,-1.536000,33.130169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.256244,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.379113,-1.536000,33.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.379113,-1.536000,33.375912>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<34.379113,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.379113,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.256244,-1.536000,33.498784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<34.256244,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.256244,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.010500,-1.536000,33.498784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.010500,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.010500,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.887628,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.887628,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.887628,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.887628,-1.536000,33.253041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.887628,-1.536000,33.253041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.887628,-1.536000,33.253041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.379113,-1.536000,33.253041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<33.887628,-1.536000,33.253041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.630697,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.630697,-1.536000,33.498784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<33.630697,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.630697,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.262084,-1.536000,33.498784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<33.262084,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.262084,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.139212,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.139212,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.139212,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.139212,-1.536000,33.007300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.139212,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.636541,-1.536000,32.761559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.513669,-1.536000,32.761559>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<32.513669,-1.536000,32.761559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.513669,-1.536000,32.761559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.390797,-1.536000,32.884431>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<32.390797,-1.536000,32.884431> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.390797,-1.536000,32.884431>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.390797,-1.536000,33.498784>}
box{<0,0,-0.038100><0.614353,0.036000,0.038100> rotate<0,90.000000,0> translate<32.390797,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.390797,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.759413,-1.536000,33.498784>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<32.390797,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.759413,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.882281,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<32.759413,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.882281,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.882281,-1.536000,33.130169>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.882281,-1.536000,33.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.882281,-1.536000,33.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.759413,-1.536000,33.007300>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.759413,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.759413,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.390797,-1.536000,33.007300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<32.390797,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.010997,-1.536000,33.621656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.010997,-1.536000,33.130169>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.010997,-1.536000,33.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.010997,-1.536000,33.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.888125,-1.536000,33.007300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<31.888125,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.133866,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.888125,-1.536000,33.498784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<31.888125,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.634922,-1.536000,33.744528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.634922,-1.536000,33.007300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.634922,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.634922,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.512053,-1.536000,33.498784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<31.512053,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.512053,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.266309,-1.536000,33.498784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<31.266309,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.266309,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.143438,-1.536000,33.375912>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.143438,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.143438,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.143438,-1.536000,33.007300>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.143438,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886506,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.763638,-1.536000,33.498784>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<30.763638,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.763638,-1.536000,33.498784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.763638,-1.536000,33.375912>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.763638,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.763638,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886506,-1.536000,33.375912>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<30.763638,-1.536000,33.375912> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886506,-1.536000,33.375912>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886506,-1.536000,33.498784>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<30.886506,-1.536000,33.498784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886506,-1.536000,33.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.763638,-1.536000,33.130169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<30.763638,-1.536000,33.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.763638,-1.536000,33.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.763638,-1.536000,33.007300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.763638,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.763638,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886506,-1.536000,33.007300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<30.763638,-1.536000,33.007300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886506,-1.536000,33.007300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886506,-1.536000,33.130169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<30.886506,-1.536000,33.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,32.525328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<40.496769,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,32.156713>}
box{<0,0,-0.038100><0.521299,0.036000,0.038100> rotate<0,44.997273,0> translate<40.496769,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,32.156713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.373897,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,32.402456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.994097,-1.536000,32.525328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<39.994097,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.994097,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,32.525328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.748353,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,32.402456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.625481,-1.536000,32.402456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,32.402456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,32.279584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.625481,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,32.156713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<39.625481,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.871225,-1.536000,32.156713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<39.748353,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,32.033841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.625481,-1.536000,32.033841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,32.033841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,31.910969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.625481,-1.536000,31.910969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,31.910969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,31.788100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<39.625481,-1.536000,31.910969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.994097,-1.536000,31.788100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.748353,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.994097,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,31.910969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.994097,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,32.402456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,32.525328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<39.245681,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,32.525328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.999938,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,32.402456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.877066,-1.536000,32.402456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,32.402456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,32.279584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.877066,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,32.156713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.877066,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.122809,-1.536000,32.156713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<38.999938,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,32.033841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.877066,-1.536000,32.033841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,32.033841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,31.910969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.877066,-1.536000,31.910969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,31.910969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,31.788100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<38.877066,-1.536000,31.910969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,31.788100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.999938,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,31.910969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.245681,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,32.525328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.871719,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.625978,-1.536000,32.279584>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<37.625978,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.625978,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,32.525328>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<37.380234,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,31.788100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.380234,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,32.525328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.123303,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,32.156713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<36.631819,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,31.788100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.631819,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,32.279584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.883403,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,31.788100>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<35.883403,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,31.788100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.883403,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.878056,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386572,-1.536000,32.156713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<34.386572,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129641,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638156,-1.536000,32.156713>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<33.638156,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638156,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129641,-1.536000,31.788100>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<33.638156,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.632809,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.387069,-1.536000,32.525328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<32.387069,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.387069,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.387069,-1.536000,31.788100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.387069,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.632809,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.141325,-1.536000,31.788100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<32.141325,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.638653,-1.536000,32.402456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<31.392909,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.638653,-1.536000,32.402456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,32.156713>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<31.638653,-1.536000,32.402456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,31.910969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.884394,-1.536000,31.910969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,31.910969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,31.788100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.761525,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,31.788100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<31.515781,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,31.910969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<31.392909,-1.536000,31.910969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,31.910969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,32.033841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<31.392909,-1.536000,32.033841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,32.033841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,32.156713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.392909,-1.536000,32.033841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,32.156713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<31.515781,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,32.525328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<30.644494,-1.536000,32.525328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,32.525328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,32.156713>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.135978,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.890238,-1.536000,32.279584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<30.890238,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.890238,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,32.279584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<30.767366,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,32.156713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.644494,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,31.910969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.644494,-1.536000,31.910969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,31.910969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,31.788100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<30.644494,-1.536000,31.910969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,31.788100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<30.767366,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,31.910969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.013109,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,32.279584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<29.639147,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516278,-1.536000,32.279584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<29.516278,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516278,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,32.156713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.393406,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,31.788100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.393406,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.270534,-1.536000,32.279584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<29.270534,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.270534,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,32.156713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.147663,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,31.788100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.147663,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,31.788100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,32.279584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<28.890731,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.767862,-1.536000,32.279584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<28.767862,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.767862,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,32.156713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.644991,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,31.788100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.644991,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.522119,-1.536000,32.279584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<28.522119,-1.536000,32.279584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.522119,-1.536000,32.279584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,32.156713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.399247,-1.536000,32.156713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,32.156713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,31.788100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.399247,-1.536000,31.788100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,31.183256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,31.306128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<40.742513,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,31.306128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.496769,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,31.183256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.373897,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,31.183256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,31.060384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.373897,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.373897,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,30.814641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.373897,-1.536000,30.814641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,30.814641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,30.691769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.373897,-1.536000,30.691769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,30.691769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,30.568900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<40.373897,-1.536000,30.691769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,30.568900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.496769,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,30.691769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.742513,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,30.691769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,30.814641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<40.865381,-1.536000,30.814641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,30.814641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<40.742513,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,31.060384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<40.742513,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,31.183256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<40.865381,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,30.937513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.496769,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.871225,-1.536000,31.183256>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<39.625481,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.871225,-1.536000,31.183256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,30.937513>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<39.871225,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,30.691769>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.116966,-1.536000,30.691769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,30.691769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.994097,-1.536000,30.568900>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.994097,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.994097,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,30.568900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.748353,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,30.691769>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<39.625481,-1.536000,30.691769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,30.691769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,30.814641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<39.625481,-1.536000,30.814641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,30.814641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.625481,-1.536000,30.814641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.748353,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,30.937513>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<39.748353,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,31.183256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,31.306128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<39.245681,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,31.306128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.999938,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,31.183256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.877066,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,31.183256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,31.060384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.877066,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.877066,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,30.814641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.877066,-1.536000,30.814641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,30.814641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,30.691769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.877066,-1.536000,30.691769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,30.691769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,30.568900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<38.877066,-1.536000,30.691769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,30.568900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.999938,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,30.691769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.245681,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,30.691769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,30.814641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<39.368550,-1.536000,30.814641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,30.814641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<39.245681,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,31.060384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<39.245681,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,31.183256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<39.368550,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,30.937513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.999938,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,31.306128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.871719,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.625978,-1.536000,31.060384>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<37.625978,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.625978,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,31.306128>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<37.380234,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,30.568900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.380234,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,31.306128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.123303,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,30.937513>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<36.631819,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,30.568900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.631819,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,31.060384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.883403,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,30.568900>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<35.883403,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,30.568900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.883403,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.878056,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386572,-1.536000,30.937513>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<34.386572,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129641,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638156,-1.536000,30.937513>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<33.638156,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638156,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129641,-1.536000,30.568900>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<33.638156,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,31.183256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,31.306128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<31.761525,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,31.306128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<31.515781,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,31.183256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.392909,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,31.183256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,31.060384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.392909,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<31.392909,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,30.814641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.392909,-1.536000,30.814641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,30.814641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,30.691769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.392909,-1.536000,30.691769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,30.691769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,30.568900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<31.392909,-1.536000,30.691769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,30.568900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<31.515781,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,30.691769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.761525,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,30.691769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,30.814641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<31.884394,-1.536000,30.814641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,30.814641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<31.761525,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,31.060384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<31.761525,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,31.183256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<31.884394,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.761525,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.515781,-1.536000,30.937513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<31.515781,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,30.568900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<30.644494,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,31.060384>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<30.644494,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,31.183256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<30.644494,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,31.183256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,31.306128>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.644494,-1.536000,31.183256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,31.306128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<30.767366,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,31.306128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,31.183256>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<31.013109,-1.536000,31.306128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,31.060384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<29.639147,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516278,-1.536000,31.060384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<29.516278,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516278,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.393406,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,30.568900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.393406,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.270534,-1.536000,31.060384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<29.270534,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.270534,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.147663,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,30.568900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.147663,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,31.060384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<28.890731,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.767862,-1.536000,31.060384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<28.767862,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.767862,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.644991,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,30.568900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.644991,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.522119,-1.536000,31.060384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<28.522119,-1.536000,31.060384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.522119,-1.536000,31.060384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,30.937513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.399247,-1.536000,30.937513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,30.937513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,30.568900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.399247,-1.536000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,29.472569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,29.349700>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.742513,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,29.349700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.496769,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,29.472569>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<40.373897,-1.536000,29.472569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,29.472569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,29.964056>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<40.373897,-1.536000,29.964056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,29.964056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,30.086928>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.373897,-1.536000,29.964056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.496769,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,30.086928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.496769,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,29.964056>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<40.742513,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,29.964056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,29.841184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.865381,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.865381,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,29.718312>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<40.742513,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.742513,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.373897,-1.536000,29.718312>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<40.373897,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.871225,-1.536000,30.086928>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<39.871225,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.871225,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.871225,-1.536000,29.349700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.871225,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.116966,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.625481,-1.536000,29.349700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.625481,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,30.086928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<38.877066,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,29.718312>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.368550,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.122809,-1.536000,29.841184>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<39.122809,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.122809,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,29.841184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<38.999938,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,29.718312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.877066,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,29.472569>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.877066,-1.536000,29.472569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.877066,-1.536000,29.472569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,29.349700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<38.877066,-1.536000,29.472569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.999938,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,29.349700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.999938,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.245681,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.368550,-1.536000,29.472569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.245681,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,30.086928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.871719,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.871719,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.625978,-1.536000,29.841184>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<37.625978,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.625978,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,30.086928>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<37.380234,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.380234,-1.536000,29.349700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.380234,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,30.086928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.123303,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.123303,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,29.718312>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<36.631819,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.631819,-1.536000,29.349700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.631819,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,29.841184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.883403,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,29.349700>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<35.883403,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.374887,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.883403,-1.536000,29.349700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.883403,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.878056,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.386572,-1.536000,29.718312>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<34.386572,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129641,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638156,-1.536000,29.718312>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<33.638156,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.638156,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.129641,-1.536000,29.349700>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<33.638156,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,30.086928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<31.392909,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,29.964056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.392909,-1.536000,29.964056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.392909,-1.536000,29.964056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,29.472569>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,44.997212,0> translate<31.392909,-1.536000,29.964056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,29.472569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.884394,-1.536000,29.349700>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.884394,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,29.964056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,30.086928>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<31.013109,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,30.086928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<30.767366,-1.536000,30.086928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,30.086928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,29.964056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.644494,-1.536000,29.964056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,29.964056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,29.841184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.644494,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,29.718312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<30.644494,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,29.595441>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.644494,-1.536000,29.595441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,29.595441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,29.472569>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.644494,-1.536000,29.472569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.644494,-1.536000,29.472569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,29.349700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<30.644494,-1.536000,29.472569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,29.349700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<30.767366,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,29.472569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.013109,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,29.472569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,29.595441>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<31.135978,-1.536000,29.595441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,29.595441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,29.718312>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<31.013109,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,29.841184>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<31.013109,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.135978,-1.536000,29.964056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<31.135978,-1.536000,29.964056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.013109,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.767366,-1.536000,29.718312>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<30.767366,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,29.841184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<29.639147,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.639147,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516278,-1.536000,29.841184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<29.516278,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.516278,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,29.718312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.393406,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,29.349700>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.393406,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.393406,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.270534,-1.536000,29.841184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<29.270534,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.270534,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,29.718312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.147663,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.147663,-1.536000,29.349700>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.147663,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,29.349700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,29.841184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<28.890731,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.890731,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.767862,-1.536000,29.841184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<28.767862,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.767862,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,29.718312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.644991,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,29.349700>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.644991,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.644991,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.522119,-1.536000,29.841184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<28.522119,-1.536000,29.841184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.522119,-1.536000,29.841184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,29.718312>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.399247,-1.536000,29.718312> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,29.718312>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.399247,-1.536000,29.349700>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.399247,-1.536000,29.349700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.892800,0.000000,24.257497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.672397,0.000000,24.257497>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<5.892800,0.000000,24.257497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.282597,0.000000,24.647297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.282597,0.000000,23.867697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.282597,0.000000,23.867697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.231594,0.000000,24.257497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.011191,0.000000,24.257497>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<8.231594,0.000000,24.257497> }
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<58.629550,0.000000,4.616450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<58.629550,0.000000,3.981450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<58.629550,0.000000,3.346450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<55.454550,0.000000,4.616450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<55.454550,0.000000,3.981450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<55.454550,0.000000,3.346450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<57.042050,0.000000,3.981450>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-180.000000,0> translate<57.067450,0.000000,1.504950>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-180.000000,0> translate<57.067450,0.000000,5.251450>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-90.000000,0> translate<54.229000,0.000000,3.378200>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-90.000000,0> translate<59.893200,0.000000,3.378200>}
//BAT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.022000,-1.536000,26.670000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.022000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.022000,-1.536000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,36.322000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.022000,-1.536000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,26.670000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.547000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.826000,-1.536000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.166000,-1.536000,23.876000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.826000,-1.536000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.166000,-1.536000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.826000,-1.536000,39.116000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.826000,-1.536000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,-1.536000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,36.322000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.445000,-1.536000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,26.670000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<4.445000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,-1.536000,26.670000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.445000,-1.536000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.736000,-1.536000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,27.686000>}
box{<0,0,-0.203200><30.226000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.510000,-1.536000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,27.686000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,30.911800>}
box{<0,0,-0.203200><3.225800,0.036000,0.203200> rotate<0,90.000000,0> translate<16.510000,-1.536000,30.911800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,30.911800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,32.181800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<16.510000,-1.536000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,35.306000>}
box{<0,0,-0.203200><3.124200,0.036000,0.203200> rotate<0,90.000000,0> translate<16.510000,-1.536000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.736000,-1.536000,35.306000>}
box{<0,0,-0.203200><30.226000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.510000,-1.536000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.736000,-1.536000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.736000,-1.536000,27.686000>}
box{<0,0,-0.203200><7.620000,0.036000,0.203200> rotate<0,-90.000000,0> translate<46.736000,-1.536000,27.686000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,30.911800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.240000,-1.536000,30.911800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<15.240000,-1.536000,30.911800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.240000,-1.536000,30.911800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.240000,-1.536000,32.181800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<15.240000,-1.536000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<15.240000,-1.536000,32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.510000,-1.536000,32.181800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<15.240000,-1.536000,32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<45.593000,-1.536000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.323000,-1.536000,31.496000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<44.323000,-1.536000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.177000,-1.536000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.907000,-1.536000,31.496000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.907000,-1.536000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.542000,-1.536000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.542000,-1.536000,32.131000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<18.542000,-1.536000,32.131000> }
//BAT4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.445000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,3.556000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.445000,-1.536000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<4.445000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.166000,-1.536000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.826000,-1.536000,16.002000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.826000,-1.536000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.826000,-1.536000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.166000,-1.536000,0.762000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.826000,-1.536000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.022000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,3.556000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.022000,-1.536000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<58.547000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.022000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.022000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,12.192000>}
box{<0,0,-0.203200><30.226000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.256000,-1.536000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,12.192000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,8.966200>}
box{<0,0,-0.203200><3.225800,0.036000,0.203200> rotate<0,-90.000000,0> translate<46.482000,-1.536000,8.966200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<46.482000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,4.572000>}
box{<0,0,-0.203200><3.124200,0.036000,0.203200> rotate<0,-90.000000,0> translate<46.482000,-1.536000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,4.572000>}
box{<0,0,-0.203200><30.226000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.256000,-1.536000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,12.192000>}
box{<0,0,-0.203200><7.620000,0.036000,0.203200> rotate<0,90.000000,0> translate<16.256000,-1.536000,12.192000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<47.752000,-1.536000,8.966200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<46.482000,-1.536000,8.966200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<47.752000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<47.752000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<47.752000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<47.752000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<46.482000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<46.482000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.399000,-1.536000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.669000,-1.536000,8.382000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.399000,-1.536000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<43.815000,-1.536000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<45.085000,-1.536000,8.382000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<43.815000,-1.536000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.450000,-1.536000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.450000,-1.536000,7.747000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<44.450000,-1.536000,7.747000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.190000,0.000000,16.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.190000,0.000000,15.702000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.190000,0.000000,15.702000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.990000,0.000000,16.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.990000,0.000000,15.702000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.990000,0.000000,15.702000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.122000,0.000000,13.894000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.422000,0.000000,13.894000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.422000,0.000000,13.894000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.422000,0.000000,13.894000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.422000,0.000000,17.044000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.422000,0.000000,17.044000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.422000,0.000000,17.044000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.122000,0.000000,17.044000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.422000,0.000000,17.044000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.022000,0.000000,13.944000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.222000,0.000000,13.944000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.022000,0.000000,13.944000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.222000,0.000000,13.944000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.622000,0.000000,14.294000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<51.222000,0.000000,13.944000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.622000,0.000000,14.294000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.622000,0.000000,16.744000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.622000,0.000000,16.744000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.622000,0.000000,16.744000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.222000,0.000000,17.044000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<51.222000,0.000000,17.044000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.222000,0.000000,17.044000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.022000,0.000000,17.044000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.022000,0.000000,17.044000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.222000,0.000000,17.044000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.022000,0.000000,17.044000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.022000,0.000000,17.044000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.631000,0.000000,16.805000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.631000,0.000000,14.208000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.631000,0.000000,14.208000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.830000,0.000000,11.776000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.430000,0.000000,11.776000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.830000,0.000000,11.776000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.830000,0.000000,10.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.430000,0.000000,10.576000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.830000,0.000000,10.576000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.786000,0.000000,32.858000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.386000,0.000000,32.858000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.786000,0.000000,32.858000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.786000,0.000000,31.658000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.386000,0.000000,31.658000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.786000,0.000000,31.658000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.478000,0.000000,37.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,37.160000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.478000,0.000000,37.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,37.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,34.010000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.178000,0.000000,34.010000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,34.010000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.478000,0.000000,34.010000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.478000,0.000000,34.010000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,37.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,37.110000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,37.110000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,37.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,36.760000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<49.978000,0.000000,36.760000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,36.760000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,34.310000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.978000,0.000000,34.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,34.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,34.010000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<49.978000,0.000000,34.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,34.010000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,34.010000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,34.010000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,34.010000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,34.010000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,34.010000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.969000,0.000000,34.249000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.969000,0.000000,36.846000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.969000,0.000000,36.846000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.178000,0.000000,10.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.578000,0.000000,10.068000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.578000,0.000000,10.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.178000,0.000000,11.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.578000,0.000000,11.268000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.578000,0.000000,11.268000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.520000,0.000000,19.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.220000,0.000000,19.380000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.520000,0.000000,19.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.220000,0.000000,19.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.220000,0.000000,16.230000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<10.220000,0.000000,16.230000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.220000,0.000000,16.230000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.520000,0.000000,16.230000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.520000,0.000000,16.230000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.620000,0.000000,19.330000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.420000,0.000000,19.330000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.420000,0.000000,19.330000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.420000,0.000000,19.330000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.020000,0.000000,18.980000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<5.020000,0.000000,18.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.020000,0.000000,18.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.020000,0.000000,16.530000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.020000,0.000000,16.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.020000,0.000000,16.530000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.420000,0.000000,16.230000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<5.020000,0.000000,16.530000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.420000,0.000000,16.230000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.620000,0.000000,16.230000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.420000,0.000000,16.230000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.420000,0.000000,16.230000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.620000,0.000000,16.230000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.420000,0.000000,16.230000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.011000,0.000000,16.469000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.011000,0.000000,19.066000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<7.011000,0.000000,19.066000> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.888000,0.000000,14.594000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.888000,0.000000,12.894000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<19.888000,0.000000,12.894000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.888000,0.000000,12.894000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,12.894000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.738000,0.000000,12.894000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,12.894000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,14.594000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.738000,0.000000,14.594000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.838000,0.000000,16.494000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.838000,0.000000,17.694000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.838000,0.000000,17.694000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.838000,0.000000,17.694000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.488000,0.000000,18.094000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,48.810853,0> translate<19.488000,0.000000,18.094000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.488000,0.000000,18.094000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.038000,0.000000,18.094000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.038000,0.000000,18.094000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.038000,0.000000,18.094000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,17.694000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-53.126596,0> translate<16.738000,0.000000,17.694000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,17.694000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,16.494000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.738000,0.000000,16.494000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,17.694000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,16.494000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.738000,0.000000,16.494000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.977000,0.000000,16.103000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.574000,0.000000,16.103000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.977000,0.000000,16.103000> }
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.178000,0.000000,12.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.578000,0.000000,12.354000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.578000,0.000000,12.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.178000,0.000000,13.554000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.578000,0.000000,13.554000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.578000,0.000000,13.554000> }
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.316000,0.000000,13.508000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.316000,0.000000,12.908000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.316000,0.000000,12.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.116000,0.000000,13.508000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.116000,0.000000,12.908000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.116000,0.000000,12.908000> }
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.830000,0.000000,13.808000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.430000,0.000000,13.808000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.830000,0.000000,13.808000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.830000,0.000000,12.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.430000,0.000000,12.608000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.830000,0.000000,12.608000> }
//CT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.176400,0.000000,28.727400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.176400,0.000000,11.938000>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,-90.000000,0> translate<65.176400,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.176400,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.454800,0.000000,11.938000>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<57.454800,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.454800,0.000000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.454800,0.000000,28.727400>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,90.000000,0> translate<57.454800,0.000000,28.727400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.454800,0.000000,28.727400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.176400,0.000000,28.727400>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<57.454800,0.000000,28.727400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.516000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.436000,0.000000,20.320000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<59.436000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.516000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.246000,0.000000,21.590000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,44.997030,0> translate<63.246000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.246000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.246000,0.000000,19.050000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.246000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.246000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.516000,0.000000,20.320000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,-44.997030,0> translate<63.246000,0.000000,19.050000> }
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.148000,0.000000,15.410000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.688000,0.000000,15.410000>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.688000,0.000000,15.410000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.228000,0.000000,15.410000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.688000,0.000000,15.410000>}
box{<0,0,-0.101600><0.460000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.228000,0.000000,15.410000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.688000,0.000000,15.410000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.921800,0.000000,15.100000>}
box{<0,0,-0.101600><0.388281,0.036000,0.101600> rotate<0,52.973141,0> translate<43.688000,0.000000,15.410000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.662600,0.000000,15.394600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.469600,0.000000,15.100000>}
box{<0,0,-0.101600><0.352191,0.036000,0.101600> rotate<0,-56.766419,0> translate<43.469600,0.000000,15.100000> }
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.166000,0.000000,16.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.266000,0.000000,16.292000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.166000,0.000000,16.292000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.266000,0.000000,16.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.266000,0.000000,20.792000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.266000,0.000000,20.792000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.266000,0.000000,20.792000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.166000,0.000000,20.792000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.166000,0.000000,20.792000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.166000,0.000000,20.792000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.166000,0.000000,16.292000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.166000,0.000000,16.292000> }
difference{
cylinder{<12.716000,0,16.842000><12.716000,0.036000,16.842000>0.287100 translate<0,0.000000,0>}
cylinder{<12.716000,-0.1,16.842000><12.716000,0.135000,16.842000>0.160100 translate<0,0.000000,0>}}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<14.041000,0.000000,21.292000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<13.391000,0.000000,21.292000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<14.691000,0.000000,21.292000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<12.741000,0.000000,21.292000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<12.741000,0.000000,15.792000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<13.391000,0.000000,15.792000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<14.041000,0.000000,15.792000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<14.691000,0.000000,15.792000>}
//JP1 silk screen
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,4.572000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.336000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,4.572000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.241000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.876000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.241000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,2.032000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,2.667000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.336000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,4.572000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.161000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.796000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.161000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,4.572000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.796000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,4.572000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.701000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.336000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.701000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,2.032000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,2.667000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.796000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.256000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.256000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,2.032000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,4.572000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.511000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.781000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.416000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.781000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.876000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.876000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,2.032000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.511000,0.000000,2.032000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.606000,0.000000,3.302000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.066000,0.000000,3.302000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.526000,0.000000,3.302000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<25.146000,0.000000,3.302000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,27.305000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.447000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,29.210000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.447000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,29.845000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.447000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,31.750000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.447000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,32.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.447000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,34.290000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.447000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,26.670000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.637000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,27.305000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<16.002000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,28.575000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.002000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,29.210000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<16.002000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,29.845000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<16.002000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,31.115000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.002000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,31.750000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<16.002000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,32.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<16.002000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,33.655000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.002000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.002000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,34.290000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<16.002000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,29.210000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.637000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,31.750000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.637000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.637000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.447000,0.000000,34.290000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.637000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,33.655000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.082000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,31.115000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.082000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.082000,0.000000,28.575000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.082000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.417000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.417000,0.000000,27.305000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<21.417000,0.000000,27.305000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<19.812000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.272000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.272000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<19.812000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.272000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<19.812000,0.000000,33.020000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,7.366000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.336000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,7.366000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.241000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.876000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.241000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,5.461000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.336000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,7.366000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.161000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.796000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.161000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,7.366000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.796000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,7.366000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.701000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.336000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.701000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,5.461000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.796000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.256000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.256000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,7.366000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.511000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.781000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.416000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.781000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.876000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.876000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.511000,0.000000,4.826000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.606000,0.000000,6.096000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.066000,0.000000,6.096000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.526000,0.000000,6.096000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<25.146000,0.000000,6.096000>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,7.366000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.418000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,7.366000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.053000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.323000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.958000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.323000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.053000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,5.461000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.418000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,7.366000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.973000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.878000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,7.366000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.878000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,7.366000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.513000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.783000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.418000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.783000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.513000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,5.461000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.878000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.338000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.338000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.338000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.973000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,7.366000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.593000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.863000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,5.461000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.498000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.863000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.958000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,4.826000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.958000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,4.826000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.593000,0.000000,4.826000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<43.688000,0.000000,6.096000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.148000,0.000000,6.096000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<38.608000,0.000000,6.096000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<46.228000,0.000000,6.096000>}
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,4.572000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.418000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,4.572000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.053000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.323000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.958000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.323000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,2.032000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.053000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,2.667000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.418000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,4.572000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.973000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.878000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,4.572000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.878000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,4.572000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.513000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.783000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.418000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.418000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.783000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,2.032000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.513000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.878000,0.000000,2.667000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.878000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.338000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.338000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.338000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.338000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.973000,0.000000,2.032000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.973000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,4.572000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.593000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.863000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,3.937000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,2.667000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.498000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.863000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,3.937000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.958000,0.000000,3.937000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,2.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,2.032000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.958000,0.000000,2.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.863000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,2.032000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.593000,0.000000,2.032000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<43.688000,0.000000,3.302000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.148000,0.000000,3.302000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<38.608000,0.000000,3.302000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<46.228000,0.000000,3.302000>}
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,20.574000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,21.209000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<7.112000,0.000000,21.209000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,22.479000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.112000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,23.114000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.112000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.652000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.652000,0.000000,22.479000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.652000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.652000,0.000000,21.209000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.017000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.652000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,23.114000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<9.017000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,23.114000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,20.574000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.477000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,20.574000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.207000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.572000,0.000000,21.209000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<4.572000,0.000000,21.209000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.572000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.572000,0.000000,22.479000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<4.572000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.572000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,23.114000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.572000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,23.114000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.207000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.112000,0.000000,22.479000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.477000,0.000000,23.114000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<8.382000,0.000000,21.844000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.842000,0.000000,21.844000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.334000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.398000,0.000000,10.668000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.334000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.334000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.398000,0.000000,15.240000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.334000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.308600,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.308600,0.000000,10.871200>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<5.308600,0.000000,10.871200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.398000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.398000,0.000000,10.871200>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<9.398000,0.000000,10.871200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.334000,0.000000,15.036800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.334000,0.000000,15.240000>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<5.334000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.398000,0.000000,15.036800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.398000,0.000000,15.240000>}
box{<0,0,-0.063500><0.203200,0.036000,0.063500> rotate<0,90.000000,0> translate<9.398000,0.000000,15.240000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.100000,0.000000,22.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.500000,0.000000,22.260000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.500000,0.000000,22.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.100000,0.000000,23.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.500000,0.000000,23.460000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.500000,0.000000,23.460000> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.500000,0.000000,20.158000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.100000,0.000000,20.158000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.500000,0.000000,20.158000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.500000,0.000000,18.958000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.100000,0.000000,18.958000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.500000,0.000000,18.958000> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.620000,0.000000,23.022000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.020000,0.000000,23.022000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.020000,0.000000,23.022000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.620000,0.000000,24.222000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.020000,0.000000,24.222000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.020000,0.000000,24.222000> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.604000,0.000000,3.094000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.604000,0.000000,2.494000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.604000,0.000000,2.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.404000,0.000000,3.094000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.404000,0.000000,2.494000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.404000,0.000000,2.494000> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.088000,0.000000,11.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.088000,0.000000,11.984000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.088000,0.000000,11.984000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.288000,0.000000,11.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.288000,0.000000,11.984000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.288000,0.000000,11.984000> }
//RB1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.248000,0.000000,15.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.248000,0.000000,16.048000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.248000,0.000000,16.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.448000,0.000000,15.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.448000,0.000000,16.048000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.448000,0.000000,16.048000> }
//RB2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.248000,0.000000,22.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.248000,0.000000,22.652000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.248000,0.000000,22.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.448000,0.000000,22.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.448000,0.000000,22.652000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.448000,0.000000,22.652000> }
//SJ2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,21.844000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,21.844000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.145000,0.000000,20.066000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<19.939000,0.000000,20.066000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<19.939000,0.000000,21.590000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.145000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,20.066000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.891000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,20.066000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.193000,0.000000,20.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.939000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,19.812000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,20.828000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.018000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,20.828000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.558000,0.000000,20.828000> }
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<18.796000,0.000000,20.828000>}
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<18.288000,0.000000,20.828000>}
//SW2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,-1.536000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,-1.536000,17.399000>}
box{<0,0,-0.101600><11.684000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.718000,-1.536000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,-1.536000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,-1.536000,22.225000>}
box{<0,0,-0.101600><11.684000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.718000,-1.536000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,-1.536000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,-1.536000,21.463000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.402000,-1.536000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,-1.536000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,-1.536000,17.399000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.402000,-1.536000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,-1.536000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.402000,-1.536000,18.161000>}
box{<0,0,-0.101600><3.302000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.402000,-1.536000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,-1.536000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,-1.536000,18.161000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.718000,-1.536000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,-1.536000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,-1.536000,22.225000>}
box{<0,0,-0.101600><0.762000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.718000,-1.536000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,-1.536000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.718000,-1.536000,21.463000>}
box{<0,0,-0.101600><3.302000,0.036000,0.101600> rotate<0,90.000000,0> translate<29.718000,-1.536000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.462200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.462200,-1.536000,17.907000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<40.462200,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.462200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.547800,-1.536000,21.717000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<39.547800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.547800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.547800,-1.536000,21.717000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<39.547800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.462200,-1.536000,17.907000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.547800,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.192200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.192200,-1.536000,17.907000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<39.192200,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<39.192200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.277800,-1.536000,21.717000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<38.277800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.277800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.277800,-1.536000,21.717000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<38.277800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.277800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.192200,-1.536000,17.907000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<38.277800,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.922200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.922200,-1.536000,17.907000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<37.922200,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.922200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.007800,-1.536000,21.717000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<37.007800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.007800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.007800,-1.536000,21.717000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<37.007800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.922200,-1.536000,17.907000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<37.007800,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.652200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.652200,-1.536000,17.907000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<36.652200,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<36.652200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.737800,-1.536000,21.717000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<35.737800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.737800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.737800,-1.536000,21.717000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<35.737800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.737800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.652200,-1.536000,17.907000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<35.737800,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.382200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.382200,-1.536000,17.907000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<35.382200,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<35.382200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.467800,-1.536000,21.717000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<34.467800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.467800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.467800,-1.536000,21.717000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<34.467800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.467800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.382200,-1.536000,17.907000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<34.467800,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.112200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.112200,-1.536000,17.907000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<34.112200,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<34.112200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<33.197800,-1.536000,21.717000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<33.197800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<33.197800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<33.197800,-1.536000,21.717000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<33.197800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.197800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.112200,-1.536000,17.907000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<33.197800,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.842200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.842200,-1.536000,17.907000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<32.842200,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.842200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.927800,-1.536000,21.717000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<31.927800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.927800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.927800,-1.536000,21.717000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<31.927800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.927800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.842200,-1.536000,17.907000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<31.927800,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.572200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.572200,-1.536000,17.907000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,-90.000000,0> translate<31.572200,-1.536000,17.907000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.572200,-1.536000,21.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.657800,-1.536000,21.717000>}
box{<0,0,-0.088900><0.914400,0.036000,0.088900> rotate<0,0.000000,0> translate<30.657800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.657800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.657800,-1.536000,21.717000>}
box{<0,0,-0.088900><3.810000,0.036000,0.088900> rotate<0,90.000000,0> translate<30.657800,-1.536000,21.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.657800,-1.536000,17.907000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.572200,-1.536000,17.907000>}
box{<0,0,-0.076200><0.914400,0.036000,0.076200> rotate<0,0.000000,0> translate<30.657800,-1.536000,17.907000> }
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<40.005000,-1.536000,19.621500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<40.005000,-1.536000,18.986500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<40.005000,-1.536000,18.351500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<38.735000,-1.536000,19.621500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<38.735000,-1.536000,18.986500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<38.735000,-1.536000,18.351500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<37.465000,-1.536000,19.621500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<37.465000,-1.536000,18.986500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<37.465000,-1.536000,18.351500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<36.195000,-1.536000,19.621500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<36.195000,-1.536000,18.986500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<36.195000,-1.536000,18.351500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<34.925000,-1.536000,19.621500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<34.925000,-1.536000,18.986500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<34.925000,-1.536000,18.351500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<33.655000,-1.536000,19.621500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<33.655000,-1.536000,18.986500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<33.655000,-1.536000,18.351500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<32.385000,-1.536000,19.621500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<32.385000,-1.536000,18.986500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<32.385000,-1.536000,18.351500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<31.115000,-1.536000,19.621500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<31.115000,-1.536000,18.986500>}
box{<-0.254000,0,-0.190500><0.254000,0.036000,0.190500> rotate<0,-180.000000,0> translate<31.115000,-1.536000,18.351500>}
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.245000,0.000000,6.909000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.245000,0.000000,13.919000>}
box{<0,0,-0.101600><7.010000,0.036000,0.101600> rotate<0,90.000000,0> translate<28.245000,0.000000,13.919000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.245000,0.000000,13.919000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.255000,0.000000,13.919000>}
box{<0,0,-0.076200><7.010000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.245000,0.000000,13.919000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.255000,0.000000,13.919000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.255000,0.000000,7.264000>}
box{<0,0,-0.101600><6.655000,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.255000,0.000000,7.264000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.900000,0.000000,6.909000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.245000,0.000000,6.909000>}
box{<0,0,-0.101600><6.655000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.245000,0.000000,6.909000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.900000,0.000000,6.909000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.255000,0.000000,7.264000>}
box{<0,0,-0.101600><0.502046,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.900000,0.000000,6.909000> }
difference{
cylinder{<35.407600,0,6.731000><35.407600,0.036000,6.731000>0.254000 translate<0,0.000000,0>}
cylinder{<35.407600,-0.1,6.731000><35.407600,0.135000,6.731000>0.050800 translate<0,0.000000,0>}}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.801300,0.000000,7.614000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.801300,0.000000,8.414000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.801300,0.000000,9.214000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.801300,0.000000,10.014000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.801300,0.000000,10.814000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.801300,0.000000,11.614000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.801300,0.000000,12.414000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<35.801300,0.000000,13.214000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<34.550000,0.000000,14.465300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<33.750000,0.000000,14.465300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<32.950000,0.000000,14.465300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<32.150000,0.000000,14.465300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.350000,0.000000,14.465300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<30.550000,0.000000,14.465300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<29.750000,0.000000,14.465300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<28.950000,0.000000,14.465300>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.698700,0.000000,13.214000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.698700,0.000000,12.414000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.698700,0.000000,11.614000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.698700,0.000000,10.814000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.698700,0.000000,10.014000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.698700,0.000000,9.214000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.698700,0.000000,8.414000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<27.698700,0.000000,7.614000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<28.950000,0.000000,6.362700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<29.750000,0.000000,6.362700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<30.550000,0.000000,6.362700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.350000,0.000000,6.362700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<32.150000,0.000000,6.362700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<32.950000,0.000000,6.362700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<33.750000,0.000000,6.362700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<34.550000,0.000000,6.362700>}
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.902000,0.000000,20.194000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.202000,0.000000,20.194000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.202000,0.000000,20.194000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.902000,0.000000,36.194000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.202000,0.000000,36.194000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.202000,0.000000,36.194000> }
difference{
cylinder{<42.037000,0,21.209000><42.037000,0.036000,21.209000>0.444500 translate<0,0.000000,0>}
cylinder{<42.037000,-0.1,21.209000><42.037000,0.135000,21.209000>0.317500 translate<0,0.000000,0>}}
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.842000,0.000000,18.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.842000,0.000000,16.018000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.842000,0.000000,16.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.692000,0.000000,16.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.842000,0.000000,16.018000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.692000,0.000000,16.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.692000,0.000000,18.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.842000,0.000000,18.018000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<39.692000,0.000000,18.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.342000,0.000000,18.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.342000,0.000000,16.018000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.342000,0.000000,16.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.342000,0.000000,16.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.492000,0.000000,16.018000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.342000,0.000000,16.018000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.342000,0.000000,18.018000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.492000,0.000000,18.018000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.342000,0.000000,18.018000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.842000,0.000000,16.018000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.342000,0.000000,16.018000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.342000,0.000000,16.018000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.342000,0.000000,16.018000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.342000,0.000000,18.018000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.342000,0.000000,18.018000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.342000,0.000000,18.018000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.842000,0.000000,18.018000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.342000,0.000000,18.018000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.842000,0.000000,18.018000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.842000,0.000000,16.018000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.842000,0.000000,16.018000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  M328P_RFM69_NODE(-33.020000,0,-19.939000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//BAT3	1.5V - AA	BATTERY-AA-KIT
//BAT4	1.5V - AA	BATTERY-AA-KIT
//CT1	MUTUAL	MUTUAL
//JP1	ANTENNA	LUXEON-PAD
//SW2	Node ID	DIPSWITCH-08-50MIL
