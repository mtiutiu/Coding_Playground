//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/Work/AVR_Playground/sensors_network/hardware/eagle/node/m328p_rfm69_node.brd
//4/12/16 4:23 PM

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
#local cam_z = -89;
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
#local lgt1_pos_y = 36;
#local lgt1_pos_z = 20;
#local lgt1_intense = 0.735535;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 36;
#local lgt2_pos_z = 20;
#local lgt2_intense = 0.735535;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 36;
#local lgt3_pos_z = -13;
#local lgt3_intense = 0.735535;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 36;
#local lgt4_pos_z = -13;
#local lgt4_intense = 0.735535;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 64.008000;
#declare pcb_y_size = 38.862000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(756);
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
	//translate<-32.004000,0,-19.431000>
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
box{<62.992000,0,37.846000><-1.016000,-1.500000,-1.016000> texture{col_brd}}

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
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.352000,0.000000,9.652000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C4 100n 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<51.816000,0.000000,29.972000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<50.800000,0.000000,33.274000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C6 10uF EIA3528
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<38.100000,0.000000,9.652000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C7 100n 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<5.842000,0.000000,19.558000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C8 47uF EIA3528
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.510000,0.000000,15.240000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C9 47uF EIA3528
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<38.100000,0.000000,11.430000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C10 100n 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<11.938000,0.000000,12.446000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 100n 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.352000,0.000000,11.430000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_TSSOP8("L6920TSSOP8","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.938000,0.000000,17.526000>translate<0,0.035000,0> }#end		//TSSOP8 IC2 L6920TSSOP8 TSSOP8
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.796000,0.000000,2.286000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP2 HTU21D 1X04
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.526000,0.000000,29.972000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) JP3 AVR_SPI_PRG_6NS 2X3-NS
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.796000,0.000000,5.334000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP4 OTHER 1X04
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<41.402000,0.000000,5.334000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP5 OTHER 1X04
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<41.402000,0.000000,2.286000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP6 OTHER 1X04
#ifndef(pack_L1) #declare global_pack_L1=yes; object {SPC_L_MURATA_2012_LQH3C("10uH",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<5.842000,0.000000,13.970000>}#end		//Inductor MURATA Chip Coil L1 10uH DLJ-4018
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.022000,0.000000,21.844000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 100K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<49.022000,0.000000,19.304000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 100K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.226000,0.000000,1.778000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_RB1) #declare global_pack_RB1=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<52.070000,0.000000,14.732000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB1 470 0805
#ifndef(pack_RB2) #declare global_pack_RB2=yes; object {RES_SMD_CHIP_0805("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<52.070000,0.000000,21.336000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB2 330 0805
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ1 V_BOOST1
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ2 V_BOOST2
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("ATMEGA328P_TQFP","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<29.972000,0.000000,9.398000>translate<0,0.035000,0> }#end		//TQFP-32 U1 ATMEGA328P_TQFP TQFP32-08
#ifndef(pack_U2) #declare global_pack_U2=yes; object {RFM69HW_SMD("RFM69W",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<33.274000,0.000000,27.178000>}#end		//RFM69HW SMD U2 RFM69W RFM69W
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {RESONATOR_SMD("8MHz",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<35.814000,0.000000,16.002000>}#end		//RESONATOR SMD Y1 8MHz RESONATOR-SMD_MED
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
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.452000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.252000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.916000,0.000000,29.972000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.716000,0.000000,29.972000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<49.150000,0.000000,33.274000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<52.450000,0.000000,33.274000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.000000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.200000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<4.192000,0.000000,19.558000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.492000,0.000000,19.558000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.510000,0.000000,16.890000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.510000,0.000000,13.590000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.000000,0.000000,11.430000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.200000,0.000000,11.430000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.838000,0.000000,12.446000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.038000,0.000000,12.446000>}
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
object{TOOLS_PCB_SMD(3.900000,2.400000,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<7.874000,0.000000,35.052000>}
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
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.226000,0.000000,2.678000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.226000,0.000000,0.878000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.070000,0.000000,13.832000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.070000,0.000000,15.632000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.070000,0.000000,20.436000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<52.070000,0.000000,22.236000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.160000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.636000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.112000,0.000000,24.384000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.764000,0.000000,20.828000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.288000,0.000000,20.828000>}
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
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.124000,0.000000,20.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.124000,0.000000,22.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.124000,0.000000,24.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.124000,0.000000,26.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.124000,0.000000,28.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.124000,0.000000,30.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.124000,0.000000,32.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.124000,0.000000,34.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.424000,0.000000,34.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.424000,0.000000,32.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.424000,0.000000,30.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.424000,0.000000,28.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.424000,0.000000,26.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.424000,0.000000,24.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.424000,0.000000,22.178000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.424000,0.000000,20.178000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.314000,0.000000,16.002000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.814000,0.000000,16.002000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.314000,0.000000,16.002000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<25.654000,0,4.826000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.940000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<36.068000,0,21.082000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<35.814000,0,5.080000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<26.410000,0,18.294000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<26.416000,0,26.162000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.464000,0,19.780000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.432000,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<30.480000,0,6.858000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.972000,0,16.002000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<25.654000,0,16.002000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,30.480000>}
box{<0,0,-0.203200><23.876000,0.035000,0.203200> rotate<0,90.000000,0> translate<1.270000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,0.000000,5.334000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<1.270000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.270000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,0.000000,32.258000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.270000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.192000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.192000,0.000000,14.120000>}
box{<0,0,-0.203200><5.438000,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.192000,0.000000,14.120000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.192000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.192000,0.000000,21.464000>}
box{<0,0,-0.203200><1.906000,0.035000,0.203200> rotate<0,90.000000,0> translate<4.192000,0.000000,21.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.192000,0.000000,14.120000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.342000,0.000000,13.970000>}
box{<0,0,-0.203200><0.212132,0.035000,0.203200> rotate<0,44.997030,0> translate<4.192000,0.000000,14.120000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,25.146000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.080000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,21.082000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<5.842000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.096000,0.000000,28.956000>}
box{<0,0,-0.304800><1.016000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.080000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.466000,0.000000,7.874000>}
box{<0,0,-0.304800><1.386000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.080000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,0.000000,21.844000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.842000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.192000,0.000000,21.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,0.000000,24.384000>}
box{<0,0,-0.203200><4.129504,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.192000,0.000000,21.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.342000,0.000000,16.534000>}
box{<0,0,-0.203200><2.121320,0.035000,0.203200> rotate<0,44.997030,0> translate<5.842000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.342000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.342000,0.000000,16.534000>}
box{<0,0,-0.203200><2.564000,0.035000,0.203200> rotate<0,90.000000,0> translate<7.342000,0.000000,16.534000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.492000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.492000,0.000000,19.432000>}
box{<0,0,-0.203200><0.126000,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.492000,0.000000,19.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.492000,0.000000,19.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,18.542000>}
box{<0,0,-0.203200><1.258650,0.035000,0.203200> rotate<0,44.997030,0> translate<7.492000,0.000000,19.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,21.844000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.604000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.096000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,26.416000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<6.096000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.636000,0.000000,26.416000>}
box{<0,0,-0.304800><2.032000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.636000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,19.558000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.398000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,21.082000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<8.636000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,18.542000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.382000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,18.542000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.652000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,19.304000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<9.398000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,12.446000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<9.652000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,14.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,15.789000>}
box{<0,0,-0.203200><1.163000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.963000,0.000000,15.789000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,21.377000>}
box{<0,0,-0.203200><0.951000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.963000,0.000000,21.377000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.466000,0.000000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.038000,0.000000,12.446000>}
box{<0,0,-0.304800><6.465784,0.035000,0.304800> rotate<0,-44.997030,0> translate<6.466000,0.000000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.414000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.038000,0.000000,12.446000>}
box{<0,0,-0.203200><0.624000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.414000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,19.304000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.652000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,21.377000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,21.844000>}
box{<0,0,-0.203200><0.660438,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.963000,0.000000,21.377000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.613000,0.000000,19.487000>}
box{<0,0,-0.203200><0.258801,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.430000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.613000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.613000,0.000000,19.487000>}
box{<0,0,-0.203200><0.939000,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.613000,0.000000,19.487000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,15.789000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,0.000000,17.018000>}
box{<0,0,-0.203200><1.738068,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.963000,0.000000,15.789000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.263000,0.000000,18.542000>}
box{<0,0,-0.203200><2.611000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.652000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.263000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.263000,0.000000,18.542000>}
box{<0,0,-0.203200><1.884000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.263000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,21.844000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.048000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,32.258000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,0.000000,0> translate<3.048000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.038000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.562000,0.000000,10.922000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<11.038000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,24.384000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.160000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.838000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,12.521000>}
box{<0,0,-0.203200><0.106066,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.838000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,14.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,12.521000>}
box{<0,0,-0.203200><2.105000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.913000,0.000000,12.521000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,21.377000>}
box{<0,0,-0.203200><0.660438,0.035000,0.203200> rotate<0,44.997030,0> translate<12.446000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,21.377000>}
box{<0,0,-0.203200><0.951000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.913000,0.000000,21.377000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.315000,0.000000,20.828000>}
box{<0,0,-0.203200><0.568514,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.913000,0.000000,20.426000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.562000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,10.922000>}
box{<0,0,-0.203200><1.408000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.562000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,29.464000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.224000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,30.480000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<12.446000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.540000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,5.334000>}
box{<0,0,-0.203200><12.446000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.540000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,5.334000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.986000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,0.000000,27.432000>}
box{<0,0,-0.203200><4.310523,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.700000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,27.432000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<14.224000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,27.432000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.748000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,27.432000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<16.256000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.382000,0.000000,17.018000>}
box{<0,0,-0.203200><4.190000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.192000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.382000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,16.890000>}
box{<0,0,-0.203200><0.181019,0.035000,0.203200> rotate<0,44.997030,0> translate<16.382000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,17.144000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.510000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,17.144000>}
box{<0,0,-0.203200><3.684000,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.764000,0.000000,17.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.315000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,20.828000>}
box{<0,0,-0.203200><3.449000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.315000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.006000,0.000000,13.958000>}
box{<0,0,-0.203200><4.293552,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.970000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.006000,0.000000,14.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.006000,0.000000,13.958000>}
box{<0,0,-0.203200><0.128000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.006000,0.000000,13.958000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,13.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.006000,0.000000,14.086000>}
box{<0,0,-0.203200><0.701450,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.510000,0.000000,13.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.986000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.018000,0.000000,0.254000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<14.986000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.514000,0.000000,15.886000>}
box{<0,0,-0.203200><1.419870,0.035000,0.203200> rotate<0,44.997030,0> translate<16.510000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,2.286000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.526000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,26.162000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.526000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,28.702000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<16.256000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,31.242000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<16.256000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.642000,0.000000,5.334000>}
box{<0,0,-0.203200><0.116000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.526000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.642000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.642000,0.000000,5.842000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,90.000000,0> translate<17.642000,0.000000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,23.876000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<16.256000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,23.876000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<18.288000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,0.000000,35.052000>}
box{<0,0,-0.203200><10.922000,0.035000,0.203200> rotate<0,0.000000,0> translate<7.874000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.558000,0.000000,24.130000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,44.997030,0> translate<17.526000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,14.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,13.070000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.812000,0.000000,13.070000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.006000,0.000000,14.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,14.086000>}
box{<0,0,-0.203200><2.806000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.006000,0.000000,14.086000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.514000,0.000000,15.886000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,15.886000>}
box{<0,0,-0.203200><2.298000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.514000,0.000000,15.886000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.050000,0.000000,26.178000>}
box{<0,0,-0.203200><1.773424,0.035000,0.203200> rotate<0,44.997030,0> translate<18.796000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,29.972000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.796000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,0.000000,31.242000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.526000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,0.000000,3.556000>}
box{<0,0,-0.203200><1.626394,0.035000,0.203200> rotate<0,-51.336803,0> translate<20.066000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.130000,0.000000,30.178000>}
box{<0,0,-0.152400><1.504723,0.035000,0.152400> rotate<0,44.997030,0> translate<20.066000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.642000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,9.652000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.642000,0.000000,5.842000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,9.652000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.452000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,13.070000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,11.430000>}
box{<0,0,-0.203200><2.319310,0.035000,0.203200> rotate<0,44.997030,0> translate<19.812000,0.000000,13.070000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.670000,0.000000,32.178000>}
box{<0,0,-0.203200><4.064450,0.035000,0.203200> rotate<0,44.997030,0> translate<18.796000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,0.000000,28.194000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<20.066000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.130000,0.000000,7.398000>}
box{<0,0,-0.203200><2.918937,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.066000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.468000,0.000000,8.382000>}
box{<0,0,-0.203200><1.626394,0.035000,0.203200> rotate<0,51.336803,0> translate<21.452000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.252000,0.000000,15.864000>}
box{<0,0,-0.203200><7.020156,0.035000,0.203200> rotate<0,44.997030,0> translate<18.288000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.252000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.252000,0.000000,15.864000>}
box{<0,0,-0.203200><4.434000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.252000,0.000000,15.864000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.252000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.284000,0.000000,11.398000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<23.252000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.558000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.376000,0.000000,24.130000>}
box{<0,0,-0.152400><3.818000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.558000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.408000,0.000000,28.194000>}
box{<0,0,-0.203200><1.564000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.844000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.376000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.424000,0.000000,24.178000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.376000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.050000,0.000000,26.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,26.178000>}
box{<0,0,-0.203200><3.374000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.050000,0.000000,26.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.408000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,28.178000>}
box{<0,0,-0.203200><0.022627,0.035000,0.203200> rotate<0,44.997030,0> translate<23.408000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.130000,0.000000,30.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.424000,0.000000,30.178000>}
box{<0,0,-0.152400><2.294000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.130000,0.000000,30.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.670000,0.000000,32.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,32.178000>}
box{<0,0,-0.203200><1.754000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.670000,0.000000,32.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,26.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.440000,0.000000,26.162000>}
box{<0,0,-0.203200><0.022627,0.035000,0.203200> rotate<0,44.997030,0> translate<23.424000,0.000000,26.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,24.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472000,0.000000,24.130000>}
box{<0,0,-0.203200><0.067882,0.035000,0.203200> rotate<0,44.997030,0> translate<23.424000,0.000000,24.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,30.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472000,0.000000,30.226000>}
box{<0,0,-0.203200><0.067882,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.424000,0.000000,30.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,22.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.504000,0.000000,22.098000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,44.997030,0> translate<23.424000,0.000000,22.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.252000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.906000,0.000000,9.798000>}
box{<0,0,-0.203200><0.670099,0.035000,0.203200> rotate<0,-12.583622,0> translate<23.252000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.468000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,8.382000>}
box{<0,0,-0.203200><1.662000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.468000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.415400,0.000000,5.334000>}
box{<0,0,-0.203200><1.809400,0.035000,0.203200> rotate<0,0.000000,0> translate<22.606000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746000,0.000000,8.998000>}
box{<0,0,-0.203200><0.871156,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.130000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.080000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,4.826000>}
box{<0,0,-0.203200><28.736820,0.035000,0.203200> rotate<0,44.997030,0> translate<5.080000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,12.223400>}
box{<0,0,-0.203200><3.778600,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.654000,0.000000,12.223400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.415400,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,6.598000>}
box{<0,0,-0.203200><1.787566,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.415400,0.000000,5.334000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.130000,0.000000,7.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,7.398000>}
box{<0,0,-0.203200><3.549400,0.035000,0.203200> rotate<0,0.000000,0> translate<22.130000,0.000000,7.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.746000,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,8.998000>}
box{<0,0,-0.203200><0.933400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.746000,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.906000,0.000000,9.798000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,9.798000>}
box{<0,0,-0.203200><1.773400,0.035000,0.203200> rotate<0,0.000000,0> translate<23.906000,0.000000,9.798000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.284000,0.000000,11.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,11.398000>}
box{<0,0,-0.203200><2.395400,0.035000,0.203200> rotate<0,0.000000,0> translate<23.284000,0.000000,11.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,12.223400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,12.198000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<25.654000,0.000000,12.223400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,11.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.711400,0.000000,11.430000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.679400,0.000000,11.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.933400,0.000000,5.105400>}
box{<0,0,-0.203200><0.395131,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.654000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.410000,-1.535000,18.294000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.410000,-1.535000,26.156000>}
box{<0,0,-0.203200><7.862000,0.035000,0.203200> rotate<0,90.000000,0> translate<26.410000,-1.535000,26.156000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.440000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,0.000000,26.162000>}
box{<0,0,-0.203200><2.976000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.440000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.410000,-1.535000,26.156000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.416000,-1.535000,26.162000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.410000,-1.535000,26.156000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.933400,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.172000,0.000000,5.105400>}
box{<0,0,-0.203200><1.238600,0.035000,0.203200> rotate<0,0.000000,0> translate<25.933400,0.000000,5.105400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.410000,0.000000,18.294000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.172000,0.000000,17.532000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<26.410000,0.000000,18.294000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.172000,0.000000,13.690600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.172000,0.000000,17.532000>}
box{<0,0,-0.203200><3.841400,0.035000,0.203200> rotate<0,90.000000,0> translate<27.172000,0.000000,17.532000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.711400,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,11.430000>}
box{<0,0,-0.203200><1.466600,0.035000,0.203200> rotate<0,0.000000,0> translate<25.711400,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,28.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.194000,0.000000,28.178000>}
box{<0,0,-0.203200><3.770000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.424000,0.000000,28.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,19.812000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.432000,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,24.130000>}
box{<0,0,-0.203200><3.960000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.472000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.796000,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,32.512000>}
box{<0,0,-0.203200><8.636000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.796000,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.464000,-1.535000,19.780000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<27.432000,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.504000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,22.098000>}
box{<0,0,-0.203200><4.182000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.504000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,2.286000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.606000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,7.620000>}
box{<0,0,-0.203200><6.858000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.940000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,7.588000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<27.940000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,7.588000>}
box{<0,0,-0.203200><2.482600,0.035000,0.203200> rotate<0,90.000000,0> translate<27.972000,0.000000,7.588000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.464000,0.000000,19.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,19.272000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<27.464000,0.000000,19.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,13.690600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,19.272000>}
box{<0,0,-0.203200><5.581400,0.035000,0.203200> rotate<0,90.000000,0> translate<27.972000,0.000000,19.272000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.010000,0.000000,10.598000>}
box{<0,0,-0.203200><1.176626,0.035000,0.203200> rotate<0,44.997030,0> translate<27.178000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.082000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,3.556000>}
box{<0,0,-0.203200><7.112000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.082000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,0.254000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<27.940000,-1.535000,0.762000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.772000,0.000000,4.134000>}
box{<0,0,-0.203200><0.817415,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.194000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.772000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.772000,0.000000,4.134000>}
box{<0,0,-0.203200><0.971400,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.772000,0.000000,4.134000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.772000,0.000000,21.012000>}
box{<0,0,-0.203200><1.535836,0.035000,0.203200> rotate<0,44.997030,0> translate<27.686000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.772000,0.000000,13.690600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.772000,0.000000,21.012000>}
box{<0,0,-0.203200><7.321400,0.035000,0.203200> rotate<0,90.000000,0> translate<28.772000,0.000000,21.012000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.848000,0.000000,8.998000>}
box{<0,0,-0.203200><3.168600,0.035000,0.203200> rotate<0,0.000000,0> translate<25.679400,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.572000,0.000000,3.918000>}
box{<0,0,-0.203200><2.307997,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.940000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.572000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.572000,0.000000,3.918000>}
box{<0,0,-0.203200><1.187400,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.572000,0.000000,3.918000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.018000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.602000,0.000000,0.254000>}
box{<0,0,-0.203200><12.584000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.018000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.848000,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.648000,0.000000,9.798000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.848000,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.848000,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,8.128000>}
box{<0,0,-0.203200><1.230366,0.035000,0.203200> rotate<0,44.997030,0> translate<28.848000,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.194000,0.000000,28.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.845000,0.000000,25.527000>}
box{<0,0,-0.203200><3.749080,0.035000,0.203200> rotate<0,44.997030,0> translate<27.194000,0.000000,28.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,-1.535000,16.002000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.654000,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.845000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,0.000000,25.400000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<29.845000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.602000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,0.878000>}
box{<0,0,-0.203200><0.882469,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.602000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,16.256000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.972000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,25.146000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<29.972000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,25.146000>}
box{<0,0,-0.203200><8.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.226000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,2.678000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.342000,0.000000,2.794000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.226000,0.000000,2.678000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.342000,0.000000,5.075400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.342000,0.000000,2.794000>}
box{<0,0,-0.203200><2.281400,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.342000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.342000,0.000000,5.075400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.372000,0.000000,5.105400>}
box{<0,0,-0.203200><0.042426,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.342000,0.000000,5.075400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.372000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.372000,0.000000,6.750000>}
box{<0,0,-0.203200><1.644600,0.035000,0.203200> rotate<0,90.000000,0> translate<30.372000,0.000000,6.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.342000,0.000000,5.075400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,5.075400>}
box{<0,0,-0.203200><0.138000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.342000,0.000000,5.075400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.372000,0.000000,6.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,0.000000,6.858000>}
box{<0,0,-0.203200><0.152735,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.372000,0.000000,6.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,0.878000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.850000,0.000000,0.254000>}
box{<0,0,-0.203200><0.882469,0.035000,0.203200> rotate<0,44.997030,0> translate<30.226000,0.000000,0.878000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.172000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.172000,0.000000,3.626000>}
box{<0,0,-0.203200><1.479400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.172000,0.000000,3.626000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.172000,0.000000,3.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,3.048000>}
box{<0,0,-0.203200><0.817415,0.035000,0.203200> rotate<0,44.997030,0> translate<31.172000,0.000000,3.626000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,8.382000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.226000,-1.535000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,8.382000>}
box{<0,0,-0.203200><19.812000,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.750000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,28.194000>}
box{<0,0,-0.203200><6.106574,0.035000,0.203200> rotate<0,44.997030,0> translate<27.432000,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.972000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.972000,0.000000,4.096000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.972000,0.000000,4.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.972000,0.000000,4.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,3.810000>}
box{<0,0,-0.203200><0.404465,0.035000,0.203200> rotate<0,44.997030,0> translate<31.972000,0.000000,4.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.772000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.772000,0.000000,5.074000>}
box{<0,0,-0.203200><0.031400,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.772000,0.000000,5.074000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.194600,0.000000,8.128000>}
box{<0,0,-0.203200><4.476600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.718000,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.194600,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,8.198000>}
box{<0,0,-0.203200><0.098995,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.194600,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.648000,0.000000,9.798000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,9.798000>}
box{<0,0,-0.203200><4.616600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.648000,0.000000,9.798000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.010000,0.000000,10.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,10.598000>}
box{<0,0,-0.203200><6.254600,0.035000,0.203200> rotate<0,0.000000,0> translate<28.010000,0.000000,10.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,12.198000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,15.952600>}
box{<0,0,-0.203200><3.754600,0.035000,0.203200> rotate<0,90.000000,0> translate<34.264600,0.000000,15.952600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,15.952600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.314000,0.000000,16.002000>}
box{<0,0,-0.203200><0.069862,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.264600,0.000000,15.952600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,11.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.528000,0.000000,11.398000>}
box{<0,0,-0.203200><1.263400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,11.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,30.226000>}
box{<0,0,-0.203200><12.088000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.472000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.772000,0.000000,5.074000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,5.080000>}
box{<0,0,-0.203200><3.042006,0.035000,0.203200> rotate<0,-0.113002,0> translate<32.772000,0.000000,5.074000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,29.972000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<35.560000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,29.972000>}
box{<0,0,-0.203200><13.970000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.814000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,33.528000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.814000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,5.334000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.814000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,-1.535000,21.082000>}
box{<0,0,-0.203200><15.748000,0.035000,0.203200> rotate<0,90.000000,0> translate<36.068000,-1.535000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,6.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.328000,0.000000,6.598000>}
box{<0,0,-0.203200><2.063400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,6.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,10.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.014000,0.000000,10.598000>}
box{<0,0,-0.203200><2.749400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,10.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,0.000000,3.048000>}
box{<0,0,-0.203200><5.334000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.750000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.092000,0.000000,8.998000>}
box{<0,0,-0.203200><2.827400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.092000,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,9.652000>}
box{<0,0,-0.203200><0.662857,0.035000,0.203200> rotate<0,-80.617619,0> translate<37.092000,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.014000,0.000000,10.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,10.412000>}
box{<0,0,-0.203200><0.263044,0.035000,0.203200> rotate<0,44.997030,0> translate<37.014000,0.000000,10.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,10.412000>}
box{<0,0,-0.203200><0.760000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.200000,0.000000,10.412000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.014000,0.000000,10.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,10.784000>}
box{<0,0,-0.203200><0.263044,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.014000,0.000000,10.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,10.784000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.200000,0.000000,10.784000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.546000>}
box{<0,0,-0.203200><0.116000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.200000,0.000000,11.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.528000,0.000000,11.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.314000,0.000000,13.184000>}
box{<0,0,-0.203200><2.525785,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.528000,0.000000,11.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.314000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.314000,0.000000,13.184000>}
box{<0,0,-0.203200><2.818000,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.314000,0.000000,13.184000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.084000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,2.286000>}
box{<0,0,-0.203200><0.915810,0.035000,0.203200> rotate<0,56.306216,0> translate<37.084000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.328000,0.000000,6.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,5.334000>}
box{<0,0,-0.203200><1.787566,0.035000,0.203200> rotate<0,44.997030,0> translate<36.328000,0.000000,6.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,7.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.068000,0.000000,7.398000>}
box{<0,0,-0.203200><3.803400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,7.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,8.198000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.308000,0.000000,8.198000>}
box{<0,0,-0.203200><4.043400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,8.198000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,3.810000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.258000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,36.068000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.814000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,12.954000>}
box{<0,0,-0.203200><1.991213,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.200000,0.000000,11.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.308000,0.000000,8.198000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,9.652000>}
box{<0,0,-0.203200><1.610273,0.035000,0.203200> rotate<0,-64.544633,0> translate<38.308000,0.000000,8.198000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,9.652000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.000000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,2.286000>}
box{<0,0,-0.203200><1.983803,0.035000,0.203200> rotate<0,50.191116,0> translate<38.354000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.068000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,22.098000>}
box{<0,0,-0.203200><3.698296,0.035000,0.203200> rotate<0,-15.944344,0> translate<36.068000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.608000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,12.954000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.608000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,0.000000,2.286000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.624000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.068000,0.000000,7.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,0.000000,5.334000>}
box{<0,0,-0.203200><2.918937,0.035000,0.203200> rotate<0,44.997030,0> translate<38.068000,0.000000,7.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.546000,0.000000,11.430000>}
box{<0,0,-0.203200><3.546000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.000000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,0.000000,2.286000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.672000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,0.000000,5.980000>}
box{<0,0,-0.203200><5.192992,0.035000,0.203200> rotate<0,44.997030,0> translate<39.000000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,0.000000,5.980000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.672000,0.000000,5.980000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.044000,0.000000,22.098000>}
box{<0,0,-0.203200><3.420000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.624000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.044000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.124000,0.000000,22.178000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.044000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.850000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,0.254000>}
box{<0,0,-0.203200><12.330000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.850000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.180000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,2.286000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.180000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,0.000000,2.286000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.212000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.546000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.594000,0.000000,14.478000>}
box{<0,0,-0.203200><4.310523,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.546000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.594000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,17.006000>}
box{<0,0,-0.203200><3.575132,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.594000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,17.006000>}
box{<0,0,-0.203200><2.298000,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.122000,0.000000,17.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,21.198000>}
box{<0,0,-0.203200><11.658777,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.878000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,21.198000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.122000,0.000000,21.198000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.124000,0.000000,34.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.246000,0.000000,34.178000>}
box{<0,0,-0.203200><5.122000,0.035000,0.203200> rotate<0,0.000000,0> translate<43.124000,0.000000,34.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,21.982000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.122000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,21.982000>}
box{<0,0,-0.203200><1.386000,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.260000,0.000000,21.982000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.150000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.150000,0.000000,31.738000>}
box{<0,0,-0.203200><1.536000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.150000,0.000000,31.738000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.246000,0.000000,34.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.150000,0.000000,33.274000>}
box{<0,0,-0.203200><1.278449,0.035000,0.203200> rotate<0,44.997030,0> translate<48.246000,0.000000,34.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.894000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.922000,0.000000,15.506000>}
box{<0,0,-0.203200><1.453812,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.894000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.922000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.922000,0.000000,15.506000>}
box{<0,0,-0.203200><3.798000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.922000,0.000000,15.506000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.922000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.922000,0.000000,19.304000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.922000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.922000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.314000,0.000000,22.236000>}
box{<0,0,-0.203200><0.554372,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.922000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.260000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.916000,0.000000,26.024000>}
box{<0,0,-0.203200><3.756151,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.260000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.916000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.916000,0.000000,26.024000>}
box{<0,0,-0.203200><3.948000,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.916000,0.000000,26.024000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.150000,0.000000,31.738000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.916000,0.000000,29.972000>}
box{<0,0,-0.203200><2.497501,0.035000,0.203200> rotate<0,44.997030,0> translate<49.150000,0.000000,31.738000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,20.436000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,15.632000>}
box{<0,0,-0.203200><4.804000,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.070000,0.000000,15.632000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.314000,0.000000,22.236000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,22.236000>}
box{<0,0,-0.203200><1.756000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.314000,0.000000,22.236000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,0.000000,36.068000>}
box{<0,0,-0.203200><13.970000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.354000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,30.238000>}
box{<0,0,-0.203200><3.036000,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.450000,0.000000,30.238000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,35.942000>}
box{<0,0,-0.203200><0.178191,0.035000,0.203200> rotate<0,44.997030,0> translate<52.324000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,35.942000>}
box{<0,0,-0.203200><2.668000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.450000,0.000000,35.942000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,30.238000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.716000,0.000000,29.972000>}
box{<0,0,-0.203200><0.376181,0.035000,0.203200> rotate<0,44.997030,0> translate<52.450000,0.000000,30.238000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,-1.535000,0.254000>}
box{<0,0,-0.203200><24.384000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.448000,-1.535000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,36.068000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.324000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,22.236000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.776000,0.000000,24.942000>}
box{<0,0,-0.203200><3.826862,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.070000,0.000000,22.236000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.372000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.372000,-1.535000,7.874000>}
box{<0,0,-0.304800><21.082000,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.372000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.626000,0.000000,11.430000>}
box{<0,0,-0.203200><16.626000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.000000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,13.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.238000,0.000000,13.832000>}
box{<0,0,-0.203200><5.168000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.070000,0.000000,13.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.626000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.658000,0.000000,9.398000>}
box{<0,0,-0.203200><2.873682,0.035000,0.203200> rotate<0,44.997030,0> translate<55.626000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,-1.535000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.928000,-1.535000,6.350000>}
box{<0,0,-0.203200><8.621046,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.832000,-1.535000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.928000,-1.535000,12.142000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.928000,-1.535000,6.350000>}
box{<0,0,-0.203200><5.792000,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.928000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.238000,0.000000,13.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.928000,0.000000,12.142000>}
box{<0,0,-0.203200><2.390021,0.035000,0.203200> rotate<0,44.997030,0> translate<57.238000,0.000000,13.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.776000,0.000000,24.942000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.928000,0.000000,24.942000>}
box{<0,0,-0.203200><4.152000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.776000,0.000000,24.942000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.658000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.706000,0.000000,9.398000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.658000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.706000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.468000,0.000000,10.160000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.706000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.102000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.468000,0.000000,28.702000>}
box{<0,0,-0.203200><10.417097,0.035000,0.203200> rotate<0,44.997030,0> translate<54.102000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.468000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.468000,0.000000,28.702000>}
box{<0,0,-0.203200><18.542000,0.035000,0.203200> rotate<0,90.000000,0> translate<61.468000,0.000000,28.702000> }
//Text
//Rect
union{
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<35.814000,0.000000,14.952000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<35.814000,0.000000,17.052000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<37.314000,0.000000,14.952000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<37.314000,0.000000,17.052000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<34.314000,0.000000,14.952000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<34.314000,0.000000,17.052000>}
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,3.687413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,33.142584>}
box{<0,0,-0.203200><29.455172,0.035000,0.203200> rotate<0,90.000000,0> translate<-0.152400,0.000000,33.142584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,3.687413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,33.142584>}
box{<0,0,-0.203200><29.455172,0.035000,0.203200> rotate<0,90.000000,0> translate<-0.152400,-1.535000,33.142584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,3.687413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.576163,0.000000,3.989197>}
box{<0,0,-0.203200><0.788592,0.035000,0.203200> rotate<0,-22.498777,0> translate<-0.152400,0.000000,3.687413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,3.687413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.576163,-1.535000,3.989197>}
box{<0,0,-0.203200><0.788592,0.035000,0.203200> rotate<0,-22.498777,0> translate<-0.152400,-1.535000,3.687413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,4.064000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.173200,0.000000,4.064000>}
box{<0,0,-0.203200><14.325600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,4.470400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.909869,0.000000,4.470400>}
box{<0,0,-0.203200><14.062269,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.847725,0.000000,4.876800>}
box{<0,0,-0.203200><2.000125,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,4.876800>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.441325,0.000000,5.283200>}
box{<0,0,-0.203200><1.593725,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,5.283200>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.034925,0.000000,5.689600>}
box{<0,0,-0.203200><1.187325,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,5.689600>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.628525,0.000000,6.096000>}
box{<0,0,-0.203200><0.780925,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,6.096000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,6.502400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,6.502400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,6.908800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,6.908800>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,7.315200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,7.315200>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,7.721600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,7.721600>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,8.128000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,8.128000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,8.534400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,8.534400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,8.940800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,8.940800>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,9.347200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,9.347200>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,9.753600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,9.753600>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,10.160000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,10.160000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,10.566400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,10.566400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,10.972800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,10.972800>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,11.379200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,11.379200>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,11.785600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,11.785600>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,12.192000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,12.192000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,12.598400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,12.598400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,13.004800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.503963,-1.535000,13.004800>}
box{<0,0,-0.203200><2.656363,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,13.411200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.967166,-1.535000,13.411200>}
box{<0,0,-0.203200><3.119566,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,13.817600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.258928,-1.535000,13.817600>}
box{<0,0,-0.203200><15.411328,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,14.224000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.852528,-1.535000,14.224000>}
box{<0,0,-0.203200><15.004928,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,14.630400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.446128,-1.535000,14.630400>}
box{<0,0,-0.203200><14.598528,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,15.036800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.039728,-1.535000,15.036800>}
box{<0,0,-0.203200><14.192128,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,15.443200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.633328,-1.535000,15.443200>}
box{<0,0,-0.203200><13.785728,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,15.849600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.226928,-1.535000,15.849600>}
box{<0,0,-0.203200><13.379328,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,16.256000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.820528,-1.535000,16.256000>}
box{<0,0,-0.203200><12.972928,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,16.662400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.414128,-1.535000,16.662400>}
box{<0,0,-0.203200><12.566528,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,17.068800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.007728,-1.535000,17.068800>}
box{<0,0,-0.203200><12.160128,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,17.475200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.601328,-1.535000,17.475200>}
box{<0,0,-0.203200><11.753728,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,17.881600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.194928,-1.535000,17.881600>}
box{<0,0,-0.203200><11.347328,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,18.288000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.788528,-1.535000,18.288000>}
box{<0,0,-0.203200><10.940928,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,18.694400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.382128,-1.535000,18.694400>}
box{<0,0,-0.203200><10.534528,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,19.100800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.975728,-1.535000,19.100800>}
box{<0,0,-0.203200><10.128128,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,19.507200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.569328,-1.535000,19.507200>}
box{<0,0,-0.203200><9.721728,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,19.913600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.162928,-1.535000,19.913600>}
box{<0,0,-0.203200><9.315328,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,20.320000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.756528,-1.535000,20.320000>}
box{<0,0,-0.203200><8.908928,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,20.726400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.350128,-1.535000,20.726400>}
box{<0,0,-0.203200><8.502528,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,21.132800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.943728,-1.535000,21.132800>}
box{<0,0,-0.203200><8.096128,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,21.539200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.537328,-1.535000,21.539200>}
box{<0,0,-0.203200><7.689728,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,21.945600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.130928,-1.535000,21.945600>}
box{<0,0,-0.203200><7.283328,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,22.352000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.724528,-1.535000,22.352000>}
box{<0,0,-0.203200><6.876928,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,22.758400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.318128,-1.535000,22.758400>}
box{<0,0,-0.203200><6.470528,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,23.164800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.911728,-1.535000,23.164800>}
box{<0,0,-0.203200><6.064128,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,23.571200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.692087,-1.535000,23.571200>}
box{<0,0,-0.203200><2.844488,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,23.977600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.440834,-1.535000,23.977600>}
box{<0,0,-0.203200><2.593234,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,24.384000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,24.384000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,24.790400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,24.790400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,25.196800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,25.196800>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,25.603200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,25.603200>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,26.009600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,26.009600>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,26.416000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,26.416000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,26.822400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,26.822400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,27.228800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,27.228800>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,27.635200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,27.635200>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,28.041600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,28.041600>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,28.448000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,28.448000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,28.854400>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,28.854400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,29.260800>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,29.260800>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,29.667200>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,29.667200>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,30.073600>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,30.073600>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,30.480000>}
box{<0,0,-0.203200><0.609600,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,30.480000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.558569,0.000000,30.886400>}
box{<0,0,-0.203200><0.710969,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,30.886400>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.933328,0.000000,31.292800>}
box{<0,0,-0.203200><1.085728,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,31.292800>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.339728,0.000000,31.699200>}
box{<0,0,-0.203200><1.492128,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,31.699200>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.746128,0.000000,32.105600>}
box{<0,0,-0.203200><1.898528,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,32.105600>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.152528,0.000000,32.512000>}
box{<0,0,-0.203200><2.304928,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,32.512000>}
box{<0,0,-0.203200><2.590800,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.388822,0.000000,32.918400>}
box{<0,0,-0.203200><0.541222,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.388822,-1.535000,32.918400>}
box{<0,0,-0.203200><0.541222,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.152400,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,0.000000,33.142584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.576163,0.000000,32.840800>}
box{<0,0,-0.203200><0.788592,0.035000,0.203200> rotate<0,22.498777,0> translate<-0.152400,0.000000,33.142584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.152400,-1.535000,33.142584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.576163,-1.535000,32.840800>}
box{<0,0,-0.203200><0.788592,0.035000,0.203200> rotate<0,22.498777,0> translate<-0.152400,-1.535000,33.142584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,6.442322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.580941,0.000000,6.143584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<0.457200,0.000000,6.442322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,30.641675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,6.442322>}
box{<0,0,-0.203200><24.199353,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.457200,0.000000,6.442322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457200,0.000000,30.641675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.580941,0.000000,30.940413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<0.457200,0.000000,30.641675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.576163,0.000000,3.989197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.455834,0.000000,3.989197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<0.576163,0.000000,3.989197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.576163,-1.535000,3.989197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.455834,-1.535000,3.989197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<0.576163,-1.535000,3.989197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.576163,0.000000,32.840800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.455834,0.000000,32.840800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<0.576163,0.000000,32.840800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.576163,-1.535000,32.840800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.455834,-1.535000,32.840800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<0.576163,-1.535000,32.840800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.580941,0.000000,6.143584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.809584,0.000000,5.914941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<0.580941,0.000000,6.143584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.580941,0.000000,30.940413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.358941,0.000000,32.718412>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,-44.997030,0> translate<0.580941,0.000000,30.940413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.809584,0.000000,5.914941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.079584,0.000000,4.644941>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<0.809584,0.000000,5.914941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.455834,0.000000,3.989197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,0.000000,3.652563>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<1.455834,0.000000,3.989197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.455834,-1.535000,3.989197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,-1.535000,3.652563>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<1.455834,-1.535000,3.989197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.455834,0.000000,32.840800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,0.000000,33.177434>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<1.455834,0.000000,32.840800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.455834,-1.535000,32.840800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,-1.535000,33.177434>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<1.455834,-1.535000,32.840800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.643175,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,32.918400>}
box{<0,0,-0.203200><0.795225,0.035000,0.203200> rotate<0,0.000000,0> translate<1.643175,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.643175,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.558928,0.000000,32.918400>}
box{<0,0,-0.203200><0.915753,0.035000,0.203200> rotate<0,0.000000,0> translate<1.643175,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.079584,0.000000,4.644941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.378322,0.000000,4.521200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<2.079584,0.000000,4.644941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,6.940672>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,30.143325>}
box{<0,0,-0.203200><23.202653,0.035000,0.203200> rotate<0,90.000000,0> translate<2.082797,0.000000,30.143325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,6.940672>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.876672,0.000000,6.146797>}
box{<0,0,-0.203200><1.122709,0.035000,0.203200> rotate<0,44.997030,0> translate<2.082797,0.000000,6.940672> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,7.315200>}
box{<0,0,-0.203200><8.108953,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,7.721600>}
box{<0,0,-0.203200><8.108953,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,8.128000>}
box{<0,0,-0.203200><8.108953,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,8.534400>}
box{<0,0,-0.203200><8.108953,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.430022,0.000000,8.940800>}
box{<0,0,-0.203200><8.347225,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.836422,0.000000,9.347200>}
box{<0,0,-0.203200><8.753625,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.242822,0.000000,9.753600>}
box{<0,0,-0.203200><9.160025,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.160000>}
box{<0,0,-0.203200><20.159603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.301359,0.000000,10.566400>}
box{<0,0,-0.203200><20.218563,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.972800>}
box{<0,0,-0.203200><20.159603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.175353,0.000000,11.379200>}
box{<0,0,-0.203200><1.092556,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.758553,0.000000,11.785600>}
box{<0,0,-0.203200><0.675756,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,12.192000>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,12.598400>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,13.004800>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,13.411200>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,13.817600>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,14.224000>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,14.630400>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,15.036800>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,15.443200>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,15.849600>}
box{<0,0,-0.203200><0.649603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.800641,0.000000,16.256000>}
box{<0,0,-0.203200><0.717844,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,16.662400>}
box{<0,0,-0.203200><1.296403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,17.068800>}
box{<0,0,-0.203200><1.296403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,17.475200>}
box{<0,0,-0.203200><1.296403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.156294,0.000000,17.881600>}
box{<0,0,-0.203200><1.073497,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,18.288000>}
box{<0,0,-0.203200><0.899603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,18.694400>}
box{<0,0,-0.203200><0.899603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,19.100800>}
box{<0,0,-0.203200><0.899603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,19.507200>}
box{<0,0,-0.203200><0.899603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,19.913600>}
box{<0,0,-0.203200><0.899603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,20.320000>}
box{<0,0,-0.203200><0.899603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,20.726400>}
box{<0,0,-0.203200><0.899603,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.066712,0.000000,21.132800>}
box{<0,0,-0.203200><0.983916,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,21.539200>}
box{<0,0,-0.203200><1.296403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.524128,0.000000,21.945600>}
box{<0,0,-0.203200><1.441331,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.930528,0.000000,22.352000>}
box{<0,0,-0.203200><1.847731,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.336928,0.000000,22.758400>}
box{<0,0,-0.203200><2.254131,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.743328,0.000000,23.164800>}
box{<0,0,-0.203200><2.660531,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.149728,0.000000,23.571200>}
box{<0,0,-0.203200><3.066931,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.556128,0.000000,23.977600>}
box{<0,0,-0.203200><3.473331,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,24.384000>}
box{<0,0,-0.203200><3.835403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,24.790400>}
box{<0,0,-0.203200><3.835403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,25.196800>}
box{<0,0,-0.203200><3.835403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.084797,0.000000,25.603200>}
box{<0,0,-0.203200><4.002000,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,0.000000,26.009600>}
box{<0,0,-0.203200><5.638803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.342841,0.000000,26.416000>}
box{<0,0,-0.203200><5.260044,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.936441,0.000000,26.822400>}
box{<0,0,-0.203200><4.853644,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.978419,0.000000,27.228800>}
box{<0,0,-0.203200><1.895622,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.572019,0.000000,27.635200>}
box{<0,0,-0.203200><1.489222,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.165619,0.000000,28.041600>}
box{<0,0,-0.203200><1.082822,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.079750,0.000000,28.448000>}
box{<0,0,-0.203200><0.996953,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.079750,0.000000,28.854400>}
box{<0,0,-0.203200><0.996953,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.079750,0.000000,29.260800>}
box{<0,0,-0.203200><0.996953,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.079750,0.000000,29.667200>}
box{<0,0,-0.203200><0.996953,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.368822,0.000000,30.073600>}
box{<0,0,-0.203200><1.286025,0.035000,0.203200> rotate<0,0.000000,0> translate<2.082797,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.082797,0.000000,30.143325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.384672,0.000000,31.445200>}
box{<0,0,-0.203200><1.841129,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.082797,0.000000,30.143325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.114669,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.328419,0.000000,6.908800>}
box{<0,0,-0.203200><8.213750,0.035000,0.203200> rotate<0,0.000000,0> translate<2.114669,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133731,0.000000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,0.000000,-0.096563>}
box{<0,0,-0.203200><0.145919,0.035000,0.203200> rotate<0,-22.497185,0> translate<2.133731,0.000000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133731,-1.535000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,-1.535000,-0.096563>}
box{<0,0,-0.203200><0.145919,0.035000,0.203200> rotate<0,-22.497185,0> translate<2.133731,-1.535000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133731,0.000000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.274931,0.000000,-0.152400>}
box{<0,0,-0.203200><14.141200,0.035000,0.203200> rotate<0,0.000000,0> translate<2.133731,0.000000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133731,-1.535000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.704931,-1.535000,-0.152400>}
box{<0,0,-0.203200><25.571200,0.035000,0.203200> rotate<0,0.000000,0> translate<2.133731,-1.535000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133731,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,0.000000,36.926563>}
box{<0,0,-0.203200><0.145919,0.035000,0.203200> rotate<0,22.497185,0> translate<2.133731,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133731,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,-1.535000,36.926563>}
box{<0,0,-0.203200><0.145919,0.035000,0.203200> rotate<0,22.497185,0> translate<2.133731,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133731,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.588266,0.000000,36.982400>}
box{<0,0,-0.203200><57.454534,0.035000,0.203200> rotate<0,0.000000,0> translate<2.133731,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133731,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.588266,-1.535000,36.982400>}
box{<0,0,-0.203200><57.454534,0.035000,0.203200> rotate<0,0.000000,0> translate<2.133731,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.256384,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,3.657600>}
box{<0,0,-0.203200><0.182016,0.035000,0.203200> rotate<0,0.000000,0> translate<2.256384,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.256384,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.173200,0.000000,3.657600>}
box{<0,0,-0.203200><11.916816,0.035000,0.203200> rotate<0,0.000000,0> translate<2.256384,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,0.000000,-0.096563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,0.000000,0.525453>}
box{<0,0,-0.203200><0.879665,0.035000,0.203200> rotate<0,-44.996886,0> translate<2.268544,0.000000,-0.096563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,-1.535000,-0.096563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,-1.535000,0.525453>}
box{<0,0,-0.203200><0.879665,0.035000,0.203200> rotate<0,-44.996886,0> translate<2.268544,-1.535000,-0.096563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,-1.535000,3.652563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,3.482703>}
box{<0,0,-0.203200><0.240215,0.035000,0.203200> rotate<0,44.997557,0> translate<2.268544,-1.535000,3.652563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,0.000000,3.652563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,0.000000,3.030544>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<2.268544,0.000000,3.652563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,-1.535000,33.177434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,33.347294>}
box{<0,0,-0.203200><0.240215,0.035000,0.203200> rotate<0,-44.997557,0> translate<2.268544,-1.535000,33.177434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,0.000000,33.177434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,0.000000,33.799453>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.268544,0.000000,33.177434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,0.000000,36.926563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,0.000000,36.304544>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<2.268544,0.000000,36.926563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.268544,-1.535000,36.926563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,-1.535000,36.304544>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<2.268544,-1.535000,36.926563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.358941,0.000000,32.718412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.587584,0.000000,32.947056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.358941,0.000000,32.718412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.365106,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.122528,0.000000,0.000000>}
box{<0,0,-0.203200><13.757422,0.035000,0.203200> rotate<0,0.000000,0> translate<2.365106,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.365106,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.552525,-1.535000,0.000000>}
box{<0,0,-0.203200><25.187419,0.035000,0.203200> rotate<0,0.000000,0> translate<2.365106,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.378322,0.000000,4.521200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.859069,0.000000,4.521200>}
box{<0,0,-0.203200><11.480747,0.035000,0.203200> rotate<0,0.000000,0> translate<2.378322,0.000000,4.521200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415906,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,33.324800>}
box{<0,0,-0.203200><0.022494,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415906,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.415909,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.844134,0.000000,33.324800>}
box{<0,0,-0.203200><3.428225,0.035000,0.203200> rotate<0,0.000000,0> translate<2.415909,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.419472,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.775222,0.000000,30.480000>}
box{<0,0,-0.203200><1.355750,0.035000,0.203200> rotate<0,0.000000,0> translate<2.419472,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,12.846519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,3.482703>}
box{<0,0,-0.203200><9.363816,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.438400,-1.535000,3.482703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,12.846519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.550541,-1.535000,13.117250>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-67.495533,0> translate<2.438400,-1.535000,12.846519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,23.983478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.550541,-1.535000,23.712747>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,67.495533,0> translate<2.438400,-1.535000,23.983478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,33.347294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.438400,-1.535000,23.983478>}
box{<0,0,-0.203200><9.363816,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.438400,-1.535000,23.983478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.521069,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.734819,0.000000,6.502400>}
box{<0,0,-0.203200><8.213750,0.035000,0.203200> rotate<0,0.000000,0> translate<2.521069,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.550541,-1.535000,13.117250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.757747,-1.535000,13.324456>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.550541,-1.535000,13.117250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.550541,-1.535000,23.712747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.757747,-1.535000,23.505541>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,44.997030,0> translate<2.550541,-1.535000,23.712747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.587584,0.000000,32.947056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.886322,0.000000,33.070797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<2.587584,0.000000,32.947056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.619106,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.561634,0.000000,36.576000>}
box{<0,0,-0.203200><2.942528,0.035000,0.203200> rotate<0,0.000000,0> translate<2.619106,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.619106,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.102891,-1.535000,36.576000>}
box{<0,0,-0.203200><56.483784,0.035000,0.203200> rotate<0,0.000000,0> translate<2.619106,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.669906,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.011472,0.000000,3.251200>}
box{<0,0,-0.203200><11.341566,0.035000,0.203200> rotate<0,0.000000,0> translate<2.669906,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,11.848741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825206,0.000000,11.624688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<2.732400,0.000000,11.848741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,16.091256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,11.848741>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.732400,0.000000,11.848741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.732400,0.000000,16.091256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825206,0.000000,16.315309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<2.732400,0.000000,16.091256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.757747,-1.535000,13.324456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.028478,-1.535000,13.436597>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-22.498528,0> translate<2.757747,-1.535000,13.324456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.757747,-1.535000,23.505541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.028478,-1.535000,23.393400>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,22.498528,0> translate<2.757747,-1.535000,23.505541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.771506,0.000000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.716125,0.000000,0.406400>}
box{<0,0,-0.203200><12.944619,0.035000,0.203200> rotate<0,0.000000,0> translate<2.771506,0.000000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.771506,-1.535000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.207522,-1.535000,0.406400>}
box{<0,0,-0.203200><24.436016,0.035000,0.203200> rotate<0,0.000000,0> translate<2.771506,-1.535000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.822309,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.413756,0.000000,33.731200>}
box{<0,0,-0.203200><2.591447,0.035000,0.203200> rotate<0,0.000000,0> translate<2.822309,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825206,0.000000,11.624688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.996688,0.000000,11.453206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<2.825206,0.000000,11.624688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825206,0.000000,16.315309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.996688,0.000000,16.486791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.825206,0.000000,16.315309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.825872,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.181622,0.000000,30.886400>}
box{<0,0,-0.203200><1.355750,0.035000,0.203200> rotate<0,0.000000,0> translate<2.825872,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.876672,0.000000,6.146797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.090425,0.000000,6.146797>}
box{<0,0,-0.203200><8.213753,0.035000,0.203200> rotate<0,0.000000,0> translate<2.876672,0.000000,6.146797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.886322,0.000000,33.070797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.607675,0.000000,33.070797>}
box{<0,0,-0.203200><9.721353,0.035000,0.203200> rotate<0,0.000000,0> translate<2.886322,0.000000,33.070797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,0.000000,0.525453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,1.338163>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<2.890563,0.000000,0.525453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,-1.535000,0.525453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,1.338163>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<2.890563,-1.535000,0.525453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,0.000000,3.030544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,2.217834>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<2.890563,0.000000,3.030544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,0.000000,33.799453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,34.612163>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<2.890563,0.000000,33.799453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,0.000000,36.304544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,35.491834>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<2.890563,0.000000,36.304544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.890563,-1.535000,36.304544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,35.491834>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<2.890563,-1.535000,36.304544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.946459,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.329591,0.000000,36.169600>}
box{<0,0,-0.203200><2.383131,0.035000,0.203200> rotate<0,0.000000,0> translate<2.946459,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.946459,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.775541,-1.535000,36.169600>}
box{<0,0,-0.203200><55.829081,0.035000,0.203200> rotate<0,0.000000,0> translate<2.946459,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.967500,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,0.000000,2.844800>}
box{<0,0,-0.203200><10.646900,0.035000,0.203200> rotate<0,0.000000,0> translate<2.967500,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,18.186741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.075206,0.000000,17.962688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<2.982400,0.000000,18.186741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,20.929256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,18.186741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.982400,0.000000,18.186741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.982400,0.000000,20.929256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.075206,0.000000,21.153309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<2.982400,0.000000,20.929256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.996688,0.000000,11.453206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.220741,0.000000,11.360400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<2.996688,0.000000,11.453206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.996688,0.000000,16.486791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.220741,0.000000,16.579597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<2.996688,0.000000,16.486791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.009584,0.000000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.309725,0.000000,0.812800>}
box{<0,0,-0.203200><12.300141,0.035000,0.203200> rotate<0,0.000000,0> translate<3.009584,0.000000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.009584,-1.535000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,0.812800>}
box{<0,0,-0.203200><24.117616,0.035000,0.203200> rotate<0,0.000000,0> translate<3.009584,-1.535000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.028478,-1.535000,13.436597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.846519,-1.535000,13.436597>}
box{<0,0,-0.203200><9.818041,0.035000,0.203200> rotate<0,0.000000,0> translate<3.028478,-1.535000,13.436597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.028478,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.683128,-1.535000,23.393400>}
box{<0,0,-0.203200><2.654650,0.035000,0.203200> rotate<0,0.000000,0> translate<3.028478,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.030625,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,34.137600>}
box{<0,0,-0.203200><2.283775,0.035000,0.203200> rotate<0,0.000000,0> translate<3.030625,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.075206,0.000000,17.962688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.246688,0.000000,17.791206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<3.075206,0.000000,17.962688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.075206,0.000000,21.153309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.246688,0.000000,21.324791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.075206,0.000000,21.153309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.079750,0.000000,28.127469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.251469,0.000000,26.955750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<3.079750,0.000000,28.127469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.079750,0.000000,29.784528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.079750,0.000000,28.127469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.079750,0.000000,28.127469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.079750,0.000000,29.784528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.251469,0.000000,30.956247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.079750,0.000000,29.784528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.114797,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,35.763200>}
box{<0,0,-0.203200><2.199603,0.035000,0.203200> rotate<0,0.000000,0> translate<3.114797,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.114797,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.607203,-1.535000,35.763200>}
box{<0,0,-0.203200><55.492406,0.035000,0.203200> rotate<0,0.000000,0> translate<3.114797,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.135838,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,0.000000,2.438400>}
box{<0,0,-0.203200><10.478562,0.035000,0.203200> rotate<0,0.000000,0> translate<3.135838,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.177919,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.113066,0.000000,1.219200>}
box{<0,0,-0.203200><10.935147,0.035000,0.203200> rotate<0,0.000000,0> translate<3.177919,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.177919,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.113066,-1.535000,1.219200>}
box{<0,0,-0.203200><10.935147,0.035000,0.203200> rotate<0,0.000000,0> translate<3.177919,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.188438,-1.535000,2.311400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,2.217834>}
box{<0,0,-0.203200><0.101276,0.035000,0.203200> rotate<0,67.493860,0> translate<3.188438,-1.535000,2.311400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.188438,-1.535000,2.311400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.846519,-1.535000,2.311400>}
box{<0,0,-0.203200><9.658081,0.035000,0.203200> rotate<0,0.000000,0> translate<3.188438,-1.535000,2.311400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.188438,-1.535000,34.518597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,34.612163>}
box{<0,0,-0.203200><0.101276,0.035000,0.203200> rotate<0,-67.493860,0> translate<3.188438,-1.535000,34.518597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.188438,-1.535000,34.518597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.846519,-1.535000,34.518597>}
box{<0,0,-0.203200><9.658081,0.035000,0.203200> rotate<0,0.000000,0> translate<3.188438,-1.535000,34.518597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.198959,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.523031,-1.535000,34.544000>}
box{<0,0,-0.203200><55.324072,0.035000,0.203200> rotate<0,0.000000,0> translate<3.198959,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.198963,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,34.544000>}
box{<0,0,-0.203200><2.115437,0.035000,0.203200> rotate<0,0.000000,0> translate<3.198963,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.220741,0.000000,11.360400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.463256,0.000000,11.360400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<3.220741,0.000000,11.360400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.220741,0.000000,16.579597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,16.579597>}
box{<0,0,-0.203200><0.158459,0.035000,0.203200> rotate<0,0.000000,0> translate<3.220741,0.000000,16.579597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,1.338163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,2.217834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<3.227197,0.000000,2.217834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,1.338163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,2.217834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<3.227197,-1.535000,2.217834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.706666,0.000000,1.625600>}
box{<0,0,-0.203200><10.479469,0.035000,0.203200> rotate<0,0.000000,0> translate<3.227197,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.706666,-1.535000,1.625600>}
box{<0,0,-0.203200><10.479469,0.035000,0.203200> rotate<0,0.000000,0> translate<3.227197,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,0.000000,2.032000>}
box{<0,0,-0.203200><10.387203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.227197,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,2.032000>}
box{<0,0,-0.203200><10.387203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.227197,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,34.612163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,35.491834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<3.227197,0.000000,35.491834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,34.612163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,35.491834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<3.227197,-1.535000,35.491834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,34.950400>}
box{<0,0,-0.203200><2.087203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.227197,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,34.950400>}
box{<0,0,-0.203200><55.267603,0.035000,0.203200> rotate<0,0.000000,0> translate<3.227197,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,35.356800>}
box{<0,0,-0.203200><2.087203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.227197,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.227197,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,35.356800>}
box{<0,0,-0.203200><55.267603,0.035000,0.203200> rotate<0,0.000000,0> translate<3.227197,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.232272,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.261725,0.000000,31.292800>}
box{<0,0,-0.203200><9.029453,0.035000,0.203200> rotate<0,0.000000,0> translate<3.232272,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.246688,0.000000,17.791206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,17.736319>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,22.498155,0> translate<3.246688,0.000000,17.791206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.246688,0.000000,21.324791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,21.379678>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,-22.498155,0> translate<3.246688,0.000000,21.324791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,17.736319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,16.579597>}
box{<0,0,-0.203200><1.156722,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.379200,0.000000,16.579597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,21.625675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,21.379678>}
box{<0,0,-0.203200><0.245997,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.379200,0.000000,21.379678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.379200,0.000000,21.625675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.502941,0.000000,21.924413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<3.379200,0.000000,21.625675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.384672,0.000000,31.445200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.109325,0.000000,31.445200>}
box{<0,0,-0.203200><8.724653,0.035000,0.203200> rotate<0,0.000000,0> translate<3.384672,0.000000,31.445200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.502941,0.000000,21.924413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,24.339672>}
box{<0,0,-0.203200><3.415693,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.502941,0.000000,21.924413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,3.784597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,11.963400>}
box{<0,0,-0.203200><8.178803,0.035000,0.203200> rotate<0,90.000000,0> translate<3.911597,-1.535000,11.963400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,3.784597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,3.784597>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,3.784597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,4.064000>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,4.470400>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,4.876800>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,5.283200>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,5.689600>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.141219,-1.535000,6.096000>}
box{<0,0,-0.203200><7.229622,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.734819,-1.535000,6.502400>}
box{<0,0,-0.203200><6.823222,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.328419,-1.535000,6.908800>}
box{<0,0,-0.203200><6.416822,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,-1.535000,7.315200>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,-1.535000,7.721600>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,-1.535000,8.128000>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,-1.535000,8.534400>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.430022,-1.535000,8.940800>}
box{<0,0,-0.203200><6.518425,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.836422,-1.535000,9.347200>}
box{<0,0,-0.203200><6.924825,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.242822,-1.535000,9.753600>}
box{<0,0,-0.203200><7.331225,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,10.160000>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,10.566400>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,10.972800>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,11.379200>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,11.785600>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.911597,-1.535000,11.963400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,11.963400>}
box{<0,0,-0.203200><8.051803,0.035000,0.203200> rotate<0,0.000000,0> translate<3.911597,-1.535000,11.963400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.251469,0.000000,26.955750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908528,0.000000,26.955750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<4.251469,0.000000,26.955750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.251469,0.000000,30.956247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908528,0.000000,30.956247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<4.251469,0.000000,30.956247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,33.971066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.452878,0.000000,33.636753>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<5.314400,0.000000,33.971066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,36.132931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,33.971066>}
box{<0,0,-0.203200><2.161866,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.314400,0.000000,33.971066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.314400,0.000000,36.132931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.452878,0.000000,36.467244>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<5.314400,0.000000,36.132931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.452878,0.000000,33.636753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.708753,0.000000,33.380878>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<5.452878,0.000000,33.636753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.452878,0.000000,36.467244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.708753,0.000000,36.723119>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.452878,0.000000,36.467244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.463256,0.000000,11.360400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.687309,0.000000,11.453206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<5.463256,0.000000,11.360400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.508641,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.175353,0.000000,11.379200>}
box{<0,0,-0.203200><0.666713,0.035000,0.203200> rotate<0,0.000000,0> translate<5.508641,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.683128,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.370931,-1.535000,6.705597>}
box{<0,0,-0.203200><23.600118,0.035000,0.203200> rotate<0,44.997030,0> translate<5.683128,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.687309,0.000000,11.453206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,11.607897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.687309,0.000000,11.453206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.708753,0.000000,33.380878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.043066,0.000000,33.242400>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,22.498713,0> translate<5.708753,0.000000,33.380878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.708753,0.000000,36.723119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.043066,0.000000,36.861597>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-22.498713,0> translate<5.708753,0.000000,36.723119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.842000,0.000000,11.607897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.996688,0.000000,11.453206>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<5.842000,0.000000,11.607897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908528,0.000000,26.955750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.355809,0.000000,27.403034>}
box{<0,0,-0.203200><0.632553,0.035000,0.203200> rotate<0,-44.997230,0> translate<5.908528,0.000000,26.955750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.908528,0.000000,30.956247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.080247,0.000000,29.784528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<5.908528,0.000000,30.956247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,25.305356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,24.339672>}
box{<0,0,-0.203200><0.965684,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.918200,0.000000,24.339672> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,25.305356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.011006,0.000000,25.529409>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<5.918200,0.000000,25.305356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.978375,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.293622,0.000000,30.886400>}
box{<0,0,-0.203200><5.315247,0.035000,0.203200> rotate<0,0.000000,0> translate<5.978375,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.996688,0.000000,11.453206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.220741,0.000000,11.360400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<5.996688,0.000000,11.453206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.011006,0.000000,25.529409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.182488,0.000000,25.700891>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.011006,0.000000,25.529409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.043066,0.000000,33.242400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.704931,0.000000,33.242400>}
box{<0,0,-0.203200><3.661866,0.035000,0.203200> rotate<0,0.000000,0> translate<6.043066,0.000000,33.242400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.043066,0.000000,36.861597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.704931,0.000000,36.861597>}
box{<0,0,-0.203200><3.661866,0.035000,0.203200> rotate<0,0.000000,0> translate<6.043066,0.000000,36.861597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.181575,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.530041,0.000000,27.228800>}
box{<0,0,-0.203200><0.348466,0.035000,0.203200> rotate<0,0.000000,0> translate<6.181575,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.182488,0.000000,25.700891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.406541,0.000000,25.793697>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<6.182488,0.000000,25.700891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.220741,0.000000,11.360400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.463256,0.000000,11.360400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<6.220741,0.000000,11.360400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.355809,0.000000,27.403034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,0.000000,26.037241>}
box{<0,0,-0.203200><1.931522,0.035000,0.203200> rotate<0,44.997096,0> translate<6.355809,0.000000,27.403034> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.384775,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.887222,0.000000,30.480000>}
box{<0,0,-0.203200><4.502447,0.035000,0.203200> rotate<0,0.000000,0> translate<6.384775,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.406541,0.000000,25.793697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,0.000000,25.793697>}
box{<0,0,-0.203200><1.315059,0.035000,0.203200> rotate<0,0.000000,0> translate<6.406541,0.000000,25.793697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,18.370672>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,20.745325>}
box{<0,0,-0.203200><2.374653,0.035000,0.203200> rotate<0,90.000000,0> translate<6.654797,0.000000,20.745325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,18.370672>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.031056,0.000000,16.994412>}
box{<0,0,-0.203200><1.946325,0.035000,0.203200> rotate<0,44.997030,0> translate<6.654797,0.000000,18.370672> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.112125,0.000000,18.694400>}
box{<0,0,-0.203200><2.457328,0.035000,0.203200> rotate<0,0.000000,0> translate<6.654797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.707606,0.000000,19.100800>}
box{<0,0,-0.203200><2.052809,0.035000,0.203200> rotate<0,0.000000,0> translate<6.654797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.585200,0.000000,19.507200>}
box{<0,0,-0.203200><1.930403,0.035000,0.203200> rotate<0,0.000000,0> translate<6.654797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.585200,0.000000,19.913600>}
box{<0,0,-0.203200><1.930403,0.035000,0.203200> rotate<0,0.000000,0> translate<6.654797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.585200,0.000000,20.320000>}
box{<0,0,-0.203200><1.930403,0.035000,0.203200> rotate<0,0.000000,0> translate<6.654797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.585200,0.000000,20.726400>}
box{<0,0,-0.203200><1.930403,0.035000,0.203200> rotate<0,0.000000,0> translate<6.654797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.654797,0.000000,20.745325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.940672,0.000000,21.031200>}
box{<0,0,-0.203200><0.404288,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.654797,0.000000,20.745325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.737469,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,18.288000>}
box{<0,0,-0.203200><9.213731,0.035000,0.203200> rotate<0,0.000000,0> translate<6.737469,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.791175,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.480822,0.000000,30.073600>}
box{<0,0,-0.203200><3.689647,0.035000,0.203200> rotate<0,0.000000,0> translate<6.791175,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.940672,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.299325,0.000000,21.031200>}
box{<0,0,-0.203200><1.358653,0.035000,0.203200> rotate<0,0.000000,0> translate<6.940672,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.080247,0.000000,29.264906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.080247,0.000000,29.784528>}
box{<0,0,-0.203200><0.519622,0.035000,0.203200> rotate<0,90.000000,0> translate<7.080247,0.000000,29.784528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.080247,0.000000,29.264906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.411188,0.000000,26.933966>}
box{<0,0,-0.203200><3.296448,0.035000,0.203200> rotate<0,44.997030,0> translate<7.080247,0.000000,29.264906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.080247,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,29.667200>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<7.080247,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.084353,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,29.260800>}
box{<0,0,-0.203200><3.107397,0.035000,0.203200> rotate<0,0.000000,0> translate<7.084353,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.143869,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.789497,0.000000,17.881600>}
box{<0,0,-0.203200><7.645628,0.035000,0.203200> rotate<0,0.000000,0> translate<7.143869,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.490753,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,28.854400>}
box{<0,0,-0.203200><2.700997,0.035000,0.203200> rotate<0,0.000000,0> translate<7.490753,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.550269,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.499728,0.000000,17.475200>}
box{<0,0,-0.203200><3.949459,0.035000,0.203200> rotate<0,0.000000,0> translate<7.550269,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,0.000000,26.037241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.721600,0.000000,25.793697>}
box{<0,0,-0.203200><0.243544,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.721600,0.000000,25.793697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.897153,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,28.448000>}
box{<0,0,-0.203200><2.294597,0.035000,0.203200> rotate<0,0.000000,0> translate<7.897153,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.956669,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.093328,0.000000,17.068800>}
box{<0,0,-0.203200><3.136659,0.035000,0.203200> rotate<0,0.000000,0> translate<7.956669,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.982066,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.846519,-1.535000,23.393400>}
box{<0,0,-0.203200><4.864453,0.035000,0.203200> rotate<0,0.000000,0> translate<7.982066,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.982066,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.487472,-1.535000,5.887997>}
box{<0,0,-0.203200><24.756381,0.035000,0.203200> rotate<0,44.997025,0> translate<7.982066,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.031056,0.000000,16.994412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.154797,0.000000,16.695675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<8.031056,0.000000,16.994412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.154797,0.000000,16.579597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.154797,0.000000,16.695675>}
box{<0,0,-0.203200><0.116078,0.035000,0.203200> rotate<0,90.000000,0> translate<8.154797,0.000000,16.695675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.154797,0.000000,16.579597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.463256,0.000000,16.579597>}
box{<0,0,-0.203200><0.308459,0.035000,0.203200> rotate<0,0.000000,0> translate<8.154797,0.000000,16.579597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.154797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.686928,0.000000,16.662400>}
box{<0,0,-0.203200><2.532131,0.035000,0.203200> rotate<0,0.000000,0> translate<8.154797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.210669,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,23.164800>}
box{<0,0,-0.203200><17.386531,0.035000,0.203200> rotate<0,0.000000,0> translate<8.210669,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.299325,0.000000,21.031200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.585200,0.000000,20.745325>}
box{<0,0,-0.203200><0.404288,0.035000,0.203200> rotate<0,44.997030,0> translate<8.299325,0.000000,21.031200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.303553,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.277619,0.000000,28.041600>}
box{<0,0,-0.203200><1.974066,0.035000,0.203200> rotate<0,0.000000,0> translate<8.303553,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.463256,0.000000,11.360400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.687309,0.000000,11.453206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<8.463256,0.000000,11.360400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.463256,0.000000,16.579597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.687309,0.000000,16.486791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<8.463256,0.000000,16.579597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.508641,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.042694,0.000000,11.379200>}
box{<0,0,-0.203200><3.534053,0.035000,0.203200> rotate<0,0.000000,0> translate<8.508641,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.585200,0.000000,19.396322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.708941,0.000000,19.097584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<8.585200,0.000000,19.396322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.585200,0.000000,20.745325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.585200,0.000000,19.396322>}
box{<0,0,-0.203200><1.349003,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.585200,0.000000,19.396322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.617069,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,22.758400>}
box{<0,0,-0.203200><16.980131,0.035000,0.203200> rotate<0,0.000000,0> translate<8.617069,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.687309,0.000000,11.453206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.858791,0.000000,11.624688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.687309,0.000000,11.453206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.687309,0.000000,16.486791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.858791,0.000000,16.315309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<8.687309,0.000000,16.486791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.708941,0.000000,19.097584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962941,0.000000,18.843584>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<8.708941,0.000000,19.097584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.709953,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.684019,0.000000,27.635200>}
box{<0,0,-0.203200><1.974066,0.035000,0.203200> rotate<0,0.000000,0> translate<8.709953,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.858791,0.000000,11.624688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,11.848741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<8.858791,0.000000,11.624688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.858791,0.000000,16.315309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,16.091256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<8.858791,0.000000,16.315309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.883359,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.280528,0.000000,16.256000>}
box{<0,0,-0.203200><1.397169,0.035000,0.203200> rotate<0,0.000000,0> translate<8.883359,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.925441,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.828400,0.000000,11.785600>}
box{<0,0,-0.203200><2.902959,0.035000,0.203200> rotate<0,0.000000,0> translate<8.925441,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,11.848741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,16.091256>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,90.000000,0> translate<8.951597,0.000000,16.091256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.828400,0.000000,12.192000>}
box{<0,0,-0.203200><2.876803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.828400,0.000000,12.598400>}
box{<0,0,-0.203200><2.876803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.828400,0.000000,13.004800>}
box{<0,0,-0.203200><2.876803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941097,0.000000,13.411200>}
box{<0,0,-0.203200><2.989500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.259294,0.000000,13.817600>}
box{<0,0,-0.203200><1.307697,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.224000>}
box{<0,0,-0.203200><1.201803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,14.630400>}
box{<0,0,-0.203200><1.198603,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.036800>}
box{<0,0,-0.203200><1.198603,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.443200>}
box{<0,0,-0.203200><1.198603,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.951597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.849600>}
box{<0,0,-0.203200><1.198603,0.035000,0.203200> rotate<0,0.000000,0> translate<8.951597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.962941,0.000000,18.843584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.191584,0.000000,18.614941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<8.962941,0.000000,18.843584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.023469,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,22.352000>}
box{<0,0,-0.203200><16.573731,0.035000,0.203200> rotate<0,0.000000,0> translate<9.023469,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.116353,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.090419,0.000000,27.228800>}
box{<0,0,-0.203200><1.974066,0.035000,0.203200> rotate<0,0.000000,0> translate<9.116353,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.191584,0.000000,18.614941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.490322,0.000000,18.491200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<9.191584,0.000000,18.614941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.411188,0.000000,26.933966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.550397,0.000000,26.597884>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<9.411188,0.000000,26.933966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.429869,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,21.945600>}
box{<0,0,-0.203200><16.167331,0.035000,0.203200> rotate<0,0.000000,0> translate<9.429869,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.457400,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.988931,0.000000,26.822400>}
box{<0,0,-0.203200><4.531531,0.035000,0.203200> rotate<0,0.000000,0> translate<9.457400,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.490322,0.000000,18.491200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.591675,0.000000,18.491200>}
box{<0,0,-0.203200><2.101353,0.035000,0.203200> rotate<0,0.000000,0> translate<9.490322,0.000000,18.491200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.550397,0.000000,25.793697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.550397,0.000000,26.597884>}
box{<0,0,-0.203200><0.804187,0.035000,0.203200> rotate<0,90.000000,0> translate<9.550397,0.000000,26.597884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.550397,0.000000,25.793697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.865456,0.000000,25.793697>}
box{<0,0,-0.203200><1.315059,0.035000,0.203200> rotate<0,0.000000,0> translate<9.550397,0.000000,25.793697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.550397,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.176131,0.000000,26.009600>}
box{<0,0,-0.203200><3.625734,0.035000,0.203200> rotate<0,0.000000,0> translate<9.550397,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.550397,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.582531,0.000000,26.416000>}
box{<0,0,-0.203200><4.032134,0.035000,0.203200> rotate<0,0.000000,0> translate<9.550397,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.704931,0.000000,33.242400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.039244,0.000000,33.380878>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-22.498713,0> translate<9.704931,0.000000,33.242400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.704931,0.000000,36.861597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.039244,0.000000,36.723119>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,22.498713,0> translate<9.704931,0.000000,36.861597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.836269,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,21.539200>}
box{<0,0,-0.203200><15.760931,0.035000,0.203200> rotate<0,0.000000,0> translate<9.836269,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.903859,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.417622,0.000000,33.324800>}
box{<0,0,-0.203200><7.513763,0.035000,0.203200> rotate<0,0.000000,0> translate<9.903859,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.039244,0.000000,33.380878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.295119,0.000000,33.636753>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.039244,0.000000,33.380878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.039244,0.000000,36.723119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.295119,0.000000,36.467244>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<10.039244,0.000000,36.723119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,14.464322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.456597>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<10.150200,0.000000,14.464322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.950675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,14.464322>}
box{<0,0,-0.203200><1.486353,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.150200,0.000000,14.464322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.950675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.273941,0.000000,16.249413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<10.150200,0.000000,15.950675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.054741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.246206,0.000000,13.830687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<10.153400,0.000000,14.054741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.456597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.054741>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.153400,0.000000,14.054741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.186363,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.102891,0.000000,36.576000>}
box{<0,0,-0.203200><48.916528,0.035000,0.203200> rotate<0,0.000000,0> translate<10.186363,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.090425,0.000000,6.146797>}
box{<0,0,-0.203200><1.270916,0.035000,0.203200> rotate<0,44.996931,0> translate<10.191750,0.000000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,-1.535000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,-1.535000,5.873750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<10.191750,-1.535000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,7.045469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.191750,0.000000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,-1.535000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,-1.535000,7.045469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.191750,-1.535000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,0.000000,9.874247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.191750,0.000000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,-1.535000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,-1.535000,9.874247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.191750,-1.535000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,28.127469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,0.000000,26.955750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<10.191750,0.000000,28.127469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,29.784528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,28.127469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.191750,0.000000,28.127469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.191750,0.000000,29.784528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,0.000000,30.956247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.191750,0.000000,29.784528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.242669,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,21.132800>}
box{<0,0,-0.203200><15.354531,0.035000,0.203200> rotate<0,0.000000,0> translate<10.242669,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.246206,0.000000,13.830687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.417688,0.000000,13.659206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<10.246206,0.000000,13.830687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.273941,0.000000,16.249413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.502941,0.000000,17.478413>}
box{<0,0,-0.203200><1.738068,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.273941,0.000000,16.249413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.295119,0.000000,33.636753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,33.971066>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<10.295119,0.000000,33.636753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.295119,0.000000,36.467244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,36.132931>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<10.295119,0.000000,36.467244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.334238,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.824022,0.000000,33.731200>}
box{<0,0,-0.203200><7.489784,0.035000,0.203200> rotate<0,0.000000,0> translate<10.334238,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.417688,0.000000,13.659206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.641741,0.000000,13.566400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<10.417688,0.000000,13.659206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.418409,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.775541,0.000000,36.169600>}
box{<0,0,-0.203200><48.357131,0.035000,0.203200> rotate<0,0.000000,0> translate<10.418409,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,33.971066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,34.239200>}
box{<0,0,-0.203200><0.268134,0.035000,0.203200> rotate<0,90.000000,0> translate<10.433597,0.000000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.560925,0.000000,34.137600>}
box{<0,0,-0.203200><8.127328,0.035000,0.203200> rotate<0,0.000000,0> translate<10.433597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,34.239200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.459325,0.000000,34.239200>}
box{<0,0,-0.203200><8.025728,0.035000,0.203200> rotate<0,0.000000,0> translate<10.433597,0.000000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,35.864797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,36.132931>}
box{<0,0,-0.203200><0.268134,0.035000,0.203200> rotate<0,90.000000,0> translate<10.433597,0.000000,36.132931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.433597,0.000000,35.864797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.957675,0.000000,35.864797>}
box{<0,0,-0.203200><8.524078,0.035000,0.203200> rotate<0,0.000000,0> translate<10.433597,0.000000,35.864797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.641741,0.000000,13.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.284256,0.000000,13.566400>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<10.641741,0.000000,13.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.649069,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,20.726400>}
box{<0,0,-0.203200><14.948131,0.035000,0.203200> rotate<0,0.000000,0> translate<10.649069,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.865456,0.000000,25.793697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.089509,0.000000,25.700891>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<10.865456,0.000000,25.793697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.055469,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,20.320000>}
box{<0,0,-0.203200><14.541731,0.035000,0.203200> rotate<0,0.000000,0> translate<11.055469,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.089509,0.000000,25.700891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.260991,0.000000,25.529409>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<11.089509,0.000000,25.700891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.187200,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.769731,0.000000,25.603200>}
box{<0,0,-0.203200><1.582531,0.035000,0.203200> rotate<0,0.000000,0> translate<11.187200,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.260991,0.000000,25.529409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.353797,0.000000,25.305356>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<11.260991,0.000000,25.529409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.284256,0.000000,13.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.287997,0.000000,13.567950>}
box{<0,0,-0.203200><0.004049,0.035000,0.203200> rotate<0,-22.506128,0> translate<11.284256,0.000000,13.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.287997,0.000000,13.567950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.291741,0.000000,13.566400>}
box{<0,0,-0.203200><0.004052,0.035000,0.203200> rotate<0,22.489214,0> translate<11.287997,0.000000,13.567950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.291741,0.000000,13.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.934256,0.000000,13.566400>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<11.291741,0.000000,13.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.353797,0.000000,25.196797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.353797,0.000000,25.305356>}
box{<0,0,-0.203200><0.108559,0.035000,0.203200> rotate<0,90.000000,0> translate<11.353797,0.000000,25.305356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.353797,0.000000,25.196797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.363325,0.000000,25.196797>}
box{<0,0,-0.203200><1.009528,0.035000,0.203200> rotate<0,0.000000,0> translate<11.353797,0.000000,25.196797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.353797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.363331,0.000000,25.196800>}
box{<0,0,-0.203200><1.009534,0.035000,0.203200> rotate<0,0.000000,0> translate<11.353797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,-1.535000,5.873750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,5.873750>}
box{<0,0,-0.203200><0.599931,0.035000,0.203200> rotate<0,0.000000,0> translate<11.363469,-1.535000,5.873750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,-1.535000,9.874247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,9.874247>}
box{<0,0,-0.203200><0.599931,0.035000,0.203200> rotate<0,0.000000,0> translate<11.363469,-1.535000,9.874247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,0.000000,9.874247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.020528,0.000000,9.874247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<11.363469,0.000000,9.874247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,0.000000,26.955750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.020528,0.000000,26.955750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<11.363469,0.000000,26.955750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.363469,0.000000,30.956247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598281,0.000000,30.956247>}
box{<0,0,-0.203200><1.234813,0.035000,0.203200> rotate<0,0.000000,0> translate<11.363469,0.000000,30.956247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461869,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,19.913600>}
box{<0,0,-0.203200><14.135331,0.035000,0.203200> rotate<0,0.000000,0> translate<11.461869,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.502941,0.000000,17.478413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.731584,0.000000,17.707056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.502941,0.000000,17.478413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.591675,0.000000,18.491200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.890413,0.000000,18.614941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<11.591675,0.000000,18.491200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.731584,0.000000,17.707056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.030322,0.000000,17.830797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<11.731584,0.000000,17.707056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.828400,0.000000,11.724741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.921206,0.000000,11.500687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<11.828400,0.000000,11.724741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.828400,0.000000,13.167256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.828400,0.000000,11.724741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.828400,0.000000,11.724741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.828400,0.000000,13.167256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.921206,0.000000,13.391309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<11.828400,0.000000,13.167256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.868269,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,19.507200>}
box{<0,0,-0.203200><13.728931,0.035000,0.203200> rotate<0,0.000000,0> translate<11.868269,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.890413,0.000000,18.614941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.302056,0.000000,19.026584>}
box{<0,0,-0.203200><0.582152,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.890413,0.000000,18.614941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.921206,0.000000,11.500687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.092688,0.000000,11.329206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<11.921206,0.000000,11.500687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.921206,0.000000,13.391309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.092688,0.000000,13.562791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.921206,0.000000,13.391309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.934256,0.000000,13.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937997,0.000000,13.567950>}
box{<0,0,-0.203200><0.004049,0.035000,0.203200> rotate<0,-22.506128,0> translate<11.934256,0.000000,13.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937997,0.000000,13.567950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941741,0.000000,13.566400>}
box{<0,0,-0.203200><0.004052,0.035000,0.203200> rotate<0,22.489214,0> translate<11.937997,0.000000,13.567950> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.941741,0.000000,13.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.100200,0.000000,13.566400>}
box{<0,0,-0.203200><0.158459,0.035000,0.203200> rotate<0,0.000000,0> translate<11.941741,0.000000,13.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,5.873750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,3.784597>}
box{<0,0,-0.203200><2.089153,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.963400,-1.535000,3.784597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,11.963400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.963400,-1.535000,9.874247>}
box{<0,0,-0.203200><2.089153,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.963400,-1.535000,9.874247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.969872,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,18.694400>}
box{<0,0,-0.203200><3.981328,0.035000,0.203200> rotate<0,0.000000,0> translate<11.969872,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.009066,0.000000,15.685597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.528672,0.000000,16.205200>}
box{<0,0,-0.203200><0.734832,0.035000,0.203200> rotate<0,-44.996858,0> translate<12.009066,0.000000,15.685597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.009066,0.000000,15.685597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.584256,0.000000,15.685597>}
box{<0,0,-0.203200><0.575191,0.035000,0.203200> rotate<0,0.000000,0> translate<12.009066,0.000000,15.685597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.030322,0.000000,17.830797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.741338,0.000000,17.830797>}
box{<0,0,-0.203200><2.711016,0.035000,0.203200> rotate<0,0.000000,0> translate<12.030322,0.000000,17.830797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.092688,0.000000,11.329206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.316741,0.000000,11.236400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<12.092688,0.000000,11.329206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.092688,0.000000,13.562791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.100200,0.000000,13.565900>}
box{<0,0,-0.203200><0.008131,0.035000,0.203200> rotate<0,-22.482862,0> translate<12.092688,0.000000,13.562791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.100200,0.000000,13.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.100200,0.000000,13.565900>}
box{<0,0,-0.203200><0.000500,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.100200,0.000000,13.565900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.109325,0.000000,31.445200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.598281,0.000000,30.956247>}
box{<0,0,-0.203200><0.691486,0.035000,0.203200> rotate<0,44.996847,0> translate<12.109325,0.000000,31.445200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.173069,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.838294,0.000000,15.849600>}
box{<0,0,-0.203200><2.665225,0.035000,0.203200> rotate<0,0.000000,0> translate<12.173069,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.274669,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.449897,-1.535000,19.100800>}
box{<0,0,-0.203200><13.175228,0.035000,0.203200> rotate<0,0.000000,0> translate<12.274669,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.302056,0.000000,19.026584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.425797,0.000000,19.325322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<12.302056,0.000000,19.026584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.316741,0.000000,11.236400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.359256,0.000000,11.236400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<12.316741,0.000000,11.236400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.332797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,19.100800>}
box{<0,0,-0.203200><3.618403,0.035000,0.203200> rotate<0,0.000000,0> translate<12.332797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.363325,0.000000,25.196797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,0.000000,27.540069>}
box{<0,0,-0.203200><3.313889,0.035000,0.203200> rotate<0,-44.996992,0> translate<12.363325,0.000000,25.196797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.425797,0.000000,19.325322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.425797,0.000000,19.435137>}
box{<0,0,-0.203200><0.109816,0.035000,0.203200> rotate<0,90.000000,0> translate<12.425797,0.000000,19.435137> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.425797,0.000000,19.435137>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.591741,0.000000,19.366400>}
box{<0,0,-0.203200><0.179617,0.035000,0.203200> rotate<0,22.498912,0> translate<12.425797,0.000000,19.435137> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.528672,0.000000,16.205200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.650400,0.000000,16.205200>}
box{<0,0,-0.203200><2.121728,0.035000,0.203200> rotate<0,0.000000,0> translate<12.528672,0.000000,16.205200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.584256,0.000000,15.685597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.588000,0.000000,15.684044>}
box{<0,0,-0.203200><0.004053,0.035000,0.203200> rotate<0,22.530027,0> translate<12.584256,0.000000,15.685597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.588000,0.000000,15.684044>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.591741,0.000000,15.685597>}
box{<0,0,-0.203200><0.004050,0.035000,0.203200> rotate<0,-22.546965,0> translate<12.588000,0.000000,15.684044> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.591741,0.000000,15.685597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.234256,0.000000,15.685597>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<12.591741,0.000000,15.685597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.591741,0.000000,19.366400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.234256,0.000000,19.366400>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<12.591741,0.000000,19.366400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.607675,0.000000,33.070797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.906413,0.000000,32.947056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<12.607675,0.000000,33.070797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.681069,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.348000,-1.535000,18.694400>}
box{<0,0,-0.203200><12.666931,0.035000,0.203200> rotate<0,0.000000,0> translate<12.681069,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.846519,-1.535000,2.311400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.117250,-1.535000,2.423541>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-22.498528,0> translate<12.846519,-1.535000,2.311400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.846519,-1.535000,13.436597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.117250,-1.535000,13.324456>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,22.498528,0> translate<12.846519,-1.535000,13.436597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.846519,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.117250,-1.535000,23.505541>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-22.498528,0> translate<12.846519,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.846519,-1.535000,34.518597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.117250,-1.535000,34.406456>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,22.498528,0> translate<12.846519,-1.535000,34.518597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.906413,0.000000,32.947056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.684413,0.000000,31.169056>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<12.906413,0.000000,32.947056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.907834,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.665328,-1.535000,13.411200>}
box{<0,0,-0.203200><2.757494,0.035000,0.203200> rotate<0,0.000000,0> translate<12.907834,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.935069,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,32.918400>}
box{<0,0,-0.203200><4.311531,0.035000,0.203200> rotate<0,0.000000,0> translate<12.935069,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.020528,0.000000,9.874247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,8.702528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<13.020528,0.000000,9.874247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.020528,0.000000,26.955750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,28.127469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.020528,0.000000,26.955750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.087469,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.348000,-1.535000,18.288000>}
box{<0,0,-0.203200><12.260531,0.035000,0.203200> rotate<0,0.000000,0> translate<13.087469,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.117250,-1.535000,2.423541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.324456,-1.535000,2.630747>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.117250,-1.535000,2.423541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.117250,-1.535000,13.324456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.324456,-1.535000,13.117250>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,44.997030,0> translate<13.117250,-1.535000,13.324456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.117250,-1.535000,23.505541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.324456,-1.535000,23.712747>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.117250,-1.535000,23.505541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.117250,-1.535000,34.406456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.324456,-1.535000,34.199250>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,44.997030,0> translate<13.117250,-1.535000,34.406456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.132109,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,2.438400>}
box{<0,0,-0.203200><0.482291,0.035000,0.203200> rotate<0,0.000000,0> translate<13.132109,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.141175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,9.753600>}
box{<0,0,-0.203200><9.101225,0.035000,0.203200> rotate<0,0.000000,0> translate<13.141175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.182909,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,23.571200>}
box{<0,0,-0.203200><12.414291,0.035000,0.203200> rotate<0,0.000000,0> translate<13.182909,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.234256,0.000000,15.685597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458309,0.000000,15.592791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<13.234256,0.000000,15.685597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.234256,0.000000,19.366400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458309,0.000000,19.459206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<13.234256,0.000000,19.366400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.293572,0.000000,6.146797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.859069,0.000000,6.146797>}
box{<0,0,-0.203200><0.565497,0.035000,0.203200> rotate<0,0.000000,0> translate<13.293572,0.000000,6.146797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.293572,0.000000,6.146797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,7.045469>}
box{<0,0,-0.203200><1.270916,0.035000,0.203200> rotate<0,-44.996931,0> translate<13.293572,0.000000,6.146797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.293578,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.395331,0.000000,27.228800>}
box{<0,0,-0.203200><1.101753,0.035000,0.203200> rotate<0,0.000000,0> translate<13.293578,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.324456,-1.535000,2.630747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,2.901478>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-67.495533,0> translate<13.324456,-1.535000,2.630747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.324456,-1.535000,13.117250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,12.846519>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,67.495533,0> translate<13.324456,-1.535000,13.117250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.324456,-1.535000,23.712747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,23.983478>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-67.495533,0> translate<13.324456,-1.535000,23.712747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.324456,-1.535000,34.199250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,33.928519>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,67.495533,0> translate<13.324456,-1.535000,34.199250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.341469,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,32.512000>}
box{<0,0,-0.203200><3.905131,0.035000,0.203200> rotate<0,0.000000,0> translate<13.341469,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.349994,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.102006,-1.535000,34.137600>}
box{<0,0,-0.203200><33.752012,0.035000,0.203200> rotate<0,0.000000,0> translate<13.349994,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.359256,0.000000,11.236400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.583309,0.000000,11.329206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<13.359256,0.000000,11.236400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.371037,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.071728,-1.535000,13.004800>}
box{<0,0,-0.203200><2.700691,0.035000,0.203200> rotate<0,0.000000,0> translate<13.371037,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.413119,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,2.844800>}
box{<0,0,-0.203200><0.201281,0.035000,0.203200> rotate<0,0.000000,0> translate<13.413119,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.434159,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,23.977600>}
box{<0,0,-0.203200><12.163041,0.035000,0.203200> rotate<0,0.000000,0> translate<13.434159,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,2.901478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,6.289819>}
box{<0,0,-0.203200><3.388341,0.035000,0.203200> rotate<0,90.000000,0> translate<13.436597,-1.535000,6.289819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.011469,-1.535000,3.251200>}
box{<0,0,-0.203200><0.574872,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,3.657600>}
box{<0,0,-0.203200><13.690603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.316266,-1.535000,4.064000>}
box{<0,0,-0.203200><0.879669,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.909866,-1.535000,4.470400>}
box{<0,0,-0.203200><0.473269,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,4.876800>}
box{<0,0,-0.203200><0.177803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,5.283200>}
box{<0,0,-0.203200><0.177803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,5.689600>}
box{<0,0,-0.203200><0.177803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.808269,-1.535000,6.096000>}
box{<0,0,-0.203200><0.371672,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,6.289819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,7.045469>}
box{<0,0,-0.203200><1.068650,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.436597,-1.535000,6.289819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,9.458178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,12.846519>}
box{<0,0,-0.203200><3.388341,0.035000,0.203200> rotate<0,90.000000,0> translate<13.436597,-1.535000,12.846519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,9.458178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,8.702528>}
box{<0,0,-0.203200><1.068650,0.035000,0.203200> rotate<0,44.997030,0> translate<13.436597,-1.535000,9.458178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.322928,-1.535000,9.753600>}
box{<0,0,-0.203200><5.886331,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.916528,-1.535000,10.160000>}
box{<0,0,-0.203200><5.479931,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.510128,-1.535000,10.566400>}
box{<0,0,-0.203200><5.073531,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.103728,-1.535000,10.972800>}
box{<0,0,-0.203200><4.667131,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.697328,-1.535000,11.379200>}
box{<0,0,-0.203200><4.260731,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.290928,-1.535000,11.785600>}
box{<0,0,-0.203200><3.854331,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.884528,-1.535000,12.192000>}
box{<0,0,-0.203200><3.447931,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.478128,-1.535000,12.598400>}
box{<0,0,-0.203200><3.041531,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,23.983478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,27.371819>}
box{<0,0,-0.203200><3.388341,0.035000,0.203200> rotate<0,90.000000,0> translate<13.436597,-1.535000,27.371819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,24.384000>}
box{<0,0,-0.203200><12.160603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,24.790400>}
box{<0,0,-0.203200><12.160603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,25.196800>}
box{<0,0,-0.203200><12.160603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.354000,-1.535000,25.603200>}
box{<0,0,-0.203200><11.917403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.487219,-1.535000,26.009600>}
box{<0,0,-0.203200><2.050622,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.080819,-1.535000,26.416000>}
box{<0,0,-0.203200><1.644222,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,26.822400>}
box{<0,0,-0.203200><1.270003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,27.228800>}
box{<0,0,-0.203200><1.270003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,27.371819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,28.127469>}
box{<0,0,-0.203200><1.068650,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.436597,-1.535000,27.371819> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,30.540178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,33.928519>}
box{<0,0,-0.203200><3.388341,0.035000,0.203200> rotate<0,90.000000,0> translate<13.436597,-1.535000,33.928519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,30.540178>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,29.784528>}
box{<0,0,-0.203200><1.068650,0.035000,0.203200> rotate<0,44.997030,0> translate<13.436597,-1.535000,30.540178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.979222,-1.535000,30.886400>}
box{<0,0,-0.203200><1.542625,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.385622,-1.535000,31.292800>}
box{<0,0,-0.203200><1.949025,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.417619,-1.535000,31.699200>}
box{<0,0,-0.203200><3.981022,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,-1.535000,32.105600>}
box{<0,0,-0.203200><3.810003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,-1.535000,32.512000>}
box{<0,0,-0.203200><3.810003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,-1.535000,32.918400>}
box{<0,0,-0.203200><3.810003,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.417622,-1.535000,33.324800>}
box{<0,0,-0.203200><3.981025,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.436597,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.824022,-1.535000,33.731200>}
box{<0,0,-0.203200><4.387425,0.035000,0.203200> rotate<0,0.000000,0> translate<13.436597,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458309,0.000000,15.592791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.629791,0.000000,15.421309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<13.458309,0.000000,15.592791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458309,0.000000,19.459206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.629791,0.000000,19.630688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.458309,0.000000,19.459206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.493869,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.348000,-1.535000,17.881600>}
box{<0,0,-0.203200><11.854131,0.035000,0.203200> rotate<0,0.000000,0> translate<13.493869,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.496775,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,30.480000>}
box{<0,0,-0.203200><1.209825,0.035000,0.203200> rotate<0,0.000000,0> translate<13.496775,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.506303,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.843916,0.000000,19.507200>}
box{<0,0,-0.203200><2.337613,0.035000,0.203200> rotate<0,0.000000,0> translate<13.506303,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.547575,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.729328,-1.535000,9.347200>}
box{<0,0,-0.203200><6.181753,0.035000,0.203200> rotate<0,0.000000,0> translate<13.547575,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.547575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,9.347200>}
box{<0,0,-0.203200><8.694825,0.035000,0.203200> rotate<0,0.000000,0> translate<13.547575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.583309,0.000000,11.329206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754791,0.000000,11.500687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.583309,0.000000,11.329206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.607900,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.807325,0.000000,15.443200>}
box{<0,0,-0.203200><3.199425,0.035000,0.203200> rotate<0,0.000000,0> translate<13.607900,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,0.000000,0.914400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<13.614400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,-1.535000,0.914400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<13.614400,-1.535000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,0.000000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.614400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.614400,-1.535000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.173200,0.000000,3.412928>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.996870,0> translate<13.614400,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.614400,-1.535000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<13.614400,-1.535000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,4.765866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.614400,-1.535000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.614400,-1.535000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,-1.535000,6.705597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.614400,-1.535000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.629791,0.000000,15.421309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,15.197256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<13.629791,0.000000,15.421309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.629791,0.000000,19.630688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,19.854741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<13.629791,0.000000,19.630688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.633303,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,11.379200>}
box{<0,0,-0.203200><8.609097,0.035000,0.203200> rotate<0,0.000000,0> translate<13.633303,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.649175,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.214672,0.000000,6.502400>}
box{<0,0,-0.203200><0.565497,0.035000,0.203200> rotate<0,0.000000,0> translate<13.649175,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.649178,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.214669,-1.535000,6.502400>}
box{<0,0,-0.203200><0.565491,0.035000,0.203200> rotate<0,0.000000,0> translate<13.649178,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.699978,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,0.000000,27.635200>}
box{<0,0,-0.203200><1.006622,0.035000,0.203200> rotate<0,0.000000,0> translate<13.699978,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.699978,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,27.635200>}
box{<0,0,-0.203200><1.006622,0.035000,0.203200> rotate<0,0.000000,0> translate<13.699978,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,14.795400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,15.197256>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,90.000000,0> translate<13.722597,0.000000,15.197256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,14.795400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,14.787675>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<13.722597,0.000000,14.795400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.799094,0.000000,15.036800>}
box{<0,0,-0.203200><5.076497,0.035000,0.203200> rotate<0,0.000000,0> translate<13.722597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,19.854741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,20.015200>}
box{<0,0,-0.203200><0.160459,0.035000,0.203200> rotate<0,90.000000,0> translate<13.722597,0.000000,20.015200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,19.913600>}
box{<0,0,-0.203200><1.847603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.722597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,20.015200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,20.015200>}
box{<0,0,-0.203200><1.847603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.722597,0.000000,20.015200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,13.420300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,14.787675>}
box{<0,0,-0.203200><1.367375,0.035000,0.203200> rotate<0,90.000000,0> translate<13.725797,0.000000,14.787675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,13.420300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754791,0.000000,13.391309>}
box{<0,0,-0.203200><0.041001,0.035000,0.203200> rotate<0,44.993942,0> translate<13.725797,0.000000,13.420300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,13.817600>}
box{<0,0,-0.203200><8.713403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,14.224000>}
box{<0,0,-0.203200><8.713403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,14.630400>}
box{<0,0,-0.203200><8.713403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.734900,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,13.411200>}
box{<0,0,-0.203200><8.704300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.734900,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.747869,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,32.105600>}
box{<0,0,-0.203200><3.498731,0.035000,0.203200> rotate<0,0.000000,0> translate<13.747869,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754791,0.000000,11.500687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847597,0.000000,11.724741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<13.754791,0.000000,11.500687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.754791,0.000000,13.391309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847597,0.000000,13.167256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<13.754791,0.000000,13.391309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847597,0.000000,11.724741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847597,0.000000,13.167256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<13.847597,0.000000,13.167256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,11.785600>}
box{<0,0,-0.203200><8.394803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.847597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.259278,0.000000,12.192000>}
box{<0,0,-0.203200><8.411681,0.035000,0.203200> rotate<0,0.000000,0> translate<13.847597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,12.598400>}
box{<0,0,-0.203200><8.591603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.847597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.847597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,13.004800>}
box{<0,0,-0.203200><8.591603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.847597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.859069,0.000000,4.521200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.173200,0.000000,4.207069>}
box{<0,0,-0.203200><0.444249,0.035000,0.203200> rotate<0,44.997030,0> translate<13.859069,0.000000,4.521200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.859069,0.000000,6.146797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,0.000000,6.705597>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.997190,0> translate<13.859069,0.000000,6.146797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.900269,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.461894,-1.535000,17.475200>}
box{<0,0,-0.203200><11.561625,0.035000,0.203200> rotate<0,0.000000,0> translate<13.900269,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.903175,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,30.073600>}
box{<0,0,-0.203200><0.803425,0.035000,0.203200> rotate<0,0.000000,0> translate<13.903175,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.953975,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.135728,-1.535000,8.940800>}
box{<0,0,-0.203200><6.181753,0.035000,0.203200> rotate<0,0.000000,0> translate<13.953975,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.953975,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,8.940800>}
box{<0,0,-0.203200><8.288425,0.035000,0.203200> rotate<0,0.000000,0> translate<13.953975,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.055575,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.491328,0.000000,6.908800>}
box{<0,0,-0.203200><6.435753,0.035000,0.203200> rotate<0,0.000000,0> translate<14.055575,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.055578,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.167728,-1.535000,6.908800>}
box{<0,0,-0.203200><8.112150,0.035000,0.203200> rotate<0,0.000000,0> translate<14.055578,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.106378,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.496925,0.000000,28.041600>}
box{<0,0,-0.203200><0.390547,0.035000,0.203200> rotate<0,0.000000,0> translate<14.106378,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.106378,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,28.041600>}
box{<0,0,-0.203200><0.600222,0.035000,0.203200> rotate<0,0.000000,0> translate<14.106378,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.154269,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.417619,0.000000,31.699200>}
box{<0,0,-0.203200><3.263350,0.035000,0.203200> rotate<0,0.000000,0> translate<14.154269,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.173200,0.000000,4.207069>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.173200,0.000000,3.412928>}
box{<0,0,-0.203200><0.794141,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.173200,0.000000,3.412928> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,8.702528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<14.192247,0.000000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,8.702528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<14.192247,-1.535000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.897728,0.000000,7.315200>}
box{<0,0,-0.203200><6.705481,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.761328,-1.535000,7.315200>}
box{<0,0,-0.203200><7.569081,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.304128,0.000000,7.721600>}
box{<0,0,-0.203200><7.111881,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.354928,-1.535000,7.721600>}
box{<0,0,-0.203200><7.162681,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.948528,-1.535000,8.128000>}
box{<0,0,-0.203200><6.756281,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.768434,0.000000,8.128000>}
box{<0,0,-0.203200><7.576188,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.542128,-1.535000,8.534400>}
box{<0,0,-0.203200><6.349881,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.508631,0.000000,8.534400>}
box{<0,0,-0.203200><8.316384,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,28.127469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,28.346281>}
box{<0,0,-0.203200><0.218812,0.035000,0.203200> rotate<0,90.000000,0> translate<14.192247,0.000000,28.346281> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,28.127469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,29.784528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<14.192247,-1.535000,29.784528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,0.000000,28.346281>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,0.000000,27.831925>}
box{<0,0,-0.203200><0.727407,0.035000,0.203200> rotate<0,44.997204,0> translate<14.192247,0.000000,28.346281> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.080825,-1.535000,28.448000>}
box{<0,0,-0.203200><0.888578,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.182419,-1.535000,28.854400>}
box{<0,0,-0.203200><0.990172,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.776019,-1.535000,29.260800>}
box{<0,0,-0.203200><0.583772,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.192247,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,29.667200>}
box{<0,0,-0.203200><0.514353,0.035000,0.203200> rotate<0,0.000000,0> translate<14.192247,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.306669,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,17.068800>}
box{<0,0,-0.203200><16.630531,0.035000,0.203200> rotate<0,0.000000,0> translate<14.306669,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,0.000000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208125,0.000000,0.914400>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<14.417866,0.000000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,-1.535000,0.914400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<14.417866,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<14.417866,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<14.417866,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,0.000000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,0.000000,6.705597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<14.417866,0.000000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.417866,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,-1.535000,6.705597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<14.417866,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.560669,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.385625,0.000000,31.292800>}
box{<0,0,-0.203200><0.824956,0.035000,0.203200> rotate<0,0.000000,0> translate<14.560669,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.650400,0.000000,16.168741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.743206,0.000000,15.944688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<14.650400,0.000000,16.168741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.650400,0.000000,16.205200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.650400,0.000000,16.168741>}
box{<0,0,-0.203200><0.036459,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.650400,0.000000,16.168741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.684413,0.000000,31.169056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.913056,0.000000,30.940413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<14.684413,0.000000,31.169056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,26.790219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.614219,-1.535000,25.882600>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,44.997030,0> translate<14.706600,-1.535000,26.790219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,0.000000,27.831925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,0.000000,27.540069>}
box{<0,0,-0.203200><0.291856,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.706600,0.000000,27.540069> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,28.073778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,26.790219>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.706600,-1.535000,26.790219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,28.073778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.334822,-1.535000,28.701997>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,-44.996888,0> translate<14.706600,-1.535000,28.073778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,29.330219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.334822,-1.535000,28.701997>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<14.706600,-1.535000,29.330219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,30.613778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,29.330219>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.706600,-1.535000,29.330219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.706600,-1.535000,30.613778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.614219,-1.535000,31.521397>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.706600,-1.535000,30.613778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.713069,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.627931,-1.535000,16.662400>}
box{<0,0,-0.203200><9.914862,0.035000,0.203200> rotate<0,0.000000,0> translate<14.713069,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.741338,0.000000,17.830797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.743206,0.000000,17.835309>}
box{<0,0,-0.203200><0.004884,0.035000,0.203200> rotate<0,-67.499758,0> translate<14.741338,0.000000,17.830797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.743206,0.000000,15.944688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.914688,0.000000,15.773206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<14.743206,0.000000,15.944688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.743206,0.000000,17.835309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.914688,0.000000,18.006791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.743206,0.000000,17.835309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.913056,0.000000,30.940413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.948256,0.000000,30.855431>}
box{<0,0,-0.203200><0.091983,0.035000,0.203200> rotate<0,67.495768,0> translate<14.913056,0.000000,30.940413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.914688,0.000000,15.773206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138741,0.000000,15.680400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<14.914688,0.000000,15.773206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.914688,0.000000,18.006791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138741,0.000000,18.099597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<14.914688,0.000000,18.006791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.935431,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.979225,0.000000,30.886400>}
box{<0,0,-0.203200><0.043794,0.035000,0.203200> rotate<0,0.000000,0> translate<14.935431,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.948256,0.000000,30.855431>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.614219,0.000000,31.521397>}
box{<0,0,-0.203200><0.941815,0.035000,0.203200> rotate<0,-44.997165,0> translate<14.948256,0.000000,30.855431> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.119469,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,16.256000>}
box{<0,0,-0.203200><9.472531,0.035000,0.203200> rotate<0,0.000000,0> translate<15.119469,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138741,0.000000,15.680400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.570125,0.000000,15.680400>}
box{<0,0,-0.203200><1.431384,0.035000,0.203200> rotate<0,0.000000,0> translate<15.138741,0.000000,15.680400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138741,0.000000,18.099597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,18.099597>}
box{<0,0,-0.203200><0.812459,0.035000,0.203200> rotate<0,0.000000,0> translate<15.138741,0.000000,18.099597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.208125,0.000000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.274931,0.000000,-0.152400>}
box{<0,0,-0.203200><1.508687,0.035000,0.203200> rotate<0,44.996862,0> translate<15.208125,0.000000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.525869,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,15.849600>}
box{<0,0,-0.203200><9.066131,0.035000,0.203200> rotate<0,0.000000,0> translate<15.525869,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,1.717866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.554131,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,2.854131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<15.554131,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,4.765866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.554131,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,0.000000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,5.902131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<15.554131,0.000000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.554131,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,5.902131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<15.554131,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,19.906641>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.663006,0.000000,19.682588>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<15.570200,0.000000,19.906641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,20.015200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,19.906641>}
box{<0,0,-0.203200><0.108559,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.570200,0.000000,19.906641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.614219,-1.535000,25.882600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897778,-1.535000,25.882600>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,0.000000,0> translate<15.614219,-1.535000,25.882600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.614219,0.000000,31.521397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897778,0.000000,31.521397>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,0.000000,0> translate<15.614219,0.000000,31.521397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.614219,-1.535000,31.521397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897778,-1.535000,31.521397>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,0.000000,0> translate<15.614219,-1.535000,31.521397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.655731,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.396266,-1.535000,4.064000>}
box{<0,0,-0.203200><3.740534,0.035000,0.203200> rotate<0,0.000000,0> translate<15.655731,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.663006,0.000000,19.682588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.834488,0.000000,19.511106>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<15.663006,0.000000,19.682588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.757328,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.294669,0.000000,6.502400>}
box{<0,0,-0.203200><3.537341,0.035000,0.203200> rotate<0,0.000000,0> translate<15.757328,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.757328,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.294669,-1.535000,6.502400>}
box{<0,0,-0.203200><3.537341,0.035000,0.203200> rotate<0,0.000000,0> translate<15.757328,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.798797,0.000000,3.412928>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.798797,0.000000,4.207069>}
box{<0,0,-0.203200><0.794141,0.035000,0.203200> rotate<0,90.000000,0> translate<15.798797,0.000000,4.207069> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.798797,0.000000,3.412928>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,2.854131>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,44.996870,0> translate<15.798797,0.000000,3.412928> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.798797,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.122391,0.000000,3.657600>}
box{<0,0,-0.203200><4.323594,0.035000,0.203200> rotate<0,0.000000,0> translate<15.798797,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.798797,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.396266,0.000000,4.064000>}
box{<0,0,-0.203200><3.597469,0.035000,0.203200> rotate<0,0.000000,0> translate<15.798797,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.798797,0.000000,4.207069>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,4.765866>}
box{<0,0,-0.203200><0.790260,0.035000,0.203200> rotate<0,-44.996870,0> translate<15.798797,0.000000,4.207069> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.834488,0.000000,19.511106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,19.462763>}
box{<0,0,-0.203200><0.126329,0.035000,0.203200> rotate<0,22.498452,0> translate<15.834488,0.000000,19.511106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.858931,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.193066,-1.535000,1.219200>}
box{<0,0,-0.203200><3.334134,0.035000,0.203200> rotate<0,0.000000,0> translate<15.858931,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.932269,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,15.443200>}
box{<0,0,-0.203200><8.659731,0.035000,0.203200> rotate<0,0.000000,0> translate<15.932269,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,19.462763>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.951200,0.000000,18.099597>}
box{<0,0,-0.203200><1.363166,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.951200,0.000000,18.099597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.960528,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.091469,0.000000,3.251200>}
box{<0,0,-0.203200><3.130941,0.035000,0.203200> rotate<0,0.000000,0> translate<15.960528,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.960528,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.091469,-1.535000,3.251200>}
box{<0,0,-0.203200><3.130941,0.035000,0.203200> rotate<0,0.000000,0> translate<15.960528,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.062128,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.989866,0.000000,4.470400>}
box{<0,0,-0.203200><2.927737,0.035000,0.203200> rotate<0,0.000000,0> translate<16.062128,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.062131,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.989866,-1.535000,4.470400>}
box{<0,0,-0.203200><2.927734,0.035000,0.203200> rotate<0,0.000000,0> translate<16.062131,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.163728,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.888269,0.000000,6.096000>}
box{<0,0,-0.203200><2.724541,0.035000,0.203200> rotate<0,0.000000,0> translate<16.163728,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.163728,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.888269,-1.535000,6.096000>}
box{<0,0,-0.203200><2.724541,0.035000,0.203200> rotate<0,0.000000,0> translate<16.163728,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.265331,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.786666,-1.535000,1.625600>}
box{<0,0,-0.203200><2.521334,0.035000,0.203200> rotate<0,0.000000,0> translate<16.265331,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.338669,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.852294,-1.535000,15.036800>}
box{<0,0,-0.203200><8.513625,0.035000,0.203200> rotate<0,0.000000,0> translate<16.338669,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<16.357597,-1.535000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,2.032000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,2.063872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,2.854131>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,90.000000,0> translate<16.357597,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,2.063872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.354669,0.000000,1.066797>}
box{<0,0,-0.203200><1.410075,0.035000,0.203200> rotate<0,44.997120,0> translate<16.357597,0.000000,2.063872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,2.438400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,2.438400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,5.902131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<16.357597,0.000000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,5.902131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<16.357597,-1.535000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,4.876800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,4.876800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,5.283200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,5.283200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,5.689600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.357597,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,5.689600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<16.357597,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.389469,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,2.032000>}
box{<0,0,-0.203200><2.304931,0.035000,0.203200> rotate<0,0.000000,0> translate<16.389469,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.570125,0.000000,15.680400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.053584,0.000000,15.196941>}
box{<0,0,-0.203200><0.683715,0.035000,0.203200> rotate<0,44.997030,0> translate<16.570125,0.000000,15.680400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.745069,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,14.630400>}
box{<0,0,-0.203200><14.192131,0.035000,0.203200> rotate<0,0.000000,0> translate<16.745069,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.795869,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.786666,0.000000,1.625600>}
box{<0,0,-0.203200><1.990797,0.035000,0.203200> rotate<0,0.000000,0> translate<16.795869,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897778,-1.535000,25.882600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,-1.535000,26.510822>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.897778,-1.535000,25.882600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897778,0.000000,31.521397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,30.893175>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<16.897778,0.000000,31.521397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897778,-1.535000,31.521397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,-1.535000,30.893175>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<16.897778,-1.535000,31.521397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.024778,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.027219,-1.535000,26.009600>}
box{<0,0,-0.203200><1.002441,0.035000,0.203200> rotate<0,0.000000,0> translate<17.024778,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.053584,0.000000,15.196941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.352322,0.000000,15.073200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<17.053584,0.000000,15.196941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.126375,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.824019,0.000000,31.292800>}
box{<0,0,-0.203200><0.697644,0.035000,0.203200> rotate<0,0.000000,0> translate<17.126375,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.126375,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.824019,-1.535000,31.292800>}
box{<0,0,-0.203200><0.697644,0.035000,0.203200> rotate<0,0.000000,0> translate<17.126375,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.151469,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,14.224000>}
box{<0,0,-0.203200><13.785731,0.035000,0.203200> rotate<0,0.000000,0> translate<17.151469,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.202269,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.193066,0.000000,1.219200>}
box{<0,0,-0.203200><1.990797,0.035000,0.203200> rotate<0,0.000000,0> translate<17.202269,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,31.870219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.874822,0.000000,31.241997>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<17.246600,0.000000,31.870219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,-1.535000,31.870219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.874822,-1.535000,31.241997>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<17.246600,-1.535000,31.870219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,33.153778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,31.870219>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.246600,0.000000,31.870219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,-1.535000,33.153778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,-1.535000,31.870219>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.246600,-1.535000,31.870219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,0.000000,33.153778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.154219,0.000000,34.061397>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.246600,0.000000,33.153778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.246600,-1.535000,33.153778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.154219,-1.535000,34.061397>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.246600,-1.535000,33.153778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.352322,0.000000,15.073200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.762697,0.000000,15.073200>}
box{<0,0,-0.203200><1.410375,0.035000,0.203200> rotate<0,0.000000,0> translate<17.352322,0.000000,15.073200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.354669,0.000000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.345472,0.000000,1.066797>}
box{<0,0,-0.203200><1.990803,0.035000,0.203200> rotate<0,0.000000,0> translate<17.354669,0.000000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.431178,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.620819,-1.535000,26.416000>}
box{<0,0,-0.203200><0.189641,0.035000,0.203200> rotate<0,0.000000,0> translate<17.431178,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,-1.535000,26.510822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.154219,-1.535000,25.882600>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,44.997173,0> translate<17.526000,-1.535000,26.510822> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,30.893175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.874822,0.000000,31.241997>}
box{<0,0,-0.203200><0.493309,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.526000,0.000000,30.893175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,-1.535000,30.893175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.874822,-1.535000,31.241997>}
box{<0,0,-0.203200><0.493309,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.526000,-1.535000,30.893175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.557869,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,13.817600>}
box{<0,0,-0.203200><13.379331,0.035000,0.203200> rotate<0,0.000000,0> translate<17.557869,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.576797,0.000000,18.099597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.576797,0.000000,19.420681>}
box{<0,0,-0.203200><1.321084,0.035000,0.203200> rotate<0,90.000000,0> translate<17.576797,0.000000,19.420681> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.576797,0.000000,18.099597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.881256,0.000000,18.099597>}
box{<0,0,-0.203200><0.304459,0.035000,0.203200> rotate<0,0.000000,0> translate<17.576797,0.000000,18.099597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.576797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.678525,0.000000,18.288000>}
box{<0,0,-0.203200><2.101728,0.035000,0.203200> rotate<0,0.000000,0> translate<17.576797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.576797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.272125,0.000000,18.694400>}
box{<0,0,-0.203200><1.695328,0.035000,0.203200> rotate<0,0.000000,0> translate<17.576797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.576797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.865725,0.000000,19.100800>}
box{<0,0,-0.203200><1.288928,0.035000,0.203200> rotate<0,0.000000,0> translate<17.576797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.576797,0.000000,19.420681>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.582541,0.000000,19.418300>}
box{<0,0,-0.203200><0.006218,0.035000,0.203200> rotate<0,22.516484,0> translate<17.576797,0.000000,19.420681> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.582541,0.000000,19.418300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.548225,0.000000,19.418300>}
box{<0,0,-0.203200><0.965684,0.035000,0.203200> rotate<0,0.000000,0> translate<17.582541,0.000000,19.418300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.881256,0.000000,18.099597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.105309,0.000000,18.006791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<17.881256,0.000000,18.099597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.964269,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,13.411200>}
box{<0,0,-0.203200><12.972931,0.035000,0.203200> rotate<0,0.000000,0> translate<17.964269,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.105309,0.000000,18.006791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.276791,0.000000,17.835309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<18.105309,0.000000,18.006791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.154219,-1.535000,25.882600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.437778,-1.535000,25.882600>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,0.000000,0> translate<18.154219,-1.535000,25.882600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.154219,0.000000,34.061397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.637131,0.000000,34.061397>}
box{<0,0,-0.203200><0.482912,0.035000,0.203200> rotate<0,0.000000,0> translate<18.154219,0.000000,34.061397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.154219,-1.535000,34.061397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.437778,-1.535000,34.061397>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,0.000000,0> translate<18.154219,-1.535000,34.061397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.230500,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.084925,0.000000,17.881600>}
box{<0,0,-0.203200><1.854425,0.035000,0.203200> rotate<0,0.000000,0> translate<18.230500,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.276791,0.000000,17.835309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,17.611256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<18.276791,0.000000,17.835309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,16.698797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,17.611256>}
box{<0,0,-0.203200><0.912459,0.035000,0.203200> rotate<0,90.000000,0> translate<18.369597,0.000000,17.611256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,16.698797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.762697,0.000000,16.698797>}
box{<0,0,-0.203200><0.393100,0.035000,0.203200> rotate<0,0.000000,0> translate<18.369597,0.000000,16.698797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.897725,0.000000,17.068800>}
box{<0,0,-0.203200><2.528128,0.035000,0.203200> rotate<0,0.000000,0> translate<18.369597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.491325,0.000000,17.475200>}
box{<0,0,-0.203200><2.121728,0.035000,0.203200> rotate<0,0.000000,0> translate<18.369597,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.370669,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,13.004800>}
box{<0,0,-0.203200><12.566531,0.035000,0.203200> rotate<0,0.000000,0> translate<18.370669,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.459325,0.000000,34.239200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.637131,0.000000,34.061397>}
box{<0,0,-0.203200><0.251454,0.035000,0.203200> rotate<0,44.996527,0> translate<18.459325,0.000000,34.239200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.548225,0.000000,19.418300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,15.527325>}
box{<0,0,-0.203200><5.502670,0.035000,0.203200> rotate<0,44.997030,0> translate<18.548225,0.000000,19.418300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.345472,0.000000,1.066797>}
box{<0,0,-0.203200><0.920752,0.035000,0.203200> rotate<0,44.996893,0> translate<18.694400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,-1.535000,0.914400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<18.694400,-1.535000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.694400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.694400,-1.535000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,0.000000,3.657597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.694400,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.694400,-1.535000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,0.000000,3.962400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<18.694400,0.000000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<18.694400,-1.535000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,4.765866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.694400,0.000000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,4.765866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.694400,-1.535000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,0.000000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,0.000000,6.705597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.694400,0.000000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.694400,-1.535000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,-1.535000,6.705597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.694400,-1.535000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.762697,0.000000,15.073200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.866688,0.000000,14.969206>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.997891,0> translate<18.762697,0.000000,15.073200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.762697,0.000000,16.698797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.866688,0.000000,16.802791>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.997891,0> translate<18.762697,0.000000,16.698797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.777069,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,12.598400>}
box{<0,0,-0.203200><12.160131,0.035000,0.203200> rotate<0,0.000000,0> translate<18.777069,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.866688,0.000000,14.969206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090741,0.000000,14.876400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<18.866688,0.000000,14.969206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.866688,0.000000,16.802791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090741,0.000000,16.895597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<18.866688,0.000000,16.802791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.957675,0.000000,35.864797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.256412,0.000000,35.741056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<18.957675,0.000000,35.864797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090741,0.000000,14.876400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.533256,0.000000,14.876400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<19.090741,0.000000,14.876400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090741,0.000000,16.895597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.533256,0.000000,16.895597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<19.090741,0.000000,16.895597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.183469,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,12.192000>}
box{<0,0,-0.203200><11.753731,0.035000,0.203200> rotate<0,0.000000,0> translate<19.183469,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.202953,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.607203,0.000000,35.763200>}
box{<0,0,-0.203200><39.404250,0.035000,0.203200> rotate<0,0.000000,0> translate<19.202953,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.256412,0.000000,35.741056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.485056,0.000000,35.512413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<19.256412,0.000000,35.741056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.437778,-1.535000,25.882600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,26.790219>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.437778,-1.535000,25.882600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.437778,-1.535000,34.061397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174375,-1.535000,33.324797>}
box{<0,0,-0.203200><1.041708,0.035000,0.203200> rotate<0,44.997152,0> translate<19.437778,-1.535000,34.061397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.485056,0.000000,35.512413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.183066>}
box{<0,0,-0.203200><1.879978,0.035000,0.203200> rotate<0,44.997098,0> translate<19.485056,0.000000,35.512413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.634131,-1.535000,0.914400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<19.497866,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,0.000000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.122388,0.000000,3.657597>}
box{<0,0,-0.203200><0.624522,0.035000,0.203200> rotate<0,0.000000,0> translate<19.497866,0.000000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.634131,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<19.497866,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,0.000000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.366231,0.000000,3.962400>}
box{<0,0,-0.203200><0.868366,0.035000,0.203200> rotate<0,0.000000,0> translate<19.497866,0.000000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.634131,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<19.497866,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,0.000000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.288125,0.000000,6.705597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<19.497866,0.000000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.634131,-1.535000,6.705597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<19.497866,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.564778,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.354000,-1.535000,26.009600>}
box{<0,0,-0.203200><5.789222,0.035000,0.203200> rotate<0,0.000000,0> translate<19.564778,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.589869,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,11.785600>}
box{<0,0,-0.203200><11.347331,0.035000,0.203200> rotate<0,0.000000,0> translate<19.589869,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.640669,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.040697,0.000000,35.356800>}
box{<0,0,-0.203200><1.400028,0.035000,0.203200> rotate<0,0.000000,0> translate<19.640669,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717175,-1.535000,28.701997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,28.073778>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,44.996888,0> translate<19.717175,-1.535000,28.701997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717175,-1.535000,28.701997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,29.330219>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.717175,-1.535000,28.701997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717175,0.000000,31.241997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174375,0.000000,30.784797>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<19.717175,0.000000,31.241997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717175,-1.535000,31.241997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174375,-1.535000,31.699200>}
box{<0,0,-0.203200><0.646581,0.035000,0.203200> rotate<0,-44.997226,0> translate<19.717175,-1.535000,31.241997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717175,-1.535000,31.241997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,30.613778>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,44.996888,0> translate<19.717175,-1.535000,31.241997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.717175,0.000000,31.241997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,0.000000,31.870219>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.717175,0.000000,31.241997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.767975,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.501725,-1.535000,31.292800>}
box{<0,0,-0.203200><7.733750,0.035000,0.203200> rotate<0,0.000000,0> translate<19.767975,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.767975,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,33.731200>}
box{<0,0,-0.203200><27.247425,0.035000,0.203200> rotate<0,0.000000,0> translate<19.767975,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.767978,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.840884,0.000000,31.292800>}
box{<0,0,-0.203200><1.072906,0.035000,0.203200> rotate<0,0.000000,0> translate<19.767978,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.869578,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.940125,-1.535000,28.854400>}
box{<0,0,-0.203200><10.070547,0.035000,0.203200> rotate<0,0.000000,0> translate<19.869578,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.971175,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.346525,-1.535000,28.448000>}
box{<0,0,-0.203200><10.375350,0.035000,0.203200> rotate<0,0.000000,0> translate<19.971175,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.971178,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.354000,-1.535000,26.416000>}
box{<0,0,-0.203200><5.382822,0.035000,0.203200> rotate<0,0.000000,0> translate<19.971178,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.996269,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,11.379200>}
box{<0,0,-0.203200><10.940931,0.035000,0.203200> rotate<0,0.000000,0> translate<19.996269,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.047069,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.950400>}
box{<0,0,-0.203200><0.767331,0.035000,0.203200> rotate<0,0.000000,0> translate<20.047069,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.072772,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.259284,0.000000,30.886400>}
box{<0,0,-0.203200><1.186512,0.035000,0.203200> rotate<0,0.000000,0> translate<20.072772,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.072775,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.908125,-1.535000,30.886400>}
box{<0,0,-0.203200><7.835350,0.035000,0.203200> rotate<0,0.000000,0> translate<20.072775,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.122388,0.000000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.366231,0.000000,3.962400>}
box{<0,0,-0.203200><0.390339,0.035000,0.203200> rotate<0,-51.336660,0> translate<20.122388,0.000000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174375,0.000000,30.784797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.227675,0.000000,30.784797>}
box{<0,0,-0.203200><0.053300,0.035000,0.203200> rotate<0,0.000000,0> translate<20.174375,0.000000,30.784797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174375,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.095325,-1.535000,31.699200>}
box{<0,0,-0.203200><6.920950,0.035000,0.203200> rotate<0,0.000000,0> translate<20.174375,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174375,-1.535000,33.324797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593675,-1.535000,33.324797>}
box{<0,0,-0.203200><7.419300,0.035000,0.203200> rotate<0,0.000000,0> translate<20.174375,-1.535000,33.324797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174375,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,33.324800>}
box{<0,0,-0.203200><26.841025,0.035000,0.203200> rotate<0,0.000000,0> translate<20.174375,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.174378,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,31.699200>}
box{<0,0,-0.203200><0.640022,0.035000,0.203200> rotate<0,0.000000,0> translate<20.174378,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.227675,0.000000,30.784797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.526412,0.000000,30.661056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<20.227675,0.000000,30.784797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.275978,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.533725,-1.535000,29.260800>}
box{<0,0,-0.203200><9.257747,0.035000,0.203200> rotate<0,0.000000,0> translate<20.275978,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.288125,0.000000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.669584,0.000000,8.087056>}
box{<0,0,-0.203200><1.953679,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.288125,0.000000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,26.790219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,28.073778>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,90.000000,0> translate<20.345397,-1.535000,28.073778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.389931,-1.535000,26.822400>}
box{<0,0,-0.203200><5.044534,0.035000,0.203200> rotate<0,0.000000,0> translate<20.345397,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,27.228800>}
box{<0,0,-0.203200><10.591803,0.035000,0.203200> rotate<0,0.000000,0> translate<20.345397,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,27.635200>}
box{<0,0,-0.203200><10.591803,0.035000,0.203200> rotate<0,0.000000,0> translate<20.345397,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.752925,-1.535000,28.041600>}
box{<0,0,-0.203200><10.407528,0.035000,0.203200> rotate<0,0.000000,0> translate<20.345397,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,29.330219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,30.613778>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,90.000000,0> translate<20.345397,-1.535000,30.613778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.127325,-1.535000,29.667200>}
box{<0,0,-0.203200><8.781928,0.035000,0.203200> rotate<0,0.000000,0> translate<20.345397,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.720925,-1.535000,30.073600>}
box{<0,0,-0.203200><8.375528,0.035000,0.203200> rotate<0,0.000000,0> translate<20.345397,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.314525,-1.535000,30.480000>}
box{<0,0,-0.203200><7.969128,0.035000,0.203200> rotate<0,0.000000,0> translate<20.345397,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,0.000000,31.870219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,0.000000,32.353131>}
box{<0,0,-0.203200><0.482913,0.035000,0.203200> rotate<0,90.000000,0> translate<20.345397,0.000000,32.353131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.592925,0.000000,32.105600>}
box{<0,0,-0.203200><0.247528,0.035000,0.203200> rotate<0,0.000000,0> translate<20.345397,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.345397,0.000000,32.353131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,31.884125>}
box{<0,0,-0.203200><0.663273,0.035000,0.203200> rotate<0,44.997221,0> translate<20.345397,0.000000,32.353131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.402669,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,10.972800>}
box{<0,0,-0.203200><10.534531,0.035000,0.203200> rotate<0,0.000000,0> translate<20.402669,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.453469,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.544000>}
box{<0,0,-0.203200><0.360931,0.035000,0.203200> rotate<0,0.000000,0> translate<20.453469,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.526412,0.000000,30.661056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.755056,0.000000,30.432413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<20.526412,0.000000,30.661056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.533256,0.000000,14.876400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.757309,0.000000,14.969206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<20.533256,0.000000,14.876400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.533256,0.000000,16.895597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.757309,0.000000,16.802791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<20.533256,0.000000,16.895597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.634131,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335997,-1.535000,1.616269>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,-44.997158,0> translate<20.634131,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.634131,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335997,-1.535000,2.955728>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,44.997158,0> translate<20.634131,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.634131,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335997,-1.535000,4.664269>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,-44.997158,0> translate<20.634131,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.634131,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335997,-1.535000,6.003728>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,44.997158,0> translate<20.634131,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.707469,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,30.480000>}
box{<0,0,-0.203200><19.806931,0.035000,0.203200> rotate<0,0.000000,0> translate<20.707469,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.735728,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.936266,-1.535000,4.064000>}
box{<0,0,-0.203200><1.200537,0.035000,0.203200> rotate<0,0.000000,0> translate<20.735728,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.755056,0.000000,30.432409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.755056,0.000000,30.432413>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,90.000000,0> translate<20.755056,0.000000,30.432413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.755056,0.000000,30.432409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.699869,0.000000,29.487597>}
box{<0,0,-0.203200><1.336167,0.035000,0.203200> rotate<0,44.997030,0> translate<20.755056,0.000000,30.432409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.757309,0.000000,14.969206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.928791,0.000000,15.140688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.757309,0.000000,14.969206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.757309,0.000000,16.802791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.928791,0.000000,16.631309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<20.757309,0.000000,16.802791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.809069,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,10.566400>}
box{<0,0,-0.203200><10.128131,0.035000,0.203200> rotate<0,0.000000,0> translate<20.809069,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,31.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.907206,0.000000,31.132688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<20.814400,0.000000,31.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,31.884125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,31.356741>}
box{<0,0,-0.203200><0.527384,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.814400,0.000000,31.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.183066>}
box{<0,0,-0.203200><0.816191,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.814400,0.000000,34.183066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.907206,0.000000,35.223309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<20.814400,0.000000,34.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.824903,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,15.036800>}
box{<0,0,-0.203200><1.614297,0.035000,0.203200> rotate<0,0.000000,0> translate<20.824903,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.837328,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.834669,-1.535000,6.502400>}
box{<0,0,-0.203200><0.997341,0.035000,0.203200> rotate<0,0.000000,0> translate<20.837328,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.897700,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.304125,0.000000,16.662400>}
box{<0,0,-0.203200><0.406425,0.035000,0.203200> rotate<0,0.000000,0> translate<20.897700,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.907206,0.000000,31.132688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078688,0.000000,30.961206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<20.907206,0.000000,31.132688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.907206,0.000000,35.223309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078688,0.000000,35.394791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.907206,0.000000,35.223309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.928791,0.000000,15.140688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,15.364741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<20.928791,0.000000,15.140688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.928791,0.000000,16.631309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,16.407256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<20.928791,0.000000,16.631309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.938928,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.733066,-1.535000,1.219200>}
box{<0,0,-0.203200><0.794138,0.035000,0.203200> rotate<0,0.000000,0> translate<20.938928,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,15.364741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,16.407256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<21.021597,0.000000,16.407256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,15.443200>}
box{<0,0,-0.203200><1.417603,0.035000,0.203200> rotate<0,0.000000,0> translate<21.021597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.116925,0.000000,15.849600>}
box{<0,0,-0.203200><1.095328,0.035000,0.203200> rotate<0,0.000000,0> translate<21.021597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.710525,0.000000,16.256000>}
box{<0,0,-0.203200><0.688928,0.035000,0.203200> rotate<0,0.000000,0> translate<21.021597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.040528,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.631469,-1.535000,3.251200>}
box{<0,0,-0.203200><0.590941,0.035000,0.203200> rotate<0,0.000000,0> translate<21.040528,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078688,0.000000,30.961206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,30.868400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<21.078688,0.000000,30.961206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078688,0.000000,35.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,35.487597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<21.078688,0.000000,35.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.113866,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,30.073600>}
box{<0,0,-0.203200><19.400534,0.035000,0.203200> rotate<0,0.000000,0> translate<21.113866,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.142128,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.529866,-1.535000,4.470400>}
box{<0,0,-0.203200><0.387738,0.035000,0.203200> rotate<0,0.000000,0> translate<21.142128,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.215469,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,10.160000>}
box{<0,0,-0.203200><9.721731,0.035000,0.203200> rotate<0,0.000000,0> translate<21.215469,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.243728,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.428269,-1.535000,6.096000>}
box{<0,0,-0.203200><0.184541,0.035000,0.203200> rotate<0,0.000000,0> translate<21.243728,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,30.868400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,30.868400>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<21.302741,0.000000,30.868400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,35.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,35.487597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<21.302741,0.000000,35.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335997,-1.535000,1.616269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,-1.535000,0.914400>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,44.997030,0> translate<21.335997,-1.535000,1.616269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335997,-1.535000,2.955728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,-1.535000,3.657597>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.335997,-1.535000,2.955728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335997,-1.535000,4.664269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,-1.535000,3.962400>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,44.997030,0> translate<21.335997,-1.535000,4.664269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335997,-1.535000,6.003728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,-1.535000,6.705597>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.335997,-1.535000,6.003728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.520266,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,29.667200>}
box{<0,0,-0.203200><18.994134,0.035000,0.203200> rotate<0,0.000000,0> translate<21.520266,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.621869,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,9.753600>}
box{<0,0,-0.203200><9.315331,0.035000,0.203200> rotate<0,0.000000,0> translate<21.621869,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.669584,0.000000,8.087056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.968322,0.000000,8.210797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<21.669584,0.000000,8.087056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.699869,0.000000,29.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,29.487597>}
box{<0,0,-0.203200><3.845388,0.035000,0.203200> rotate<0,0.000000,0> translate<21.699869,0.000000,29.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.968322,0.000000,8.210797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.210797>}
box{<0,0,-0.203200><2.466478,0.035000,0.203200> rotate<0,0.000000,0> translate<21.968322,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.028269,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,9.347200>}
box{<0,0,-0.203200><8.908931,0.035000,0.203200> rotate<0,0.000000,0> translate<22.028269,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.174131,-1.535000,0.914400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<22.037866,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.174131,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<22.037866,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.174131,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<22.037866,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.037866,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.370931,-1.535000,6.705597>}
box{<0,0,-0.203200><0.333066,0.035000,0.203200> rotate<0,0.000000,0> translate<22.037866,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,8.930741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,8.706688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<22.242400,0.000000,8.930741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.373256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,8.930741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.242400,0.000000,8.930741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.373256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.311884,0.000000,10.540997>}
box{<0,0,-0.203200><0.181563,0.035000,0.203200> rotate<0,-67.494399,0> translate<22.242400,0.000000,10.373256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.708741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.311884,0.000000,10.540997>}
box{<0,0,-0.203200><0.181566,0.035000,0.203200> rotate<0,67.494776,0> translate<22.242400,0.000000,10.708741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,12.151256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.708741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.242400,0.000000,10.708741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,12.151256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,12.375309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<22.242400,0.000000,12.151256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,8.706688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.506688,0.000000,8.535206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<22.335206,0.000000,8.706688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,12.375309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,12.479300>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<22.335206,0.000000,12.375309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.434669,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,8.940800>}
box{<0,0,-0.203200><8.502531,0.035000,0.203200> rotate<0,0.000000,0> translate<22.434669,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,15.527325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.439200,0.000000,12.479300>}
box{<0,0,-0.203200><3.048025,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.439200,0.000000,12.479300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.506688,0.000000,8.535206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.730741,0.000000,8.442400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<22.506688,0.000000,8.535206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.730741,0.000000,8.442400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.773256,0.000000,8.442400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<22.730741,0.000000,8.442400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.841069,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.087497,-1.535000,8.534400>}
box{<0,0,-0.203200><4.246428,0.035000,0.203200> rotate<0,0.000000,0> translate<22.841069,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.174131,-1.535000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,1.717866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.174131,-1.535000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.174131,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,2.854131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<23.174131,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.174131,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,4.765866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.174131,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.247469,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,8.128000>}
box{<0,0,-0.203200><3.630531,0.035000,0.203200> rotate<0,0.000000,0> translate<23.247469,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.275731,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.670013,-1.535000,4.064000>}
box{<0,0,-0.203200><1.394281,0.035000,0.203200> rotate<0,0.000000,0> translate<23.275731,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.478931,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,1.219200>}
box{<0,0,-0.203200><3.648269,0.035000,0.203200> rotate<0,0.000000,0> translate<23.478931,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.580528,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,3.251200>}
box{<0,0,-0.203200><3.546672,0.035000,0.203200> rotate<0,0.000000,0> translate<23.580528,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.653869,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,7.721600>}
box{<0,0,-0.203200><3.224131,0.035000,0.203200> rotate<0,0.000000,0> translate<23.653869,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.682131,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,4.470400>}
box{<0,0,-0.203200><0.909869,0.035000,0.203200> rotate<0,0.000000,0> translate<23.682131,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.773256,0.000000,8.442400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.997309,0.000000,8.535206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<23.773256,0.000000,8.442400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.885331,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,1.625600>}
box{<0,0,-0.203200><3.241869,0.035000,0.203200> rotate<0,0.000000,0> translate<23.885331,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<23.977597,-1.535000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,2.032000>}
box{<0,0,-0.203200><3.149603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.977597,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,2.438400>}
box{<0,0,-0.203200><3.149603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.977597,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,2.844800>}
box{<0,0,-0.203200><3.149603,0.035000,0.203200> rotate<0,0.000000,0> translate<23.977597,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,5.098931>}
box{<0,0,-0.203200><0.333066,0.035000,0.203200> rotate<0,90.000000,0> translate<23.977597,-1.535000,5.098931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.199725,-1.535000,4.876800>}
box{<0,0,-0.203200><0.222128,0.035000,0.203200> rotate<0,0.000000,0> translate<23.977597,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.977597,-1.535000,5.098931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,4.484525>}
box{<0,0,-0.203200><0.868899,0.035000,0.203200> rotate<0,44.997176,0> translate<23.977597,-1.535000,5.098931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.995363,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.534400>}
box{<0,0,-0.203200><0.439438,0.035000,0.203200> rotate<0,0.000000,0> translate<23.995363,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.997309,0.000000,8.535206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.168791,0.000000,8.706688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.997309,0.000000,8.535206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.060269,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,7.315200>}
box{<0,0,-0.203200><2.817731,0.035000,0.203200> rotate<0,0.000000,0> translate<24.060269,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.168791,0.000000,8.706688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.261597,0.000000,8.930741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<24.168791,0.000000,8.706688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.261597,0.000000,8.930741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.261597,0.000000,8.985200>}
box{<0,0,-0.203200><0.054459,0.035000,0.203200> rotate<0,90.000000,0> translate<24.261597,0.000000,8.985200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.261597,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.645700,0.000000,8.940800>}
box{<0,0,-0.203200><0.384103,0.035000,0.203200> rotate<0,0.000000,0> translate<24.261597,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.261597,0.000000,8.985200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.690100,0.000000,8.985200>}
box{<0,0,-0.203200><0.428503,0.035000,0.203200> rotate<0,0.000000,0> translate<24.261597,0.000000,8.985200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.598656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.210797>}
box{<0,0,-0.203200><0.387859,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.434800,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.598656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.527606,0.000000,8.822709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<24.434800,0.000000,8.598656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.466669,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.934969,-1.535000,6.908800>}
box{<0,0,-0.203200><2.468300,0.035000,0.203200> rotate<0,0.000000,0> translate<24.466669,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.527606,0.000000,8.822709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.690100,0.000000,8.985200>}
box{<0,0,-0.203200><0.229799,0.035000,0.203200> rotate<0,-44.996479,0> translate<24.527606,0.000000,8.822709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,4.252341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.684806,-1.535000,4.028288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<24.592000,-1.535000,4.252341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,4.484525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,4.252341>}
box{<0,0,-0.203200><0.232184,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.592000,-1.535000,4.252341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,15.428341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.684806,-1.535000,15.204288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<24.592000,-1.535000,15.428341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,16.575656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,15.428341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.592000,-1.535000,15.428341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592000,-1.535000,16.575656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.684806,-1.535000,16.799709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<24.592000,-1.535000,16.575656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.684806,-1.535000,4.028288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.856288,-1.535000,3.856806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<24.684806,-1.535000,4.028288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.684806,-1.535000,15.204288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.856288,-1.535000,15.032806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<24.684806,-1.535000,15.204288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.684806,-1.535000,16.799709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.856288,-1.535000,16.971191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.684806,-1.535000,16.799709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.856288,-1.535000,3.856806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.080341,-1.535000,3.764000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<24.856288,-1.535000,3.856806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.856288,-1.535000,15.032806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.080341,-1.535000,14.940000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<24.856288,-1.535000,15.032806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.856288,-1.535000,16.971191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.080341,-1.535000,17.063997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<24.856288,-1.535000,16.971191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.873069,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,6.502400>}
box{<0,0,-0.203200><2.254131,0.035000,0.203200> rotate<0,0.000000,0> translate<24.873069,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.080341,-1.535000,3.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.227656,-1.535000,3.764000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<25.080341,-1.535000,3.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.080341,-1.535000,14.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.227656,-1.535000,14.940000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<25.080341,-1.535000,14.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.080341,-1.535000,17.063997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.227656,-1.535000,17.063997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<25.080341,-1.535000,17.063997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.279469,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,6.096000>}
box{<0,0,-0.203200><1.847731,0.035000,0.203200> rotate<0,0.000000,0> translate<25.279469,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.348000,-1.535000,17.720341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.440806,-1.535000,17.496288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<25.348000,-1.535000,17.720341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.348000,-1.535000,18.867656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.348000,-1.535000,17.720341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.348000,-1.535000,17.720341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.348000,-1.535000,18.867656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.440806,-1.535000,19.091709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<25.348000,-1.535000,18.867656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.354000,-1.535000,25.588341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.446806,-1.535000,25.364287>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<25.354000,-1.535000,25.588341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.354000,-1.535000,26.735656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.354000,-1.535000,25.588341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.354000,-1.535000,25.588341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.354000,-1.535000,26.735656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.446806,-1.535000,26.959709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<25.354000,-1.535000,26.735656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.440806,-1.535000,17.496288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.612288,-1.535000,17.324806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<25.440806,-1.535000,17.496288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.440806,-1.535000,19.091709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,19.248103>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.440806,-1.535000,19.091709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.446806,-1.535000,25.364287>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,25.213894>}
box{<0,0,-0.203200><0.212689,0.035000,0.203200> rotate<0,44.997030,0> translate<25.446806,-1.535000,25.364287> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.446806,-1.535000,26.959709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.618288,-1.535000,27.131191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.446806,-1.535000,26.959709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.487472,-1.535000,5.887997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.227656,-1.535000,5.887997>}
box{<0,0,-0.203200><0.740184,0.035000,0.203200> rotate<0,0.000000,0> translate<25.487472,-1.535000,5.887997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,29.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.769309,0.000000,29.394791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<25.545256,0.000000,29.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,30.868400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.769309,0.000000,30.961206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<25.545256,0.000000,30.868400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,35.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.769309,0.000000,35.394791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<25.545256,0.000000,35.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.588709,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,30.886400>}
box{<0,0,-0.203200><14.925691,0.035000,0.203200> rotate<0,0.000000,0> translate<25.588709,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,25.213894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.597200,-1.535000,19.248103>}
box{<0,0,-0.203200><5.965791,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.597200,-1.535000,19.248103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.612288,-1.535000,17.324806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.836341,-1.535000,17.232000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<25.612288,-1.535000,17.324806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.618288,-1.535000,27.131191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.842341,-1.535000,27.223997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<25.618288,-1.535000,27.131191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.769309,0.000000,29.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.940791,0.000000,29.223309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<25.769309,0.000000,29.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.769309,0.000000,30.961206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.940791,0.000000,31.132688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.769309,0.000000,30.961206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.769309,0.000000,35.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.940791,0.000000,35.223309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<25.769309,0.000000,35.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.807300,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.740697,0.000000,35.356800>}
box{<0,0,-0.203200><14.933397,0.035000,0.203200> rotate<0,0.000000,0> translate<25.807300,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.836341,-1.535000,17.232000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.983656,-1.535000,17.232000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<25.836341,-1.535000,17.232000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.842341,-1.535000,27.223997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.989656,-1.535000,27.223997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<25.842341,-1.535000,27.223997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.903300,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.554141,0.000000,29.260800>}
box{<0,0,-0.203200><14.650841,0.035000,0.203200> rotate<0,0.000000,0> translate<25.903300,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.940791,0.000000,29.223309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,28.999256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<25.940791,0.000000,29.223309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.940791,0.000000,31.132688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,31.356741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<25.940791,0.000000,31.132688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.940791,0.000000,35.223309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,34.999256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<25.940791,0.000000,35.223309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.959556,0.000000,33.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,32.999256>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<25.959556,0.000000,33.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.959556,0.000000,33.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,33.356741>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<25.959556,0.000000,33.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.007109,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.540884,0.000000,31.292800>}
box{<0,0,-0.203200><14.533775,0.035000,0.203200> rotate<0,0.000000,0> translate<26.007109,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.020366,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.527628,0.000000,33.324800>}
box{<0,0,-0.203200><14.507262,0.035000,0.203200> rotate<0,0.000000,0> translate<26.020366,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,28.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,28.999256>}
box{<0,0,-0.203200><0.008459,0.035000,0.203200> rotate<0,90.000000,0> translate<26.033597,0.000000,28.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,28.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.355675,0.000000,28.990797>}
box{<0,0,-0.203200><1.322078,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,28.990797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,31.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,32.999256>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,90.000000,0> translate<26.033597,0.000000,32.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,31.699200>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,32.105600>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,32.512000>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,32.918400>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,33.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,34.999256>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,90.000000,0> translate<26.033597,0.000000,34.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,33.731200>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,34.137600>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,34.544000>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.033597,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,34.950400>}
box{<0,0,-0.203200><14.480803,0.035000,0.203200> rotate<0,0.000000,0> translate<26.033597,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.227656,-1.535000,3.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.451709,-1.535000,3.856806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<26.227656,-1.535000,3.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.227656,-1.535000,5.887997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.451709,-1.535000,5.795191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<26.227656,-1.535000,5.887997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.227656,-1.535000,14.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.451709,-1.535000,15.032806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<26.227656,-1.535000,14.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.227656,-1.535000,17.063997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.451709,-1.535000,16.971191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<26.227656,-1.535000,17.063997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.451709,-1.535000,3.856806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.623191,-1.535000,4.028288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.451709,-1.535000,3.856806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.451709,-1.535000,5.795191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.623191,-1.535000,5.623709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<26.451709,-1.535000,5.795191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.451709,-1.535000,15.032806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.608103,-1.535000,15.189200>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.451709,-1.535000,15.032806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.451709,-1.535000,16.971191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.608103,-1.535000,16.814797>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,44.997030,0> translate<26.451709,-1.535000,16.971191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.455703,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.170294,-1.535000,15.036800>}
box{<0,0,-0.203200><2.714591,0.035000,0.203200> rotate<0,0.000000,0> translate<26.455703,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.557300,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,5.689600>}
box{<0,0,-0.203200><0.569900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.557300,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.608103,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.017894,-1.535000,15.189200>}
box{<0,0,-0.203200><2.409791,0.035000,0.203200> rotate<0,0.000000,0> translate<26.608103,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.608103,-1.535000,16.814797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.017894,-1.535000,16.814797>}
box{<0,0,-0.203200><2.409791,0.035000,0.203200> rotate<0,0.000000,0> translate<26.608103,-1.535000,16.814797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.623191,-1.535000,4.028288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,-1.535000,4.252341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<26.623191,-1.535000,4.028288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.623191,-1.535000,5.623709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,-1.535000,5.399656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<26.623191,-1.535000,5.623709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.637981,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,4.064000>}
box{<0,0,-0.203200><0.489219,0.035000,0.203200> rotate<0,0.000000,0> translate<26.637981,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.650516,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.659709,0.000000,8.994191>}
box{<0,0,-0.203200><0.009952,0.035000,0.203200> rotate<0,22.504893,0> translate<26.650516,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.650516,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.659709,0.000000,9.001806>}
box{<0,0,-0.203200><0.009951,0.035000,0.203200> rotate<0,-22.488270,0> translate<26.650516,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.659709,0.000000,8.994191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.831191,0.000000,8.822709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<26.659709,0.000000,8.994191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.659709,0.000000,9.001806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.831191,0.000000,9.173288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.659709,0.000000,9.001806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.713100,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,8.940800>}
box{<0,0,-0.203200><6.306900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.713100,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,-1.535000,4.252341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,-1.535000,5.399656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<26.715997,-1.535000,5.399656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,4.470400>}
box{<0,0,-0.203200><0.411203,0.035000,0.203200> rotate<0,0.000000,0> translate<26.715997,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,4.876800>}
box{<0,0,-0.203200><0.411203,0.035000,0.203200> rotate<0,0.000000,0> translate<26.715997,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.715997,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,5.283200>}
box{<0,0,-0.203200><0.411203,0.035000,0.203200> rotate<0,0.000000,0> translate<26.715997,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.831191,0.000000,8.822709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,8.598656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<26.831191,0.000000,8.822709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.831191,0.000000,9.173288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,9.397341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<26.831191,0.000000,9.173288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,7.046341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,-1.535000,6.822288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<26.878000,-1.535000,7.046341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,8.193656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,7.046341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.878000,-1.535000,7.046341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.878000,-1.535000,8.193656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,-1.535000,8.417709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<26.878000,-1.535000,8.193656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.903225,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,9.347200>}
box{<0,0,-0.203200><6.116775,0.035000,0.203200> rotate<0,0.000000,0> translate<26.903225,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,8.304697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,8.598656>}
box{<0,0,-0.203200><0.293959,0.035000,0.203200> rotate<0,90.000000,0> translate<26.923997,0.000000,8.598656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,8.304697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,0.000000,8.417709>}
box{<0,0,-0.203200><0.122323,0.035000,0.203200> rotate<0,-67.496383,0> translate<26.923997,0.000000,8.304697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.087497,0.000000,8.534400>}
box{<0,0,-0.203200><0.163500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.923997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,9.397341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,10.534531>}
box{<0,0,-0.203200><1.137191,0.035000,0.203200> rotate<0,90.000000,0> translate<26.923997,0.000000,10.534531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.243700,0.000000,9.753600>}
box{<0,0,-0.203200><6.319703,0.035000,0.203200> rotate<0,0.000000,0> translate<26.923997,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.298525,0.000000,10.160000>}
box{<0,0,-0.203200><0.374528,0.035000,0.203200> rotate<0,0.000000,0> translate<26.923997,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,10.534531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.549584,0.000000,9.908941>}
box{<0,0,-0.203200><0.884717,0.035000,0.203200> rotate<0,44.997173,0> translate<26.923997,0.000000,10.534531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,-1.535000,6.822288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,6.665894>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,44.997030,0> translate<26.970806,-1.535000,6.822288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,0.000000,8.417709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.142288,0.000000,8.589191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.970806,0.000000,8.417709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,-1.535000,8.417709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.142288,-1.535000,8.589191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.970806,-1.535000,8.417709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.983656,-1.535000,17.232000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.207709,-1.535000,17.324806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<26.983656,-1.535000,17.232000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.989656,-1.535000,27.223997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.213709,-1.535000,27.131191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<26.989656,-1.535000,27.223997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.095325,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,27.857325>}
box{<0,0,-0.203200><5.433232,0.035000,0.203200> rotate<0,44.997030,0> translate<27.095325,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,0.600322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.250941,-1.535000,0.301584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<27.127200,-1.535000,0.600322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,6.665894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.127200,-1.535000,0.600322>}
box{<0,0,-0.203200><6.065572,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.127200,-1.535000,0.600322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.142288,0.000000,8.589191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.366341,0.000000,8.681997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<27.142288,0.000000,8.589191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.142288,-1.535000,8.589191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.366341,-1.535000,8.681997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<27.142288,-1.535000,8.589191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.207709,-1.535000,17.324806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.379191,-1.535000,17.496288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.207709,-1.535000,17.324806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.213709,-1.535000,27.131191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.385191,-1.535000,26.959709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<27.213709,-1.535000,27.131191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.222797,-1.535000,25.191997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.222797,-1.535000,25.201894>}
box{<0,0,-0.203200><0.009897,0.035000,0.203200> rotate<0,90.000000,0> translate<27.222797,-1.535000,25.201894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.222797,-1.535000,25.191997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.005656,-1.535000,25.191997>}
box{<0,0,-0.203200><0.782859,0.035000,0.203200> rotate<0,0.000000,0> translate<27.222797,-1.535000,25.191997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.222797,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,25.196800>}
box{<0,0,-0.203200><3.714403,0.035000,0.203200> rotate<0,0.000000,0> translate<27.222797,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.222797,-1.535000,25.201894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.385191,-1.535000,25.364287>}
box{<0,0,-0.203200><0.229659,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.222797,-1.535000,25.201894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.250941,-1.535000,0.301584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.479584,-1.535000,0.072941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<27.250941,-1.535000,0.301584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.355675,0.000000,28.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.654413,0.000000,28.867056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<27.355675,0.000000,28.990797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.358103,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,17.475200>}
box{<0,0,-0.203200><3.579097,0.035000,0.203200> rotate<0,0.000000,0> translate<27.358103,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.366341,0.000000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.513656,0.000000,8.681997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<27.366341,0.000000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.366341,-1.535000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.513656,-1.535000,8.681997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<27.366341,-1.535000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.379191,-1.535000,17.496288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.471997,-1.535000,17.720341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<27.379191,-1.535000,17.496288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.385191,-1.535000,25.364287>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477997,-1.535000,25.588341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<27.385191,-1.535000,25.364287> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.385191,-1.535000,26.959709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477997,-1.535000,26.735656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<27.385191,-1.535000,26.959709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.442069,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,26.822400>}
box{<0,0,-0.203200><3.495131,0.035000,0.203200> rotate<0,0.000000,0> translate<27.442069,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.471997,-1.535000,17.720341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.471997,-1.535000,18.718000>}
box{<0,0,-0.203200><0.997659,0.035000,0.203200> rotate<0,90.000000,0> translate<27.471997,-1.535000,18.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.471997,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,17.881600>}
box{<0,0,-0.203200><3.465203,0.035000,0.203200> rotate<0,0.000000,0> translate<27.471997,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.471997,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,18.288000>}
box{<0,0,-0.203200><3.465203,0.035000,0.203200> rotate<0,0.000000,0> translate<27.471997,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.471997,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,18.694400>}
box{<0,0,-0.203200><3.465203,0.035000,0.203200> rotate<0,0.000000,0> translate<27.471997,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.471997,-1.535000,18.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.037656,-1.535000,18.718000>}
box{<0,0,-0.203200><0.565659,0.035000,0.203200> rotate<0,0.000000,0> translate<27.471997,-1.535000,18.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477997,-1.535000,25.588341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477997,-1.535000,26.735656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<27.477997,-1.535000,26.735656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477997,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,25.603200>}
box{<0,0,-0.203200><3.459203,0.035000,0.203200> rotate<0,0.000000,0> translate<27.477997,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477997,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,26.009600>}
box{<0,0,-0.203200><3.459203,0.035000,0.203200> rotate<0,0.000000,0> translate<27.477997,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477997,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,26.416000>}
box{<0,0,-0.203200><3.459203,0.035000,0.203200> rotate<0,0.000000,0> translate<27.477997,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.479584,-1.535000,0.072941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.704931,-1.535000,-0.152400>}
box{<0,0,-0.203200><0.318684,0.035000,0.203200> rotate<0,44.996236,0> translate<27.479584,-1.535000,0.072941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.549584,0.000000,9.908941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.848322,0.000000,9.785200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<27.549584,0.000000,9.908941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.593675,-1.535000,33.324797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.892413,-1.535000,33.201056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<27.593675,-1.535000,33.324797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.654413,0.000000,28.867056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.305413,0.000000,26.216056>}
box{<0,0,-0.203200><3.749080,0.035000,0.203200> rotate<0,44.997030,0> translate<27.654413,0.000000,28.867056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.667069,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,28.854400>}
box{<0,0,-0.203200><12.847331,0.035000,0.203200> rotate<0,0.000000,0> translate<27.667069,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.848322,0.000000,9.785200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.275300,0.000000,9.785200>}
box{<0,0,-0.203200><5.426978,0.035000,0.203200> rotate<0,0.000000,0> translate<27.848322,0.000000,9.785200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.892413,-1.535000,33.201056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.210413,-1.535000,28.883056>}
box{<0,0,-0.203200><6.106574,0.035000,0.203200> rotate<0,44.997030,0> translate<27.892413,-1.535000,33.201056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.005656,-1.535000,25.191997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.229709,-1.535000,25.099191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<28.005656,-1.535000,25.191997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.037656,-1.535000,18.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.261709,-1.535000,18.810806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<28.037656,-1.535000,18.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.073469,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,28.448000>}
box{<0,0,-0.203200><12.440931,0.035000,0.203200> rotate<0,0.000000,0> translate<28.073469,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.175069,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,32.918400>}
box{<0,0,-0.203200><18.840331,0.035000,0.203200> rotate<0,0.000000,0> translate<28.175069,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.229709,-1.535000,25.099191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.401191,-1.535000,24.927709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<28.229709,-1.535000,25.099191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,20.756194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,23.175894>}
box{<0,0,-0.203200><2.419700,0.035000,0.203200> rotate<0,90.000000,0> translate<28.244797,-1.535000,23.175894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,20.756194>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.261709,-1.535000,20.749191>}
box{<0,0,-0.203200><0.018305,0.035000,0.203200> rotate<0,22.491975,0> translate<28.244797,-1.535000,20.756194> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,21.132800>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<28.244797,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,21.539200>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<28.244797,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,21.945600>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<28.244797,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,22.352000>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<28.244797,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,22.758400>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<28.244797,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,23.164800>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<28.244797,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.244797,-1.535000,23.175894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.401191,-1.535000,23.332287>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.244797,-1.535000,23.175894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.261709,-1.535000,18.810806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.433191,-1.535000,18.982288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.261709,-1.535000,18.810806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.261709,-1.535000,20.749191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.433191,-1.535000,20.577709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<28.261709,-1.535000,20.749191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.284500,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,20.726400>}
box{<0,0,-0.203200><2.652700,0.035000,0.203200> rotate<0,0.000000,0> translate<28.284500,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.401191,-1.535000,23.332287>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.493997,-1.535000,23.556341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.401191,-1.535000,23.332287> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.401191,-1.535000,24.927709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.493997,-1.535000,24.703656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<28.401191,-1.535000,24.927709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.433191,-1.535000,18.982288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.525997,-1.535000,19.206341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.433191,-1.535000,18.982288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.433191,-1.535000,20.577709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.525997,-1.535000,20.353656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<28.433191,-1.535000,20.577709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.458069,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,24.790400>}
box{<0,0,-0.203200><2.479131,0.035000,0.203200> rotate<0,0.000000,0> translate<28.458069,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.479869,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,28.041600>}
box{<0,0,-0.203200><12.034531,0.035000,0.203200> rotate<0,0.000000,0> translate<28.479869,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.482278,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,19.100800>}
box{<0,0,-0.203200><2.454922,0.035000,0.203200> rotate<0,0.000000,0> translate<28.482278,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.493997,-1.535000,23.556341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.493997,-1.535000,24.703656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<28.493997,-1.535000,24.703656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.493997,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,23.571200>}
box{<0,0,-0.203200><2.443203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.493997,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.493997,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,23.977600>}
box{<0,0,-0.203200><2.443203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.493997,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.493997,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,24.384000>}
box{<0,0,-0.203200><2.443203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.493997,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.513656,0.000000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737709,0.000000,8.589191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<28.513656,0.000000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.513656,-1.535000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737709,-1.535000,8.589191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<28.513656,-1.535000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.525997,-1.535000,19.206341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.525997,-1.535000,20.353656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<28.525997,-1.535000,20.353656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.525997,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,19.507200>}
box{<0,0,-0.203200><2.411203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.525997,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.525997,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,19.913600>}
box{<0,0,-0.203200><2.411203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.525997,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.525997,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,20.320000>}
box{<0,0,-0.203200><2.411203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.525997,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.581469,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,32.512000>}
box{<0,0,-0.203200><18.433931,0.035000,0.203200> rotate<0,0.000000,0> translate<28.581469,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737709,0.000000,8.589191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,0.000000,8.417709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<28.737709,0.000000,8.589191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737709,-1.535000,8.589191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,-1.535000,8.417709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<28.737709,-1.535000,8.589191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,1.098672>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,6.665894>}
box{<0,0,-0.203200><5.567222,0.035000,0.203200> rotate<0,90.000000,0> translate<28.752797,-1.535000,6.665894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,1.098672>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.784672,-1.535000,1.066797>}
box{<0,0,-0.203200><0.045078,0.035000,0.203200> rotate<0,44.997030,0> translate<28.752797,-1.535000,1.098672> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.719066,-1.535000,1.219200>}
box{<0,0,-0.203200><7.966269,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.312666,-1.535000,1.625600>}
box{<0,0,-0.203200><7.559869,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.220400,-1.535000,2.032000>}
box{<0,0,-0.203200><7.467603,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.220400,-1.535000,2.438400>}
box{<0,0,-0.203200><7.467603,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.220400,-1.535000,2.844800>}
box{<0,0,-0.203200><7.467603,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.617469,-1.535000,3.251200>}
box{<0,0,-0.203200><7.864672,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,3.657600>}
box{<0,0,-0.203200><18.262603,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.129284,-1.535000,4.064000>}
box{<0,0,-0.203200><6.376488,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.766884,-1.535000,4.470400>}
box{<0,0,-0.203200><6.014088,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.752000,-1.535000,4.876800>}
box{<0,0,-0.203200><5.999203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.752000,-1.535000,5.283200>}
box{<0,0,-0.203200><5.999203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.766891,-1.535000,5.689600>}
box{<0,0,-0.203200><6.014094,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496013,-1.535000,6.096000>}
box{<0,0,-0.203200><0.743216,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,6.502400>}
box{<0,0,-0.203200><0.665203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.752797,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.752797,-1.535000,6.665894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,-1.535000,6.822288>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.752797,-1.535000,6.665894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.784672,-1.535000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.871472,-1.535000,1.066797>}
box{<0,0,-0.203200><8.086800,0.035000,0.203200> rotate<0,0.000000,0> translate<28.784672,-1.535000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.784797,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.784797,0.000000,6.697894>}
box{<0,0,-0.203200><0.347897,0.035000,0.203200> rotate<0,90.000000,0> translate<28.784797,0.000000,6.697894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.784797,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,6.349997>}
box{<0,0,-0.203200><0.633203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.784797,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.784797,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,6.502400>}
box{<0,0,-0.203200><0.633203,0.035000,0.203200> rotate<0,0.000000,0> translate<28.784797,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.784797,0.000000,6.697894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,0.000000,6.822288>}
box{<0,0,-0.203200><0.175919,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.784797,0.000000,6.697894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.792500,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.752931,-1.535000,8.534400>}
box{<0,0,-0.203200><1.960431,0.035000,0.203200> rotate<0,0.000000,0> translate<28.792500,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.792500,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046069,0.000000,8.534400>}
box{<0,0,-0.203200><4.253569,0.035000,0.203200> rotate<0,0.000000,0> translate<28.792500,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.886269,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,27.635200>}
box{<0,0,-0.203200><11.628131,0.035000,0.203200> rotate<0,0.000000,0> translate<28.886269,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,0.000000,6.822288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,7.046341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.909191,0.000000,6.822288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,-1.535000,6.822288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,-1.535000,7.046341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.909191,-1.535000,6.822288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,0.000000,8.417709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,8.193656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<28.909191,0.000000,8.417709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,-1.535000,8.417709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,-1.535000,8.193656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<28.909191,-1.535000,8.417709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.945025,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.413200,-1.535000,6.908800>}
box{<0,0,-0.203200><0.468175,0.035000,0.203200> rotate<0,0.000000,0> translate<28.945025,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.945025,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,6.908800>}
box{<0,0,-0.203200><0.472975,0.035000,0.203200> rotate<0,0.000000,0> translate<28.945025,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.987869,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,32.105600>}
box{<0,0,-0.203200><18.027531,0.035000,0.203200> rotate<0,0.000000,0> translate<28.987869,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,7.046341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,8.193656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<29.001997,0.000000,8.193656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,-1.535000,7.046341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,-1.535000,8.193656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<29.001997,-1.535000,8.193656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,7.315200>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,7.315200>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.576697,0.000000,7.721600>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.576697,-1.535000,7.721600>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.346531,-1.535000,8.128000>}
box{<0,0,-0.203200><1.344534,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.218097,0.000000,8.128000>}
box{<0,0,-0.203200><4.216100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.017894,-1.535000,15.189200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.174288,-1.535000,15.032806>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,44.997030,0> translate<29.017894,-1.535000,15.189200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.017894,-1.535000,16.814797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.174288,-1.535000,16.971191>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.017894,-1.535000,16.814797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.174288,-1.535000,15.032806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.398341,-1.535000,14.940000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<29.174288,-1.535000,15.032806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.174288,-1.535000,16.971191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.398341,-1.535000,17.063997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.174288,-1.535000,16.971191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.292669,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.567394,0.000000,27.228800>}
box{<0,0,-0.203200><11.274725,0.035000,0.203200> rotate<0,0.000000,0> translate<29.292669,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.394269,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,31.699200>}
box{<0,0,-0.203200><17.621131,0.035000,0.203200> rotate<0,0.000000,0> translate<29.394269,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.398341,-1.535000,14.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.545656,-1.535000,14.940000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<29.398341,-1.535000,14.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.398341,-1.535000,17.063997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.545656,-1.535000,17.063997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<29.398341,-1.535000,17.063997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.413200,-1.535000,6.696322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,6.684734>}
box{<0,0,-0.203200><0.012542,0.035000,0.203200> rotate<0,67.494278,0> translate<29.413200,-1.535000,6.696322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.413200,-1.535000,7.019675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.413200,-1.535000,6.696322>}
box{<0,0,-0.203200><0.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.413200,-1.535000,6.696322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.413200,-1.535000,7.019675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,7.031263>}
box{<0,0,-0.203200><0.012542,0.035000,0.203200> rotate<0,-67.494278,0> translate<29.413200,-1.535000,7.019675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,6.284341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.510806,-1.535000,6.060288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<29.418000,-1.535000,6.284341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,6.684734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,6.284341>}
box{<0,0,-0.203200><0.400394,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.418000,-1.535000,6.284341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,7.431656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,6.349997>}
box{<0,0,-0.203200><1.081659,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.418000,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,7.431656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,7.031263>}
box{<0,0,-0.203200><0.400394,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.418000,-1.535000,7.031263> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,7.431656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.510806,0.000000,7.655709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<29.418000,0.000000,7.431656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,-1.535000,7.431656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.510806,-1.535000,7.655709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<29.418000,-1.535000,7.431656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.510806,-1.535000,6.060288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.682288,-1.535000,5.888806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<29.510806,-1.535000,6.060288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.510806,0.000000,7.655709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.682288,0.000000,7.827191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.510806,0.000000,7.655709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.510806,-1.535000,7.655709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.682288,-1.535000,7.827191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.510806,-1.535000,7.655709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,14.935197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,14.940000>}
box{<0,0,-0.203200><0.004803,0.035000,0.203200> rotate<0,90.000000,0> translate<29.584797,0.000000,14.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,14.935197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.172656,0.000000,14.935197>}
box{<0,0,-0.203200><3.587859,0.035000,0.203200> rotate<0,0.000000,0> translate<29.584797,0.000000,14.935197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,14.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.545656,0.000000,14.940000>}
box{<0,0,-0.203200><0.960859,0.035000,0.203200> rotate<0,0.000000,0> translate<29.584797,0.000000,14.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.682288,-1.535000,5.888806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906341,-1.535000,5.796000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<29.682288,-1.535000,5.888806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.682288,0.000000,7.827191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906341,0.000000,7.919997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.682288,0.000000,7.827191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.682288,-1.535000,7.827191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906341,-1.535000,7.919997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.682288,-1.535000,7.827191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.699069,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,26.822400>}
box{<0,0,-0.203200><10.815331,0.035000,0.203200> rotate<0,0.000000,0> translate<29.699069,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.800669,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,31.292800>}
box{<0,0,-0.203200><17.214731,0.035000,0.203200> rotate<0,0.000000,0> translate<29.800669,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906341,-1.535000,5.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.053656,-1.535000,5.796000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<29.906341,-1.535000,5.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906341,-1.535000,7.919997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.138528,-1.535000,7.919997>}
box{<0,0,-0.203200><0.232187,0.035000,0.203200> rotate<0,0.000000,0> translate<29.906341,-1.535000,7.919997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906341,0.000000,7.919997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.053656,0.000000,7.919997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<29.906341,0.000000,7.919997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.105469,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,26.416000>}
box{<0,0,-0.203200><10.408931,0.035000,0.203200> rotate<0,0.000000,0> translate<30.105469,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.138528,-1.535000,7.919997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,8.718669>}
box{<0,0,-0.203200><1.129493,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.138528,-1.535000,7.919997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.207069,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,30.886400>}
box{<0,0,-0.203200><16.808331,0.035000,0.203200> rotate<0,0.000000,0> translate<30.207069,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.305413,0.000000,26.216056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.432409,0.000000,26.089056>}
box{<0,0,-0.203200><0.179603,0.035000,0.203200> rotate<0,44.997735,0> translate<30.305413,0.000000,26.216056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.432409,0.000000,26.089056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.432413,0.000000,26.089056>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<30.432409,0.000000,26.089056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.432413,0.000000,26.089056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.915056,0.000000,25.606413>}
box{<0,0,-0.203200><0.682561,0.035000,0.203200> rotate<0,44.997030,0> translate<30.432413,0.000000,26.089056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.511869,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,26.009600>}
box{<0,0,-0.203200><10.002531,0.035000,0.203200> rotate<0,0.000000,0> translate<30.511869,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.545656,0.000000,14.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.769709,0.000000,15.032806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<30.545656,0.000000,14.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.545656,-1.535000,14.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.769709,-1.535000,15.032806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<30.545656,-1.535000,14.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.545656,-1.535000,17.063997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.769709,-1.535000,16.971191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<30.545656,-1.535000,17.063997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.613469,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.955222,-1.535000,30.480000>}
box{<0,0,-0.203200><16.341753,0.035000,0.203200> rotate<0,0.000000,0> translate<30.613469,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.769709,-1.535000,15.032806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,15.200300>}
box{<0,0,-0.203200><0.236870,0.035000,0.203200> rotate<0,-44.997565,0> translate<30.769709,-1.535000,15.032806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.769709,0.000000,15.032806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.941191,0.000000,15.204288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.769709,0.000000,15.032806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.769709,-1.535000,16.971191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,16.803697>}
box{<0,0,-0.203200><0.236870,0.035000,0.203200> rotate<0,44.997565,0> translate<30.769709,-1.535000,16.971191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.773700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,15.036800>}
box{<0,0,-0.203200><0.163500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.773700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.773703,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,15.036800>}
box{<0,0,-0.203200><2.530697,0.035000,0.203200> rotate<0,0.000000,0> translate<30.773703,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.915056,0.000000,25.606413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,25.307675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<30.915056,0.000000,25.606413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.916388,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,25.603200>}
box{<0,0,-0.203200><9.598012,0.035000,0.203200> rotate<0,0.000000,0> translate<30.916388,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,15.200300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,8.718669>}
box{<0,0,-0.203200><6.481631,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.937200,-1.535000,8.718669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,27.857325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.937200,-1.535000,16.803697>}
box{<0,0,-0.203200><11.053628,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.937200,-1.535000,16.803697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.941191,0.000000,15.204288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,15.428341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<30.941191,0.000000,15.204288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.019869,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.548822,-1.535000,30.073600>}
box{<0,0,-0.203200><15.528953,0.035000,0.203200> rotate<0,0.000000,0> translate<31.019869,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,15.428341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,16.082734>}
box{<0,0,-0.203200><0.654394,0.035000,0.203200> rotate<0,90.000000,0> translate<31.033997,0.000000,16.082734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.354084,0.000000,15.443200>}
box{<0,0,-0.203200><2.320087,0.035000,0.203200> rotate<0,0.000000,0> translate<31.033997,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.451800,0.000000,15.849600>}
box{<0,0,-0.203200><2.417803,0.035000,0.203200> rotate<0,0.000000,0> translate<31.033997,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,16.082734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,16.094322>}
box{<0,0,-0.203200><0.012542,0.035000,0.203200> rotate<0,-67.494278,0> translate<31.033997,0.000000,16.082734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,16.094322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,25.307675>}
box{<0,0,-0.203200><9.213353,0.035000,0.203200> rotate<0,90.000000,0> translate<31.038797,0.000000,25.307675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.504400,0.000000,16.256000>}
box{<0,0,-0.203200><2.465603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.311997,0.000000,16.662400>}
box{<0,0,-0.203200><2.273200,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,17.068800>}
box{<0,0,-0.203200><2.265603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.325919,0.000000,17.475200>}
box{<0,0,-0.203200><2.287122,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.720325,0.000000,17.881600>}
box{<0,0,-0.203200><2.681528,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.062531,0.000000,18.288000>}
box{<0,0,-0.203200><13.023734,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.468931,0.000000,18.694400>}
box{<0,0,-0.203200><13.430134,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.639094,0.000000,19.100800>}
box{<0,0,-0.203200><9.600297,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,19.507200>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,19.913600>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.084013,0.000000,20.320000>}
box{<0,0,-0.203200><4.045216,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,0.000000,20.726400>}
box{<0,0,-0.203200><3.967203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,0.000000,21.132800>}
box{<0,0,-0.203200><3.967203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,0.000000,21.539200>}
box{<0,0,-0.203200><3.967203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.164697,0.000000,21.945600>}
box{<0,0,-0.203200><4.125900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.554372,0.000000,22.352000>}
box{<0,0,-0.203200><6.515575,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.976772,0.000000,22.758400>}
box{<0,0,-0.203200><7.937975,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.582975,0.000000,23.164800>}
box{<0,0,-0.203200><9.544178,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,23.571200>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,23.977600>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,24.384000>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,24.790400>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.580650,0.000000,25.196800>}
box{<0,0,-0.203200><9.541853,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.053656,-1.535000,5.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.277709,-1.535000,5.888806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<31.053656,-1.535000,5.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.053656,0.000000,7.919997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.277709,0.000000,7.827191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<31.053656,0.000000,7.919997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.277709,-1.535000,5.888806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.449191,-1.535000,6.060288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.277709,-1.535000,5.888806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.277709,0.000000,7.827191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.449191,0.000000,7.655709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<31.277709,0.000000,7.827191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.383300,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,7.721600>}
box{<0,0,-0.203200><1.636700,0.035000,0.203200> rotate<0,0.000000,0> translate<31.383300,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.426269,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,29.667200>}
box{<0,0,-0.203200><14.833481,0.035000,0.203200> rotate<0,0.000000,0> translate<31.426269,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.449191,-1.535000,6.060288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,-1.535000,6.284341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<31.449191,-1.535000,6.060288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.449191,0.000000,7.655709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,7.431656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<31.449191,0.000000,7.655709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.463981,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.129297,-1.535000,6.096000>}
box{<0,0,-0.203200><3.665316,0.035000,0.203200> rotate<0,0.000000,0> translate<31.463981,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,-1.535000,6.284341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,-1.535000,7.024528>}
box{<0,0,-0.203200><0.740188,0.035000,0.203200> rotate<0,90.000000,0> translate<31.541997,-1.535000,7.024528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,7.431656>}
box{<0,0,-0.203200><1.081659,0.035000,0.203200> rotate<0,90.000000,0> translate<31.541997,0.000000,7.431656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.571341,0.000000,6.349997>}
box{<0,0,-0.203200><0.029344,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,6.502400>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,6.502400>}
box{<0,0,-0.203200><3.713203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,6.908800>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,6.908800>}
box{<0,0,-0.203200><3.713203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,-1.535000,7.024528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.210409,-1.535000,7.692941>}
box{<0,0,-0.203200><0.945278,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.541997,-1.535000,7.024528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,7.315200>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.571341,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.371341,0.000000,6.349997>}
box{<0,0,-0.203200><0.800000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.571341,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.832669,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,7.315200>}
box{<0,0,-0.203200><3.422531,0.035000,0.203200> rotate<0,0.000000,0> translate<31.832669,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.832669,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,29.260800>}
box{<0,0,-0.203200><14.427081,0.035000,0.203200> rotate<0,0.000000,0> translate<31.832669,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.210409,-1.535000,7.692941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.210413,-1.535000,7.692941>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<32.210409,-1.535000,7.692941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.210413,-1.535000,7.692941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.439056,-1.535000,7.921584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.210413,-1.535000,7.692941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.210413,-1.535000,28.883056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.439056,-1.535000,28.654413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<32.210413,-1.535000,28.883056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.239069,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,28.854400>}
box{<0,0,-0.203200><14.020681,0.035000,0.203200> rotate<0,0.000000,0> translate<32.239069,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.239072,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,7.721600>}
box{<0,0,-0.203200><3.016128,0.035000,0.203200> rotate<0,0.000000,0> translate<32.239072,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.371341,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,6.349997>}
box{<0,0,-0.203200><0.648659,0.035000,0.203200> rotate<0,0.000000,0> translate<32.371341,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.439056,-1.535000,7.921584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,8.220322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<32.439056,-1.535000,7.921584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.439056,-1.535000,28.654413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,28.355675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<32.439056,-1.535000,28.654413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.524553,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,8.128000>}
box{<0,0,-0.203200><2.730647,0.035000,0.203200> rotate<0,0.000000,0> translate<32.524553,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.524556,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,28.448000>}
box{<0,0,-0.203200><13.735194,0.035000,0.203200> rotate<0,0.000000,0> translate<32.524556,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,8.220322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,28.355675>}
box{<0,0,-0.203200><20.135353,0.035000,0.203200> rotate<0,90.000000,0> translate<32.562797,-1.535000,28.355675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,8.534400>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,8.940800>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,9.347200>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,9.753600>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,10.160000>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,10.566400>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,10.972800>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,11.379200>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,11.785600>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,12.192000>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,12.598400>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,13.004800>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,13.411200>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,13.817600>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,14.224000>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,14.630400>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,15.036800>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,15.443200>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,15.849600>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,16.256000>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,16.662400>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,17.068800>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,17.475200>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,17.881600>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,18.288000>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,18.694400>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,19.100800>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,19.507200>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,19.913600>}
box{<0,0,-0.203200><2.692403,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.084013,-1.535000,20.320000>}
box{<0,0,-0.203200><2.521216,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,-1.535000,20.726400>}
box{<0,0,-0.203200><2.443203,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,-1.535000,21.132800>}
box{<0,0,-0.203200><2.443203,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,-1.535000,21.539200>}
box{<0,0,-0.203200><2.443203,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.164697,-1.535000,21.945600>}
box{<0,0,-0.203200><2.601900,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,22.352000>}
box{<0,0,-0.203200><21.894803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,22.758400>}
box{<0,0,-0.203200><21.894803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,23.164800>}
box{<0,0,-0.203200><21.894803,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.269088,-1.535000,23.571200>}
box{<0,0,-0.203200><14.706291,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.017834,-1.535000,23.977600>}
box{<0,0,-0.203200><14.455037,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,24.384000>}
box{<0,0,-0.203200><14.452603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,24.790400>}
box{<0,0,-0.203200><14.452603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,25.196800>}
box{<0,0,-0.203200><14.452603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,25.603200>}
box{<0,0,-0.203200><14.452603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,26.009600>}
box{<0,0,-0.203200><14.452603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,26.416000>}
box{<0,0,-0.203200><14.452603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,26.822400>}
box{<0,0,-0.203200><14.452603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,27.228800>}
box{<0,0,-0.203200><14.452603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.752019,-1.535000,27.635200>}
box{<0,0,-0.203200><14.189222,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.562797,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.345619,-1.535000,28.041600>}
box{<0,0,-0.203200><13.782822,0.035000,0.203200> rotate<0,0.000000,0> translate<32.562797,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,7.798656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,6.349997>}
box{<0,0,-0.203200><1.448659,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,7.798656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.112806,0.000000,8.022709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.020000,0.000000,7.798656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,8.597341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.112806,0.000000,8.373287>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.020000,0.000000,8.597341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,9.398656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,8.597341>}
box{<0,0,-0.203200><0.801316,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020000,0.000000,8.597341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,9.398656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.112806,0.000000,9.622709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.020000,0.000000,9.398656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.112806,0.000000,8.022709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.284288,0.000000,8.194191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.112806,0.000000,8.022709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.112806,0.000000,8.373287>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.284288,0.000000,8.201806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<33.112806,0.000000,8.373287> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.112806,0.000000,9.622709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.275300,0.000000,9.785200>}
box{<0,0,-0.203200><0.229799,0.035000,0.203200> rotate<0,-44.996479,0> translate<33.112806,0.000000,9.622709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.172656,0.000000,14.935197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,14.880625>}
box{<0,0,-0.203200><0.142599,0.035000,0.203200> rotate<0,22.499193,0> translate<33.172656,0.000000,14.935197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.284288,0.000000,8.194191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.293484,0.000000,8.197997>}
box{<0,0,-0.203200><0.009953,0.035000,0.203200> rotate<0,-22.481390,0> translate<33.284288,0.000000,8.194191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.284288,0.000000,8.201806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.293484,0.000000,8.197997>}
box{<0,0,-0.203200><0.009955,0.035000,0.203200> rotate<0,22.498008,0> translate<33.284288,0.000000,8.201806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,15.323256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,14.880625>}
box{<0,0,-0.203200><0.442631,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.304400,0.000000,14.880625> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,15.323256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.397206,0.000000,15.547309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.304400,0.000000,15.323256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,16.680741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.397206,0.000000,16.456688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.304400,0.000000,16.680741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,17.423256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,16.680741>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.304400,0.000000,16.680741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,17.423256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.397206,0.000000,17.647309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<33.304400,0.000000,17.423256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.397206,0.000000,15.547309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.451800,0.000000,15.601903>}
box{<0,0,-0.203200><0.077207,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.397206,0.000000,15.547309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.397206,0.000000,16.456688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.504400,0.000000,16.349494>}
box{<0,0,-0.203200><0.151595,0.035000,0.203200> rotate<0,44.997030,0> translate<33.397206,0.000000,16.456688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.397206,0.000000,17.647309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.568688,0.000000,17.818791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.397206,0.000000,17.647309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.451800,0.000000,16.114275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.451800,0.000000,15.601903>}
box{<0,0,-0.203200><0.512372,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.451800,0.000000,15.601903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.451800,0.000000,16.114275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.504400,0.000000,16.241259>}
box{<0,0,-0.203200><0.137447,0.035000,0.203200> rotate<0,-67.495026,0> translate<33.451800,0.000000,16.114275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.504400,0.000000,16.349494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.504400,0.000000,16.241259>}
box{<0,0,-0.203200><0.108234,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.504400,0.000000,16.241259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.568688,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.792741,0.000000,17.911597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<33.568688,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.792741,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.835256,0.000000,17.911597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<33.792741,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.752000,-1.535000,4.506341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.844806,-1.535000,4.282287>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<34.752000,-1.535000,4.506341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.752000,-1.535000,5.653656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.752000,-1.535000,4.506341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.752000,-1.535000,4.506341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.752000,-1.535000,5.653656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.844806,-1.535000,5.877709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<34.752000,-1.535000,5.653656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.835256,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.059309,0.000000,17.818791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<34.835256,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.844806,-1.535000,4.282287>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.016288,-1.535000,4.110806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<34.844806,-1.535000,4.282287> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.844806,-1.535000,5.877709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.016288,-1.535000,6.049191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.844806,-1.535000,5.877709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.907675,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.220325,0.000000,17.881600>}
box{<0,0,-0.203200><0.312650,0.035000,0.203200> rotate<0,0.000000,0> translate<34.907675,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,0.000000,20.508341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.098806,0.000000,20.284288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<35.006000,0.000000,20.508341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,-1.535000,20.508341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.098806,-1.535000,20.284288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<35.006000,-1.535000,20.508341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,0.000000,21.655656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,0.000000,20.508341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.006000,0.000000,20.508341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,-1.535000,21.655656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,-1.535000,20.508341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.006000,-1.535000,20.508341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,0.000000,21.655656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.098806,0.000000,21.879709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<35.006000,0.000000,21.655656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006000,-1.535000,21.655656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.098806,-1.535000,21.879709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<35.006000,-1.535000,21.655656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.016288,-1.535000,4.110806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.240341,-1.535000,4.018000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<35.016288,-1.535000,4.110806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.016288,-1.535000,6.049191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.240341,-1.535000,6.141997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.016288,-1.535000,6.049191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.059309,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.064000,0.000000,17.814100>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,44.997030,0> translate<35.059309,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.064000,0.000000,17.814100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.068688,0.000000,17.818791>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,-45.016121,0> translate<35.064000,0.000000,17.814100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.068688,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,17.911597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.068688,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.098806,-1.535000,20.284288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,20.127894>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,44.997030,0> translate<35.098806,-1.535000,20.284288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.098806,0.000000,20.284288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.270288,0.000000,20.112806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<35.098806,0.000000,20.284288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.098806,0.000000,21.879709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.270288,0.000000,22.051191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.098806,0.000000,21.879709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.098806,-1.535000,21.879709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.270288,-1.535000,22.051191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.098806,-1.535000,21.879709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,15.741534>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,15.832600>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,90.000000,0> translate<35.123597,0.000000,15.832600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,15.741534>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,15.811597>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,-22.498765,0> translate<35.123597,0.000000,15.741534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,15.832600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.126797,0.000000,15.840322>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-67.486080,0> translate<35.123597,0.000000,15.832600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,16.171397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,16.262463>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,90.000000,0> translate<35.123597,0.000000,16.262463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,16.171397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.126797,0.000000,16.163675>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<35.123597,0.000000,16.171397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.139197,0.000000,16.256000>}
box{<0,0,-0.203200><0.015600,0.035000,0.203200> rotate<0,0.000000,0> translate<35.123597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.123597,0.000000,16.262463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,16.192400>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,22.498765,0> translate<35.123597,0.000000,16.262463> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.126797,0.000000,15.840322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.126797,0.000000,16.163675>}
box{<0,0,-0.203200><0.323353,0.035000,0.203200> rotate<0,90.000000,0> translate<35.126797,0.000000,16.163675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.126797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,15.849600>}
box{<0,0,-0.203200><1.374403,0.035000,0.203200> rotate<0,0.000000,0> translate<35.126797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.240341,-1.535000,4.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.387656,-1.535000,4.018000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<35.240341,-1.535000,4.018000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.240341,-1.535000,6.141997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,6.141997>}
box{<0,0,-0.203200><0.014859,0.035000,0.203200> rotate<0,0.000000,0> translate<35.240341,-1.535000,6.141997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,20.127894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.255200,-1.535000,6.141997>}
box{<0,0,-0.203200><13.985897,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.255200,-1.535000,6.141997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.270288,0.000000,20.112806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.494341,0.000000,20.020000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<35.270288,0.000000,20.112806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.270288,0.000000,22.051191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.494341,0.000000,22.143997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.270288,0.000000,22.051191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.270288,-1.535000,22.051191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.494341,-1.535000,22.143997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.270288,-1.535000,22.051191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,15.811597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,15.811597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.292741,0.000000,15.811597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,16.192400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,16.192400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.292741,0.000000,16.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,17.911597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.292741,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.494341,0.000000,20.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.641656,0.000000,20.020000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<35.494341,0.000000,20.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.494341,0.000000,22.143997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.641656,0.000000,22.143997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<35.494341,0.000000,22.143997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.494341,-1.535000,22.143997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.641656,-1.535000,22.143997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<35.494341,-1.535000,22.143997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.220400,-1.535000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.871472,-1.535000,1.066797>}
box{<0,0,-0.203200><0.920752,0.035000,0.203200> rotate<0,44.996893,0> translate<36.220400,-1.535000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.220400,-1.535000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.220400,-1.535000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.220400,-1.535000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.220400,-1.535000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.023866,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.220400,-1.535000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,15.811597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,15.742859>}
box{<0,0,-0.203200><0.179617,0.035000,0.203200> rotate<0,22.498912,0> translate<36.335256,0.000000,15.811597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,16.192400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.262463>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,-22.498765,0> translate<36.335256,0.000000,16.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.559309,0.000000,17.818791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<36.335256,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.387656,-1.535000,4.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.611709,-1.535000,4.110806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.387656,-1.535000,4.018000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.407675,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720325,0.000000,17.881600>}
box{<0,0,-0.203200><0.312650,0.035000,0.203200> rotate<0,0.000000,0> translate<36.407675,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.488797,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.256000>}
box{<0,0,-0.203200><0.015603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.488797,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.498709,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.922266,-1.535000,4.064000>}
box{<0,0,-0.203200><0.423556,0.035000,0.203200> rotate<0,0.000000,0> translate<36.498709,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,16.163675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,15.742859>}
box{<0,0,-0.203200><0.420816,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.501200,0.000000,15.742859> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,16.163675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.171397>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,-67.486080,0> translate<36.501200,0.000000,16.163675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.262463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.171397>}
box{<0,0,-0.203200><0.091066,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.504400,0.000000,16.171397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.559309,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.563997,0.000000,17.814100>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,45.016121,0> translate<36.559309,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.563997,0.000000,17.814100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.568688,0.000000,17.818791>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.563997,0.000000,17.814100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.568688,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.792741,0.000000,17.911597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.568688,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.611709,-1.535000,4.110806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.743584,-1.535000,4.242684>}
box{<0,0,-0.203200><0.186502,0.035000,0.203200> rotate<0,-44.997709,0> translate<36.611709,-1.535000,4.110806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.641656,0.000000,20.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.865709,0.000000,20.112806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.641656,0.000000,20.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.641656,0.000000,22.143997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.717050,0.000000,22.112766>}
box{<0,0,-0.203200><0.081606,0.035000,0.203200> rotate<0,22.499901,0> translate<36.641656,0.000000,22.143997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.641656,-1.535000,22.143997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.865709,-1.535000,22.051191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<36.641656,-1.535000,22.143997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.717050,0.000000,22.112766>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.355963,0.000000,22.866741>}
box{<0,0,-0.203200><2.744510,0.035000,0.203200> rotate<0,-15.944344,0> translate<36.717050,0.000000,22.112766> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.743584,-1.535000,4.242684>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.023866,-1.535000,3.962400>}
box{<0,0,-0.203200><0.396380,0.035000,0.203200> rotate<0,44.997350,0> translate<36.743584,-1.535000,4.242684> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.792741,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.835256,0.000000,17.911597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<36.792741,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.865709,0.000000,20.112806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.037191,0.000000,20.284288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.865709,0.000000,20.112806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.865709,-1.535000,22.051191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.037191,-1.535000,21.879709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<36.865709,-1.535000,22.051191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,6.562525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,20.127894>}
box{<0,0,-0.203200><13.565369,0.035000,0.203200> rotate<0,90.000000,0> translate<36.880797,-1.535000,20.127894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,6.562525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.023866,-1.535000,6.705597>}
box{<0,0,-0.203200><0.202332,0.035000,0.203200> rotate<0,-44.997656,0> translate<36.880797,-1.535000,6.562525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.396419,-1.535000,6.908800>}
box{<0,0,-0.203200><9.515622,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,7.315200>}
box{<0,0,-0.203200><9.378953,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,7.721600>}
box{<0,0,-0.203200><9.378953,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,8.128000>}
box{<0,0,-0.203200><9.378953,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,8.534400>}
box{<0,0,-0.203200><9.378953,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.498025,-1.535000,8.940800>}
box{<0,0,-0.203200><9.617228,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.904425,-1.535000,9.347200>}
box{<0,0,-0.203200><10.023628,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,9.753600>}
box{<0,0,-0.203200><10.134603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,10.160000>}
box{<0,0,-0.203200><10.134603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,10.566400>}
box{<0,0,-0.203200><10.134603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,10.972800>}
box{<0,0,-0.203200><10.134603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,11.379200>}
box{<0,0,-0.203200><10.134603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,11.785600>}
box{<0,0,-0.203200><10.134603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,12.192000>}
box{<0,0,-0.203200><10.134603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,12.598400>}
box{<0,0,-0.203200><10.134603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.080963,-1.535000,13.004800>}
box{<0,0,-0.203200><10.200166,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.544166,-1.535000,13.411200>}
box{<0,0,-0.203200><10.663369,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,13.817600>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,14.224000>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,14.630400>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,15.036800>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,15.443200>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,15.849600>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,16.256000>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,16.662400>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,17.068800>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,17.475200>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,17.881600>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,18.288000>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,18.694400>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,19.100800>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,19.507200>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,19.913600>}
box{<0,0,-0.203200><17.576803,0.035000,0.203200> rotate<0,0.000000,0> translate<36.880797,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.880797,-1.535000,20.127894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.037191,-1.535000,20.284288>}
box{<0,0,-0.203200><0.221174,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.880797,-1.535000,20.127894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.971300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,21.945600>}
box{<0,0,-0.203200><17.486300,0.035000,0.203200> rotate<0,0.000000,0> translate<36.971300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.023866,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.160131,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<37.023866,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.023866,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.160131,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<37.023866,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.023866,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.160131,-1.535000,6.705597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<37.023866,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.037191,0.000000,20.284288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,0.000000,20.508341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<37.037191,0.000000,20.284288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.037191,-1.535000,20.284288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,-1.535000,20.508341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<37.037191,-1.535000,20.284288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.037191,-1.535000,21.879709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,-1.535000,21.655656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<37.037191,-1.535000,21.879709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.051981,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,20.320000>}
box{<0,0,-0.203200><3.462419,0.035000,0.203200> rotate<0,0.000000,0> translate<37.051981,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.051981,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,20.320000>}
box{<0,0,-0.203200><17.405619,0.035000,0.203200> rotate<0,0.000000,0> translate<37.051981,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,0.000000,20.508341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,0.000000,20.540103>}
box{<0,0,-0.203200><0.031762,0.035000,0.203200> rotate<0,90.000000,0> translate<37.129997,0.000000,20.540103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,-1.535000,20.508341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,-1.535000,21.655656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<37.129997,-1.535000,21.655656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,0.000000,20.540103>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.737838,0.000000,21.285200>}
box{<0,0,-0.203200><2.712195,0.035000,0.203200> rotate<0,-15.944335,0> translate<37.129997,0.000000,20.540103> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,20.726400>}
box{<0,0,-0.203200><17.327603,0.035000,0.203200> rotate<0,0.000000,0> translate<37.129997,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,21.132800>}
box{<0,0,-0.203200><17.327603,0.035000,0.203200> rotate<0,0.000000,0> translate<37.129997,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.129997,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,21.539200>}
box{<0,0,-0.203200><17.327603,0.035000,0.203200> rotate<0,0.000000,0> translate<37.129997,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.315466,0.000000,8.210797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.341462,0.000000,8.221563>}
box{<0,0,-0.203200><0.028138,0.035000,0.203200> rotate<0,-22.493562,0> translate<37.315466,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.315466,0.000000,8.210797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.229675,0.000000,8.210797>}
box{<0,0,-0.203200><0.914209,0.035000,0.203200> rotate<0,0.000000,0> translate<37.315466,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.341462,0.000000,8.221563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.433991,0.000000,8.243134>}
box{<0,0,-0.203200><0.095009,0.035000,0.203200> rotate<0,-13.122573,0> translate<37.341462,0.000000,8.221563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.433991,0.000000,8.243134>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.489409,0.000000,8.282847>}
box{<0,0,-0.203200><0.068179,0.035000,0.203200> rotate<0,-35.622639,0> translate<37.433991,0.000000,8.243134> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.489409,0.000000,8.282847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.552413,0.000000,8.308941>}
box{<0,0,-0.203200><0.068193,0.035000,0.203200> rotate<0,-22.496187,0> translate<37.489409,0.000000,8.282847> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.552413,0.000000,8.308941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.619600,0.000000,8.376128>}
box{<0,0,-0.203200><0.095017,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.552413,0.000000,8.308941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.619600,0.000000,8.376128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.696834,0.000000,8.431469>}
box{<0,0,-0.203200><0.095014,0.035000,0.203200> rotate<0,-35.620323,0> translate<37.619600,0.000000,8.376128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.696834,0.000000,8.431469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.703631,0.000000,8.442400>}
box{<0,0,-0.203200><0.012872,0.035000,0.203200> rotate<0,-58.123481,0> translate<37.696834,0.000000,8.431469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.703631,0.000000,8.442400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.721256,0.000000,8.442400>}
box{<0,0,-0.203200><0.017625,0.035000,0.203200> rotate<0,0.000000,0> translate<37.703631,0.000000,8.442400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.721256,0.000000,8.442400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.945309,0.000000,8.535206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<37.721256,0.000000,8.442400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.782034,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,20.726400>}
box{<0,0,-0.203200><2.732366,0.035000,0.203200> rotate<0,0.000000,0> translate<37.782034,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.835256,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.059309,0.000000,17.818791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<37.835256,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.907675,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.656131,0.000000,17.881600>}
box{<0,0,-0.203200><5.748456,0.035000,0.203200> rotate<0,0.000000,0> translate<37.907675,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.943362,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,0.000000,8.534400>}
box{<0,0,-0.203200><8.316388,0.035000,0.203200> rotate<0,0.000000,0> translate<37.943362,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.945309,0.000000,8.535206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,8.706688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.945309,0.000000,8.535206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.059309,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,17.647309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<38.059309,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,8.706688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,8.930741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.116791,0.000000,8.706688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.171397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.349494>}
box{<0,0,-0.203200><0.178097,0.035000,0.203200> rotate<0,90.000000,0> translate<38.123597,0.000000,16.349494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.171397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,16.163675>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<38.123597,0.000000,16.171397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.030531,0.000000,16.256000>}
box{<0,0,-0.203200><3.906934,0.035000,0.203200> rotate<0,0.000000,0> translate<38.123597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.349494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,16.456688>}
box{<0,0,-0.203200><0.151595,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.123597,0.000000,16.349494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,13.622266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,14.252694>}
box{<0,0,-0.203200><0.630428,0.035000,0.203200> rotate<0,90.000000,0> translate<38.126797,0.000000,14.252694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,13.622266>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.147584,0.000000,13.643056>}
box{<0,0,-0.203200><0.029400,0.035000,0.203200> rotate<0,-45.001336,0> translate<38.126797,0.000000,13.622266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.592131,0.000000,13.817600>}
box{<0,0,-0.203200><1.465334,0.035000,0.203200> rotate<0,0.000000,0> translate<38.126797,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.998531,0.000000,14.224000>}
box{<0,0,-0.203200><1.871734,0.035000,0.203200> rotate<0,0.000000,0> translate<38.126797,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,14.252694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,14.356688>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.126797,0.000000,14.252694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,15.651303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,16.163675>}
box{<0,0,-0.203200><0.512372,0.035000,0.203200> rotate<0,90.000000,0> translate<38.126797,0.000000,16.163675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,15.651303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,15.547309>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,44.997030,0> translate<38.126797,0.000000,15.651303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.126797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.624131,0.000000,15.849600>}
box{<0,0,-0.203200><3.497334,0.035000,0.203200> rotate<0,0.000000,0> translate<38.126797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.140113,0.000000,10.540997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.373256>}
box{<0,0,-0.203200><0.181563,0.035000,0.203200> rotate<0,67.494399,0> translate<38.140113,0.000000,10.540997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.140113,0.000000,10.540997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.708741>}
box{<0,0,-0.203200><0.181566,0.035000,0.203200> rotate<0,-67.494776,0> translate<38.140113,0.000000,10.540997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.147584,0.000000,13.643056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.446322,0.000000,13.766797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<38.147584,0.000000,13.643056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.150634,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,10.566400>}
box{<0,0,-0.203200><23.977766,0.035000,0.203200> rotate<0,0.000000,0> translate<38.150634,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.160131,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.861997,-1.535000,2.955728>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,44.997158,0> translate<38.160131,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.160131,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.861997,-1.535000,4.664269>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,-44.997158,0> translate<38.160131,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.160131,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.861997,-1.535000,6.003728>}
box{<0,0,-0.203200><0.992590,0.035000,0.203200> rotate<0,44.997158,0> translate<38.160131,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,8.930741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.373256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<38.209597,0.000000,10.373256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.498022,0.000000,8.940800>}
box{<0,0,-0.203200><8.288425,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.904422,0.000000,9.347200>}
box{<0,0,-0.203200><8.694825,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.310822,0.000000,9.753600>}
box{<0,0,-0.203200><9.101225,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,10.160000>}
box{<0,0,-0.203200><23.918803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.708741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,11.406125>}
box{<0,0,-0.203200><0.697384,0.035000,0.203200> rotate<0,90.000000,0> translate<38.209597,0.000000,11.406125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.977859,0.000000,10.972800>}
box{<0,0,-0.203200><19.768262,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.571459,0.000000,11.379200>}
box{<0,0,-0.203200><19.361863,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,11.406125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.944672,0.000000,12.141200>}
box{<0,0,-0.203200><1.039553,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.209597,0.000000,11.406125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.229675,0.000000,8.210797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.528413,0.000000,8.087056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<38.229675,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,14.356688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,14.580741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.230791,0.000000,14.356688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,15.547309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,15.323256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.230791,0.000000,15.547309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,16.456688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,16.680741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.230791,0.000000,16.456688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,17.647309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,17.423256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.230791,0.000000,17.647309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.261728,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.462266,-1.535000,4.064000>}
box{<0,0,-0.203200><1.200537,0.035000,0.203200> rotate<0,0.000000,0> translate<38.261728,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.273916,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.217731,0.000000,15.443200>}
box{<0,0,-0.203200><2.943816,0.035000,0.203200> rotate<0,0.000000,0> translate<38.273916,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.302081,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.249731,0.000000,17.475200>}
box{<0,0,-0.203200><4.947650,0.035000,0.203200> rotate<0,0.000000,0> translate<38.302081,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.315997,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.436931,0.000000,16.662400>}
box{<0,0,-0.203200><4.120934,0.035000,0.203200> rotate<0,0.000000,0> translate<38.315997,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,14.580741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,15.323256>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,90.000000,0> translate<38.323597,0.000000,15.323256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.404931,0.000000,14.630400>}
box{<0,0,-0.203200><2.081334,0.035000,0.203200> rotate<0,0.000000,0> translate<38.323597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.811331,0.000000,15.036800>}
box{<0,0,-0.203200><2.487734,0.035000,0.203200> rotate<0,0.000000,0> translate<38.323597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,16.680741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,17.423256>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,90.000000,0> translate<38.323597,0.000000,17.423256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.843331,0.000000,17.068800>}
box{<0,0,-0.203200><4.519734,0.035000,0.203200> rotate<0,0.000000,0> translate<38.323597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.363328,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.360669,-1.535000,6.502400>}
box{<0,0,-0.203200><0.997341,0.035000,0.203200> rotate<0,0.000000,0> translate<38.363328,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.429566,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,0.000000,8.128000>}
box{<0,0,-0.203200><7.830184,0.035000,0.203200> rotate<0,0.000000,0> translate<38.429566,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.446322,0.000000,13.766797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.541325,0.000000,13.766797>}
box{<0,0,-0.203200><1.095003,0.035000,0.203200> rotate<0,0.000000,0> translate<38.446322,0.000000,13.766797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.528413,0.000000,8.087056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.909872,0.000000,6.705597>}
box{<0,0,-0.203200><1.953679,0.035000,0.203200> rotate<0,44.997030,0> translate<38.528413,0.000000,8.087056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.566528,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.157469,-1.535000,3.251200>}
box{<0,0,-0.203200><0.590941,0.035000,0.203200> rotate<0,0.000000,0> translate<38.566528,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.589072,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.429400,0.000000,11.785600>}
box{<0,0,-0.203200><18.840328,0.035000,0.203200> rotate<0,0.000000,0> translate<38.589072,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.668128,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.055866,-1.535000,4.470400>}
box{<0,0,-0.203200><0.387738,0.035000,0.203200> rotate<0,0.000000,0> translate<38.668128,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.731234,0.000000,4.533506>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.814413,0.000000,4.499056>}
box{<0,0,-0.203200><0.090030,0.035000,0.203200> rotate<0,22.496453,0> translate<38.731234,0.000000,4.533506> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.731234,0.000000,4.533506>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.861997,0.000000,4.664269>}
box{<0,0,-0.203200><0.184926,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.731234,0.000000,4.533506> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.769728,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.954269,-1.535000,6.096000>}
box{<0,0,-0.203200><0.184541,0.035000,0.203200> rotate<0,0.000000,0> translate<38.769728,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.814413,0.000000,4.499056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.841269,0.000000,4.472197>}
box{<0,0,-0.203200><0.037983,0.035000,0.203200> rotate<0,45.000363,0> translate<38.814413,0.000000,4.499056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.841269,0.000000,4.472197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.874906,0.000000,4.454544>}
box{<0,0,-0.203200><0.037988,0.035000,0.203200> rotate<0,27.688882,0> translate<38.841269,0.000000,4.472197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.844694,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.055866,0.000000,4.470400>}
box{<0,0,-0.203200><0.211172,0.035000,0.203200> rotate<0,0.000000,0> translate<38.844694,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.861997,-1.535000,2.955728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,-1.535000,3.657597>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.861997,-1.535000,2.955728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.861997,0.000000,4.664269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,0.000000,3.962400>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,44.997030,0> translate<38.861997,0.000000,4.664269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.861997,-1.535000,4.664269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,-1.535000,3.962400>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,44.997030,0> translate<38.861997,-1.535000,4.664269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.861997,-1.535000,6.003728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,-1.535000,6.705597>}
box{<0,0,-0.203200><0.992592,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.861997,-1.535000,6.003728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.874906,0.000000,4.454544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.954809,0.000000,4.358656>}
box{<0,0,-0.203200><0.124816,0.035000,0.203200> rotate<0,50.192218,0> translate<38.874906,0.000000,4.454544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.893869,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,0.000000,7.721600>}
box{<0,0,-0.203200><7.365881,0.035000,0.203200> rotate<0,0.000000,0> translate<38.893869,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.944672,0.000000,12.141200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.039675,0.000000,12.141200>}
box{<0,0,-0.203200><1.095003,0.035000,0.203200> rotate<0,0.000000,0> translate<38.944672,0.000000,12.141200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.954809,0.000000,4.358656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.043056,0.000000,4.270412>}
box{<0,0,-0.203200><0.124798,0.035000,0.203200> rotate<0,44.996016,0> translate<38.954809,0.000000,4.358656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.043056,0.000000,4.270412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.057591,0.000000,4.235319>}
box{<0,0,-0.203200><0.037984,0.035000,0.203200> rotate<0,67.498238,0> translate<39.043056,0.000000,4.270412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.057591,0.000000,4.235319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.550319,0.000000,3.644047>}
box{<0,0,-0.203200><0.769664,0.035000,0.203200> rotate<0,50.191027,0> translate<39.057591,0.000000,4.235319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.200359,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.462266,0.000000,4.064000>}
box{<0,0,-0.203200><0.261906,0.035000,0.203200> rotate<0,0.000000,0> translate<39.200359,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.204434,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.569719,0.000000,21.132800>}
box{<0,0,-0.203200><1.365284,0.035000,0.203200> rotate<0,0.000000,0> translate<39.204434,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.300269,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,0.000000,7.315200>}
box{<0,0,-0.203200><6.959481,0.035000,0.203200> rotate<0,0.000000,0> translate<39.300269,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.355963,0.000000,22.866741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.462322,0.000000,22.910797>}
box{<0,0,-0.203200><0.115123,0.035000,0.203200> rotate<0,-22.498862,0> translate<39.355963,0.000000,22.866741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.462322,0.000000,22.910797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.510159,0.000000,22.910797>}
box{<0,0,-0.203200><0.047837,0.035000,0.203200> rotate<0,0.000000,0> translate<39.462322,0.000000,22.910797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.510159,0.000000,22.910797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.556159,0.000000,22.923941>}
box{<0,0,-0.203200><0.047841,0.035000,0.203200> rotate<0,-15.945372,0> translate<39.510159,0.000000,22.910797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.539025,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,0.000000,3.657600>}
box{<0,0,-0.203200><4.860175,0.035000,0.203200> rotate<0,0.000000,0> translate<39.539025,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.541325,0.000000,13.766797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.642931,0.000000,18.868400>}
box{<0,0,-0.203200><7.214759,0.035000,0.203200> rotate<0,-44.997013,0> translate<39.541325,0.000000,13.766797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.550319,0.000000,3.644047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,0.000000,3.657597>}
box{<0,0,-0.203200><0.019160,0.035000,0.203200> rotate<0,-45.003637,0> translate<39.550319,0.000000,3.644047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.556159,0.000000,22.923941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.670547,0.000000,22.910797>}
box{<0,0,-0.203200><0.115140,0.035000,0.203200> rotate<0,6.554419,0> translate<39.556159,0.000000,22.923941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,0.000000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,0.000000,3.657597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<39.563866,0.000000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<39.563866,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,0.000000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,0.000000,3.962400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<39.563866,0.000000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<39.563866,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.563866,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,-1.535000,6.705597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<39.563866,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.670547,0.000000,22.910797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,22.910797>}
box{<0,0,-0.203200><0.843853,0.035000,0.203200> rotate<0,0.000000,0> translate<39.670547,0.000000,22.910797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.706669,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.396419,0.000000,6.908800>}
box{<0,0,-0.203200><6.689750,0.035000,0.203200> rotate<0,0.000000,0> translate<39.706669,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.737838,0.000000,21.285200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.544034,0.000000,21.285200>}
box{<0,0,-0.203200><0.806197,0.035000,0.203200> rotate<0,0.000000,0> translate<39.737838,0.000000,21.285200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.909872,0.000000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,0.000000,6.705597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<39.909872,0.000000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.039675,0.000000,12.141200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.338413,0.000000,12.264941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<40.039675,0.000000,12.141200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.162316,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.429400,0.000000,12.192000>}
box{<0,0,-0.203200><17.267084,0.035000,0.203200> rotate<0,0.000000,0> translate<40.162316,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.338413,0.000000,12.264941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.567056,0.000000,12.493584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.338413,0.000000,12.264941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,19.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.607206,0.000000,19.132687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<40.514400,0.000000,19.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,20.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,19.356741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.514400,0.000000,19.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,20.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,21.177997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<40.514400,0.000000,20.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,22.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,22.910797>}
box{<0,0,-0.203200><0.088459,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.514400,0.000000,22.910797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,22.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,23.177997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<40.514400,0.000000,22.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,23.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,23.177997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<40.514400,0.000000,23.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,24.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,23.356741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.514400,0.000000,23.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,24.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,25.177997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<40.514400,0.000000,24.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,25.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,25.177997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<40.514400,0.000000,25.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,26.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,25.356741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.514400,0.000000,25.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,26.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,27.177997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<40.514400,0.000000,26.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,27.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,27.177997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<40.514400,0.000000,27.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,28.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,27.356741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.514400,0.000000,27.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,28.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,29.177997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<40.514400,0.000000,28.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,29.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,29.177997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<40.514400,0.000000,29.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,30.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,29.356741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.514400,0.000000,29.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,30.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,31.177997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<40.514400,0.000000,30.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,31.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,31.177997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<40.514400,0.000000,31.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,32.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,31.356741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.514400,0.000000,31.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,32.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,33.177997>}
box{<0,0,-0.203200><0.193469,0.035000,0.203200> rotate<0,-67.494496,0> translate<40.514400,0.000000,32.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,33.356741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,33.177997>}
box{<0,0,-0.203200><0.193472,0.035000,0.203200> rotate<0,67.494850,0> translate<40.514400,0.000000,33.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,34.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,33.356741>}
box{<0,0,-0.203200><1.642516,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.514400,0.000000,33.356741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,34.999256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.607206,0.000000,35.223309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<40.514400,0.000000,34.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.544034,0.000000,21.285200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.588441,0.000000,21.177997>}
box{<0,0,-0.203200><0.116036,0.035000,0.203200> rotate<0,67.494970,0> translate<40.544034,0.000000,21.285200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.567056,0.000000,12.493584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.753563,0.000000,20.680091>}
box{<0,0,-0.203200><11.577468,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.567056,0.000000,12.493584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.607206,0.000000,19.132687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778688,0.000000,18.961206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<40.607206,0.000000,19.132687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.607206,0.000000,35.223309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778688,0.000000,35.394791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.607206,0.000000,35.223309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.671872,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.322125,0.000000,12.598400>}
box{<0,0,-0.203200><16.650253,0.035000,0.203200> rotate<0,0.000000,0> translate<40.671872,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,0.000000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,2.854131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<40.700131,0.000000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,2.854131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<40.700131,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,0.000000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,4.765866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.700131,0.000000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,4.765866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.700131,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,0.000000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,5.902131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<40.700131,0.000000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,5.902131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<40.700131,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778688,0.000000,18.961206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.002741,0.000000,18.868400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<40.778688,0.000000,18.961206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778688,0.000000,35.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.002741,0.000000,35.487597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<40.778688,0.000000,35.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.801731,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,0.000000,4.064000>}
box{<0,0,-0.203200><3.597469,0.035000,0.203200> rotate<0,0.000000,0> translate<40.801731,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.801731,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.542266,-1.535000,4.064000>}
box{<0,0,-0.203200><3.740534,0.035000,0.203200> rotate<0,0.000000,0> translate<40.801731,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.852525,0.000000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,1.717866>}
box{<0,0,-0.203200><0.920752,0.035000,0.203200> rotate<0,-44.996893,0> translate<40.852525,0.000000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.852525,-1.535000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,1.717866>}
box{<0,0,-0.203200><0.920752,0.035000,0.203200> rotate<0,-44.996893,0> translate<40.852525,-1.535000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.852525,0.000000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.843325,0.000000,1.066797>}
box{<0,0,-0.203200><1.990800,0.035000,0.203200> rotate<0,0.000000,0> translate<40.852525,0.000000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.852525,-1.535000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.491472,-1.535000,1.066797>}
box{<0,0,-0.203200><3.638947,0.035000,0.203200> rotate<0,0.000000,0> translate<40.852525,-1.535000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.903328,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.440669,0.000000,6.502400>}
box{<0,0,-0.203200><3.537341,0.035000,0.203200> rotate<0,0.000000,0> translate<40.903328,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.903328,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.440669,-1.535000,6.502400>}
box{<0,0,-0.203200><3.537341,0.035000,0.203200> rotate<0,0.000000,0> translate<40.903328,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.002741,0.000000,18.868400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.642931,0.000000,18.868400>}
box{<0,0,-0.203200><3.640191,0.035000,0.203200> rotate<0,0.000000,0> translate<41.002741,0.000000,18.868400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.002741,0.000000,35.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.245256,0.000000,35.487597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<41.002741,0.000000,35.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.004928,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.995728,0.000000,1.219200>}
box{<0,0,-0.203200><1.990800,0.035000,0.203200> rotate<0,0.000000,0> translate<41.004928,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.004928,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.339066,-1.535000,1.219200>}
box{<0,0,-0.203200><3.334138,0.035000,0.203200> rotate<0,0.000000,0> translate<41.004928,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.078272,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.726625,0.000000,13.004800>}
box{<0,0,-0.203200><6.648353,0.035000,0.203200> rotate<0,0.000000,0> translate<41.078272,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.106528,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.237469,0.000000,3.251200>}
box{<0,0,-0.203200><3.130941,0.035000,0.203200> rotate<0,0.000000,0> translate<41.106528,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.106528,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.237469,-1.535000,3.251200>}
box{<0,0,-0.203200><3.130941,0.035000,0.203200> rotate<0,0.000000,0> translate<41.106528,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.208131,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.135866,0.000000,4.470400>}
box{<0,0,-0.203200><2.927734,0.035000,0.203200> rotate<0,0.000000,0> translate<41.208131,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.208131,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.135866,-1.535000,4.470400>}
box{<0,0,-0.203200><2.927734,0.035000,0.203200> rotate<0,0.000000,0> translate<41.208131,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.309728,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.034269,0.000000,6.096000>}
box{<0,0,-0.203200><2.724541,0.035000,0.203200> rotate<0,0.000000,0> translate<41.309728,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.309728,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.034269,-1.535000,6.096000>}
box{<0,0,-0.203200><2.724541,0.035000,0.203200> rotate<0,0.000000,0> translate<41.309728,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.411328,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.402128,0.000000,1.625600>}
box{<0,0,-0.203200><1.990800,0.035000,0.203200> rotate<0,0.000000,0> translate<41.411328,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.411328,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.932666,-1.535000,1.625600>}
box{<0,0,-0.203200><2.521338,0.035000,0.203200> rotate<0,0.000000,0> translate<41.411328,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.484672,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,13.411200>}
box{<0,0,-0.203200><6.199728,0.035000,0.203200> rotate<0,0.000000,0> translate<41.484672,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<41.503597,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<41.503597,-1.535000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.808528,0.000000,2.032000>}
box{<0,0,-0.203200><2.304931,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,2.032000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,2.438400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,2.438400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,5.902131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<41.503597,0.000000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,5.902131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<41.503597,-1.535000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,4.876800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,4.876800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,5.283200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,5.283200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,5.689600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.503597,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,5.689600>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<41.503597,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.891072,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,13.817600>}
box{<0,0,-0.203200><5.793328,0.035000,0.203200> rotate<0,0.000000,0> translate<41.891072,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.297472,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,14.224000>}
box{<0,0,-0.203200><5.386928,0.035000,0.203200> rotate<0,0.000000,0> translate<42.297472,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.703872,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,14.630400>}
box{<0,0,-0.203200><4.980528,0.035000,0.203200> rotate<0,0.000000,0> translate<42.703872,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.843325,0.000000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,2.063872>}
box{<0,0,-0.203200><1.410077,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.843325,0.000000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.110272,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,15.036800>}
box{<0,0,-0.203200><4.574128,0.035000,0.203200> rotate<0,0.000000,0> translate<43.110272,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.516672,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,15.443200>}
box{<0,0,-0.203200><4.167728,0.035000,0.203200> rotate<0,0.000000,0> translate<43.516672,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.491472,-1.535000,1.066797>}
box{<0,0,-0.203200><0.920752,0.035000,0.203200> rotate<0,44.996893,0> translate<43.840400,-1.535000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.840400,-1.535000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,2.063872>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.840400,0.000000,2.063872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,0.000000,3.412931>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.840400,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643866,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.840400,-1.535000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,0.000000,4.207066>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,44.997030,0> translate<43.840400,0.000000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643866,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<43.840400,-1.535000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,4.765866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.840400,0.000000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,4.765866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.840400,-1.535000,4.765866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,0.000000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643866,0.000000,6.705597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.840400,0.000000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.840400,-1.535000,5.902131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643866,-1.535000,6.705597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.840400,-1.535000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.923066,0.000000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.989872,0.000000,0.914400>}
box{<0,0,-0.203200><1.508687,0.035000,0.203200> rotate<0,-44.996862,0> translate<43.923066,0.000000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.923066,0.000000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.201478,0.000000,-0.152400>}
box{<0,0,-0.203200><16.278413,0.035000,0.203200> rotate<0,0.000000,0> translate<43.923066,0.000000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.923072,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684544,0.000000,15.849600>}
box{<0,0,-0.203200><3.761472,0.035000,0.203200> rotate<0,0.000000,0> translate<43.923072,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.075466,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.833541,0.000000,0.000000>}
box{<0,0,-0.203200><15.758075,0.035000,0.203200> rotate<0,0.000000,0> translate<44.075466,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.329472,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.975750,0.000000,16.256000>}
box{<0,0,-0.203200><3.646278,0.035000,0.203200> rotate<0,0.000000,0> translate<44.329472,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,0.000000,4.207066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.399200,0.000000,3.412931>}
box{<0,0,-0.203200><0.794134,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.399200,0.000000,3.412931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.481869,0.000000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.204488,0.000000,0.406400>}
box{<0,0,-0.203200><14.722619,0.035000,0.203200> rotate<0,0.000000,0> translate<44.481869,0.000000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643866,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,-1.535000,3.657597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643866,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643866,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,-1.535000,3.962400>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643866,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643866,0.000000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,0.000000,6.705597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643866,0.000000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.643866,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,-1.535000,6.705597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<44.643866,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.735872,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,16.662400>}
box{<0,0,-0.203200><4.373328,0.035000,0.203200> rotate<0,0.000000,0> translate<44.735872,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.888269,0.000000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.817619,0.000000,0.812800>}
box{<0,0,-0.203200><13.929350,0.035000,0.203200> rotate<0,0.000000,0> translate<44.888269,0.000000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.989872,0.000000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,0.000000,0.914400>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<44.989872,0.000000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.142272,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,17.068800>}
box{<0,0,-0.203200><3.966928,0.035000,0.203200> rotate<0,0.000000,0> translate<45.142272,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.245256,0.000000,35.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.469309,0.000000,35.394791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<45.245256,0.000000,35.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.469309,0.000000,35.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.640791,0.000000,35.223309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<45.469309,0.000000,35.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.507300,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,35.356800>}
box{<0,0,-0.203200><12.987500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.507300,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.548672,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,17.475200>}
box{<0,0,-0.203200><3.560528,0.035000,0.203200> rotate<0,0.000000,0> translate<45.548672,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.640791,0.000000,35.223309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.733597,0.000000,34.999256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<45.640791,0.000000,35.223309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.733597,0.000000,34.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.733597,0.000000,34.999256>}
box{<0,0,-0.203200><0.008459,0.035000,0.203200> rotate<0,90.000000,0> translate<45.733597,0.000000,34.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.733597,0.000000,34.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.154697,0.000000,34.990797>}
box{<0,0,-0.203200><2.421100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.733597,0.000000,34.990797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,0.000000,0.914400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,1.717866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.780131,0.000000,0.914400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,-1.535000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,2.854131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<45.780131,-1.535000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,-1.535000,3.962400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,4.765866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.780131,-1.535000,3.962400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,0.000000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,5.902131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<45.780131,0.000000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780131,-1.535000,6.705597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,5.902131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<45.780131,-1.535000,6.705597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.881731,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,4.064000>}
box{<0,0,-0.203200><1.133669,0.035000,0.203200> rotate<0,0.000000,0> translate<45.881731,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.932525,-1.535000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,1.717866>}
box{<0,0,-0.203200><0.920752,0.035000,0.203200> rotate<0,-44.996893,0> translate<45.932525,-1.535000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.932525,-1.535000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.495325,-1.535000,1.066797>}
box{<0,0,-0.203200><6.562800,0.035000,0.203200> rotate<0,0.000000,0> translate<45.932525,-1.535000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.955072,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,17.881600>}
box{<0,0,-0.203200><3.154128,0.035000,0.203200> rotate<0,0.000000,0> translate<45.955072,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.983328,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.802819,0.000000,6.502400>}
box{<0,0,-0.203200><0.819491,0.035000,0.203200> rotate<0,0.000000,0> translate<45.983328,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.983328,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.802819,-1.535000,6.502400>}
box{<0,0,-0.203200><0.819491,0.035000,0.203200> rotate<0,0.000000,0> translate<45.983328,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.024797,0.000000,3.412931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.024797,0.000000,4.207066>}
box{<0,0,-0.203200><0.794134,0.035000,0.203200> rotate<0,90.000000,0> translate<46.024797,0.000000,4.207066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.024797,0.000000,3.412931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,2.854131>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,44.997030,0> translate<46.024797,0.000000,3.412931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.024797,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.204491,0.000000,3.657600>}
box{<0,0,-0.203200><13.179694,0.035000,0.203200> rotate<0,0.000000,0> translate<46.024797,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.024797,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.833544,0.000000,4.064000>}
box{<0,0,-0.203200><13.808747,0.035000,0.203200> rotate<0,0.000000,0> translate<46.024797,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.024797,0.000000,4.207066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,4.765866>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.024797,0.000000,4.207066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.084928,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.647731,-1.535000,1.219200>}
box{<0,0,-0.203200><6.562803,0.035000,0.203200> rotate<0,0.000000,0> translate<46.084928,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.084931,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.649284,0.000000,1.219200>}
box{<0,0,-0.203200><12.564353,0.035000,0.203200> rotate<0,0.000000,0> translate<46.084931,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.186528,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,3.251200>}
box{<0,0,-0.203200><0.828872,0.035000,0.203200> rotate<0,0.000000,0> translate<46.186528,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.186528,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.817625,0.000000,3.251200>}
box{<0,0,-0.203200><12.631097,0.035000,0.203200> rotate<0,0.000000,0> translate<46.186528,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,6.289822>}
box{<0,0,-0.203200><1.068648,0.035000,0.203200> rotate<0,44.996912,0> translate<46.259750,-1.535000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,0.000000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.431469,0.000000,5.873750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<46.259750,0.000000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,0.000000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,0.000000,7.045469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<46.259750,0.000000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,7.045469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<46.259750,-1.535000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,9.458175>}
box{<0,0,-0.203200><1.068648,0.035000,0.203200> rotate<0,-44.996912,0> translate<46.259750,-1.535000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,0.000000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.431469,0.000000,9.874247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.259750,0.000000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,28.127469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,27.371819>}
box{<0,0,-0.203200><1.068650,0.035000,0.203200> rotate<0,44.997030,0> translate<46.259750,-1.535000,28.127469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,29.784528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,28.127469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<46.259750,-1.535000,28.127469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.259750,-1.535000,29.784528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,30.540178>}
box{<0,0,-0.203200><1.068650,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.259750,-1.535000,29.784528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.288131,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,4.470400>}
box{<0,0,-0.203200><0.727269,0.035000,0.203200> rotate<0,0.000000,0> translate<46.288131,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.288131,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,4.470400>}
box{<0,0,-0.203200><15.840269,0.035000,0.203200> rotate<0,0.000000,0> translate<46.288131,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.361472,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.075894,0.000000,18.288000>}
box{<0,0,-0.203200><2.714422,0.035000,0.203200> rotate<0,0.000000,0> translate<46.361472,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.389728,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,6.096000>}
box{<0,0,-0.203200><0.625672,0.035000,0.203200> rotate<0,0.000000,0> translate<46.389728,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.389728,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.209219,0.000000,6.096000>}
box{<0,0,-0.203200><0.819491,0.035000,0.203200> rotate<0,0.000000,0> translate<46.389728,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.491328,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.054131,-1.535000,1.625600>}
box{<0,0,-0.203200><6.562803,0.035000,0.203200> rotate<0,0.000000,0> translate<46.491328,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.491331,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,1.625600>}
box{<0,0,-0.203200><12.003469,0.035000,0.203200> rotate<0,0.000000,0> translate<46.491331,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<46.583597,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<46.583597,-1.535000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.460531,-1.535000,2.032000>}
box{<0,0,-0.203200><6.876934,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,2.032000>}
box{<0,0,-0.203200><11.911203,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.319888,-1.535000,2.438400>}
box{<0,0,-0.203200><0.736291,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,2.438400>}
box{<0,0,-0.203200><11.911203,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.038875,-1.535000,2.844800>}
box{<0,0,-0.203200><0.455278,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.649287,0.000000,2.844800>}
box{<0,0,-0.203200><12.065691,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,5.902131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<46.583597,0.000000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,4.765866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,5.902131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<46.583597,-1.535000,5.902131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,4.876800>}
box{<0,0,-0.203200><0.431803,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,4.876800>}
box{<0,0,-0.203200><15.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,5.283200>}
box{<0,0,-0.203200><0.431803,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,5.283200>}
box{<0,0,-0.203200><15.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,5.689600>}
box{<0,0,-0.203200><0.431803,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.583597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,5.689600>}
box{<0,0,-0.203200><15.544803,0.035000,0.203200> rotate<0,0.000000,0> translate<46.583597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.767872,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,18.694400>}
box{<0,0,-0.203200><2.144528,0.035000,0.203200> rotate<0,0.000000,0> translate<46.767872,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,2.901478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.127541,-1.535000,2.630747>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,67.495533,0> translate<47.015400,-1.535000,2.901478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,6.289822>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,2.901478>}
box{<0,0,-0.203200><3.388344,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.015400,-1.535000,2.901478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,12.846519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,9.458175>}
box{<0,0,-0.203200><3.388344,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.015400,-1.535000,9.458175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,12.846519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.127541,-1.535000,13.117250>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-67.495533,0> translate<47.015400,-1.535000,12.846519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,23.983478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.127541,-1.535000,23.712747>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,67.495533,0> translate<47.015400,-1.535000,23.983478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,27.371819>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,23.983478>}
box{<0,0,-0.203200><3.388341,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.015400,-1.535000,23.983478> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,33.928519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,30.540178>}
box{<0,0,-0.203200><3.388341,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.015400,-1.535000,30.540178> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.015400,-1.535000,33.928519>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.127541,-1.535000,34.199250>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-67.495533,0> translate<47.015400,-1.535000,33.928519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.127541,-1.535000,2.630747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.334747,-1.535000,2.423541>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,44.997030,0> translate<47.127541,-1.535000,2.630747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.127541,-1.535000,13.117250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.334747,-1.535000,13.324456>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.127541,-1.535000,13.117250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.127541,-1.535000,23.712747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.334747,-1.535000,23.505541>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,44.997030,0> translate<47.127541,-1.535000,23.712747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.127541,-1.535000,34.199250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.334747,-1.535000,34.406456>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.127541,-1.535000,34.199250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.174272,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,19.100800>}
box{<0,0,-0.203200><1.738128,0.035000,0.203200> rotate<0,0.000000,0> translate<47.174272,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.334747,-1.535000,2.423541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.605478,-1.535000,2.311400>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,22.498528,0> translate<47.334747,-1.535000,2.423541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.334747,-1.535000,13.324456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.605478,-1.535000,13.436597>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-22.498528,0> translate<47.334747,-1.535000,13.324456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.334747,-1.535000,23.505541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.605478,-1.535000,23.393400>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,22.498528,0> translate<47.334747,-1.535000,23.505541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.334747,-1.535000,34.406456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.605478,-1.535000,34.518597>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-22.498528,0> translate<47.334747,-1.535000,34.406456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.431469,0.000000,5.873750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.088528,0.000000,5.873750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<47.431469,0.000000,5.873750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.431469,0.000000,9.874247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.088528,0.000000,9.874247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<47.431469,0.000000,9.874247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.580672,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,19.507200>}
box{<0,0,-0.203200><1.331728,0.035000,0.203200> rotate<0,0.000000,0> translate<47.580672,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.605478,-1.535000,2.311400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.739931,-1.535000,2.311400>}
box{<0,0,-0.203200><6.134453,0.035000,0.203200> rotate<0,0.000000,0> translate<47.605478,-1.535000,2.311400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.605478,-1.535000,13.436597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,13.436597>}
box{<0,0,-0.203200><6.852122,0.035000,0.203200> rotate<0,0.000000,0> translate<47.605478,-1.535000,13.436597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.605478,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,23.393400>}
box{<0,0,-0.203200><6.852122,0.035000,0.203200> rotate<0,0.000000,0> translate<47.605478,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.605478,-1.535000,34.518597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.423519,-1.535000,34.518597>}
box{<0,0,-0.203200><9.818041,0.035000,0.203200> rotate<0,0.000000,0> translate<47.605478,-1.535000,34.518597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,13.106741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.777206,0.000000,12.882688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<47.684400,0.000000,13.106741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,15.849256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,13.106741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.684400,0.000000,13.106741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,15.849256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.777206,0.000000,16.073309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<47.684400,0.000000,15.849256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.777206,0.000000,12.882688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.948688,0.000000,12.711206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<47.777206,0.000000,12.882688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.777206,0.000000,16.073309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.948688,0.000000,16.244791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.777206,0.000000,16.073309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.948688,0.000000,12.711206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.172741,0.000000,12.618400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<47.948688,0.000000,12.711206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.948688,0.000000,16.244791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.172741,0.000000,16.337597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<47.948688,0.000000,16.244791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.987072,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,19.913600>}
box{<0,0,-0.203200><0.925328,0.035000,0.203200> rotate<0,0.000000,0> translate<47.987072,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.154697,0.000000,34.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.204688,0.000000,35.040791>}
box{<0,0,-0.203200><0.070700,0.035000,0.203200> rotate<0,-44.998821,0> translate<48.154697,0.000000,34.990797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.172741,0.000000,12.618400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.615256,0.000000,12.618400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<48.172741,0.000000,12.618400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.172741,0.000000,16.337597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,16.337597>}
box{<0,0,-0.203200><0.936459,0.035000,0.203200> rotate<0,0.000000,0> translate<48.172741,0.000000,16.337597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.204688,0.000000,35.040791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.428741,0.000000,35.133597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<48.204688,0.000000,35.040791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.393472,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.075900,0.000000,20.320000>}
box{<0,0,-0.203200><0.682428,0.035000,0.203200> rotate<0,0.000000,0> translate<48.393472,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.428741,0.000000,35.133597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.871256,0.000000,35.133597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<48.428741,0.000000,35.133597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.753563,0.000000,20.680091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.867309,0.000000,20.727206>}
box{<0,0,-0.203200><0.123119,0.035000,0.203200> rotate<0,-22.498570,0> translate<48.753563,0.000000,20.680091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.865363,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.726400>}
box{<0,0,-0.203200><0.243837,0.035000,0.203200> rotate<0,0.000000,0> translate<48.865363,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.867309,0.000000,20.727206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.022000,0.000000,20.881897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.867309,0.000000,20.727206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,18.582741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.005206,0.000000,18.358688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<48.912400,0.000000,18.582741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,20.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,18.582741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.912400,0.000000,18.582741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,20.025256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.005206,0.000000,20.249309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<48.912400,0.000000,20.025256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.005206,0.000000,18.358688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,18.254697>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<49.005206,0.000000,18.358688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.005206,0.000000,20.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.353300>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<49.005206,0.000000,20.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.022000,0.000000,20.881897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.794697>}
box{<0,0,-0.203200><0.123319,0.035000,0.203200> rotate<0,44.997030,0> translate<49.022000,0.000000,20.881897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.072797,0.000000,22.856897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.072797,0.000000,23.031325>}
box{<0,0,-0.203200><0.174428,0.035000,0.203200> rotate<0,90.000000,0> translate<49.072797,0.000000,23.031325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.072797,0.000000,22.856897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.176687,0.000000,22.960791>}
box{<0,0,-0.203200><0.146926,0.035000,0.203200> rotate<0,-44.997892,0> translate<49.072797,0.000000,22.856897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.072797,0.000000,23.031325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.605056,0.000000,25.563584>}
box{<0,0,-0.203200><3.581156,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.072797,0.000000,23.031325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.088528,0.000000,5.873750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.260247,0.000000,7.045469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.088528,0.000000,5.873750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.088528,0.000000,9.874247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.260247,0.000000,8.702528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<49.088528,0.000000,9.874247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,18.254697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,16.337597>}
box{<0,0,-0.203200><1.917100,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.109200,0.000000,16.337597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.794697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.353300>}
box{<0,0,-0.203200><0.441397,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.109200,0.000000,20.353300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.176687,0.000000,22.960791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.400741,0.000000,23.053597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.176687,0.000000,22.960791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.206272,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.153681,0.000000,23.164800>}
box{<0,0,-0.203200><1.947409,0.035000,0.203200> rotate<0,0.000000,0> translate<49.206272,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.209175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.422822,0.000000,9.753600>}
box{<0,0,-0.203200><5.213647,0.035000,0.203200> rotate<0,0.000000,0> translate<49.209175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.310778,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.321219,0.000000,6.096000>}
box{<0,0,-0.203200><5.010441,0.035000,0.203200> rotate<0,0.000000,0> translate<49.310778,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.400741,0.000000,23.053597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.443256,0.000000,23.053597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<49.400741,0.000000,23.053597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.612672,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.255731,0.000000,23.571200>}
box{<0,0,-0.203200><2.643059,0.035000,0.203200> rotate<0,0.000000,0> translate<49.612672,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.615256,0.000000,12.618400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.839309,0.000000,12.711206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.615256,0.000000,12.618400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.615575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.016422,0.000000,9.347200>}
box{<0,0,-0.203200><4.400847,0.035000,0.203200> rotate<0,0.000000,0> translate<49.615575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.717178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.914819,0.000000,6.502400>}
box{<0,0,-0.203200><4.197641,0.035000,0.203200> rotate<0,0.000000,0> translate<49.717178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.839309,0.000000,12.711206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.010791,0.000000,12.882688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.839309,0.000000,12.711206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.871256,0.000000,35.133597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.095309,0.000000,35.040791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<49.871256,0.000000,35.133597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.010791,0.000000,12.882688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,13.106741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.010791,0.000000,12.882688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.019072,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.662131,0.000000,23.977600>}
box{<0,0,-0.203200><2.643059,0.035000,0.203200> rotate<0,0.000000,0> translate<50.019072,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.021975,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.610022,0.000000,8.940800>}
box{<0,0,-0.203200><3.588047,0.035000,0.203200> rotate<0,0.000000,0> translate<50.021975,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.061369,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.035094,0.000000,13.004800>}
box{<0,0,-0.203200><0.973725,0.035000,0.203200> rotate<0,0.000000,0> translate<50.061369,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.095309,0.000000,35.040791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.266791,0.000000,34.869309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<50.095309,0.000000,35.040791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,13.106741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,14.538125>}
box{<0,0,-0.203200><1.431384,0.035000,0.203200> rotate<0,90.000000,0> translate<50.103597,0.000000,14.538125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,13.411200>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.103597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,13.817600>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.103597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,14.224000>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.103597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,14.538125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.611056,0.000000,15.045584>}
box{<0,0,-0.203200><0.717656,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.103597,0.000000,14.538125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.123578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.508419,0.000000,6.908800>}
box{<0,0,-0.203200><3.384841,0.035000,0.203200> rotate<0,0.000000,0> translate<50.123578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.185700,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,34.950400>}
box{<0,0,-0.203200><8.309100,0.035000,0.203200> rotate<0,0.000000,0> translate<50.185700,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.195872,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.006300,0.000000,14.630400>}
box{<0,0,-0.203200><0.810428,0.035000,0.203200> rotate<0,0.000000,0> translate<50.195872,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.260247,0.000000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.260247,0.000000,8.702528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<50.260247,0.000000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.260247,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,7.315200>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<50.260247,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.260247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,7.721600>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<50.260247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.260247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,8.128000>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<50.260247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.260247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,8.534400>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<50.260247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.266791,0.000000,34.869309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,34.645256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<50.266791,0.000000,34.869309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.293731,0.000000,31.743734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,31.902741>}
box{<0,0,-0.203200><0.172108,0.035000,0.203200> rotate<0,-67.494598,0> translate<50.293731,0.000000,31.743734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.293731,0.000000,31.743734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.855872,0.000000,31.181597>}
box{<0,0,-0.203200><0.794985,0.035000,0.203200> rotate<0,44.996871,0> translate<50.293731,0.000000,31.743734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.338269,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,31.699200>}
box{<0,0,-0.203200><11.790131,0.035000,0.203200> rotate<0,0.000000,0> translate<50.338269,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,31.902741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,34.645256>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,90.000000,0> translate<50.359597,0.000000,34.645256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,32.105600>}
box{<0,0,-0.203200><11.768803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,32.512000>}
box{<0,0,-0.203200><11.768803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.078819,0.000000,32.918400>}
box{<0,0,-0.203200><9.719222,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.306088,0.000000,33.324800>}
box{<0,0,-0.203200><8.946491,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.899688,0.000000,33.731200>}
box{<0,0,-0.203200><8.540091,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.691369,0.000000,34.137600>}
box{<0,0,-0.203200><8.331772,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.523031,0.000000,34.544000>}
box{<0,0,-0.203200><8.163434,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.425472,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.068531,0.000000,24.384000>}
box{<0,0,-0.203200><2.643059,0.035000,0.203200> rotate<0,0.000000,0> translate<50.425472,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.443256,0.000000,23.053597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.454844,0.000000,23.048797>}
box{<0,0,-0.203200><0.012542,0.035000,0.203200> rotate<0,22.499783,0> translate<50.443256,0.000000,23.053597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.454844,0.000000,23.048797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.020694,0.000000,23.048797>}
box{<0,0,-0.203200><0.565850,0.035000,0.203200> rotate<0,0.000000,0> translate<50.454844,0.000000,23.048797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.602272,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.891025,0.000000,15.036800>}
box{<0,0,-0.203200><0.288753,0.035000,0.203200> rotate<0,0.000000,0> translate<50.602272,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.611056,0.000000,15.045584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,15.344322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<50.611056,0.000000,15.045584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,15.344322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,18.254697>}
box{<0,0,-0.203200><2.910375,0.035000,0.203200> rotate<0,90.000000,0> translate<50.734797,0.000000,18.254697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,15.443200>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<50.734797,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,15.849600>}
box{<0,0,-0.203200><0.125603,0.035000,0.203200> rotate<0,0.000000,0> translate<50.734797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.902959,0.000000,16.256000>}
box{<0,0,-0.203200><0.168163,0.035000,0.203200> rotate<0,0.000000,0> translate<50.734797,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,16.662400>}
box{<0,0,-0.203200><0.522403,0.035000,0.203200> rotate<0,0.000000,0> translate<50.734797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,17.068800>}
box{<0,0,-0.203200><0.522403,0.035000,0.203200> rotate<0,0.000000,0> translate<50.734797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,17.475200>}
box{<0,0,-0.203200><0.522403,0.035000,0.203200> rotate<0,0.000000,0> translate<50.734797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,17.881600>}
box{<0,0,-0.203200><0.522403,0.035000,0.203200> rotate<0,0.000000,0> translate<50.734797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,18.254697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.838791,0.000000,18.358688>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<50.734797,0.000000,18.254697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.744669,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,31.292800>}
box{<0,0,-0.203200><11.383731,0.035000,0.203200> rotate<0,0.000000,0> translate<50.744669,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.768100,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,18.288000>}
box{<0,0,-0.203200><0.489100,0.035000,0.203200> rotate<0,0.000000,0> translate<50.768100,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.831872,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.474931,0.000000,24.790400>}
box{<0,0,-0.203200><2.643059,0.035000,0.203200> rotate<0,0.000000,0> translate<50.831872,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.838791,0.000000,18.358688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.931597,0.000000,18.582741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.838791,0.000000,18.358688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.855872,0.000000,31.181597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.437256,0.000000,31.181597>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,0.000000,0> translate<50.855872,0.000000,31.181597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,13.310741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,13.086688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<50.860400,0.000000,13.310741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,14.353256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,13.310741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.860400,0.000000,13.310741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,14.353256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,14.577309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.860400,0.000000,14.353256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,15.110741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,14.886688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<50.860400,0.000000,15.110741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,16.153256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,15.110741>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.860400,0.000000,15.110741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,16.153256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,16.377309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.860400,0.000000,16.153256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.931597,0.000000,18.582741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.931597,0.000000,19.742863>}
box{<0,0,-0.203200><1.160122,0.035000,0.203200> rotate<0,90.000000,0> translate<50.931597,0.000000,19.742863> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.931597,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,18.694400>}
box{<0,0,-0.203200><0.325603,0.035000,0.203200> rotate<0,0.000000,0> translate<50.931597,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.931597,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,19.100800>}
box{<0,0,-0.203200><0.325603,0.035000,0.203200> rotate<0,0.000000,0> translate<50.931597,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.931597,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.153672,0.000000,19.507200>}
box{<0,0,-0.203200><0.222075,0.035000,0.203200> rotate<0,0.000000,0> translate<50.931597,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.931597,0.000000,19.742863>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,19.690687>}
box{<0,0,-0.203200><0.056473,0.035000,0.203200> rotate<0,67.497624,0> translate<50.931597,0.000000,19.742863> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,13.086688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,12.915206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<50.953206,0.000000,13.086688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,14.577309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.107897,0.000000,14.731997>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,-44.996451,0> translate<50.953206,0.000000,14.577309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,14.886688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.107897,0.000000,14.731997>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,44.997030,0> translate<50.953206,0.000000,14.886688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,16.377309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,16.548791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.953206,0.000000,16.377309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.953206,0.000000,19.690687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,19.519206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<50.953206,0.000000,19.690687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.020694,0.000000,23.048797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,23.152791>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.020694,0.000000,23.048797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,12.915206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.348741,0.000000,12.822400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<51.124688,0.000000,12.915206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,16.548791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,16.603678>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,-22.498155,0> translate<51.124688,0.000000,16.548791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,19.519206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,19.464319>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,22.498155,0> translate<51.124688,0.000000,19.519206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,23.152791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.348741,0.000000,23.245597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<51.124688,0.000000,23.152791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.238272,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.881331,0.000000,25.196800>}
box{<0,0,-0.203200><2.643059,0.035000,0.203200> rotate<0,0.000000,0> translate<51.238272,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,19.464319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,16.603678>}
box{<0,0,-0.203200><2.860641,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.257200,0.000000,16.603678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.348741,0.000000,12.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.791256,0.000000,12.822400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<51.348741,0.000000,12.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.348741,0.000000,23.245597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.930128,0.000000,23.245597>}
box{<0,0,-0.203200><0.581387,0.035000,0.203200> rotate<0,0.000000,0> translate<51.348741,0.000000,23.245597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.437256,0.000000,31.181597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.661309,0.000000,31.088791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<51.437256,0.000000,31.181597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.605056,0.000000,25.563584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,25.862322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<51.605056,0.000000,25.563584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.621462,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.287731,0.000000,25.603200>}
box{<0,0,-0.203200><2.666269,0.035000,0.203200> rotate<0,0.000000,0> translate<51.621462,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.661309,0.000000,31.088791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.832791,0.000000,30.917309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<51.661309,0.000000,31.088791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,25.862322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,28.922697>}
box{<0,0,-0.203200><3.060375,0.035000,0.203200> rotate<0,90.000000,0> translate<51.728797,0.000000,28.922697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.876263,0.000000,26.009600>}
box{<0,0,-0.203200><6.147466,0.035000,0.203200> rotate<0,0.000000,0> translate<51.728797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.282663,0.000000,26.416000>}
box{<0,0,-0.203200><6.553866,0.035000,0.203200> rotate<0,0.000000,0> translate<51.728797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,26.822400>}
box{<0,0,-0.203200><10.399603,0.035000,0.203200> rotate<0,0.000000,0> translate<51.728797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.270419,0.000000,27.228800>}
box{<0,0,-0.203200><2.541622,0.035000,0.203200> rotate<0,0.000000,0> translate<51.728797,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.864019,0.000000,27.635200>}
box{<0,0,-0.203200><2.135222,0.035000,0.203200> rotate<0,0.000000,0> translate<51.728797,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.457619,0.000000,28.041600>}
box{<0,0,-0.203200><1.728822,0.035000,0.203200> rotate<0,0.000000,0> translate<51.728797,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,28.448000>}
box{<0,0,-0.203200><1.642953,0.035000,0.203200> rotate<0,0.000000,0> translate<51.728797,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,28.854400>}
box{<0,0,-0.203200><1.642953,0.035000,0.203200> rotate<0,0.000000,0> translate<51.728797,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.728797,0.000000,28.922697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.832791,0.000000,29.026688>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<51.728797,0.000000,28.922697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.832791,0.000000,29.026688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.925597,0.000000,29.250741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<51.832791,0.000000,29.026688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.832791,0.000000,30.917309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.925597,0.000000,30.693256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<51.832791,0.000000,30.917309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.845597,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.473622,0.000000,30.886400>}
box{<0,0,-0.203200><2.628025,0.035000,0.203200> rotate<0,0.000000,0> translate<51.845597,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.925597,0.000000,29.250741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.925597,0.000000,30.693256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<51.925597,0.000000,30.693256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.925597,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,29.260800>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<51.925597,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.925597,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,29.667200>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<51.925597,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.925597,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.660822,0.000000,30.073600>}
box{<0,0,-0.203200><1.735225,0.035000,0.203200> rotate<0,0.000000,0> translate<51.925597,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.925597,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.067222,0.000000,30.480000>}
box{<0,0,-0.203200><2.141625,0.035000,0.203200> rotate<0,0.000000,0> translate<51.925597,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.930128,0.000000,23.245597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.315584,0.000000,25.631056>}
box{<0,0,-0.203200><3.373547,0.035000,0.203200> rotate<0,-44.997068,0> translate<51.930128,0.000000,23.245597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.495325,-1.535000,1.066797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.739931,-1.535000,2.311400>}
box{<0,0,-0.203200><1.760137,0.035000,0.203200> rotate<0,-44.996958,0> translate<52.495325,-1.535000,1.066797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.791256,0.000000,12.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,12.915206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<52.791256,0.000000,12.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,16.603678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,19.464319>}
box{<0,0,-0.203200><2.860641,0.035000,0.203200> rotate<0,90.000000,0> translate<52.882797,0.000000,19.464319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,16.603678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,16.548791>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,22.498155,0> translate<52.882797,0.000000,16.603678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,16.662400>}
box{<0,0,-0.203200><9.245603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,17.068800>}
box{<0,0,-0.203200><9.245603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,17.475200>}
box{<0,0,-0.203200><9.245603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,17.881600>}
box{<0,0,-0.203200><9.245603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,18.288000>}
box{<0,0,-0.203200><9.245603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,18.694400>}
box{<0,0,-0.203200><9.245603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,19.100800>}
box{<0,0,-0.203200><9.245603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,19.464319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,19.519206>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,-22.498155,0> translate<52.882797,0.000000,19.464319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.986322,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,19.507200>}
box{<0,0,-0.203200><9.142078,0.035000,0.203200> rotate<0,0.000000,0> translate<52.986322,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,12.915206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.119303,0.000000,13.019200>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.015309,0.000000,12.915206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,16.548791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,16.377309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<53.015309,0.000000,16.548791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,19.519206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,19.690687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.015309,0.000000,19.519206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.032100,0.000000,14.731997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.119303,0.000000,14.644797>}
box{<0,0,-0.203200><0.123322,0.035000,0.203200> rotate<0,44.996004,0> translate<53.032100,0.000000,14.731997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.032100,0.000000,14.731997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,14.886688>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.032100,0.000000,14.731997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.032100,0.000000,21.335997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,21.181309>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.996451,0> translate<53.032100,0.000000,21.335997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.032100,0.000000,21.335997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,21.490687>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.032100,0.000000,21.335997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.104903,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.915725,0.000000,13.004800>}
box{<0,0,-0.203200><3.810822,0.035000,0.203200> rotate<0,0.000000,0> translate<53.104903,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.119303,0.000000,13.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.901325,0.000000,13.019200>}
box{<0,0,-0.203200><3.782022,0.035000,0.203200> rotate<0,0.000000,0> translate<53.119303,0.000000,13.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.119303,0.000000,14.644797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.399675,0.000000,14.644797>}
box{<0,0,-0.203200><4.280372,0.035000,0.203200> rotate<0,0.000000,0> translate<53.119303,0.000000,14.644797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,14.886688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,15.110741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<53.186791,0.000000,14.886688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,16.377309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,16.153256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<53.186791,0.000000,16.377309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,19.690687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,19.914741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<53.186791,0.000000,19.690687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,21.181309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,20.957256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<53.186791,0.000000,21.181309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.186791,0.000000,21.490687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,21.714741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<53.186791,0.000000,21.490687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.206884,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,21.132800>}
box{<0,0,-0.203200><8.921516,0.035000,0.203200> rotate<0,0.000000,0> translate<53.206884,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.206884,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,21.539200>}
box{<0,0,-0.203200><8.921516,0.035000,0.203200> rotate<0,0.000000,0> translate<53.206884,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.237041,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,16.256000>}
box{<0,0,-0.203200><8.891359,0.035000,0.203200> rotate<0,0.000000,0> translate<53.237041,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.248969,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,15.036800>}
box{<0,0,-0.203200><8.879431,0.035000,0.203200> rotate<0,0.000000,0> translate<53.248969,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279122,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,19.913600>}
box{<0,0,-0.203200><8.849278,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279122,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,15.110741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,16.153256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<53.279597,0.000000,16.153256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,15.443200>}
box{<0,0,-0.203200><8.848803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,15.849600>}
box{<0,0,-0.203200><8.848803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,19.914741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,20.957256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<53.279597,0.000000,20.957256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,20.320000>}
box{<0,0,-0.203200><8.848803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,20.726400>}
box{<0,0,-0.203200><8.848803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,21.714741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,22.296128>}
box{<0,0,-0.203200><0.581388,0.035000,0.203200> rotate<0,90.000000,0> translate<53.279597,0.000000,22.296128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,21.945600>}
box{<0,0,-0.203200><8.848803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,22.296128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.112672,0.000000,24.129200>}
box{<0,0,-0.203200><2.592357,0.035000,0.203200> rotate<0,-44.996981,0> translate<53.279597,0.000000,22.296128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.335469,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,22.352000>}
box{<0,0,-0.203200><8.792931,0.035000,0.203200> rotate<0,0.000000,0> translate<53.335469,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.543469,0.000000,5.873750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<53.371750,0.000000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,7.045469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.371750,0.000000,7.045469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,8.702528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.543469,0.000000,9.874247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.371750,0.000000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,28.127469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.543469,0.000000,26.955750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<53.371750,0.000000,28.127469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,29.784528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,28.127469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.371750,0.000000,28.127469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.371750,0.000000,29.784528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.543469,0.000000,30.956247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.371750,0.000000,29.784528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.575066,-1.535000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.038869,-1.535000,2.311400>}
box{<0,0,-0.203200><3.484342,0.035000,0.203200> rotate<0,-44.996994,0> translate<53.575066,-1.535000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.575066,-1.535000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.201478,-1.535000,-0.152400>}
box{<0,0,-0.203200><6.626413,0.035000,0.203200> rotate<0,0.000000,0> translate<53.575066,-1.535000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.727466,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.833541,-1.535000,0.000000>}
box{<0,0,-0.203200><6.106075,0.035000,0.203200> rotate<0,0.000000,0> translate<53.727466,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.741869,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,22.758400>}
box{<0,0,-0.203200><8.386531,0.035000,0.203200> rotate<0,0.000000,0> translate<53.741869,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.133866,-1.535000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.204488,-1.535000,0.406400>}
box{<0,0,-0.203200><5.070622,0.035000,0.203200> rotate<0,0.000000,0> translate<54.133866,-1.535000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.148269,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,23.164800>}
box{<0,0,-0.203200><7.980131,0.035000,0.203200> rotate<0,0.000000,0> translate<54.148269,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.315584,0.000000,25.631056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.614322,0.000000,25.754797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<54.315584,0.000000,25.631056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.457600,-1.535000,13.436597>}
box{<0,0,-0.203200><9.956803,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.457600,-1.535000,13.436597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.540266,-1.535000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.817619,-1.535000,0.812800>}
box{<0,0,-0.203200><4.277353,0.035000,0.203200> rotate<0,0.000000,0> translate<54.540266,-1.535000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.543469,0.000000,5.873750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.200528,0.000000,5.873750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<54.543469,0.000000,5.873750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.543469,0.000000,9.874247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.200528,0.000000,9.874247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<54.543469,0.000000,9.874247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.543469,0.000000,26.955750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.200528,0.000000,26.955750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<54.543469,0.000000,26.955750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.543469,0.000000,30.956247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.200528,0.000000,30.956247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<54.543469,0.000000,30.956247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.554669,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.179459,0.000000,23.571200>}
box{<0,0,-0.203200><3.624791,0.035000,0.203200> rotate<0,0.000000,0> translate<54.554669,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.614322,0.000000,25.754797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.621459,0.000000,25.754797>}
box{<0,0,-0.203200><3.007137,0.035000,0.203200> rotate<0,0.000000,0> translate<54.614322,0.000000,25.754797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.946666,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.649284,-1.535000,1.219200>}
box{<0,0,-0.203200><3.702619,0.035000,0.203200> rotate<0,0.000000,0> translate<54.946666,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.961069,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.773059,0.000000,23.977600>}
box{<0,0,-0.203200><2.811991,0.035000,0.203200> rotate<0,0.000000,0> translate<54.961069,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.112672,0.000000,24.129200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.621459,0.000000,24.129200>}
box{<0,0,-0.203200><2.508787,0.035000,0.203200> rotate<0,0.000000,0> translate<55.112672,0.000000,24.129200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.353066,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,1.625600>}
box{<0,0,-0.203200><3.141734,0.035000,0.203200> rotate<0,0.000000,0> translate<55.353066,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.759466,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,2.032000>}
box{<0,0,-0.203200><2.735334,0.035000,0.203200> rotate<0,0.000000,0> translate<55.759466,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.038869,-1.535000,2.311400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.423519,-1.535000,2.311400>}
box{<0,0,-0.203200><1.384650,0.035000,0.203200> rotate<0,0.000000,0> translate<56.038869,-1.535000,2.311400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.200528,0.000000,5.873750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,7.045469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.200528,0.000000,5.873750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.200528,0.000000,9.874247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,8.702528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<56.200528,0.000000,9.874247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.200528,0.000000,26.955750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,28.127469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.200528,0.000000,26.955750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.200528,0.000000,30.956247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,29.784528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<56.200528,0.000000,30.956247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.270375,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,30.886400>}
box{<0,0,-0.203200><5.858025,0.035000,0.203200> rotate<0,0.000000,0> translate<56.270375,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,13.436597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,23.393400>}
box{<0,0,-0.203200><9.956803,0.035000,0.203200> rotate<0,90.000000,0> translate<56.286397,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,13.436597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.423519,-1.535000,13.436597>}
box{<0,0,-0.203200><1.137122,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,13.436597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,13.817600>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,14.224000>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,14.630400>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,15.036800>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,15.443200>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,15.849600>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,16.256000>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,16.662400>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,17.068800>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,17.475200>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,17.881600>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,18.288000>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,18.694400>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,19.100800>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,19.507200>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,19.913600>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,20.320000>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,20.726400>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,21.132800>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,21.539200>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,21.945600>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,22.352000>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,22.758400>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,23.164800>}
box{<0,0,-0.203200><5.842003,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286397,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.423519,-1.535000,23.393400>}
box{<0,0,-0.203200><1.137122,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286397,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.321175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,9.753600>}
box{<0,0,-0.203200><5.807225,0.035000,0.203200> rotate<0,0.000000,0> translate<56.321175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.422778,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,6.096000>}
box{<0,0,-0.203200><5.705622,0.035000,0.203200> rotate<0,0.000000,0> translate<56.422778,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.473578,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,27.228800>}
box{<0,0,-0.203200><5.654822,0.035000,0.203200> rotate<0,0.000000,0> translate<56.473578,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.676775,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,30.480000>}
box{<0,0,-0.203200><5.451625,0.035000,0.203200> rotate<0,0.000000,0> translate<56.676775,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.727575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,9.347200>}
box{<0,0,-0.203200><5.400825,0.035000,0.203200> rotate<0,0.000000,0> translate<56.727575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.829178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,6.502400>}
box{<0,0,-0.203200><5.299222,0.035000,0.203200> rotate<0,0.000000,0> translate<56.829178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.879978,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,27.635200>}
box{<0,0,-0.203200><5.248422,0.035000,0.203200> rotate<0,0.000000,0> translate<56.879978,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.901325,0.000000,13.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.429400,0.000000,12.491128>}
box{<0,0,-0.203200><0.746809,0.035000,0.203200> rotate<0,44.996861,0> translate<56.901325,0.000000,13.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.083175,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,30.073600>}
box{<0,0,-0.203200><5.045225,0.035000,0.203200> rotate<0,0.000000,0> translate<57.083175,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.133975,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,8.940800>}
box{<0,0,-0.203200><4.994425,0.035000,0.203200> rotate<0,0.000000,0> translate<57.133975,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.235578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,6.908800>}
box{<0,0,-0.203200><4.892822,0.035000,0.203200> rotate<0,0.000000,0> translate<57.235578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.286378,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,28.041600>}
box{<0,0,-0.203200><4.842022,0.035000,0.203200> rotate<0,0.000000,0> translate<57.286378,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,7.045469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,8.702528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<57.372247,0.000000,8.702528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,7.315200>}
box{<0,0,-0.203200><4.756153,0.035000,0.203200> rotate<0,0.000000,0> translate<57.372247,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,7.721600>}
box{<0,0,-0.203200><4.756153,0.035000,0.203200> rotate<0,0.000000,0> translate<57.372247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,8.128000>}
box{<0,0,-0.203200><4.756153,0.035000,0.203200> rotate<0,0.000000,0> translate<57.372247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,8.534400>}
box{<0,0,-0.203200><4.756153,0.035000,0.203200> rotate<0,0.000000,0> translate<57.372247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,28.127469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,29.784528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<57.372247,0.000000,29.784528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,28.448000>}
box{<0,0,-0.203200><4.756153,0.035000,0.203200> rotate<0,0.000000,0> translate<57.372247,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,28.854400>}
box{<0,0,-0.203200><4.756153,0.035000,0.203200> rotate<0,0.000000,0> translate<57.372247,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,29.260800>}
box{<0,0,-0.203200><4.756153,0.035000,0.203200> rotate<0,0.000000,0> translate<57.372247,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.372247,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,29.667200>}
box{<0,0,-0.203200><4.756153,0.035000,0.203200> rotate<0,0.000000,0> translate<57.372247,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.399675,0.000000,14.644797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.698413,0.000000,14.521056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<57.399675,0.000000,14.644797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.423519,-1.535000,2.311400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.694250,-1.535000,2.423541>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-22.498528,0> translate<57.423519,-1.535000,2.311400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.423519,-1.535000,13.436597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.694250,-1.535000,13.324456>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,22.498528,0> translate<57.423519,-1.535000,13.436597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.423519,-1.535000,23.393400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.694250,-1.535000,23.505541>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-22.498528,0> translate<57.423519,-1.535000,23.393400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.423519,-1.535000,34.518597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.694250,-1.535000,34.406456>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,22.498528,0> translate<57.423519,-1.535000,34.518597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.429400,0.000000,11.521259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,0.000000,10.643400>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<57.429400,0.000000,11.521259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.429400,0.000000,12.491128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.429400,0.000000,11.521259>}
box{<0,0,-0.203200><0.969869,0.035000,0.203200> rotate<0,-90.000000,0> translate<57.429400,0.000000,11.521259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.434434,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,14.630400>}
box{<0,0,-0.203200><4.693966,0.035000,0.203200> rotate<0,0.000000,0> translate<57.434434,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.484834,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.077866,-1.535000,13.411200>}
box{<0,0,-0.203200><0.593031,0.035000,0.203200> rotate<0,0.000000,0> translate<57.484834,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.621459,0.000000,24.129200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,0.000000,23.443400>}
box{<0,0,-0.203200><0.969868,0.035000,0.203200> rotate<0,44.997030,0> translate<57.621459,0.000000,24.129200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.621459,0.000000,25.754797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,0.000000,26.440597>}
box{<0,0,-0.203200><0.969868,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.621459,0.000000,25.754797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.694250,-1.535000,2.423541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.901456,-1.535000,2.630747>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.694250,-1.535000,2.423541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.694250,-1.535000,13.324456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.842684,-1.535000,13.176019>}
box{<0,0,-0.203200><0.209920,0.035000,0.203200> rotate<0,44.997633,0> translate<57.694250,-1.535000,13.324456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.694250,-1.535000,23.505541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.901456,-1.535000,23.712747>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.694250,-1.535000,23.505541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.694250,-1.535000,34.406456>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.901456,-1.535000,34.199250>}
box{<0,0,-0.203200><0.293034,0.035000,0.203200> rotate<0,44.997030,0> translate<57.694250,-1.535000,34.406456> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.698413,0.000000,14.521056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.578869,0.000000,13.640597>}
box{<0,0,-0.203200><1.245155,0.035000,0.203200> rotate<0,44.997132,0> translate<57.698413,0.000000,14.521056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.709109,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,2.438400>}
box{<0,0,-0.203200><0.785691,0.035000,0.203200> rotate<0,0.000000,0> translate<57.709109,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.759909,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.179459,-1.535000,23.571200>}
box{<0,0,-0.203200><0.419550,0.035000,0.203200> rotate<0,0.000000,0> translate<57.759909,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.842684,-1.535000,13.176019>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,-1.535000,13.640597>}
box{<0,0,-0.203200><0.657010,0.035000,0.203200> rotate<0,-44.997223,0> translate<57.842684,-1.535000,13.176019> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.901456,-1.535000,2.630747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,2.901478>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,-67.495533,0> translate<57.901456,-1.535000,2.630747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.901456,-1.535000,23.712747>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.941422,-1.535000,23.809238>}
box{<0,0,-0.203200><0.104440,0.035000,0.203200> rotate<0,-67.496610,0> translate<57.901456,-1.535000,23.712747> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.901456,-1.535000,34.199250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,33.928519>}
box{<0,0,-0.203200><0.293037,0.035000,0.203200> rotate<0,67.495533,0> translate<57.901456,-1.535000,34.199250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.926994,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.691369,-1.535000,34.137600>}
box{<0,0,-0.203200><0.764375,0.035000,0.203200> rotate<0,0.000000,0> translate<57.926994,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.941422,-1.535000,23.809238>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,-1.535000,23.443400>}
box{<0,0,-0.203200><0.517372,0.035000,0.203200> rotate<0,44.997030,0> translate<57.941422,-1.535000,23.809238> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.990119,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.649287,-1.535000,2.844800>}
box{<0,0,-0.203200><0.659169,0.035000,0.203200> rotate<0,0.000000,0> translate<57.990119,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.995469,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,14.224000>}
box{<0,0,-0.203200><4.132931,0.035000,0.203200> rotate<0,0.000000,0> translate<57.995469,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,2.901478>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,4.286128>}
box{<0,0,-0.203200><1.384650,0.035000,0.203200> rotate<0,90.000000,0> translate<58.013597,-1.535000,4.286128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.817625,-1.535000,3.251200>}
box{<0,0,-0.203200><0.804028,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.204491,-1.535000,3.657600>}
box{<0,0,-0.203200><1.190894,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.833544,-1.535000,4.064000>}
box{<0,0,-0.203200><1.819947,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,4.286128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.617056,-1.535000,5.889584>}
box{<0,0,-0.203200><2.267632,0.035000,0.203200> rotate<0,-44.996974,0> translate<58.013597,-1.535000,4.286128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,26.146931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,33.928519>}
box{<0,0,-0.203200><7.781588,0.035000,0.203200> rotate<0,90.000000,0> translate<58.013597,-1.535000,33.928519> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,26.146931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,-1.535000,26.440597>}
box{<0,0,-0.203200><0.415304,0.035000,0.203200> rotate<0,-44.997335,0> translate<58.013597,-1.535000,26.146931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.282666,-1.535000,26.416000>}
box{<0,0,-0.203200><0.269069,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,26.822400>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,27.228800>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,27.635200>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,28.041600>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,28.448000>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,28.854400>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,29.260800>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,29.667200>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,30.073600>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,30.480000>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,30.886400>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,31.292800>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,31.699200>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,32.105600>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,32.512000>}
box{<0,0,-0.203200><4.114803,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.078819,-1.535000,32.918400>}
box{<0,0,-0.203200><2.065222,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.306088,-1.535000,33.324800>}
box{<0,0,-0.203200><1.292491,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.013597,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.899688,-1.535000,33.731200>}
box{<0,0,-0.203200><0.886091,0.035000,0.203200> rotate<0,0.000000,0> translate<58.013597,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.197869,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,4.470400>}
box{<0,0,-0.203200><3.930531,0.035000,0.203200> rotate<0,0.000000,0> translate<58.197869,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,0.000000,10.643400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,0.000000,10.643400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<58.307259,0.000000,10.643400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,-1.535000,13.640597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,-1.535000,13.640597>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<58.307259,-1.535000,13.640597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,0.000000,23.443400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,0.000000,23.443400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<58.307259,0.000000,23.443400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,-1.535000,23.443400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,-1.535000,23.443400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<58.307259,-1.535000,23.443400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,0.000000,26.440597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,0.000000,26.440597>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<58.307259,0.000000,26.440597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.307259,-1.535000,26.440597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,-1.535000,26.440597>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<58.307259,-1.535000,26.440597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.401869,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,13.817600>}
box{<0,0,-0.203200><3.726531,0.035000,0.203200> rotate<0,0.000000,0> translate<58.401869,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,1.592163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,0.000000,0.779453>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<58.494800,0.000000,1.592163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,1.592163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,-1.535000,0.779453>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<58.494800,-1.535000,1.592163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,2.471834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,1.592163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.494800,0.000000,1.592163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,2.471834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,1.592163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.494800,-1.535000,1.592163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,2.471834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,0.000000,3.284544>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<58.494800,0.000000,2.471834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,2.471834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,-1.535000,3.284544>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<58.494800,-1.535000,2.471834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,34.612163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,0.000000,33.799453>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<58.494800,0.000000,34.612163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,34.612163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,-1.535000,33.799453>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<58.494800,-1.535000,34.612163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,35.491834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,34.612163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.494800,0.000000,34.612163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,35.491834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,34.612163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.494800,-1.535000,34.612163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,0.000000,35.491834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,0.000000,36.304544>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<58.494800,0.000000,35.491834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.494800,-1.535000,35.491834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,-1.535000,36.304544>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<58.494800,-1.535000,35.491834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.578869,0.000000,13.640597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,0.000000,13.640597>}
box{<0,0,-0.203200><0.969869,0.035000,0.203200> rotate<0,0.000000,0> translate<58.578869,0.000000,13.640597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.604269,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,4.876800>}
box{<0,0,-0.203200><3.524131,0.035000,0.203200> rotate<0,0.000000,0> translate<58.604269,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,0.000000,0.779453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,0.000000,0.157434>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<58.831434,0.000000,0.779453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,-1.535000,0.779453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,-1.535000,0.157434>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<58.831434,-1.535000,0.779453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,0.000000,3.284544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,0.000000,3.906563>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.831434,0.000000,3.284544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,-1.535000,3.284544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,-1.535000,3.906563>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.831434,-1.535000,3.284544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,0.000000,33.799453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,0.000000,33.177434>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<58.831434,0.000000,33.799453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,-1.535000,33.799453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,-1.535000,33.177434>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<58.831434,-1.535000,33.799453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,0.000000,36.304544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,0.000000,36.926563>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.831434,0.000000,36.304544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.831434,-1.535000,36.304544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,-1.535000,36.926563>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.831434,-1.535000,36.304544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.010669,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,5.283200>}
box{<0,0,-0.203200><3.117731,0.035000,0.203200> rotate<0,0.000000,0> translate<59.010669,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.417069,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,5.689600>}
box{<0,0,-0.203200><2.711331,0.035000,0.203200> rotate<0,0.000000,0> translate<59.417069,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,0.000000,0.157434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.201478,0.000000,-0.152400>}
box{<0,0,-0.203200><0.809653,0.035000,0.203200> rotate<0,22.498010,0> translate<59.453453,0.000000,0.157434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,-1.535000,0.157434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.201478,-1.535000,-0.152400>}
box{<0,0,-0.203200><0.809653,0.035000,0.203200> rotate<0,22.498010,0> translate<59.453453,-1.535000,0.157434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,0.000000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.266163,0.000000,4.243197>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<59.453453,0.000000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,-1.535000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.266163,-1.535000,4.243197>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<59.453453,-1.535000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,0.000000,33.177434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.266163,0.000000,32.840800>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<59.453453,0.000000,33.177434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,-1.535000,33.177434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.266163,-1.535000,32.840800>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<59.453453,-1.535000,33.177434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,0.000000,36.926563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.588266,0.000000,36.982400>}
box{<0,0,-0.203200><0.145919,0.035000,0.203200> rotate<0,-22.497185,0> translate<59.453453,0.000000,36.926563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.453453,-1.535000,36.926563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.588266,-1.535000,36.982400>}
box{<0,0,-0.203200><0.145919,0.035000,0.203200> rotate<0,-22.497185,0> translate<59.453453,-1.535000,36.926563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,0.000000,10.643400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,11.521259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.548738,0.000000,10.643400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,0.000000,13.640597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,12.762738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<59.548738,0.000000,13.640597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,-1.535000,13.640597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,12.762738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<59.548738,-1.535000,13.640597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,0.000000,23.443400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,24.321259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.548738,0.000000,23.443400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,-1.535000,23.443400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,24.321259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.548738,-1.535000,23.443400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,0.000000,26.440597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,25.562738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<59.548738,0.000000,26.440597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.548738,-1.535000,26.440597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,25.562738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<59.548738,-1.535000,26.440597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.573334,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,26.416000>}
box{<0,0,-0.203200><2.555066,0.035000,0.203200> rotate<0,0.000000,0> translate<59.573334,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.573334,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,26.416000>}
box{<0,0,-0.203200><2.555066,0.035000,0.203200> rotate<0,0.000000,0> translate<59.573334,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.617056,-1.535000,5.889584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,6.188322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<59.617056,-1.535000,5.889584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.676538,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,23.571200>}
box{<0,0,-0.203200><2.451863,0.035000,0.203200> rotate<0,0.000000,0> translate<59.676538,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.676538,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,23.571200>}
box{<0,0,-0.203200><2.451863,0.035000,0.203200> rotate<0,0.000000,0> translate<59.676538,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702553,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,6.096000>}
box{<0,0,-0.203200><2.425847,0.035000,0.203200> rotate<0,0.000000,0> translate<59.702553,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,6.188322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,10.835459>}
box{<0,0,-0.203200><4.647138,0.035000,0.203200> rotate<0,90.000000,0> translate<59.740797,-1.535000,10.835459> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,6.502400>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,6.908800>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,7.315200>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,7.721600>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,8.128000>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,8.534400>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,8.940800>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,9.347200>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,9.753600>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,10.160000>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,10.566400>}
box{<0,0,-0.203200><2.387603,0.035000,0.203200> rotate<0,0.000000,0> translate<59.740797,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.740797,-1.535000,10.835459>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,11.521259>}
box{<0,0,-0.203200><0.969868,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.740797,-1.535000,10.835459> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.778134,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,13.411200>}
box{<0,0,-0.203200><2.350266,0.035000,0.203200> rotate<0,0.000000,0> translate<59.778134,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.778134,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,13.411200>}
box{<0,0,-0.203200><2.350266,0.035000,0.203200> rotate<0,0.000000,0> translate<59.778134,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.878138,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,10.972800>}
box{<0,0,-0.203200><2.250263,0.035000,0.203200> rotate<0,0.000000,0> translate<59.878138,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.878138,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,10.972800>}
box{<0,0,-0.203200><2.250263,0.035000,0.203200> rotate<0,0.000000,0> translate<59.878138,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.979734,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,26.009600>}
box{<0,0,-0.203200><2.148666,0.035000,0.203200> rotate<0,0.000000,0> translate<59.979734,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.979734,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,26.009600>}
box{<0,0,-0.203200><2.148666,0.035000,0.203200> rotate<0,0.000000,0> translate<59.979734,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.082937,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,23.977600>}
box{<0,0,-0.203200><2.045463,0.035000,0.203200> rotate<0,0.000000,0> translate<60.082937,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.082937,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,23.977600>}
box{<0,0,-0.203200><2.045463,0.035000,0.203200> rotate<0,0.000000,0> translate<60.082937,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.184534,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,13.004800>}
box{<0,0,-0.203200><1.943866,0.035000,0.203200> rotate<0,0.000000,0> translate<60.184534,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.184534,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,13.004800>}
box{<0,0,-0.203200><1.943866,0.035000,0.203200> rotate<0,0.000000,0> translate<60.184534,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.266163,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.145834,0.000000,4.243197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<60.266163,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.266163,-1.535000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.145834,-1.535000,4.243197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<60.266163,-1.535000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.266163,0.000000,32.840800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.145834,0.000000,32.840800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<60.266163,0.000000,32.840800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.266163,-1.535000,32.840800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.145834,-1.535000,32.840800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<60.266163,-1.535000,32.840800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.284538,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,11.379200>}
box{<0,0,-0.203200><1.843863,0.035000,0.203200> rotate<0,0.000000,0> translate<60.284538,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.284538,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,11.379200>}
box{<0,0,-0.203200><1.843863,0.035000,0.203200> rotate<0,0.000000,0> translate<60.284538,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.386134,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,25.603200>}
box{<0,0,-0.203200><1.742266,0.035000,0.203200> rotate<0,0.000000,0> translate<60.386134,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.386134,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,25.603200>}
box{<0,0,-0.203200><1.742266,0.035000,0.203200> rotate<0,0.000000,0> translate<60.386134,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,11.521259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,12.762738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<60.426597,0.000000,12.762738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,11.521259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,12.762738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<60.426597,-1.535000,12.762738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,11.785600>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,11.785600>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,12.192000>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,12.192000>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,12.598400>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,12.598400>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,24.321259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,25.562738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<60.426597,0.000000,25.562738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,24.321259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,25.562738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<60.426597,-1.535000,25.562738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,24.384000>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,24.384000>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,24.790400>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,24.790400>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,25.196800>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.426597,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,25.196800>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<60.426597,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.145834,0.000000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.958544,0.000000,3.906563>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<61.145834,0.000000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.145834,-1.535000,4.243197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.958544,-1.535000,3.906563>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<61.145834,-1.535000,4.243197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.145834,0.000000,32.840800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.958544,0.000000,33.177434>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<61.145834,0.000000,32.840800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.145834,-1.535000,32.840800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.958544,-1.535000,33.177434>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<61.145834,-1.535000,32.840800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.333175,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,32.918400>}
box{<0,0,-0.203200><0.795225,0.035000,0.203200> rotate<0,0.000000,0> translate<61.333175,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.333175,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,32.918400>}
box{<0,0,-0.203200><0.795225,0.035000,0.203200> rotate<0,0.000000,0> translate<61.333175,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.578456,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,4.064000>}
box{<0,0,-0.203200><0.549944,0.035000,0.203200> rotate<0,0.000000,0> translate<61.578456,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.578456,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,4.064000>}
box{<0,0,-0.203200><0.549944,0.035000,0.203200> rotate<0,0.000000,0> translate<61.578456,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.958544,0.000000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,3.736703>}
box{<0,0,-0.203200><0.240215,0.035000,0.203200> rotate<0,44.997557,0> translate<61.958544,0.000000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.958544,-1.535000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,3.736703>}
box{<0,0,-0.203200><0.240215,0.035000,0.203200> rotate<0,44.997557,0> translate<61.958544,-1.535000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.958544,0.000000,33.177434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,33.347294>}
box{<0,0,-0.203200><0.240215,0.035000,0.203200> rotate<0,-44.997557,0> translate<61.958544,0.000000,33.177434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.958544,-1.535000,33.177434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,33.347294>}
box{<0,0,-0.203200><0.240215,0.035000,0.203200> rotate<0,-44.997557,0> translate<61.958544,-1.535000,33.177434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.105906,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,33.324800>}
box{<0,0,-0.203200><0.022494,0.035000,0.203200> rotate<0,0.000000,0> translate<62.105906,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.105906,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,33.324800>}
box{<0,0,-0.203200><0.022494,0.035000,0.203200> rotate<0,0.000000,0> translate<62.105906,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,33.347294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,0.000000,3.736703>}
box{<0,0,-0.203200><29.610591,0.035000,0.203200> rotate<0,-90.000000,0> translate<62.128400,0.000000,3.736703> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,33.347294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.128400,-1.535000,3.736703>}
box{<0,0,-0.203200><29.610591,0.035000,0.203200> rotate<0,-90.000000,0> translate<62.128400,-1.535000,3.736703> }
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
cylinder{<25.654000,0.038000,4.826000><25.654000,-1.538000,4.826000>0.300000 }
cylinder{<27.940000,0.038000,7.620000><27.940000,-1.538000,7.620000>0.300000 }
cylinder{<36.068000,0.038000,21.082000><36.068000,-1.538000,21.082000>0.300000 }
cylinder{<35.814000,0.038000,5.080000><35.814000,-1.538000,5.080000>0.300000 }
cylinder{<26.410000,0.038000,18.294000><26.410000,-1.538000,18.294000>0.300000 }
cylinder{<26.416000,0.038000,26.162000><26.416000,-1.538000,26.162000>0.300000 }
cylinder{<27.464000,0.038000,19.780000><27.464000,-1.538000,19.780000>0.300000 }
cylinder{<27.432000,0.038000,24.130000><27.432000,-1.538000,24.130000>0.300000 }
cylinder{<30.480000,0.038000,6.858000><30.480000,-1.538000,6.858000>0.300000 }
cylinder{<29.972000,0.038000,16.002000><29.972000,-1.538000,16.002000>0.300000 }
cylinder{<25.654000,0.038000,16.002000><25.654000,-1.538000,16.002000>0.300000 }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,10.252000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,10.252000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,10.252000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,9.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,9.052000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,9.052000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.516000,0.000000,30.572000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.116000,0.000000,30.572000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.516000,0.000000,30.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.516000,0.000000,29.372000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.116000,0.000000,29.372000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.516000,0.000000,29.372000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.700000,0.000000,34.874000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.400000,0.000000,34.874000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.700000,0.000000,34.874000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.400000,0.000000,34.874000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.400000,0.000000,31.724000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<53.400000,0.000000,31.724000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.400000,0.000000,31.724000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.700000,0.000000,31.724000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.700000,0.000000,31.724000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,34.824000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,34.824000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.600000,0.000000,34.824000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,34.824000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.200000,0.000000,34.474000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<48.200000,0.000000,34.474000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.200000,0.000000,34.474000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.200000,0.000000,32.024000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<48.200000,0.000000,32.024000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.200000,0.000000,32.024000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,31.724000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<48.200000,0.000000,32.024000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,31.724000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,31.724000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.600000,0.000000,31.724000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,31.724000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,31.724000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.600000,0.000000,31.724000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.191000,0.000000,31.963000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.191000,0.000000,34.560000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<50.191000,0.000000,34.560000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,9.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,9.052000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,9.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,10.252000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,10.252000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,10.252000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.238000,0.000000,11.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.638000,0.000000,11.846000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.638000,0.000000,11.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.238000,0.000000,13.046000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.638000,0.000000,13.046000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.638000,0.000000,13.046000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.826000,0.000000,2.078000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.826000,0.000000,1.478000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.826000,0.000000,1.478000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.626000,0.000000,2.078000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.626000,0.000000,1.478000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.626000,0.000000,1.478000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,19.812000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.129000,0.000000,19.812000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<18.923000,0.000000,21.590000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<16.129000,0.000000,21.590000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<16.129000,0.000000,20.066000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<18.923000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,21.590000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.177000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,20.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,21.590000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.875000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,21.844000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.129000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,20.828000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.542000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.002000,0.000000,20.828000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.002000,0.000000,20.828000> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<17.272000,0.000000,20.828000>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<17.780000,0.000000,20.828000>}
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
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.124000,0.000000,19.178000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.424000,0.000000,19.178000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.424000,0.000000,19.178000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<43.124000,0.000000,35.178000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.424000,0.000000,35.178000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<23.424000,0.000000,35.178000> }
difference{
cylinder{<40.259000,0,20.193000><40.259000,0.036000,20.193000>0.444500 translate<0,0.000000,0>}
cylinder{<40.259000,-0.1,20.193000><40.259000,0.135000,20.193000>0.317500 translate<0,0.000000,0>}}
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.064000,0.000000,17.002000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.064000,0.000000,15.002000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<38.064000,0.000000,15.002000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.914000,0.000000,15.002000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.064000,0.000000,15.002000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.914000,0.000000,15.002000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.914000,0.000000,17.002000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.064000,0.000000,17.002000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.914000,0.000000,17.002000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.564000,0.000000,17.002000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.564000,0.000000,15.002000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.564000,0.000000,15.002000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.564000,0.000000,15.002000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.714000,0.000000,15.002000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.564000,0.000000,15.002000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.564000,0.000000,17.002000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.714000,0.000000,17.002000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.564000,0.000000,17.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.064000,0.000000,15.002000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.564000,0.000000,15.002000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.564000,0.000000,15.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.564000,0.000000,15.002000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.564000,0.000000,17.002000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<33.564000,0.000000,17.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.564000,0.000000,17.002000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.064000,0.000000,17.002000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.564000,0.000000,17.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.064000,0.000000,17.002000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.064000,0.000000,15.002000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<38.064000,0.000000,15.002000> }
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
//JP1	ANT	LUXEON-PAD
