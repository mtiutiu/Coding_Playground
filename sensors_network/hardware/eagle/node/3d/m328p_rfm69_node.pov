//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/Work/AVR_Playground/sensors_network/hardware/eagle/node/m328p_rfm69_node.brd
//4/11/16 4:23 PM

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
#local cam_y = 204;
#local cam_z = -85;
#local cam_a = 35;
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
#local lgt1_pos_y = 36;
#local lgt1_pos_z = 19;
#local lgt1_intense = 0.734142;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 36;
#local lgt2_pos_z = 19;
#local lgt2_intense = 0.734142;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 36;
#local lgt3_pos_z = -13;
#local lgt3_intense = 0.734142;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 36;
#local lgt4_pos_z = -13;
#local lgt4_intense = 0.734142;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 64.008000;
#declare pcb_y_size = 37.338000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(376);
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
	//translate<-32.004000,0,-18.669000>
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
box{<62.992000,0,37.084000><-1.016000,-1.500000,-0.254000> texture{col_brd}}

//Holes(real)/Parts
//Holes(real)/Board
cylinder{<1.016000,1,35.052000><1.016000,-5,35.052000>1.500000 texture{col_hls}}
cylinder{<1.016000,1,1.778000><1.016000,-5,1.778000>1.500000 texture{col_hls}}
cylinder{<60.706000,1,2.032000><60.706000,-5,2.032000>1.500000 texture{col_hls}}
cylinder{<60.706000,1,35.052000><60.706000,-5,35.052000>1.500000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.812000,0.000000,14.986000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100n 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<47.244000,0.000000,14.478000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C2 10uF EIA3528
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.352000,0.000000,9.144000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C4 100n 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<52.070000,0.000000,29.210000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.530000,0.000000,33.782000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C6 10uF EIA3528
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<38.100000,0.000000,8.890000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C7 100n 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<5.842000,0.000000,19.558000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C8 47uF EIA3528
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.510000,0.000000,15.240000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C9 47uF EIA3528
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<38.100000,0.000000,11.430000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C10 100n 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<12.446000,0.000000,11.938000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 100n 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.352000,0.000000,11.430000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_TSSOP8("L6920TSSOP8","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.938000,0.000000,17.526000>translate<0,0.035000,0> }#end		//TSSOP8 IC2 L6920TSSOP8 TSSOP8
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<7.874000,0.000000,35.306000>}#end		//Header 2,54mm Grid 1Pin 1Row (jumper.lib) JP1 ANT 1X01
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.796000,0.000000,2.286000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP2 HTU21D 1X04
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.526000,0.000000,29.972000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) JP3 AVR_SPI_PRG_6NS 2X3-NS
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.796000,0.000000,5.334000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP4 OTHER 1X04
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<41.402000,0.000000,5.334000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP5 OTHER 1X04
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<41.402000,0.000000,2.286000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP6 OTHER 1X04
#ifndef(pack_L1) #declare global_pack_L1=yes; object {SPC_L_MURATA_2012_LQH3C("10uH",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<5.842000,0.000000,13.970000>}#end		//Inductor MURATA Chip Coil L1 10uH DLJ-4018
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.022000,0.000000,21.844000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 100K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<49.022000,0.000000,19.304000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 100K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<31.242000,0.000000,2.794000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_RB1) #declare global_pack_RB1=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<52.070000,0.000000,14.732000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB1 470 0805
#ifndef(pack_RB2) #declare global_pack_RB2=yes; object {RES_SMD_CHIP_0805("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<52.070000,0.000000,21.336000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB2 330 0805
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ1 V_BOOST1
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ2 V_BOOST2
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("ATMEGA328P_TQFP","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<29.972000,0.000000,9.398000>translate<0,0.035000,0> }#end		//TQFP-32 U1 ATMEGA328P_TQFP TQFP32-08
#ifndef(pack_U2) #declare global_pack_U2=yes; object {RFM69HW_SMD("RFM69W",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<33.528000,0.000000,25.400000>}#end		//RFM69HW SMD U2 RFM69W RFM69W
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {RESONATOR_SMD("8MHz",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<38.100000,0.000000,14.478000>}#end		//RESONATOR SMD Y1 8MHz RESONATOR-SMD_MED
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<55.372000,0,28.956000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<48.260000,0,28.956000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<5.080000,0,28.956000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<12.192000,0,28.956000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<5.080000,0,7.874000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<12.192000,0,7.874000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<55.372000,0,7.874000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<48.260000,0,7.874000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.812000,0.000000,15.886000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.812000,0.000000,14.086000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.894000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.594000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.452000,0.000000,9.144000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.252000,0.000000,9.144000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.170000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.970000,0.000000,29.210000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<47.880000,0.000000,33.782000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<51.180000,0.000000,33.782000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.000000,0.000000,8.890000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.200000,0.000000,8.890000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<4.192000,0.000000,19.558000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.492000,0.000000,19.558000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.510000,0.000000,16.890000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.510000,0.000000,13.590000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.000000,0.000000,11.430000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.200000,0.000000,11.430000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.346000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.546000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.452000,0.000000,11.430000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.252000,0.000000,11.430000>}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.928000,0,24.942000> texture{col_thl}}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.928000,0,12.142000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.963000,0.000000,14.626000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.613000,0.000000,14.626000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.263000,0.000000,14.626000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.913000,0.000000,14.626000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.913000,0.000000,20.426000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.263000,0.000000,20.426000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.613000,0.000000,20.426000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.963000,0.000000,20.426000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<7.874000,0,35.306000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<14.986000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<17.526000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<20.066000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<22.606000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<18.796000,0,27.432000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.256000,0,27.432000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<18.796000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.256000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<18.796000,0,32.512000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.256000,0,32.512000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<14.986000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<17.526000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<20.066000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<22.606000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<37.592000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<40.132000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<42.672000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<45.212000,0,5.334000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<37.592000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<40.132000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<42.672000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<45.212000,0,2.286000> texture{col_thl}}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.342000,0.000000,13.970000>}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<4.342000,0.000000,13.970000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.922000,0.000000,21.844000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<48.122000,0.000000,21.844000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<48.122000,0.000000,19.304000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.922000,0.000000,19.304000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.342000,0.000000,2.794000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.142000,0.000000,2.794000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.070000,0.000000,13.832000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.070000,0.000000,15.632000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.070000,0.000000,20.436000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.070000,0.000000,22.236000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.160000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.636000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.112000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.510000,0.000000,20.574000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<16.510000,0.000000,22.098000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.264600,0.000000,6.598000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.264600,0.000000,7.398000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.264600,0.000000,8.198000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.264600,0.000000,8.998000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.264600,0.000000,9.798000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.264600,0.000000,10.598000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.264600,0.000000,11.398000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.264600,0.000000,12.198000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.772000,0.000000,13.690600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.972000,0.000000,13.690600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.172000,0.000000,13.690600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.372000,0.000000,13.690600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.572000,0.000000,13.690600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.772000,0.000000,13.690600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.972000,0.000000,13.690600>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.172000,0.000000,13.690600>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.679400,0.000000,12.198000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.679400,0.000000,11.398000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.679400,0.000000,10.598000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.679400,0.000000,9.798000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.679400,0.000000,8.998000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.679400,0.000000,8.198000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.679400,0.000000,7.398000>}
object{TOOLS_PCB_SMD(1.270000,0.558800,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.679400,0.000000,6.598000>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.172000,0.000000,5.105400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.972000,0.000000,5.105400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.772000,0.000000,5.105400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.572000,0.000000,5.105400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.372000,0.000000,5.105400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.172000,0.000000,5.105400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.972000,0.000000,5.105400>}
object{TOOLS_PCB_SMD(0.558800,1.270000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.772000,0.000000,5.105400>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.378000,0.000000,18.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.378000,0.000000,20.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.378000,0.000000,22.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.378000,0.000000,24.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.378000,0.000000,26.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.378000,0.000000,28.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.378000,0.000000,30.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.378000,0.000000,32.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.678000,0.000000,32.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.678000,0.000000,30.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.678000,0.000000,28.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.678000,0.000000,26.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.678000,0.000000,24.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.678000,0.000000,22.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.678000,0.000000,20.400000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.678000,0.000000,18.400000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.600000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.100000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.600000,0.000000,14.478000>}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
//Text
//Rect
union{
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<38.100000,0.000000,13.428000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<38.100000,0.000000,15.528000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<39.600000,0.000000,13.428000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<39.600000,0.000000,15.528000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<36.600000,0.000000,13.428000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<36.600000,0.000000,15.528000>}
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<55.372000,0.038000,28.956000><55.372000,-1.538000,28.956000>0.927100}
cylinder{<48.260000,0.038000,28.956000><48.260000,-1.538000,28.956000>0.927100}
cylinder{<5.080000,0.038000,28.956000><5.080000,-1.538000,28.956000>0.927100}
cylinder{<12.192000,0.038000,28.956000><12.192000,-1.538000,28.956000>0.927100}
cylinder{<5.080000,0.038000,7.874000><5.080000,-1.538000,7.874000>0.927100}
cylinder{<12.192000,0.038000,7.874000><12.192000,-1.538000,7.874000>0.927100}
cylinder{<55.372000,0.038000,7.874000><55.372000,-1.538000,7.874000>0.927100}
cylinder{<48.260000,0.038000,7.874000><48.260000,-1.538000,7.874000>0.927100}
cylinder{<58.928000,0.038000,24.942000><58.928000,-1.538000,24.942000>0.508000}
cylinder{<58.928000,0.038000,12.142000><58.928000,-1.538000,12.142000>0.508000}
cylinder{<7.874000,0.038000,35.306000><7.874000,-1.538000,35.306000>0.508000}
cylinder{<14.986000,0.038000,2.286000><14.986000,-1.538000,2.286000>0.508000}
cylinder{<17.526000,0.038000,2.286000><17.526000,-1.538000,2.286000>0.508000}
cylinder{<20.066000,0.038000,2.286000><20.066000,-1.538000,2.286000>0.508000}
cylinder{<22.606000,0.038000,2.286000><22.606000,-1.538000,2.286000>0.508000}
cylinder{<18.796000,0.038000,27.432000><18.796000,-1.538000,27.432000>0.508000}
cylinder{<16.256000,0.038000,27.432000><16.256000,-1.538000,27.432000>0.508000}
cylinder{<18.796000,0.038000,29.972000><18.796000,-1.538000,29.972000>0.508000}
cylinder{<16.256000,0.038000,29.972000><16.256000,-1.538000,29.972000>0.508000}
cylinder{<18.796000,0.038000,32.512000><18.796000,-1.538000,32.512000>0.508000}
cylinder{<16.256000,0.038000,32.512000><16.256000,-1.538000,32.512000>0.508000}
cylinder{<14.986000,0.038000,5.334000><14.986000,-1.538000,5.334000>0.508000}
cylinder{<17.526000,0.038000,5.334000><17.526000,-1.538000,5.334000>0.508000}
cylinder{<20.066000,0.038000,5.334000><20.066000,-1.538000,5.334000>0.508000}
cylinder{<22.606000,0.038000,5.334000><22.606000,-1.538000,5.334000>0.508000}
cylinder{<37.592000,0.038000,5.334000><37.592000,-1.538000,5.334000>0.508000}
cylinder{<40.132000,0.038000,5.334000><40.132000,-1.538000,5.334000>0.508000}
cylinder{<42.672000,0.038000,5.334000><42.672000,-1.538000,5.334000>0.508000}
cylinder{<45.212000,0.038000,5.334000><45.212000,-1.538000,5.334000>0.508000}
cylinder{<37.592000,0.038000,2.286000><37.592000,-1.538000,2.286000>0.508000}
cylinder{<40.132000,0.038000,2.286000><40.132000,-1.538000,2.286000>0.508000}
cylinder{<42.672000,0.038000,2.286000><42.672000,-1.538000,2.286000>0.508000}
cylinder{<45.212000,0.038000,2.286000><45.212000,-1.538000,2.286000>0.508000}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//BAT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.277000,-1.536000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.752000,-1.536000,24.130000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<47.752000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.752000,-1.536000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.277000,-1.536000,33.782000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<47.752000,-1.536000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.277000,-1.536000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.277000,-1.536000,24.130000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<57.277000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.556000,-1.536000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.896000,-1.536000,21.336000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.556000,-1.536000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.896000,-1.536000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.556000,-1.536000,36.576000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.556000,-1.536000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,-1.536000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,-1.536000,33.782000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<3.175000,-1.536000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,-1.536000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,-1.536000,24.130000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<3.175000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,-1.536000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,-1.536000,24.130000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<3.175000,-1.536000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.196000,-1.536000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,26.416000>}
box{<0,0,-0.203200><26.670000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.526000,-1.536000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,28.371800>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,90.000000,0> translate<17.526000,-1.536000,28.371800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,28.371800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,29.641800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<17.526000,-1.536000,29.641800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,29.641800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,31.496000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,90.000000,0> translate<17.526000,-1.536000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.196000,-1.536000,31.496000>}
box{<0,0,-0.203200><26.670000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.526000,-1.536000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.196000,-1.536000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.196000,-1.536000,26.416000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,-90.000000,0> translate<44.196000,-1.536000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,28.371800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,28.371800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.256000,-1.536000,28.371800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,28.371800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,29.641800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<16.256000,-1.536000,29.641800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,29.641800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.526000,-1.536000,29.641800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.256000,-1.536000,29.641800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.291000,-1.536000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.021000,-1.536000,28.956000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<41.021000,-1.536000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<20.701000,-1.536000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.431000,-1.536000,28.956000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<19.431000,-1.536000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<20.066000,-1.536000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<20.066000,-1.536000,29.591000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<20.066000,-1.536000,29.591000> }
//BAT4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,-1.536000,12.700000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<3.175000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,-1.536000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,-1.536000,3.048000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<3.175000,-1.536000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,-1.536000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<3.175000,-1.536000,12.700000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<3.175000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.896000,-1.536000,15.494000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.556000,-1.536000,15.494000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.556000,-1.536000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.556000,-1.536000,0.254000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.896000,-1.536000,0.254000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.556000,-1.536000,0.254000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.752000,-1.536000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.277000,-1.536000,3.048000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<47.752000,-1.536000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.277000,-1.536000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.277000,-1.536000,12.700000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<57.277000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.277000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.752000,-1.536000,12.700000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<47.752000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,10.414000>}
box{<0,0,-0.203200><26.670000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.256000,-1.536000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,8.458200>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,-90.000000,0> translate<42.926000,-1.536000,8.458200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,8.458200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,7.188200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<42.926000,-1.536000,7.188200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,7.188200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,5.334000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,-90.000000,0> translate<42.926000,-1.536000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,5.334000>}
box{<0,0,-0.203200><26.670000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.256000,-1.536000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,10.414000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,90.000000,0> translate<16.256000,-1.536000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,8.458200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.196000,-1.536000,8.458200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<42.926000,-1.536000,8.458200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.196000,-1.536000,8.458200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.196000,-1.536000,7.188200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<44.196000,-1.536000,7.188200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<44.196000,-1.536000,7.188200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,7.188200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<42.926000,-1.536000,7.188200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.161000,-1.536000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.431000,-1.536000,7.874000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<18.161000,-1.536000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.751000,-1.536000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.021000,-1.536000,7.874000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<39.751000,-1.536000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<40.386000,-1.536000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<40.386000,-1.536000,7.239000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<40.386000,-1.536000,7.239000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.412000,0.000000,15.286000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.412000,0.000000,14.686000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.412000,0.000000,14.686000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.212000,0.000000,15.286000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.212000,0.000000,14.686000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.212000,0.000000,14.686000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.344000,0.000000,12.878000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.644000,0.000000,12.878000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.644000,0.000000,12.878000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.644000,0.000000,12.878000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.644000,0.000000,16.028000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,90.000000,0> translate<44.644000,0.000000,16.028000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.644000,0.000000,16.028000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.344000,0.000000,16.028000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.644000,0.000000,16.028000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.244000,0.000000,12.928000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.444000,0.000000,12.928000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.244000,0.000000,12.928000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.444000,0.000000,12.928000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.844000,0.000000,13.278000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<49.444000,0.000000,12.928000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.844000,0.000000,13.278000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.844000,0.000000,15.728000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,90.000000,0> translate<49.844000,0.000000,15.728000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.844000,0.000000,15.728000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.444000,0.000000,16.028000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<49.444000,0.000000,16.028000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.444000,0.000000,16.028000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.244000,0.000000,16.028000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.244000,0.000000,16.028000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.444000,0.000000,16.028000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.244000,0.000000,16.028000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.244000,0.000000,16.028000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.853000,0.000000,15.789000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.853000,0.000000,13.192000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,-90.000000,0> translate<47.853000,0.000000,13.192000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,9.744000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,9.744000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,9.744000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,8.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,8.544000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,8.544000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.770000,0.000000,29.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.370000,0.000000,29.810000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.770000,0.000000,29.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.770000,0.000000,28.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.370000,0.000000,28.610000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.770000,0.000000,28.610000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.430000,0.000000,35.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.130000,0.000000,35.382000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.430000,0.000000,35.382000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.130000,0.000000,35.382000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.130000,0.000000,32.232000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<52.130000,0.000000,32.232000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<52.130000,0.000000,32.232000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.430000,0.000000,32.232000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.430000,0.000000,32.232000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.530000,0.000000,35.332000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.330000,0.000000,35.332000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.330000,0.000000,35.332000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.330000,0.000000,35.332000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.930000,0.000000,34.982000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<46.930000,0.000000,34.982000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.930000,0.000000,34.982000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.930000,0.000000,32.532000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.930000,0.000000,32.532000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.930000,0.000000,32.532000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.330000,0.000000,32.232000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<46.930000,0.000000,32.532000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.330000,0.000000,32.232000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.530000,0.000000,32.232000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.330000,0.000000,32.232000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.330000,0.000000,32.232000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.530000,0.000000,32.232000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.330000,0.000000,32.232000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.921000,0.000000,32.471000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.921000,0.000000,35.068000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<48.921000,0.000000,35.068000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,8.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,8.290000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,8.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,9.490000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,9.490000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,9.490000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.742000,0.000000,21.158000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.442000,0.000000,21.158000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.742000,0.000000,21.158000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.442000,0.000000,21.158000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.442000,0.000000,18.008000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<8.442000,0.000000,18.008000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.442000,0.000000,18.008000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.742000,0.000000,18.008000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.742000,0.000000,18.008000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.842000,0.000000,21.108000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.642000,0.000000,21.108000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.642000,0.000000,21.108000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.642000,0.000000,21.108000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.242000,0.000000,20.758000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<3.242000,0.000000,20.758000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.242000,0.000000,20.758000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.242000,0.000000,18.308000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.242000,0.000000,18.308000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.242000,0.000000,18.308000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.642000,0.000000,18.008000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<3.242000,0.000000,18.308000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.642000,0.000000,18.008000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.842000,0.000000,18.008000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.642000,0.000000,18.008000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.642000,0.000000,18.008000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.842000,0.000000,18.008000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.642000,0.000000,18.008000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.233000,0.000000,18.247000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.233000,0.000000,20.844000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<5.233000,0.000000,20.844000> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.110000,0.000000,14.340000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.110000,0.000000,12.640000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<18.110000,0.000000,12.640000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.110000,0.000000,12.640000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.960000,0.000000,12.640000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.960000,0.000000,12.640000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.960000,0.000000,12.640000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.960000,0.000000,14.340000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.960000,0.000000,14.340000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.060000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.060000,0.000000,17.440000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<18.060000,0.000000,17.440000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.060000,0.000000,17.440000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.710000,0.000000,17.840000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,48.810853,0> translate<17.710000,0.000000,17.840000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.710000,0.000000,17.840000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.260000,0.000000,17.840000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.260000,0.000000,17.840000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.260000,0.000000,17.840000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.960000,0.000000,17.440000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-53.126596,0> translate<14.960000,0.000000,17.440000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.960000,0.000000,17.440000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.960000,0.000000,16.240000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.960000,0.000000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.960000,0.000000,17.440000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.960000,0.000000,16.240000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.960000,0.000000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.199000,0.000000,15.849000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.796000,0.000000,15.849000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.199000,0.000000,15.849000> }
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,10.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,10.830000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,10.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,12.030000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,12.030000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,12.030000> }
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.746000,0.000000,11.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.146000,0.000000,11.338000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.146000,0.000000,11.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.746000,0.000000,12.538000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.146000,0.000000,12.538000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.146000,0.000000,12.538000> }
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,12.030000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,12.030000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,12.030000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,10.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,10.830000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,10.830000> }
//CT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.128400,0.000000,26.949400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.128400,0.000000,10.160000>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,-90.000000,0> translate<62.128400,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.128400,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.406800,0.000000,10.160000>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<54.406800,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.406800,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.406800,0.000000,26.949400>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,90.000000,0> translate<54.406800,0.000000,26.949400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.406800,0.000000,26.949400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.128400,0.000000,26.949400>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<54.406800,0.000000,26.949400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.388000,0.000000,18.542000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<56.388000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.198000,0.000000,19.812000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,44.997030,0> translate<60.198000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.198000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.198000,0.000000,17.272000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<60.198000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.198000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,18.542000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,-44.997030,0> translate<60.198000,0.000000,17.272000> }
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.388000,0.000000,15.276000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.488000,0.000000,15.276000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.388000,0.000000,15.276000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.488000,0.000000,15.276000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.488000,0.000000,19.776000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.488000,0.000000,19.776000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.488000,0.000000,19.776000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.388000,0.000000,19.776000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.388000,0.000000,19.776000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.388000,0.000000,19.776000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.388000,0.000000,15.276000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.388000,0.000000,15.276000> }
difference{
cylinder{<10.938000,0,15.826000><10.938000,0.036000,15.826000>0.287100 translate<0,0.000000,0>}
cylinder{<10.938000,-0.1,15.826000><10.938000,0.135000,15.826000>0.160100 translate<0,0.000000,0>}}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<12.263000,0.000000,20.276000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<11.613000,0.000000,20.276000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<12.913000,0.000000,20.276000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<10.963000,0.000000,20.276000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<10.963000,0.000000,14.776000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<11.613000,0.000000,14.776000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<12.263000,0.000000,14.776000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<12.913000,0.000000,14.776000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,36.576000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,35.941000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<8.509000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,34.671000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.144000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,34.036000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.509000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,34.671000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,35.941000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.604000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,34.036000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<6.604000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,34.036000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,0.000000,34.036000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<7.874000,0.000000,35.306000>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.796000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.701000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.336000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.701000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.796000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<15.621000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.621000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.256000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.161000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.796000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.161000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.256000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.716000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.716000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<13.716000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.241000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.876000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.241000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.336000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.336000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,1.016000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.066000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.526000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<14.986000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.606000,0.000000,2.286000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,26.797000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.431000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,28.702000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.431000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,29.337000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.431000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,31.242000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.431000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,31.877000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.431000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,33.782000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.431000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,26.162000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.621000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,26.797000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.986000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,28.067000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.986000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,28.702000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.986000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,29.337000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.986000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,30.607000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.986000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,31.242000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.986000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,31.877000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.986000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,33.147000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.986000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.986000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,33.782000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.986000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,28.702000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.621000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,31.242000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.621000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.621000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.431000,0.000000,33.782000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.621000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,33.147000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.066000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,30.607000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.066000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.066000,0.000000,28.067000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.066000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.401000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.401000,0.000000,26.797000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<20.401000,0.000000,26.797000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<18.796000,0.000000,27.432000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.256000,0.000000,27.432000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.256000,0.000000,29.972000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<18.796000,0.000000,29.972000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.256000,0.000000,32.512000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<18.796000,0.000000,32.512000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,6.604000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.796000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,6.604000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.701000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.336000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.701000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,4.064000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.796000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,6.604000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<15.621000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.621000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,6.604000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.256000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,6.604000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.161000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.796000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.161000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,4.064000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.256000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.716000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.716000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<13.716000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,4.064000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,6.604000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.241000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.876000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.241000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.336000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.336000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,4.064000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,4.064000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.066000,0.000000,5.334000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.526000,0.000000,5.334000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<14.986000,0.000000,5.334000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.606000,0.000000,5.334000>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,6.604000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.402000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,6.604000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.037000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.307000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.942000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.307000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,4.064000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.037000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.402000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,6.604000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.227000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.862000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.227000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,6.604000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.862000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,6.604000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.402000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,4.064000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,4.699000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.862000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.322000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.322000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.322000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,4.064000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,6.604000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.577000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<45.847000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,5.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,4.699000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.482000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.847000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,5.969000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.942000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,4.064000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.942000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,4.064000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.577000,0.000000,4.064000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<42.672000,0.000000,5.334000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<40.132000,0.000000,5.334000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<37.592000,0.000000,5.334000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<45.212000,0.000000,5.334000>}
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.402000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.037000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.307000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.942000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.307000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.037000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.402000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.227000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.862000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.227000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.862000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.402000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.402000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.497000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.862000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.862000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.322000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.322000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.322000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.322000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.577000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<45.847000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.482000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.847000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.942000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.942000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.942000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.847000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.577000,0.000000,1.016000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<42.672000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<40.132000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<37.592000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<45.212000,0.000000,2.286000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.842000,0.000000,11.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.842000,0.000000,11.970000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.842000,0.000000,11.970000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.842000,0.000000,11.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.842000,0.000000,15.970000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<7.842000,0.000000,15.970000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.842000,0.000000,15.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.842000,0.000000,11.970000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.842000,0.000000,11.970000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.842000,0.000000,15.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.842000,0.000000,15.970000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.842000,0.000000,15.970000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.322000,0.000000,21.244000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.722000,0.000000,21.244000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.722000,0.000000,21.244000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.322000,0.000000,22.444000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.722000,0.000000,22.444000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.722000,0.000000,22.444000> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.722000,0.000000,19.904000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.322000,0.000000,19.904000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.722000,0.000000,19.904000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.722000,0.000000,18.704000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.322000,0.000000,18.704000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.722000,0.000000,18.704000> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.942000,0.000000,3.394000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.542000,0.000000,3.394000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.942000,0.000000,3.394000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.942000,0.000000,2.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.542000,0.000000,2.194000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.942000,0.000000,2.194000> }
//RB1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.470000,0.000000,14.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.470000,0.000000,15.032000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.470000,0.000000,15.032000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.670000,0.000000,14.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.670000,0.000000,15.032000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.670000,0.000000,15.032000> }
//RB2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.470000,0.000000,21.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.470000,0.000000,21.636000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.470000,0.000000,21.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.670000,0.000000,21.036000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.670000,0.000000,21.636000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.670000,0.000000,21.636000> }
//SJ1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,25.400000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.477000,0.000000,25.400000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.477000,0.000000,23.622000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<10.795000,0.000000,23.622000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<10.795000,0.000000,25.146000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.477000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,23.622000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.223000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,23.622000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.049000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,23.368000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.477000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,24.384000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.350000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,24.384000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,23.368000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.636000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,25.146000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.636000,0.000000,25.146000> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<7.620000,0.000000,24.384000>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<9.652000,0.000000,24.384000>}
box{<-0.508000,0,-0.762000><0.508000,0.036000,0.762000> rotate<0,-180.000000,0> translate<8.636000,0.000000,24.384000>}
//SJ2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,19.939000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.526000,0.000000,19.939000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<15.748000,0.000000,22.733000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<15.748000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<17.272000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<17.272000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,22.987000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.748000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.272000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.748000,0.000000,19.685000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.748000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,22.733000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.494000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,22.860000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.510000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,19.812000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,19.812000> }
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<16.510000,0.000000,21.082000>}
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<16.510000,0.000000,21.590000>}
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.467000,0.000000,5.893000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.467000,0.000000,12.903000>}
box{<0,0,-0.101600><7.010000,0.036000,0.101600> rotate<0,90.000000,0> translate<26.467000,0.000000,12.903000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.467000,0.000000,12.903000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.477000,0.000000,12.903000>}
box{<0,0,-0.076200><7.010000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.467000,0.000000,12.903000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.477000,0.000000,12.903000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.477000,0.000000,6.248000>}
box{<0,0,-0.101600><6.655000,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.477000,0.000000,6.248000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.122000,0.000000,5.893000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.467000,0.000000,5.893000>}
box{<0,0,-0.101600><6.655000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.467000,0.000000,5.893000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.122000,0.000000,5.893000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.477000,0.000000,6.248000>}
box{<0,0,-0.101600><0.502046,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.122000,0.000000,5.893000> }
difference{
cylinder{<33.629600,0,5.715000><33.629600,0.036000,5.715000>0.254000 translate<0,0.000000,0>}
cylinder{<33.629600,-0.1,5.715000><33.629600,0.135000,5.715000>0.050800 translate<0,0.000000,0>}}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<34.023300,0.000000,6.598000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<34.023300,0.000000,7.398000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<34.023300,0.000000,8.198000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<34.023300,0.000000,8.998000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<34.023300,0.000000,9.798000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<34.023300,0.000000,10.598000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<34.023300,0.000000,11.398000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<34.023300,0.000000,12.198000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<32.772000,0.000000,13.449300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.972000,0.000000,13.449300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.172000,0.000000,13.449300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<30.372000,0.000000,13.449300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<29.572000,0.000000,13.449300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<28.772000,0.000000,13.449300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<27.972000,0.000000,13.449300>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<27.172000,0.000000,13.449300>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<25.920700,0.000000,12.198000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<25.920700,0.000000,11.398000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<25.920700,0.000000,10.598000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<25.920700,0.000000,9.798000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<25.920700,0.000000,8.998000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<25.920700,0.000000,8.198000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<25.920700,0.000000,7.398000>}
box{<-0.495300,0,-0.228600><0.495300,0.036000,0.228600> rotate<0,-180.000000,0> translate<25.920700,0.000000,6.598000>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<27.172000,0.000000,5.346700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<27.972000,0.000000,5.346700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<28.772000,0.000000,5.346700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<29.572000,0.000000,5.346700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<30.372000,0.000000,5.346700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.172000,0.000000,5.346700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<31.972000,0.000000,5.346700>}
box{<-0.228600,0,-0.495300><0.228600,0.036000,0.495300> rotate<0,-180.000000,0> translate<32.772000,0.000000,5.346700>}
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.378000,0.000000,17.400000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.678000,0.000000,17.400000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.678000,0.000000,17.400000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.378000,0.000000,33.400000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.678000,0.000000,33.400000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.678000,0.000000,33.400000> }
difference{
cylinder{<40.513000,0,18.415000><40.513000,0.036000,18.415000>0.444500 translate<0,0.000000,0>}
cylinder{<40.513000,-0.1,18.415000><40.513000,0.135000,18.415000>0.317500 translate<0,0.000000,0>}}
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.350000,0.000000,15.478000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.350000,0.000000,13.478000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.350000,0.000000,13.478000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.200000,0.000000,13.478000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.350000,0.000000,13.478000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.200000,0.000000,13.478000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.200000,0.000000,15.478000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.350000,0.000000,15.478000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.200000,0.000000,15.478000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.850000,0.000000,15.478000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.850000,0.000000,13.478000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<35.850000,0.000000,13.478000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.850000,0.000000,13.478000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.000000,0.000000,13.478000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.850000,0.000000,13.478000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.850000,0.000000,15.478000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.000000,0.000000,15.478000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.850000,0.000000,15.478000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.350000,0.000000,13.478000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.850000,0.000000,13.478000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.850000,0.000000,13.478000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.850000,0.000000,13.478000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.850000,0.000000,15.478000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.850000,0.000000,15.478000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.850000,0.000000,15.478000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.350000,0.000000,15.478000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.850000,0.000000,15.478000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.350000,0.000000,15.478000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.350000,0.000000,13.478000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<40.350000,0.000000,13.478000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  M328P_RFM69_NODE(-30.988000,0,-18.415000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//BAT3	1.5V - AA	BATTERY-AA-KIT
//BAT4	1.5V - AA	BATTERY-AA-KIT
//CT1	MUTUAL	MUTUAL
