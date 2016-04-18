//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/Work/AVR_Playground/sensors_network/hardware/eagle/node/m328p_rfm69_node.brd
//4/18/16 12:22 PM

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
#declare global_seed=seed(906);
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
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<53.086000,0.000000,31.750000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<52.578000,0.000000,35.052000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C6 10uF EIA3528
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.878000,0.000000,10.668000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C7 100n 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<7.112000,0.000000,22.606000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C8 47uF EIA3528
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<18.288000,0.000000,16.256000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C9 47uF EIA3528
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<39.878000,0.000000,12.954000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C10 100n 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.716000,0.000000,13.208000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 100n 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.130000,0.000000,13.208000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_TSSOP8("L6920","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.716000,0.000000,18.542000>translate<0,0.035000,0> }#end		//TSSOP8 IC2 L6920 TSSOP8
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.336000,0.000000,3.302000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP2 HTU21D 1X04
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<19.050000,0.000000,30.988000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) JP3 ISP 2X3-NS
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<21.336000,0.000000,6.096000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP4 OTHER 1X04
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<42.418000,0.000000,6.096000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP5 OTHER 1X04
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<42.418000,0.000000,3.302000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP6 OTHER 1X04
#ifndef(pack_L1) #declare global_pack_L1=yes; object {SPC_L_MURATA_2012_LQH3C("10uH",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<7.112000,0.000000,16.256000>}#end		//Inductor MURATA Chip Coil L1 10uH DLJ-4018
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<50.800000,0.000000,22.860000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 100K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<50.800000,0.000000,20.320000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 100K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<32.004000,0.000000,2.794000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_RB1) #declare global_pack_RB1=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.848000,0.000000,15.748000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB1 470 0805
#ifndef(pack_RB2) #declare global_pack_RB2=yes; object {RES_SMD_CHIP_0805("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<53.848000,0.000000,22.352000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB2 330 0805
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ1 V_BOOST1
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ2 V_BOOST2
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("M328P","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<31.750000,0.000000,10.414000>translate<0,0.035000,0> }#end		//TQFP-32 U1 M328P TQFP32-08
#ifndef(pack_U2) #declare global_pack_U2=yes; object {RFM69HW_SMD("RFM69W",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<35.052000,0.000000,28.194000>}#end		//RFM69HW SMD U2 RFM69W RFM69W
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {RESONATOR_SMD("8MHz",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<37.592000,0.000000,17.018000>}#end		//RESONATOR SMD Y1 8MHz RESONATOR-SMD_MED
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<56.642000,0,30.988000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<49.530000,0,30.988000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<6.350000,0,30.988000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.462000,0,30.988000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<6.350000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.462000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<56.642000,0,9.398000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<49.530000,0,9.398000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.590000,0.000000,16.902000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.590000,0.000000,15.102000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<50.672000,0.000000,15.494000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<47.372000,0.000000,15.494000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.230000,0.000000,11.176000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.030000,0.000000,11.176000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.186000,0.000000,31.750000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<53.986000,0.000000,31.750000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.928000,0.000000,35.052000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<54.228000,0.000000,35.052000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.778000,0.000000,10.668000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.978000,0.000000,10.668000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<5.462000,0.000000,22.606000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.762000,0.000000,22.606000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.288000,0.000000,17.906000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.288000,0.000000,14.606000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.778000,0.000000,12.954000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.978000,0.000000,12.954000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.716000,0.000000,14.108000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.716000,0.000000,12.308000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.230000,0.000000,13.208000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.030000,0.000000,13.208000>}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<61.976000,0,26.720000> texture{col_thl}}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<61.976000,0,13.920000> texture{col_thl}}
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
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<20.320000,0,28.448000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,28.448000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<20.320000,0,30.988000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,30.988000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<20.320000,0,33.528000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,33.528000> texture{col_thl}}
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
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.612000,0.000000,16.256000>}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.612000,0.000000,16.256000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<51.700000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<49.900000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.900000,0.000000,20.320000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.700000,0.000000,20.320000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.004000,0.000000,3.694000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.004000,0.000000,1.894000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.848000,0.000000,14.848000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.848000,0.000000,16.648000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.848000,0.000000,21.452000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<53.848000,0.000000,23.252000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.938000,0.000000,27.432000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.414000,0.000000,27.432000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.890000,0.000000,27.432000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.542000,0.000000,21.844000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.066000,0.000000,21.844000>}
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
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.178000,0,6.096000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.718000,0,8.636000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<36.322000,0,6.096000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<39.878000,0,22.352000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.442000,0,19.310000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<28.448000,0,27.178000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.496000,0,21.050000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.718000,0,25.146000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<32.258000,0,7.874000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<31.750000,0,17.780000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.432000,0,17.780000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.048000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.048000,0.000000,31.496000>}
box{<0,0,-0.304800><23.876000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.048000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.048000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,6.096000>}
box{<0,0,-0.304800><2.155261,0.035000,0.304800> rotate<0,44.997030,0> translate<3.048000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.048000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,33.528000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-53.126596,0> translate<3.048000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.462000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,22.732000>}
box{<0,0,-0.304800><0.178191,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.462000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,22.732000>}
box{<0,0,-0.304800><2.160000,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.588000,0.000000,22.732000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.612000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.612000,0.000000,16.256000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,-90.000000,0> translate<5.612000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.462000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.612000,0.000000,22.606000>}
box{<0,0,-0.304800><0.150000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.462000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.612000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.970000,0.000000,15.136000>}
box{<0,0,-0.203200><1.175825,0.035000,0.203200> rotate<0,72.269123,0> translate<5.612000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,30.988000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<6.350000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,0.000000,24.638000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<7.112000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.350000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.112000,0.000000,30.988000>}
box{<0,0,-0.635000><0.762000,0.035000,0.635000> rotate<0,0.000000,0> translate<6.350000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,25.146000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.112000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.588000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.128000,0.000000,27.432000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.588000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,9.398000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.350000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.128000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,0.000000,27.432000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.128000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.762000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.270000,0.000000,20.448000>}
box{<0,0,-0.203200><2.216986,0.035000,0.203200> rotate<0,76.748495,0> translate<8.762000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.612000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,15.264000>}
box{<0,0,-0.203200><1.265646,0.035000,0.203200> rotate<0,51.605446,0> translate<8.612000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,15.264000>}
box{<0,0,-0.203200><1.246000,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.398000,0.000000,15.264000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.112000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.398000,0.000000,17.272000>}
box{<0,0,-0.304800><3.232892,0.035000,0.304800> rotate<0,44.997030,0> translate<7.112000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.398000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.398000,0.000000,17.272000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,90.000000,0> translate<9.398000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.270000,0.000000,20.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,19.558000>}
box{<0,0,-0.203200><1.258650,0.035000,0.203200> rotate<0,44.997030,0> translate<9.270000,0.000000,20.448000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,25.146000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<7.620000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.414000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.414000,0.000000,27.432000>}
box{<0,0,-0.635000><1.778000,0.035000,0.635000> rotate<0,-90.000000,0> translate<10.414000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.112000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.414000,0.000000,29.210000>}
box{<0,0,-0.635000><3.750265,0.035000,0.635000> rotate<0,28.298888,0> translate<7.112000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.176000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.176000,0.000000,20.574000>}
box{<0,0,-0.304800><3.556000,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.176000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.176000,0.000000,24.130000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<10.160000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.636000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,12.192000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.636000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,19.558000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.160000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,19.558000>}
box{<0,0,-0.203200><7.366000,0.035000,0.203200> rotate<0,90.000000,0> translate<11.430000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.176000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,20.320000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<11.176000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.546000,0.000000,12.308000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.430000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,15.642000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,16.805000>}
box{<0,0,-0.203200><1.163000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.741000,0.000000,16.805000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,21.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.741000,0.000000,22.647000>}
box{<0,0,-0.203200><1.205000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.741000,0.000000,22.647000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,0.000000,20.320000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.741000,0.000000,22.647000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.208000,0.000000,23.114000>}
box{<0,0,-0.228600><0.660438,0.035000,0.228600> rotate<0,-44.997030,0> translate<12.741000,0.000000,22.647000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.391000,0.000000,20.503000>}
box{<0,0,-0.203200><0.258801,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.208000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.391000,0.000000,21.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.391000,0.000000,20.503000>}
box{<0,0,-0.203200><0.939000,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.391000,0.000000,20.503000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.546000,0.000000,12.308000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,12.308000>}
box{<0,0,-0.203200><2.170000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.546000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,14.108000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.832000,0.000000,14.224000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.716000,0.000000,14.108000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.741000,0.000000,16.805000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.970000,0.000000,18.034000>}
box{<0,0,-0.228600><1.738068,0.035000,0.228600> rotate<0,-44.997030,0> translate<12.741000,0.000000,16.805000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.041000,0.000000,19.558000>}
box{<0,0,-0.203200><2.611000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.041000,0.000000,21.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.041000,0.000000,19.558000>}
box{<0,0,-0.203200><1.884000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.041000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.832000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.478000,0.000000,14.224000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.832000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.208000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<14.650000,0.000000,23.114000>}
box{<0,0,-0.228600><1.442000,0.035000,0.228600> rotate<0,0.000000,0> translate<13.208000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.478000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,14.437000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.478000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,15.642000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,14.437000>}
box{<0,0,-0.203200><1.205000,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.691000,0.000000,14.437000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<14.650000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<14.691000,0.000000,23.073000>}
box{<0,0,-0.228600><0.057983,0.035000,0.228600> rotate<0,44.997030,0> translate<14.650000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,21.442000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,23.073000>}
box{<0,0,-0.203200><1.631000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.691000,0.000000,23.073000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.691000,0.000000,23.073000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,0.000000,23.114000>}
box{<0,0,-0.203200><0.057983,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.691000,0.000000,23.073000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.732000,0.000000,33.528000>}
box{<0,0,-0.304800><10.160000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.572000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.716000,0.000000,12.308000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.990000,0.000000,12.308000>}
box{<0,0,-0.203200><2.274000,0.035000,0.203200> rotate<0,0.000000,0> translate<13.716000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,29.718000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.002000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.732000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,32.258000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<14.732000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.938000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,27.432000>}
box{<0,0,-0.304800><4.826000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.938000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.891000,0.000000,27.559000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.764000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<14.732000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<17.272000,0.000000,23.114000>}
box{<0,0,-0.228600><2.540000,0.035000,0.228600> rotate<0,0.000000,0> translate<14.732000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,28.448000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<16.002000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,2.032000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.526000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,6.096000>}
box{<0,0,-0.304800><12.954000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.572000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,6.096000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.526000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.891000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,28.448000>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.891000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.272000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,28.448000>}
box{<0,0,-0.304800><0.508000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.272000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,0.000000,28.448000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.526000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<13.970000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<18.160000,0.000000,18.034000>}
box{<0,0,-0.228600><4.190000,0.035000,0.228600> rotate<0,0.000000,0> translate<13.970000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,1.270000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<17.526000,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.990000,0.000000,12.308000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,14.606000>}
box{<0,0,-0.203200><3.249863,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.990000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.160000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,17.906000>}
box{<0,0,-0.203200><0.181019,0.035000,0.203200> rotate<0,44.997030,0> translate<18.160000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,17.906000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,0.000000,18.160000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.288000,0.000000,17.906000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.542000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.542000,0.000000,18.160000>}
box{<0,0,-0.304800><3.684000,0.035000,0.304800> rotate<0,-90.000000,0> translate<18.542000,0.000000,18.160000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<17.272000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<18.542000,0.000000,21.844000>}
box{<0,0,-0.228600><1.796051,0.035000,0.228600> rotate<0,44.997030,0> translate<17.272000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,27.178000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.050000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,29.718000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<17.780000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<18.288000,0.000000,17.906000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<19.292000,0.000000,16.902000>}
box{<0,0,-0.228600><1.419870,0.035000,0.228600> rotate<0,44.997030,0> translate<18.288000,0.000000,17.906000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,0.000000,32.258000>}
box{<0,0,-0.152400><1.983803,0.035000,0.152400> rotate<0,39.802944,0> translate<17.780000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.906000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,37.338000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.906000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,3.302000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.066000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,0.000000,21.844000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.066000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.891000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,0.000000,24.384000>}
box{<0,0,-0.304800><4.490128,0.035000,0.304800> rotate<0,44.997030,0> translate<16.891000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,0.000000,25.146000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,44.997030,0> translate<19.050000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,14.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.094000,0.000000,14.606000>}
box{<0,0,-0.203200><2.806000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.288000,0.000000,14.606000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.574000,0.000000,27.194000>}
box{<0,0,-0.203200><1.773424,0.035000,0.203200> rotate<0,44.997030,0> translate<20.320000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.094000,0.000000,14.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,15.102000>}
box{<0,0,-0.203200><0.701450,0.035000,0.203200> rotate<0,-44.997030,0> translate<21.094000,0.000000,14.606000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<19.292000,0.000000,16.902000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<21.590000,0.000000,16.902000>}
box{<0,0,-0.228600><2.298000,0.035000,0.228600> rotate<0,0.000000,0> translate<19.292000,0.000000,16.902000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,29.210000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<20.320000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,0.000000,32.258000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.304000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,31.242000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,44.997030,0> translate<22.098000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.230000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.230000,0.000000,11.176000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.230000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,15.102000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.230000,0.000000,13.462000>}
box{<0,0,-0.203200><2.319310,0.035000,0.203200> rotate<0,44.997030,0> translate<21.590000,0.000000,15.102000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.230000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.230000,0.000000,13.462000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.230000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.066000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,9.398000>}
box{<0,0,-0.203200><4.669733,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.066000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.230000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,11.038000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,44.997030,0> translate<23.230000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,11.038000>}
box{<0,0,-0.203200><1.640000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.368000,0.000000,11.038000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.448000,0.000000,33.194000>}
box{<0,0,-0.203200><5.860501,0.035000,0.203200> rotate<0,44.997030,0> translate<19.304000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,30.226000>}
box{<0,0,-0.203200><4.669733,0.035000,0.203200> rotate<0,44.997030,0> translate<20.320000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,30.226000>}
box{<0,0,-0.203200><11.430000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.622000,-1.535000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,0.000000,4.572000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.606000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.606000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.924000,0.000000,8.414000>}
box{<0,0,-0.203200><3.278147,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.606000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.030000,0.000000,16.880000>}
box{<0,0,-0.304800><7.020156,0.035000,0.304800> rotate<0,44.997030,0> translate<20.066000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.030000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.030000,0.000000,16.880000>}
box{<0,0,-0.304800><3.672000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.030000,0.000000,16.880000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.154000,0.000000,25.146000>}
box{<0,0,-0.152400><4.072000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.082000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.154000,0.000000,31.242000>}
box{<0,0,-0.152400><2.040000,0.035000,0.152400> rotate<0,0.000000,0> translate<23.114000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.186000,0.000000,29.210000>}
box{<0,0,-0.203200><3.088000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.098000,0.000000,29.210000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,9.398000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.368000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.030000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.824000,0.000000,12.414000>}
box{<0,0,-0.203200><1.122886,0.035000,0.203200> rotate<0,44.997030,0> translate<25.030000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.016000,0.000000,10.014000>}
box{<0,0,-0.203200><0.871156,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.400000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.664000,0.000000,7.614000>}
box{<0,0,-0.203200><2.146776,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.146000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,-1.535000,6.096000>}
box{<0,0,-0.203200><29.455240,0.035000,0.203200> rotate<0,44.997030,0> translate<6.350000,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,6.121400>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.178000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,13.239400>}
box{<0,0,-0.203200><4.540600,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.432000,0.000000,13.239400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.664000,0.000000,7.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,7.614000>}
box{<0,0,-0.203200><0.793400,0.035000,0.203200> rotate<0,0.000000,0> translate<26.664000,0.000000,7.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.924000,0.000000,8.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,8.414000>}
box{<0,0,-0.203200><2.533400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.924000,0.000000,8.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.016000,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,10.014000>}
box{<0,0,-0.203200><1.441400,0.035000,0.203200> rotate<0,0.000000,0> translate<26.016000,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.392000,0.000000,10.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,10.814000>}
box{<0,0,-0.203200><2.065400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.392000,0.000000,10.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.824000,0.000000,12.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,12.414000>}
box{<0,0,-0.203200><1.633400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.824000,0.000000,12.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,0.000000,13.239400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,13.214000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<27.432000,0.000000,13.239400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.457400,0.000000,12.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.489400,0.000000,12.446000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.457400,0.000000,12.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,35.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.306000,0.000000,35.194000>}
box{<0,0,-0.203200><3.104000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.202000,0.000000,35.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.442000,-1.535000,19.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.442000,-1.535000,27.172000>}
box{<0,0,-0.203200><7.862000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.442000,-1.535000,27.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.218000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,0.000000,27.178000>}
box{<0,0,-0.203200><3.230000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.218000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.442000,-1.535000,27.172000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,27.178000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.442000,-1.535000,27.172000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.203400,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,6.121400>}
box{<0,0,-0.203200><1.746600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.203400,0.000000,6.121400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.442000,0.000000,19.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,18.548000>}
box{<0,0,-0.203200><0.915810,0.035000,0.203200> rotate<0,56.306216,0> translate<28.442000,0.000000,19.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.950000,0.000000,18.548000>}
box{<0,0,-0.203200><3.841400,0.035000,0.203200> rotate<0,90.000000,0> translate<28.950000,0.000000,18.548000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.489400,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,12.446000>}
box{<0,0,-0.203200><1.466600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.489400,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.250000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,31.242000>}
box{<0,0,-0.203200><3.706000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.250000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.202000,0.000000,29.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.972000,0.000000,29.194000>}
box{<0,0,-0.203200><3.770000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.202000,0.000000,29.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.282000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,23.114000>}
box{<0,0,-0.203200><4.182000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.282000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,24.892000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.464000,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,31.750000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.956000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,31.750000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.464000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.306000,0.000000,35.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,0.000000,34.036000>}
box{<0,0,-0.203200><1.637659,0.035000,0.203200> rotate<0,44.997030,0> translate<28.306000,0.000000,35.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496000,-1.535000,21.050000>}
box{<0,0,-0.203200><0.224294,0.035000,0.203200> rotate<0,-81.792247,0> translate<29.464000,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.146000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,3.302000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.146000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,8.636000>}
box{<0,0,-0.203200><6.858000,0.035000,0.203200> rotate<0,90.000000,0> translate<29.718000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.250000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,25.146000>}
box{<0,0,-0.203200><4.468000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.250000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,25.146000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.464000,-1.535000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,8.604000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<29.718000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,8.604000>}
box{<0,0,-0.203200><2.482600,0.035000,0.203200> rotate<0,90.000000,0> translate<29.750000,0.000000,8.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.496000,0.000000,21.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,20.796000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<29.496000,0.000000,21.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,14.706600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.750000,0.000000,20.796000>}
box{<0,0,-0.203200><6.089400,0.035000,0.203200> rotate<0,90.000000,0> translate<29.750000,0.000000,20.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.788000,0.000000,11.614000>}
box{<0,0,-0.203200><1.176626,0.035000,0.203200> rotate<0,44.997030,0> translate<28.956000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,0.000000,4.572000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.876000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,-1.535000,1.778000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,1.270000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<29.718000,-1.535000,1.778000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,4.934000>}
box{<0,0,-0.203200><2.307997,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.718000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.350000,0.000000,4.934000>}
box{<0,0,-0.203200><1.187400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.350000,0.000000,4.934000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.626000,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.426000,0.000000,10.814000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.626000,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.626000,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,0.000000,9.144000>}
box{<0,0,-0.203200><1.230366,0.035000,0.203200> rotate<0,44.997030,0> translate<30.626000,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.432000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,17.780000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.432000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.270000>}
box{<0,0,-0.304800><13.716000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.288000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.894000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.004000,0.000000,1.270000>}
box{<0,0,-0.304800><0.624000,0.035000,0.304800> rotate<0,-90.000000,0> translate<32.004000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,18.034000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.750000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.972000,0.000000,29.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,26.162000>}
box{<0,0,-0.203200><4.287896,0.035000,0.203200> rotate<0,44.997030,0> translate<28.972000,0.000000,29.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.004000,0.000000,26.162000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,90.000000,0> translate<32.004000,0.000000,26.162000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,7.766000>}
box{<0,0,-0.203200><1.644600,0.035000,0.203200> rotate<0,90.000000,0> translate<32.150000,0.000000,7.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.120000,0.000000,6.091400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,6.091400>}
box{<0,0,-0.203200><0.138000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.120000,0.000000,6.091400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.150000,0.000000,7.766000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,7.874000>}
box{<0,0,-0.203200><0.152735,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.150000,0.000000,7.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,-1.535000,10.160000>}
box{<0,0,-0.203200><12.213148,0.035000,0.203200> rotate<0,44.997030,0> translate<23.622000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,-1.535000,10.160000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,90.000000,0> translate<32.258000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,4.896000>}
box{<0,0,-0.203200><1.225400,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.950000,0.000000,4.896000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,5.112000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.750000,0.000000,5.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.950000,0.000000,4.896000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,0.000000,3.810000>}
box{<0,0,-0.203200><1.535836,0.035000,0.203200> rotate<0,44.997030,0> translate<32.950000,0.000000,4.896000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.750000,0.000000,5.112000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.036000,0.000000,4.826000>}
box{<0,0,-0.203200><0.404465,0.035000,0.203200> rotate<0,44.997030,0> translate<33.750000,0.000000,5.112000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,6.121400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,6.090000>}
box{<0,0,-0.203200><0.031400,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.550000,0.000000,6.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.496000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.972600,0.000000,9.144000>}
box{<0,0,-0.203200><4.476600,0.035000,0.203200> rotate<0,0.000000,0> translate<31.496000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.972600,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,9.214000>}
box{<0,0,-0.203200><0.098995,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.972600,0.000000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.426000,0.000000,10.814000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,10.814000>}
box{<0,0,-0.203200><4.616600,0.035000,0.203200> rotate<0,0.000000,0> translate<31.426000,0.000000,10.814000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.788000,0.000000,11.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,11.614000>}
box{<0,0,-0.203200><6.254600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.788000,0.000000,11.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,13.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,16.968600>}
box{<0,0,-0.203200><3.754600,0.035000,0.203200> rotate<0,90.000000,0> translate<36.042600,0.000000,16.968600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,16.968600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.092000,0.000000,17.018000>}
box{<0,0,-0.203200><0.069862,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.042600,0.000000,16.968600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550000,0.000000,6.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.316000,0.000000,6.090000>}
box{<0,0,-0.203200><1.766000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.550000,0.000000,6.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.316000,0.000000,6.090000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,0.000000,6.096000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.316000,0.000000,6.090000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,18.796000>}
box{<0,0,-0.203200><12.700000,0.035000,0.203200> rotate<0,90.000000,0> translate<36.322000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,12.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.052000,0.000000,12.414000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,12.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,7.614000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.090000,0.000000,7.614000>}
box{<0,0,-0.203200><1.047400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,7.614000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,31.242000>}
box{<0,0,-0.203200><8.382000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.956000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.052000,0.000000,12.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,12.954000>}
box{<0,0,-0.203200><0.763675,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.052000,0.000000,12.414000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,14.478000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.592000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,30.988000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<37.338000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,30.988000>}
box{<0,0,-0.203200><13.970000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.592000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,34.544000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.592000,0.000000,34.544000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.042600,0.000000,8.414000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.830000,0.000000,8.414000>}
box{<0,0,-0.203200><2.787400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.042600,0.000000,8.414000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,-1.535000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,-1.535000,22.352000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.322000,-1.535000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,-1.535000,22.352000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.624000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.592000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,0.000000,37.084000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.592000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.694000,0.000000,9.214000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,10.160000>}
box{<0,0,-0.203200><1.337846,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.694000,0.000000,9.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,10.530000>}
box{<0,0,-0.203200><0.370000,0.035000,0.203200> rotate<0,90.000000,0> translate<40.640000,0.000000,10.530000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,23.114000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.878000,0.000000,22.352000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,3.302000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.688000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.450000,0.000000,6.996000>}
box{<0,0,-0.203200><5.192992,0.035000,0.203200> rotate<0,44.997030,0> translate<40.778000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.688000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.450000,0.000000,6.996000>}
box{<0,0,-0.203200><1.179256,0.035000,0.203200> rotate<0,-49.743240,0> translate<43.688000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.978000,0.000000,13.324000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.704000,0.000000,19.050000>}
box{<0,0,-0.203200><8.097787,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.978000,0.000000,13.324000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.822000,0.000000,23.114000>}
box{<0,0,-0.203200><4.182000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.640000,0.000000,23.114000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.372000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.372000,0.000000,13.080000>}
box{<0,0,-0.203200><2.414000,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.372000,0.000000,13.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,12.954000>}
box{<0,0,-0.203200><6.720000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.778000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.372000,0.000000,13.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.498000,0.000000,12.954000>}
box{<0,0,-0.203200><0.178191,0.035000,0.203200> rotate<0,44.997030,0> translate<47.372000,0.000000,13.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.372000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,18.022000>}
box{<0,0,-0.203200><3.575132,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.372000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,18.022000>}
box{<0,0,-0.203200><2.298000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.900000,0.000000,18.022000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.736000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,22.214000>}
box{<0,0,-0.203200><4.474572,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.736000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,22.214000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.900000,0.000000,22.214000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.902000,0.000000,35.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.024000,0.000000,35.194000>}
box{<0,0,-0.203200><5.122000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.902000,0.000000,35.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.900000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,22.998000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.900000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,22.998000>}
box{<0,0,-0.203200><1.386000,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.038000,0.000000,22.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.024000,0.000000,35.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.928000,0.000000,35.052000>}
box{<0,0,-0.203200><0.915085,0.035000,0.203200> rotate<0,8.926466,0> translate<50.024000,0.000000,35.194000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.672000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,16.522000>}
box{<0,0,-0.203200><1.453812,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.672000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,16.522000>}
box{<0,0,-0.203200><3.798000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.700000,0.000000,16.522000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,20.320000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.700000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.700000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.092000,0.000000,23.252000>}
box{<0,0,-0.203200><0.554372,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.700000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.038000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,26.532000>}
box{<0,0,-0.203200><3.037731,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.038000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,26.532000>}
box{<0,0,-0.203200><5.218000,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.186000,0.000000,26.532000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.928000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,33.794000>}
box{<0,0,-0.203200><1.779081,0.035000,0.203200> rotate<0,44.997030,0> translate<50.928000,0.000000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.186000,0.000000,33.794000>}
box{<0,0,-0.203200><2.044000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.186000,0.000000,33.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,21.452000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,16.648000>}
box{<0,0,-0.203200><4.804000,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.848000,0.000000,16.648000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.092000,0.000000,23.252000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,0.000000,23.252000>}
box{<0,0,-0.203200><1.756000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.092000,0.000000,23.252000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.986000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,31.254000>}
box{<0,0,-0.203200><0.551888,0.035000,0.203200> rotate<0,63.987879,0> translate<53.986000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,31.254000>}
box{<0,0,-0.203200><3.798000,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.228000,0.000000,31.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,36.956000>}
box{<0,0,-0.203200><1.904000,0.035000,0.203200> rotate<0,90.000000,0> translate<54.228000,0.000000,36.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,0.000000,37.084000>}
box{<0,0,-0.203200><14.224000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.132000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.228000,0.000000,36.956000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,0.000000,37.084000>}
box{<0,0,-0.203200><0.181019,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.228000,0.000000,36.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.610000,-1.535000,1.270000>}
box{<0,0,-0.203200><24.384000,0.035000,0.203200> rotate<0,0.000000,0> translate<30.226000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.642000,-1.535000,30.988000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<56.642000,-1.535000,9.398000>}
box{<0,0,-0.635000><21.590000,0.035000,0.635000> rotate<0,-90.000000,0> translate<56.642000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.356000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.896000,0.000000,37.084000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.356000,0.000000,37.084000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.896000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.770000,0.000000,29.210000>}
box{<0,0,-0.203200><11.135518,0.035000,0.203200> rotate<0,44.997030,0> translate<56.896000,0.000000,37.084000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,4.470400>}
box{<0,0,-0.203200><15.494003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,4.876800>}
box{<0,0,-0.203200><15.494003,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.144828,0.000000,5.283200>}
box{<0,0,-0.203200><3.027231,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.685244,0.000000,5.689600>}
box{<0,0,-0.203200><2.567647,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.278844,0.000000,6.096000>}
box{<0,0,-0.203200><2.161247,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.872444,0.000000,6.502400>}
box{<0,0,-0.203200><1.754847,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.466041,0.000000,6.908800>}
box{<0,0,-0.203200><1.348444,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184509,0.000000,7.315200>}
box{<0,0,-0.203200><1.066913,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,7.315200> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.142431,0.000000,31.699200>}
box{<0,0,-0.203200><1.024834,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.362206,0.000000,32.105600>}
box{<0,0,-0.203200><1.244609,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.667003,0.000000,32.512000>}
box{<0,0,-0.203200><1.549406,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.971803,0.000000,32.918400>}
box{<0,0,-0.203200><1.854206,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.276603,0.000000,33.324800>}
box{<0,0,-0.203200><2.159006,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.581403,0.000000,33.731200>}
box{<0,0,-0.203200><2.463806,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.886203,0.000000,34.137600>}
box{<0,0,-0.203200><2.768606,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.144822,0.000000,34.544000>}
box{<0,0,-0.203200><18.027225,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.117597,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.551222,0.000000,34.950400>}
box{<0,0,-0.203200><18.433625,0.035000,0.203200> rotate<0,0.000000,0> translate<1.117597,0.000000,34.950400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.117069,0.000000,31.546741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,31.431019>}
box{<0,0,-0.203200><0.116897,0.035000,0.203200> rotate<0,81.864711,0> translate<2.117069,0.000000,31.546741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.117069,0.000000,31.546741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,31.611266>}
box{<0,0,-0.203200><0.066609,0.035000,0.203200> rotate<0,-75.624964,0> translate<2.117069,0.000000,31.546741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,7.438113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.272809,0.000000,7.102031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<2.133600,0.000000,7.438113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,31.431019>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,7.438113>}
box{<0,0,-0.203200><23.992906,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.133600,0.000000,7.438113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,31.677884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,31.611266>}
box{<0,0,-0.203200><0.066619,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.133600,0.000000,31.611266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.133600,0.000000,31.677884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178341,0.000000,31.785891>}
box{<0,0,-0.203200><0.116906,0.035000,0.203200> rotate<0,-67.494200,0> translate<2.133600,0.000000,31.677884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.178341,0.000000,31.785891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.207350,0.000000,31.899131>}
box{<0,0,-0.203200><0.116897,0.035000,0.203200> rotate<0,-75.626282,0> translate<2.178341,0.000000,31.785891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.207350,0.000000,31.899131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.247319,0.000000,31.952419>}
box{<0,0,-0.203200><0.066611,0.035000,0.203200> rotate<0,-53.124446,0> translate<2.207350,0.000000,31.899131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.247319,0.000000,31.952419>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.272809,0.000000,32.013966>}
box{<0,0,-0.203200><0.066617,0.035000,0.203200> rotate<0,-67.497870,0> translate<2.247319,0.000000,31.952419> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.272809,0.000000,7.102031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530031,0.000000,6.844809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<2.272809,0.000000,7.102031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.272809,0.000000,32.013966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.355475,0.000000,32.096628>}
box{<0,0,-0.203200><0.116905,0.035000,0.203200> rotate<0,-44.995947,0> translate<2.272809,0.000000,32.013966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.355475,0.000000,32.096628>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.771319,0.000000,33.984425>}
box{<0,0,-0.203200><2.359744,0.035000,0.203200> rotate<0,-53.126672,0> translate<2.355475,0.000000,32.096628> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530031,0.000000,6.844809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530034,0.000000,6.844809>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.530031,0.000000,6.844809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.530034,0.000000,6.844809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.796809,0.000000,5.578034>}
box{<0,0,-0.203200><1.791490,0.035000,0.203200> rotate<0,44.997030,0> translate<2.530034,0.000000,6.844809> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.348269,0.000000,4.064000>}
box{<0,0,-0.203200><13.189812,0.035000,0.203200> rotate<0,0.000000,0> translate<3.158456,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.538544,0.000000,3.906563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.160563,0.000000,3.284544>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<3.538544,0.000000,3.906563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.538544,0.000000,35.971434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.160563,0.000000,36.593453>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.538544,0.000000,35.971434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.736709,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.382628,0.000000,36.169600>}
box{<0,0,-0.203200><3.645919,0.035000,0.203200> rotate<0,0.000000,0> translate<3.736709,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.771319,0.000000,33.984425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.796809,0.000000,34.045966>}
box{<0,0,-0.203200><0.066611,0.035000,0.203200> rotate<0,-67.495813,0> translate<3.771319,0.000000,33.984425> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.787506,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,3.657600>}
box{<0,0,-0.203200><12.366894,0.035000,0.203200> rotate<0,0.000000,0> translate<3.787506,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.796809,0.000000,5.578031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.054031,0.000000,5.320809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<3.796809,0.000000,5.578031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.796809,0.000000,5.578034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.796809,0.000000,5.578031>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<3.796809,0.000000,5.578031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.796809,0.000000,34.045966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.879469,0.000000,34.128622>}
box{<0,0,-0.203200><0.116896,0.035000,0.203200> rotate<0,-44.995947,0> translate<3.796809,0.000000,34.045966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.879469,0.000000,34.128622>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.949609,0.000000,34.222147>}
box{<0,0,-0.203200><0.116904,0.035000,0.203200> rotate<0,-53.127821,0> translate<3.879469,0.000000,34.128622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.949609,0.000000,34.222147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.006931,0.000000,34.256084>}
box{<0,0,-0.203200><0.066615,0.035000,0.203200> rotate<0,-30.625695,0> translate<3.949609,0.000000,34.222147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,7.998753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,31.191197>}
box{<0,0,-0.203200><23.192444,0.035000,0.203200> rotate<0,90.000000,0> translate<3.962397,0.000000,31.191197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,7.998753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.950753,0.000000,7.010397>}
box{<0,0,-0.203200><1.397747,0.035000,0.203200> rotate<0,44.997030,0> translate<3.962397,0.000000,7.998753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.903219,0.000000,8.128000>}
box{<0,0,-0.203200><7.940822,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.496819,0.000000,8.534400>}
box{<0,0,-0.203200><7.534422,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,8.940800>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,9.347200>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,9.753600>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,10.160000>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.801622,0.000000,10.566400>}
box{<0,0,-0.203200><7.839225,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.208022,0.000000,10.972800>}
box{<0,0,-0.203200><8.245625,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.614422,0.000000,11.379200>}
box{<0,0,-0.203200><8.652025,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,11.785600>}
box{<0,0,-0.203200><20.058003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.183894,0.000000,12.192000>}
box{<0,0,-0.203200><20.221497,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,12.598400>}
box{<0,0,-0.203200><20.058003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,13.004800>}
box{<0,0,-0.203200><20.058003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.579109,0.000000,13.411200>}
box{<0,0,-0.203200><8.616713,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.188294,0.000000,13.817600>}
box{<0,0,-0.203200><0.225897,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,14.224000>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,14.630400>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,15.036800>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,15.443200>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,15.849600>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,16.256000>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,16.662400>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,17.068800>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,17.475200>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,17.881600>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,18.288000>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.188297,0.000000,18.694400>}
box{<0,0,-0.203200><0.225900,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,19.100800>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,19.507200>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,19.913600>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,20.320000>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,20.726400>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.294625,0.000000,21.132800>}
box{<0,0,-0.203200><0.332228,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,21.539200>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,21.945600>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,22.352000>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,22.758400>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,23.164800>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,23.571200>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252544,0.000000,23.977600>}
box{<0,0,-0.203200><0.290147,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.543750,0.000000,24.384000>}
box{<0,0,-0.203200><0.581353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.673600,0.000000,24.790400>}
box{<0,0,-0.203200><0.711203,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.724516,0.000000,25.196800>}
box{<0,0,-0.203200><0.762119,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.006044,0.000000,25.603200>}
box{<0,0,-0.203200><1.043647,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.412444,0.000000,26.009600>}
box{<0,0,-0.203200><1.450047,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.818844,0.000000,26.416000>}
box{<0,0,-0.203200><1.856447,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.225244,0.000000,26.822400>}
box{<0,0,-0.203200><2.262847,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.631644,0.000000,27.228800>}
box{<0,0,-0.203200><2.669247,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.038044,0.000000,27.635200>}
box{<0,0,-0.203200><3.075647,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.444444,0.000000,28.041600>}
box{<0,0,-0.203200><3.482047,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.735403,0.000000,28.448000>}
box{<0,0,-0.203200><3.773006,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.449216,0.000000,28.854400>}
box{<0,0,-0.203200><4.486819,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.248419,0.000000,29.260800>}
box{<0,0,-0.203200><1.286022,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.842019,0.000000,29.667200>}
box{<0,0,-0.203200><0.879622,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.435619,0.000000,30.073600>}
box{<0,0,-0.203200><0.473222,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,30.480000>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,30.886400>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<3.962397,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.962397,0.000000,31.191197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,31.707672>}
box{<0,0,-0.203200><0.645592,0.035000,0.203200> rotate<0,-53.126818,0> translate<3.962397,0.000000,31.191197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,14.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095206,0.000000,13.910687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<4.002400,0.000000,14.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,18.377256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,14.134741>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.002400,0.000000,14.134741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.002400,0.000000,18.377256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095206,0.000000,18.601309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<4.002400,0.000000,18.377256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.006931,0.000000,34.256084>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.054031,0.000000,34.303187>}
box{<0,0,-0.203200><0.066612,0.035000,0.203200> rotate<0,-44.998931,0> translate<4.006931,0.000000,34.256084> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.038597,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,31.292800>}
box{<0,0,-0.203200><0.311153,0.035000,0.203200> rotate<0,0.000000,0> translate<4.038597,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.054031,0.000000,5.320809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.390112,0.000000,5.181600>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,22.498510,0> translate<4.054031,0.000000,5.320809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.054031,0.000000,34.303187>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.162034,0.000000,34.347922>}
box{<0,0,-0.203200><0.116901,0.035000,0.203200> rotate<0,-22.497617,0> translate<4.054031,0.000000,34.303187> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095206,0.000000,13.910687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.266688,0.000000,13.739206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<4.095206,0.000000,13.910687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.095206,0.000000,18.601309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.266688,0.000000,18.772791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.095206,0.000000,18.601309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.143109,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,36.576000>}
box{<0,0,-0.203200><3.203291,0.035000,0.203200> rotate<0,0.000000,0> translate<4.143109,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.160563,0.000000,3.284544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,2.471834>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<4.160563,0.000000,3.284544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.160563,0.000000,36.593453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,37.406163>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<4.160563,0.000000,36.593453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.162034,0.000000,34.347922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.262625,0.000000,34.407484>}
box{<0,0,-0.203200><0.116902,0.035000,0.203200> rotate<0,-30.628931,0> translate<4.162034,0.000000,34.347922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.174375,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,3.251200>}
box{<0,0,-0.203200><11.980025,0.035000,0.203200> rotate<0,0.000000,0> translate<4.174375,0.000000,3.251200> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.753513,0.000000,39.014400>}
box{<0,0,-0.203200><3.558100,0.035000,0.203200> rotate<0,0.000000,0> translate<4.195412,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.239550,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.309619,0.000000,7.721600>}
box{<0,0,-0.203200><8.070069,0.035000,0.203200> rotate<0,0.000000,0> translate<4.239550,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,21.234741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.345206,0.000000,21.010687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<4.252400,0.000000,21.234741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,23.977256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,21.234741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.252400,0.000000,21.234741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.252400,0.000000,23.977256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.345206,0.000000,24.201309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<4.252400,0.000000,23.977256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.262625,0.000000,34.407484>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.328572,0.000000,34.416903>}
box{<0,0,-0.203200><0.066616,0.035000,0.203200> rotate<0,-8.127665,0> translate<4.262625,0.000000,34.407484> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.266688,0.000000,13.739206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490741,0.000000,13.646400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<4.266688,0.000000,13.739206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.266688,0.000000,18.772791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490741,0.000000,18.865597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<4.266688,0.000000,18.772791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.321669,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,36.982400>}
box{<0,0,-0.203200><3.024731,0.035000,0.203200> rotate<0,0.000000,0> translate<4.321669,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.328572,0.000000,34.416903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.390112,0.000000,34.442397>}
box{<0,0,-0.203200><0.066612,0.035000,0.203200> rotate<0,-22.500731,0> translate<4.328572,0.000000,34.416903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.342709,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.045641,0.000000,1.219200>}
box{<0,0,-0.203200><12.702931,0.035000,0.203200> rotate<0,0.000000,0> translate<4.342709,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.342713,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,2.844800>}
box{<0,0,-0.203200><11.811688,0.035000,0.203200> rotate<0,0.000000,0> translate<4.342713,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.343394,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,31.699200>}
box{<0,0,-0.203200><0.006356,0.035000,0.203200> rotate<0,0.000000,0> translate<4.343394,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.345206,0.000000,21.010687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.516688,0.000000,20.839206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<4.345206,0.000000,21.010687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.345206,0.000000,24.201309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.516688,0.000000,24.372791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.345206,0.000000,24.201309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,30.159469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.521469,0.000000,28.987750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<4.349750,0.000000,30.159469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,31.707672>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.349750,0.000000,30.159469>}
box{<0,0,-0.203200><1.548203,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.349750,0.000000,30.159469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.363753,0.000000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.424716,0.000000,38.608000>}
box{<0,0,-0.203200><3.060962,0.035000,0.203200> rotate<0,0.000000,0> translate<4.363753,0.000000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.390112,0.000000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.500669,0.000000,5.181600>}
box{<0,0,-0.203200><12.110556,0.035000,0.203200> rotate<0,0.000000,0> translate<4.390112,0.000000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.390112,0.000000,34.442397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.507019,0.000000,34.442397>}
box{<0,0,-0.203200><0.116906,0.035000,0.203200> rotate<0,0.000000,0> translate<4.390112,0.000000,34.442397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490003,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,37.388800>}
box{<0,0,-0.203200><2.856397,0.035000,0.203200> rotate<0,0.000000,0> translate<4.490003,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490741,0.000000,13.646400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.733256,0.000000,13.646400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<4.490741,0.000000,13.646400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.490741,0.000000,18.865597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,18.865597>}
box{<0,0,-0.203200><0.206859,0.035000,0.203200> rotate<0,0.000000,0> translate<4.490741,0.000000,18.865597> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.449866,0.000000,2.438400>}
box{<0,0,-0.203200><11.952669,0.035000,0.203200> rotate<0,0.000000,0> translate<4.497197,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,37.406163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,38.285834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<4.497197,0.000000,38.285834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,37.795200>}
box{<0,0,-0.203200><2.849203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.497197,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.497197,0.000000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,38.201600>}
box{<0,0,-0.203200><2.849203,0.035000,0.203200> rotate<0,0.000000,0> translate<4.497197,0.000000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.507019,0.000000,34.442397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.622741,0.000000,34.458928>}
box{<0,0,-0.203200><0.116897,0.035000,0.203200> rotate<0,-8.129349,0> translate<4.507019,0.000000,34.442397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.516688,0.000000,20.839206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,20.764272>}
box{<0,0,-0.203200><0.195817,0.035000,0.203200> rotate<0,22.497965,0> translate<4.516688,0.000000,20.839206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.516688,0.000000,24.372791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.673600,0.000000,24.437784>}
box{<0,0,-0.203200><0.169840,0.035000,0.203200> rotate<0,-22.498037,0> translate<4.516688,0.000000,24.372791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.622741,0.000000,34.458928>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.687266,0.000000,34.442397>}
box{<0,0,-0.203200><0.066609,0.035000,0.203200> rotate<0,14.369096,0> translate<4.622741,0.000000,34.458928> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.645950,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.805472,0.000000,7.315200>}
box{<0,0,-0.203200><12.159522,0.035000,0.203200> rotate<0,0.000000,0> translate<4.645950,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.673600,0.000000,25.073884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.673600,0.000000,24.437784>}
box{<0,0,-0.203200><0.636100,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.673600,0.000000,24.437784> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.673600,0.000000,25.073884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.812809,0.000000,25.409966>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-67.495551,0> translate<4.673600,0.000000,25.073884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.687266,0.000000,34.442397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.913884,0.000000,34.442397>}
box{<0,0,-0.203200><10.226619,0.035000,0.203200> rotate<0,0.000000,0> translate<4.687266,0.000000,34.442397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,20.764272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.697600,0.000000,18.865597>}
box{<0,0,-0.203200><1.898675,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.697600,0.000000,18.865597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.812809,0.000000,25.409966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.352809,0.000000,27.949966>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.812809,0.000000,25.409966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.950753,0.000000,7.010397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.500669,0.000000,7.010397>}
box{<0,0,-0.203200><11.549916,0.035000,0.203200> rotate<0,0.000000,0> translate<4.950753,0.000000,7.010397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.521469,0.000000,28.987750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.178528,0.000000,28.987750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<5.521469,0.000000,28.987750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.733256,0.000000,13.646400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.957309,0.000000,13.739206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<6.733256,0.000000,13.646400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.957309,0.000000,13.739206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,0.000000,13.893897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.957309,0.000000,13.739206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.035703,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.188294,0.000000,13.817600>}
box{<0,0,-0.203200><0.152591,0.035000,0.203200> rotate<0,0.000000,0> translate<7.035703,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.112000,0.000000,13.893897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.266688,0.000000,13.739206>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<7.112000,0.000000,13.893897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.178528,0.000000,28.987750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.536591,0.000000,29.345813>}
box{<0,0,-0.203200><0.506377,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.178528,0.000000,28.987750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.266688,0.000000,13.739206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.490741,0.000000,13.646400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<7.266688,0.000000,13.739206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,36.257066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.484878,0.000000,35.922753>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<7.346400,0.000000,36.257066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,38.418931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,36.257066>}
box{<0,0,-0.203200><2.161866,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.346400,0.000000,36.257066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.346400,0.000000,38.418931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.484878,0.000000,38.753244>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<7.346400,0.000000,38.418931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.352809,0.000000,27.949966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.610031,0.000000,28.207187>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.352809,0.000000,27.949966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.451578,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.694469,0.000000,29.260800>}
box{<0,0,-0.203200><0.242891,0.035000,0.203200> rotate<0,0.000000,0> translate<7.451578,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.484878,0.000000,35.922753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.740753,0.000000,35.666878>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<7.484878,0.000000,35.922753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.484878,0.000000,38.753244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.740753,0.000000,39.009119>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.484878,0.000000,38.753244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.490741,0.000000,13.646400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.733256,0.000000,13.646400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<7.490741,0.000000,13.646400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.536591,0.000000,29.345813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.472809,0.000000,28.841697>}
box{<0,0,-0.203200><1.063315,0.035000,0.203200> rotate<0,28.298785,0> translate<7.536591,0.000000,29.345813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.610031,0.000000,28.207187>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.696200,0.000000,28.242878>}
box{<0,0,-0.203200><0.093268,0.035000,0.203200> rotate<0,-22.497584,0> translate<7.610031,0.000000,28.207187> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.696200,0.000000,28.353356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.696200,0.000000,28.242878>}
box{<0,0,-0.203200><0.110478,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.696200,0.000000,28.242878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.696200,0.000000,28.353356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.789006,0.000000,28.577409>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<7.696200,0.000000,28.353356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.740753,0.000000,35.666878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.075066,0.000000,35.528400>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,22.498713,0> translate<7.740753,0.000000,35.666878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.740753,0.000000,39.009119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.753513,0.000000,39.014400>}
box{<0,0,-0.203200><0.013809,0.035000,0.203200> rotate<0,-22.483734,0> translate<7.740753,0.000000,39.009119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.789006,0.000000,28.577409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.960488,0.000000,28.748891>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.789006,0.000000,28.577409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.960488,0.000000,28.748891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.184541,0.000000,28.841697>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<7.960488,0.000000,28.748891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,19.936756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,24.231600>}
box{<0,0,-0.203200><4.294844,0.035000,0.203200> rotate<0,90.000000,0> translate<8.026397,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,19.936756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.097553,0.000000,18.865597>}
box{<0,0,-0.203200><1.514846,0.035000,0.203200> rotate<0,44.997114,0> translate<8.026397,0.000000,19.936756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.291469,0.000000,20.320000>}
box{<0,0,-0.203200><2.265072,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,20.726400>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,21.132800>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,21.539200>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,21.945600>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,22.352000>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,22.758400>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,23.164800>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,23.571200>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.035241,0.000000,23.977600>}
box{<0,0,-0.203200><2.008844,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.026397,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.781241,0.000000,24.231600>}
box{<0,0,-0.203200><1.754844,0.035000,0.203200> rotate<0,0.000000,0> translate<8.026397,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.049553,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.543241,0.000000,19.913600>}
box{<0,0,-0.203200><2.493688,0.035000,0.203200> rotate<0,0.000000,0> translate<8.049553,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.075066,0.000000,35.528400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.736931,0.000000,35.528400>}
box{<0,0,-0.203200><3.661866,0.035000,0.203200> rotate<0,0.000000,0> translate<8.075066,0.000000,35.528400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.184541,0.000000,28.841697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.472809,0.000000,28.841697>}
box{<0,0,-0.203200><0.288269,0.035000,0.203200> rotate<0,0.000000,0> translate<8.184541,0.000000,28.841697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.455953,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.268322,0.000000,19.507200>}
box{<0,0,-0.203200><2.812369,0.035000,0.203200> rotate<0,0.000000,0> translate<8.455953,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.862353,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.881019,0.000000,19.100800>}
box{<0,0,-0.203200><8.018666,0.035000,0.203200> rotate<0,0.000000,0> translate<8.862353,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.097553,0.000000,18.865597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.733256,0.000000,18.865597>}
box{<0,0,-0.203200><0.635703,0.035000,0.203200> rotate<0,0.000000,0> translate<9.097553,0.000000,18.865597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.733256,0.000000,13.646400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.957309,0.000000,13.739206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<9.733256,0.000000,13.646400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.733256,0.000000,18.865597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.957309,0.000000,18.772791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<9.733256,0.000000,18.865597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.781241,0.000000,24.231600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,23.751241>}
box{<0,0,-0.203200><0.679331,0.035000,0.203200> rotate<0,44.997030,0> translate<9.781241,0.000000,24.231600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.957309,0.000000,13.739206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.128791,0.000000,13.910687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.957309,0.000000,13.739206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.957309,0.000000,18.772791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.128791,0.000000,18.601309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<9.957309,0.000000,18.772791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.035700,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.445009,0.000000,18.694400>}
box{<0,0,-0.203200><3.409309,0.035000,0.203200> rotate<0,0.000000,0> translate<10.035700,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.035703,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,13.817600>}
box{<0,0,-0.203200><2.470697,0.035000,0.203200> rotate<0,0.000000,0> translate<10.035703,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.128791,0.000000,13.910687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,14.134741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<10.128791,0.000000,13.910687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.128791,0.000000,18.601309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,18.377256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<10.128791,0.000000,18.601309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,14.134741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.310294>}
box{<0,0,-0.203200><1.175553,0.035000,0.203200> rotate<0,90.000000,0> translate<10.221597,0.000000,15.310294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,14.224000>}
box{<0,0,-0.203200><2.284803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.303856,0.000000,14.630400>}
box{<0,0,-0.203200><2.082259,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.945456,0.000000,15.036800>}
box{<0,0,-0.203200><1.723859,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.310294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.224003,0.000000,15.331056>}
box{<0,0,-0.203200><0.020901,0.035000,0.203200> rotate<0,-83.383749,0> translate<10.221597,0.000000,15.310294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.339503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,16.108906>}
box{<0,0,-0.203200><0.769403,0.035000,0.203200> rotate<0,90.000000,0> translate<10.221597,0.000000,16.108906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.339503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.224003,0.000000,15.331056>}
box{<0,0,-0.203200><0.008783,0.035000,0.203200> rotate<0,74.094518,0> translate<10.221597,0.000000,15.339503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.443200>}
box{<0,0,-0.203200><1.709803,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,15.849600>}
box{<0,0,-0.203200><1.706603,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,16.108906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.312397,0.000000,16.328112>}
box{<0,0,-0.203200><0.237268,0.035000,0.203200> rotate<0,-67.495144,0> translate<10.221597,0.000000,16.108906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,17.673091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,18.377256>}
box{<0,0,-0.203200><0.704166,0.035000,0.203200> rotate<0,90.000000,0> translate<10.221597,0.000000,18.377256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,17.673091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.312397,0.000000,17.453884>}
box{<0,0,-0.203200><0.237268,0.035000,0.203200> rotate<0,67.495144,0> translate<10.221597,0.000000,17.673091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.632209,0.000000,17.881600>}
box{<0,0,-0.203200><2.410612,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.221597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.038609,0.000000,18.288000>}
box{<0,0,-0.203200><2.817012,0.035000,0.203200> rotate<0,0.000000,0> translate<10.221597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,20.392112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400809,0.000000,20.056031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<10.261600,0.000000,20.392112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,23.751241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.261600,0.000000,20.392112>}
box{<0,0,-0.203200><3.359128,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.261600,0.000000,20.392112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.282525,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,16.256000>}
box{<0,0,-0.203200><1.645675,0.035000,0.203200> rotate<0,0.000000,0> translate<10.282525,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.303569,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.225809,0.000000,17.475200>}
box{<0,0,-0.203200><1.922241,0.035000,0.203200> rotate<0,0.000000,0> translate<10.303569,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.312397,0.000000,16.328112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.312397,0.000000,17.453884>}
box{<0,0,-0.203200><1.125772,0.035000,0.203200> rotate<0,90.000000,0> translate<10.312397,0.000000,17.453884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.312397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.902800,0.000000,16.662400>}
box{<0,0,-0.203200><1.590403,0.035000,0.203200> rotate<0,0.000000,0> translate<10.312397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.312397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.943009,0.000000,17.068800>}
box{<0,0,-0.203200><1.630612,0.035000,0.203200> rotate<0,0.000000,0> translate<10.312397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.400809,0.000000,20.056031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.658031,0.000000,19.798809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<10.400809,0.000000,20.056031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.658031,0.000000,19.798809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.903319,0.000000,19.697209>}
box{<0,0,-0.203200><0.265497,0.035000,0.203200> rotate<0,22.498234,0> translate<10.658031,0.000000,19.798809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.903319,0.000000,19.697209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.969584,0.000000,19.630941>}
box{<0,0,-0.203200><0.093716,0.035000,0.203200> rotate<0,44.998381,0> translate<10.903319,0.000000,19.697209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.969584,0.000000,19.630941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.268322,0.000000,19.507200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<10.969584,0.000000,19.630941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.268322,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.369675,0.000000,19.507200>}
box{<0,0,-0.203200><2.101353,0.035000,0.203200> rotate<0,0.000000,0> translate<11.268322,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,8.569469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633469,0.000000,7.397750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<11.461750,0.000000,8.569469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,10.226528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,8.569469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.461750,0.000000,8.569469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.461750,0.000000,10.226528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633469,0.000000,11.398247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.461750,0.000000,10.226528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.736931,0.000000,35.528400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.071244,0.000000,35.666878>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-22.498713,0> translate<11.736931,0.000000,35.528400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.902800,0.000000,16.638269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,16.576950>}
box{<0,0,-0.203200><0.066371,0.035000,0.203200> rotate<0,67.494794,0> translate<11.902800,0.000000,16.638269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.902800,0.000000,16.971728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.902800,0.000000,16.638269>}
box{<0,0,-0.203200><0.333459,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.902800,0.000000,16.638269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.902800,0.000000,16.971728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.030409,0.000000,17.279800>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-67.495255,0> translate<11.902800,0.000000,16.971728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,15.480322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.472597>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<11.928200,0.000000,15.480322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,16.576950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.928200,0.000000,15.480322>}
box{<0,0,-0.203200><1.096628,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.928200,0.000000,15.480322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.070741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.024206,0.000000,14.846688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<11.931400,0.000000,15.070741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.472597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.931400,0.000000,15.070741>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.931400,0.000000,15.070741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.024206,0.000000,14.846688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.195688,0.000000,14.675206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<12.024206,0.000000,14.846688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.030409,0.000000,17.279800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.259409,0.000000,18.508800>}
box{<0,0,-0.203200><1.738068,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.030409,0.000000,17.279800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.058484,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.071244,0.000000,39.009119>}
box{<0,0,-0.203200><0.013809,0.035000,0.203200> rotate<0,22.483734,0> translate<12.058484,0.000000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.058484,0.000000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.844584,0.000000,39.014400>}
box{<0,0,-0.203200><49.786100,0.035000,0.203200> rotate<0,0.000000,0> translate<12.058484,0.000000,39.014400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,13.586741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.599206,0.000000,13.362687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<12.506400,0.000000,13.586741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,14.582400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.506400,0.000000,13.586741>}
box{<0,0,-0.203200><0.995659,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.506400,0.000000,13.586741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.599206,0.000000,13.362687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.770688,0.000000,13.191206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<12.599206,0.000000,13.362687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633469,0.000000,7.397750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290528,0.000000,7.397750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<12.633469,0.000000,7.397750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633469,0.000000,11.398247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290528,0.000000,11.398247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<12.633469,0.000000,11.398247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.770688,0.000000,13.191206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.994741,0.000000,13.098400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<12.770688,0.000000,13.191206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.994741,0.000000,13.098400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437256,0.000000,13.098400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<12.994741,0.000000,13.098400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.259409,0.000000,18.508800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.495197,0.000000,18.744588>}
box{<0,0,-0.203200><0.333454,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.259409,0.000000,18.508800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.369675,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.668413,0.000000,19.630941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<13.369675,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.369675,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.627600,0.000000,19.507200>}
box{<0,0,-0.203200><4.257925,0.035000,0.203200> rotate<0,0.000000,0> translate<13.369675,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.495197,0.000000,18.744588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.803269,0.000000,18.872197>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-22.498805,0> translate<13.495197,0.000000,18.744588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.668413,0.000000,19.630941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.080056,0.000000,20.042584>}
box{<0,0,-0.203200><0.582152,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.668413,0.000000,19.630941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.803269,0.000000,18.872197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.542094,0.000000,18.872197>}
box{<0,0,-0.203200><2.738825,0.035000,0.203200> rotate<0,0.000000,0> translate<13.803269,0.000000,18.872197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.822984,0.000000,16.701597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.317191,0.000000,17.195800>}
box{<0,0,-0.203200><0.698911,0.035000,0.203200> rotate<0,-44.996849,0> translate<13.822984,0.000000,16.701597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.822984,0.000000,16.701597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.362256,0.000000,16.701597>}
box{<0,0,-0.203200><0.539272,0.035000,0.203200> rotate<0,0.000000,0> translate<13.822984,0.000000,16.701597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.951072,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.627600,0.000000,19.913600>}
box{<0,0,-0.203200><3.676528,0.035000,0.203200> rotate<0,0.000000,0> translate<13.951072,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.080056,0.000000,20.042584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.203797,0.000000,20.341322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<14.080056,0.000000,20.042584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.190188,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.476422,0.000000,17.068800>}
box{<0,0,-0.203200><2.286234,0.035000,0.203200> rotate<0,0.000000,0> translate<14.190188,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.194963,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.627600,0.000000,20.320000>}
box{<0,0,-0.203200><3.432638,0.035000,0.203200> rotate<0,0.000000,0> translate<14.194963,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.203797,0.000000,20.341322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.203797,0.000000,20.451138>}
box{<0,0,-0.203200><0.109816,0.035000,0.203200> rotate<0,90.000000,0> translate<14.203797,0.000000,20.451138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.203797,0.000000,20.451138>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.369741,0.000000,20.382400>}
box{<0,0,-0.203200><0.179617,0.035000,0.203200> rotate<0,22.498912,0> translate<14.203797,0.000000,20.451138> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290528,0.000000,7.397750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,8.569469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.290528,0.000000,7.397750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.290528,0.000000,11.398247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,10.226528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<14.290528,0.000000,11.398247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.309575,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,11.379200>}
box{<0,0,-0.203200><9.710825,0.035000,0.203200> rotate<0,0.000000,0> translate<14.309575,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.317191,0.000000,17.195800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.428400,0.000000,17.195800>}
box{<0,0,-0.203200><2.111209,0.035000,0.203200> rotate<0,0.000000,0> translate<14.317191,0.000000,17.195800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.362256,0.000000,16.701597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.365997,0.000000,16.700047>}
box{<0,0,-0.203200><0.004049,0.035000,0.203200> rotate<0,22.506128,0> translate<14.362256,0.000000,16.701597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.365997,0.000000,16.700047>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.369741,0.000000,16.701597>}
box{<0,0,-0.203200><0.004052,0.035000,0.203200> rotate<0,-22.489214,0> translate<14.365997,0.000000,16.700047> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.369741,0.000000,16.701597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.012256,0.000000,16.701597>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<14.369741,0.000000,16.701597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.369741,0.000000,20.382400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.012256,0.000000,20.382400>}
box{<0,0,-0.203200><0.642516,0.035000,0.203200> rotate<0,0.000000,0> translate<14.369741,0.000000,20.382400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.437256,0.000000,13.098400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.661309,0.000000,13.191206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<14.437256,0.000000,13.098400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.614378,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.082131,0.000000,7.721600>}
box{<0,0,-0.203200><8.467753,0.035000,0.203200> rotate<0,0.000000,0> translate<14.614378,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.661309,0.000000,13.191206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.832791,0.000000,13.362687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.661309,0.000000,13.191206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.715975,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,10.972800>}
box{<0,0,-0.203200><9.304425,0.035000,0.203200> rotate<0,0.000000,0> translate<14.715975,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.832791,0.000000,13.362687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.897041,0.000000,13.517806>}
box{<0,0,-0.203200><0.167898,0.035000,0.203200> rotate<0,-67.496267,0> translate<14.832791,0.000000,13.362687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.852884,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,13.411200>}
box{<0,0,-0.203200><9.167516,0.035000,0.203200> rotate<0,0.000000,0> translate<14.852884,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.897041,0.000000,13.517806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.938413,0.000000,13.534941>}
box{<0,0,-0.203200><0.044780,0.035000,0.203200> rotate<0,-22.495658,0> translate<14.897041,0.000000,13.517806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.913884,0.000000,34.442397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249966,0.000000,34.303187>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,22.498510,0> translate<14.913884,0.000000,34.442397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.938413,0.000000,13.534941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.167056,0.000000,13.763584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.938413,0.000000,13.534941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.012256,0.000000,16.701597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.236309,0.000000,16.608791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<15.012256,0.000000,16.701597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.012256,0.000000,20.382400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.236309,0.000000,20.475206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<15.012256,0.000000,20.382400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.020778,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.488531,0.000000,8.128000>}
box{<0,0,-0.203200><8.467753,0.035000,0.203200> rotate<0,0.000000,0> translate<15.020778,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.106888,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.346206,0.000000,16.662400>}
box{<0,0,-0.203200><3.239319,0.035000,0.203200> rotate<0,0.000000,0> translate<15.106888,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.122375,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,10.566400>}
box{<0,0,-0.203200><8.898025,0.035000,0.203200> rotate<0,0.000000,0> translate<15.122375,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.167056,0.000000,13.763584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.380056,0.000000,13.976584>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.167056,0.000000,13.763584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.221072,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.020400,0.000000,13.817600>}
box{<0,0,-0.203200><8.799328,0.035000,0.203200> rotate<0,0.000000,0> translate<15.221072,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.236309,0.000000,16.608791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.407791,0.000000,16.437309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<15.236309,0.000000,16.608791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.236309,0.000000,20.475206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.407791,0.000000,20.646688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.236309,0.000000,20.475206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.249966,0.000000,34.303187>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.777188,0.000000,32.775966>}
box{<0,0,-0.203200><2.159818,0.035000,0.203200> rotate<0,44.997030,0> translate<15.249966,0.000000,34.303187> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.380056,0.000000,13.976584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,14.275322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<15.380056,0.000000,13.976584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.407791,0.000000,16.437309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,16.213256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<15.407791,0.000000,16.437309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.407791,0.000000,20.646688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,20.870741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<15.407791,0.000000,20.646688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.415553,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.770600,0.000000,34.137600>}
box{<0,0,-0.203200><3.355047,0.035000,0.203200> rotate<0,0.000000,0> translate<15.415553,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.427178,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.894931,0.000000,8.534400>}
box{<0,0,-0.203200><8.467753,0.035000,0.203200> rotate<0,0.000000,0> translate<15.427178,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.440806,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.429484,0.000000,20.726400>}
box{<0,0,-0.203200><1.988678,0.035000,0.203200> rotate<0,0.000000,0> translate<15.440806,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,8.569469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,10.226528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<15.462247,0.000000,10.226528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.301331,0.000000,8.940800>}
box{<0,0,-0.203200><8.839084,0.035000,0.203200> rotate<0,0.000000,0> translate<15.462247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.212800,0.000000,9.347200>}
box{<0,0,-0.203200><10.750553,0.035000,0.203200> rotate<0,0.000000,0> translate<15.462247,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.270353,0.000000,9.753600>}
box{<0,0,-0.203200><10.808106,0.035000,0.203200> rotate<0,0.000000,0> translate<15.462247,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.462247,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.183894,0.000000,10.160000>}
box{<0,0,-0.203200><8.721647,0.035000,0.203200> rotate<0,0.000000,0> translate<15.462247,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.482538,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.224000>}
box{<0,0,-0.203200><8.633062,0.035000,0.203200> rotate<0,0.000000,0> translate<15.482538,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.482894,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.752606,0.000000,16.256000>}
box{<0,0,-0.203200><3.269712,0.035000,0.203200> rotate<0,0.000000,0> translate<15.482894,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,15.811397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,16.213256>}
box{<0,0,-0.203200><0.401859,0.035000,0.203200> rotate<0,90.000000,0> translate<15.500597,0.000000,16.213256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,15.811397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,15.803675>}
box{<0,0,-0.203200><0.008359,0.035000,0.203200> rotate<0,67.486080,0> translate<15.500597,0.000000,15.811397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,15.849600>}
box{<0,0,-0.203200><8.615003,0.035000,0.203200> rotate<0,0.000000,0> translate<15.500597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,20.870741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,21.272597>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,90.000000,0> translate<15.500597,0.000000,21.272597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.348200,0.000000,21.132800>}
box{<0,0,-0.203200><1.847603,0.035000,0.203200> rotate<0,0.000000,0> translate<15.500597,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.500597,0.000000,21.272597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.280322>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,-67.494278,0> translate<15.500597,0.000000,21.272597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,14.275322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,15.803675>}
box{<0,0,-0.203200><1.528353,0.035000,0.203200> rotate<0,90.000000,0> translate<15.503797,0.000000,15.803675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.630400>}
box{<0,0,-0.203200><8.611803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,15.036800>}
box{<0,0,-0.203200><8.611803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,15.443200>}
box{<0,0,-0.203200><8.611803,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.280322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,22.275800>}
box{<0,0,-0.203200><0.995478,0.035000,0.203200> rotate<0,90.000000,0> translate<15.503797,0.000000,22.275800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.348200,0.000000,21.539200>}
box{<0,0,-0.203200><1.844403,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.255006,0.000000,21.945600>}
box{<0,0,-0.203200><1.751209,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.503797,0.000000,22.275800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.924806,0.000000,22.275800>}
box{<0,0,-0.203200><1.421009,0.035000,0.203200> rotate<0,0.000000,0> translate<15.503797,0.000000,22.275800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.821953,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.770600,0.000000,33.731200>}
box{<0,0,-0.203200><2.948647,0.035000,0.203200> rotate<0,0.000000,0> translate<15.821953,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,2.733866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,2.276669>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<16.154400,0.000000,2.733866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,3.870131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,2.733866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.154400,0.000000,2.733866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,0.000000,3.870131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,4.327331>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.154400,0.000000,3.870131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.228353,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.770600,0.000000,33.324800>}
box{<0,0,-0.203200><2.542247,0.035000,0.203200> rotate<0,0.000000,0> translate<16.228353,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.428400,0.000000,17.184741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.521206,0.000000,16.960688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<16.428400,0.000000,17.184741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.428400,0.000000,17.195800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.428400,0.000000,17.184741>}
box{<0,0,-0.203200><0.011059,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.428400,0.000000,17.184741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.500669,0.000000,5.181600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,5.070669>}
box{<0,0,-0.203200><0.156880,0.035000,0.203200> rotate<0,44.997030,0> translate<16.500669,0.000000,5.181600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.500669,0.000000,7.010397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.957866,0.000000,7.467597>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.997226,0> translate<16.500669,0.000000,7.010397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.521206,0.000000,16.960688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692688,0.000000,16.789206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<16.521206,0.000000,16.960688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.542094,0.000000,18.872197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692688,0.000000,19.022791>}
box{<0,0,-0.203200><0.212972,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.542094,0.000000,18.872197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,1.850113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.750809,0.000000,1.514031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<16.611600,0.000000,1.850113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,2.276669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,1.850113>}
box{<0,0,-0.203200><0.426556,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.611600,0.000000,1.850113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,5.070669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.611600,0.000000,4.327331>}
box{<0,0,-0.203200><0.743337,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.611600,0.000000,4.327331> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.634753,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.770600,0.000000,32.918400>}
box{<0,0,-0.203200><2.135847,0.035000,0.203200> rotate<0,0.000000,0> translate<16.634753,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692688,0.000000,16.789206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916741,0.000000,16.696400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<16.692688,0.000000,16.789206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.692688,0.000000,19.022791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916741,0.000000,19.115597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<16.692688,0.000000,19.022791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.750809,0.000000,1.514031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.401247,0.000000,0.863597>}
box{<0,0,-0.203200><0.919855,0.035000,0.203200> rotate<0,44.996893,0> translate<16.750809,0.000000,1.514031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.777188,0.000000,32.775966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916397,0.000000,32.439884>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<16.777188,0.000000,32.775966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.886528,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.112825,0.000000,32.512000>}
box{<0,0,-0.203200><0.226297,0.035000,0.203200> rotate<0,0.000000,0> translate<16.886528,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916397,0.000000,32.315572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916397,0.000000,32.439884>}
box{<0,0,-0.203200><0.124312,0.035000,0.203200> rotate<0,90.000000,0> translate<16.916397,0.000000,32.439884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916397,0.000000,32.315572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.138219,0.000000,32.537397>}
box{<0,0,-0.203200><0.313706,0.035000,0.203200> rotate<0,-44.997434,0> translate<16.916397,0.000000,32.315572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916741,0.000000,16.696400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.312206,0.000000,16.696400>}
box{<0,0,-0.203200><1.395466,0.035000,0.203200> rotate<0,0.000000,0> translate<16.916741,0.000000,16.696400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.916741,0.000000,19.115597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.627600,0.000000,19.115597>}
box{<0,0,-0.203200><0.710859,0.035000,0.203200> rotate<0,0.000000,0> translate<16.916741,0.000000,19.115597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.924806,0.000000,22.275800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.348200,0.000000,21.852406>}
box{<0,0,-0.203200><0.598769,0.035000,0.203200> rotate<0,44.997030,0> translate<16.924806,0.000000,22.275800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.957866,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.094131,0.000000,7.467597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<16.957866,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.138219,0.000000,32.537397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.421778,0.000000,32.537397>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,0.000000,0> translate<17.138219,0.000000,32.537397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.348200,0.000000,20.922641>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.441006,0.000000,20.698588>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<17.348200,0.000000,20.922641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.348200,0.000000,21.852406>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.348200,0.000000,20.922641>}
box{<0,0,-0.203200><0.929766,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.348200,0.000000,20.922641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.441006,0.000000,20.698588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.612488,0.000000,20.527106>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<17.441006,0.000000,20.698588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.612488,0.000000,20.527106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.627600,0.000000,20.520847>}
box{<0,0,-0.203200><0.016357,0.035000,0.203200> rotate<0,22.497132,0> translate<17.612488,0.000000,20.527106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.627600,0.000000,20.520847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.627600,0.000000,19.115597>}
box{<0,0,-0.203200><1.405250,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.627600,0.000000,19.115597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.094131,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,6.664131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<18.094131,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.246528,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.885469,0.000000,7.315200>}
box{<0,0,-0.203200><3.638941,0.035000,0.203200> rotate<0,0.000000,0> translate<18.246528,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.312206,0.000000,16.696400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.817197,0.000000,16.191409>}
box{<0,0,-0.203200><0.714165,0.035000,0.203200> rotate<0,44.997030,0> translate<18.312206,0.000000,16.696400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.421778,0.000000,32.537397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049997,0.000000,31.909175>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,44.997173,0> translate<18.421778,0.000000,32.537397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,4.327331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,5.070669>}
box{<0,0,-0.203200><0.743337,0.035000,0.203200> rotate<0,90.000000,0> translate<18.440397,0.000000,5.070669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,4.327331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,3.870131>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<18.440397,0.000000,4.327331> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.834669,0.000000,4.470400>}
box{<0,0,-0.203200><3.394272,0.035000,0.203200> rotate<0,0.000000,0> translate<18.440397,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.885466,0.000000,4.876800>}
box{<0,0,-0.203200><3.445069,0.035000,0.203200> rotate<0,0.000000,0> translate<18.440397,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.440397,0.000000,5.070669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,5.527866>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<18.440397,0.000000,5.070669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.447175,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.144819,0.000000,32.512000>}
box{<0,0,-0.203200><0.697644,0.035000,0.203200> rotate<0,0.000000,0> translate<18.447175,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.507441,0.000000,2.343713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.666756,0.000000,2.184397>}
box{<0,0,-0.203200><0.225306,0.035000,0.203200> rotate<0,44.997030,0> translate<18.507441,0.000000,2.343713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.507441,0.000000,2.343713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897597,0.000000,2.733866>}
box{<0,0,-0.203200><0.551762,0.035000,0.203200> rotate<0,-44.996801,0> translate<18.507441,0.000000,2.343713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.602128,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.529866,0.000000,2.438400>}
box{<0,0,-0.203200><2.927737,0.035000,0.203200> rotate<0,0.000000,0> translate<18.602128,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.652928,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.479066,0.000000,5.283200>}
box{<0,0,-0.203200><2.826137,0.035000,0.203200> rotate<0,0.000000,0> translate<18.652928,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.652928,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.479069,0.000000,6.908800>}
box{<0,0,-0.203200><2.826141,0.035000,0.203200> rotate<0,0.000000,0> translate<18.652928,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.666756,0.000000,2.184397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.783872,0.000000,2.184397>}
box{<0,0,-0.203200><3.117116,0.035000,0.203200> rotate<0,0.000000,0> translate<18.666756,0.000000,2.184397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.703728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.428269,0.000000,4.064000>}
box{<0,0,-0.203200><2.724541,0.035000,0.203200> rotate<0,0.000000,0> translate<18.703728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.770600,0.000000,32.886219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.398822,0.000000,32.258000>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,44.996888,0> translate<18.770600,0.000000,32.886219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.770600,0.000000,34.169778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.770600,0.000000,32.886219>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.770600,0.000000,32.886219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.770600,0.000000,34.169778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.678219,0.000000,35.077397>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.770600,0.000000,34.169778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.817197,0.000000,16.191409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.125269,0.000000,16.063800>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,22.498805,0> translate<18.817197,0.000000,16.191409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.853575,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.246422,0.000000,32.105600>}
box{<0,0,-0.203200><0.392847,0.035000,0.203200> rotate<0,0.000000,0> translate<18.853575,0.000000,32.105600> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.415131,0.000000,35.077397>}
box{<0,0,-0.203200><2.047505,0.035000,0.203200> rotate<0,44.996968,0> translate<18.967325,0.000000,36.525200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.049997,0.000000,31.909175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.398822,0.000000,32.258000>}
box{<0,0,-0.203200><0.493313,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.049997,0.000000,31.909175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.125269,0.000000,16.063800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.566097,0.000000,16.063800>}
box{<0,0,-0.203200><1.440828,0.035000,0.203200> rotate<0,0.000000,0> translate<19.125269,0.000000,16.063800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456397,0.000000,19.115597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456397,0.000000,20.434300>}
box{<0,0,-0.203200><1.318703,0.035000,0.203200> rotate<0,90.000000,0> translate<19.456397,0.000000,20.434300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456397,0.000000,19.115597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.659256,0.000000,19.115597>}
box{<0,0,-0.203200><0.202859,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456397,0.000000,19.115597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.109641,0.000000,19.507200>}
box{<0,0,-0.203200><1.653244,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456397,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.703241,0.000000,19.913600>}
box{<0,0,-0.203200><1.246844,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456397,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.296841,0.000000,20.320000>}
box{<0,0,-0.203200><0.840444,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456397,0.000000,20.434300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.182541,0.000000,20.434300>}
box{<0,0,-0.203200><0.726144,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456397,0.000000,20.434300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.465675,0.000000,38.150797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.764413,0.000000,38.027056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<19.465675,0.000000,38.150797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.659256,0.000000,19.115597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.883309,0.000000,19.022791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<19.659256,0.000000,19.115597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.678219,0.000000,35.077397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.415131,0.000000,35.077397>}
box{<0,0,-0.203200><0.736913,0.035000,0.203200> rotate<0,0.000000,0> translate<19.678219,0.000000,35.077397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.694981,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.516041,0.000000,19.100800>}
box{<0,0,-0.203200><1.821059,0.035000,0.203200> rotate<0,0.000000,0> translate<19.694981,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.764413,0.000000,38.027056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.993056,0.000000,37.798413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<19.764413,0.000000,38.027056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.883309,0.000000,19.022791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.054791,0.000000,18.851309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<19.883309,0.000000,19.022791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.993056,0.000000,37.798413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.287872,0.000000,34.503597>}
box{<0,0,-0.203200><4.659573,0.035000,0.203200> rotate<0,44.997030,0> translate<19.993056,0.000000,37.798413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.996269,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,37.795200>}
box{<0,0,-0.203200><41.546531,0.035000,0.203200> rotate<0,0.000000,0> translate<19.996269,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.054791,0.000000,18.851309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.147597,0.000000,18.627256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<20.054791,0.000000,18.851309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.119788,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.922441,0.000000,18.694400>}
box{<0,0,-0.203200><1.802653,0.035000,0.203200> rotate<0,0.000000,0> translate<20.119788,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.147597,0.000000,17.740197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.147597,0.000000,18.627256>}
box{<0,0,-0.203200><0.887059,0.035000,0.203200> rotate<0,90.000000,0> translate<20.147597,0.000000,18.627256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.147597,0.000000,17.740197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.566097,0.000000,17.740197>}
box{<0,0,-0.203200><0.418500,0.035000,0.203200> rotate<0,0.000000,0> translate<20.147597,0.000000,17.740197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.147597,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.796325,0.000000,17.881600>}
box{<0,0,-0.203200><0.648728,0.035000,0.203200> rotate<0,0.000000,0> translate<20.147597,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.147597,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.328841,0.000000,18.288000>}
box{<0,0,-0.203200><2.181244,0.035000,0.203200> rotate<0,0.000000,0> translate<20.147597,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.182541,0.000000,20.434300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,16.501241>}
box{<0,0,-0.203200><5.562186,0.035000,0.203200> rotate<0,44.997030,0> translate<20.182541,0.000000,20.434300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.402669,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.549991,0.000000,37.388800>}
box{<0,0,-0.203200><41.147322,0.035000,0.203200> rotate<0,0.000000,0> translate<20.402669,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.566097,0.000000,16.063800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.644687,0.000000,15.985206>}
box{<0,0,-0.203200><0.111146,0.035000,0.203200> rotate<0,44.998169,0> translate<20.566097,0.000000,16.063800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.566097,0.000000,17.740197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.644687,0.000000,17.818791>}
box{<0,0,-0.203200><0.111146,0.035000,0.203200> rotate<0,-44.998169,0> translate<20.566097,0.000000,17.740197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.644687,0.000000,15.985206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.868741,0.000000,15.892400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<20.644687,0.000000,15.985206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.644687,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.868741,0.000000,17.911597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<20.644687,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.809069,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.718325,0.000000,36.982400>}
box{<0,0,-0.203200><40.909256,0.035000,0.203200> rotate<0,0.000000,0> translate<20.809069,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.868741,0.000000,15.892400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.311256,0.000000,15.892400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<20.868741,0.000000,15.892400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.868741,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.311256,0.000000,17.911597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<20.868741,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.215469,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.781672,0.000000,36.576000>}
box{<0,0,-0.203200><28.566203,0.035000,0.203200> rotate<0,0.000000,0> translate<21.215469,0.000000,36.576000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.241175,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,31.629778>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<21.241175,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.241175,0.000000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,32.886219>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,-44.996888,0> translate<21.241175,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.393575,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.728294,0.000000,32.105600>}
box{<0,0,-0.203200><1.334719,0.035000,0.203200> rotate<0,0.000000,0> translate<21.393575,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.495175,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.592400,0.000000,32.512000>}
box{<0,0,-0.203200><1.097225,0.035000,0.203200> rotate<0,0.000000,0> translate<21.495175,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.621869,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.356334,0.000000,36.169600>}
box{<0,0,-0.203200><20.734466,0.035000,0.203200> rotate<0,0.000000,0> translate<21.621869,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.799975,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,31.699200>}
box{<0,0,-0.203200><20.492425,0.035000,0.203200> rotate<0,0.000000,0> translate<21.799975,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,30.588069>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,31.629778>}
box{<0,0,-0.203200><1.041709,0.035000,0.203200> rotate<0,90.000000,0> translate<21.869397,0.000000,31.629778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,30.588069>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.434669,0.000000,30.022797>}
box{<0,0,-0.203200><0.799415,0.035000,0.203200> rotate<0,44.997030,0> translate<21.869397,0.000000,30.588069> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,30.886400>}
box{<0,0,-0.203200><20.423003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.869397,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,31.292800>}
box{<0,0,-0.203200><20.423003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.869397,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,32.886219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,33.623131>}
box{<0,0,-0.203200><0.736912,0.035000,0.203200> rotate<0,90.000000,0> translate<21.869397,0.000000,33.623131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.574125,0.000000,32.918400>}
box{<0,0,-0.203200><0.704728,0.035000,0.203200> rotate<0,0.000000,0> translate<21.869397,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.167725,0.000000,33.324800>}
box{<0,0,-0.203200><0.298328,0.035000,0.203200> rotate<0,0.000000,0> translate<21.869397,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.869397,0.000000,33.623131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.592400,0.000000,32.900125>}
box{<0,0,-0.203200><1.022483,0.035000,0.203200> rotate<0,44.997154,0> translate<21.869397,0.000000,33.623131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.977466,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.023775,0.000000,30.480000>}
box{<0,0,-0.203200><1.046309,0.035000,0.203200> rotate<0,0.000000,0> translate<21.977466,0.000000,30.480000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.828128,0.000000,7.467597>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,0.000000,0> translate<22.037866,0.000000,7.467597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.311256,0.000000,15.892400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.535309,0.000000,15.985206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<22.311256,0.000000,15.892400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.311256,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.535309,0.000000,17.818791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<22.311256,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.383675,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.735241,0.000000,17.881600>}
box{<0,0,-0.203200><0.351566,0.035000,0.203200> rotate<0,0.000000,0> translate<22.383675,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.383866,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.616569,0.000000,30.073600>}
box{<0,0,-0.203200><0.232703,0.035000,0.203200> rotate<0,0.000000,0> translate<22.383866,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.434669,0.000000,30.022797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.595525,0.000000,30.022797>}
box{<0,0,-0.203200><0.160856,0.035000,0.203200> rotate<0,0.000000,0> translate<22.434669,0.000000,30.022797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.434669,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,35.356800>}
box{<0,0,-0.203200><19.857731,0.035000,0.203200> rotate<0,0.000000,0> translate<22.434669,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.535309,0.000000,15.985206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.706791,0.000000,16.156688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.535309,0.000000,15.985206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.535309,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.706791,0.000000,17.647309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<22.535309,0.000000,17.818791> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.706791,0.000000,16.156688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.799597,0.000000,16.380741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<22.706791,0.000000,16.156688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.706791,0.000000,17.647309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.799597,0.000000,17.423256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<22.706791,0.000000,17.647309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.747925,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,16.256000>}
box{<0,0,-0.203200><1.367675,0.035000,0.203200> rotate<0,0.000000,0> translate<22.747925,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.778081,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.141641,0.000000,17.475200>}
box{<0,0,-0.203200><0.363559,0.035000,0.203200> rotate<0,0.000000,0> translate<22.778081,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.799597,0.000000,16.380741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.799597,0.000000,17.423256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<22.799597,0.000000,17.423256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.799597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.954441,0.000000,16.662400>}
box{<0,0,-0.203200><1.154844,0.035000,0.203200> rotate<0,0.000000,0> translate<22.799597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.799597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.548041,0.000000,17.068800>}
box{<0,0,-0.203200><0.748444,0.035000,0.203200> rotate<0,0.000000,0> translate<22.799597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.828125,0.000000,4.673597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.878931,0.000000,4.724400>}
box{<0,0,-0.203200><0.071849,0.035000,0.203200> rotate<0,-44.995268,0> translate<22.828125,0.000000,4.673597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.828128,0.000000,7.467597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.463584,0.000000,9.103056>}
box{<0,0,-0.203200><2.312887,0.035000,0.203200> rotate<0,-44.997085,0> translate<22.828128,0.000000,7.467597> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.247469,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,34.544000>}
box{<0,0,-0.203200><19.044931,0.035000,0.203200> rotate<0,0.000000,0> translate<23.247469,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.287872,0.000000,34.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.323256,0.000000,34.503597>}
box{<0,0,-0.203200><4.035384,0.035000,0.203200> rotate<0,0.000000,0> translate<23.287872,0.000000,34.503597> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.183897,0.000000,12.191997>}
box{<0,0,-0.203200><0.099969,0.035000,0.203200> rotate<0,-44.995764,0> translate<24.113206,0.000000,12.121309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,12.262688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.183897,0.000000,12.191997>}
box{<0,0,-0.203200><0.099972,0.035000,0.203200> rotate<0,44.997030,0> translate<24.113206,0.000000,12.262688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.113206,0.000000,14.153309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.155700>}
box{<0,0,-0.203200><0.003383,0.035000,0.203200> rotate<0,-44.959609,0> translate<24.113206,0.000000,14.153309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,16.501241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.115600,0.000000,14.155700>}
box{<0,0,-0.203200><2.345541,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.115600,0.000000,14.155700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.284688,0.000000,10.059206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.508741,0.000000,9.966400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<24.284688,0.000000,10.059206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.463584,0.000000,9.103056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.762322,0.000000,9.226797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<24.463584,0.000000,9.103056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.508741,0.000000,9.966400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.551256,0.000000,9.966400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<24.508741,0.000000,9.966400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.762322,0.000000,9.226797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.212800,0.000000,9.226797>}
box{<0,0,-0.203200><1.450478,0.035000,0.203200> rotate<0,0.000000,0> translate<24.762322,0.000000,9.226797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.551256,0.000000,9.966400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.635269,0.000000,10.001200>}
box{<0,0,-0.203200><0.090935,0.035000,0.203200> rotate<0,-22.499029,0> translate<25.551256,0.000000,9.966400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.635269,0.000000,10.001200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.468100,0.000000,10.001200>}
box{<0,0,-0.203200><0.832831,0.035000,0.203200> rotate<0,0.000000,0> translate<25.635269,0.000000,10.001200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.212800,0.000000,9.614656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.212800,0.000000,9.226797>}
box{<0,0,-0.203200><0.387859,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.212800,0.000000,9.226797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.212800,0.000000,9.614656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.305606,0.000000,9.838709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<26.212800,0.000000,9.614656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.305606,0.000000,9.838709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.468100,0.000000,10.001200>}
box{<0,0,-0.203200><0.229799,0.035000,0.203200> rotate<0,-44.996479,0> translate<26.305606,0.000000,9.838709> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.428516,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.437709,0.000000,10.010191>}
box{<0,0,-0.203200><0.009952,0.035000,0.203200> rotate<0,22.504893,0> translate<28.428516,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.428516,0.000000,10.014000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.437709,0.000000,10.017806>}
box{<0,0,-0.203200><0.009951,0.035000,0.203200> rotate<0,-22.488270,0> translate<28.428516,0.000000,10.014000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.437709,0.000000,10.010191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.609191,0.000000,9.838709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<28.437709,0.000000,10.010191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.437709,0.000000,10.017806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.609191,0.000000,10.189288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.437709,0.000000,10.017806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.579903,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,10.160000>}
box{<0,0,-0.203200><6.218097,0.035000,0.203200> rotate<0,0.000000,0> translate<28.579903,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.609191,0.000000,9.838709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,9.614656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<28.609191,0.000000,9.838709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.609191,0.000000,10.189288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,10.413341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.609191,0.000000,10.189288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.644447,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,9.753600>}
box{<0,0,-0.203200><6.153553,0.035000,0.203200> rotate<0,0.000000,0> translate<28.644447,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,9.320697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,9.614656>}
box{<0,0,-0.203200><0.293959,0.035000,0.203200> rotate<0,90.000000,0> translate<28.701997,0.000000,9.614656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,9.320697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.748806,0.000000,9.433709>}
box{<0,0,-0.203200><0.122323,0.035000,0.203200> rotate<0,-67.496383,0> translate<28.701997,0.000000,9.320697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.712975,0.000000,9.347200>}
box{<0,0,-0.203200><0.010978,0.035000,0.203200> rotate<0,0.000000,0> translate<28.701997,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,10.413341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,11.550531>}
box{<0,0,-0.203200><1.137191,0.035000,0.203200> rotate<0,90.000000,0> translate<28.701997,0.000000,11.550531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.860856,0.000000,10.566400>}
box{<0,0,-0.203200><6.158859,0.035000,0.203200> rotate<0,0.000000,0> translate<28.701997,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.279725,0.000000,10.972800>}
box{<0,0,-0.203200><0.577728,0.035000,0.203200> rotate<0,0.000000,0> translate<28.701997,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.873325,0.000000,11.379200>}
box{<0,0,-0.203200><0.171328,0.035000,0.203200> rotate<0,0.000000,0> translate<28.701997,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.701997,0.000000,11.550531>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.327584,0.000000,10.924941>}
box{<0,0,-0.203200><0.884717,0.035000,0.203200> rotate<0,44.997173,0> translate<28.701997,0.000000,11.550531> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.748806,0.000000,9.433709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.920288,0.000000,9.605191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.748806,0.000000,9.433709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.920288,0.000000,9.605191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.144341,0.000000,9.697997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<28.920288,0.000000,9.605191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.133675,0.000000,30.006797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.432413,0.000000,29.883056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<29.133675,0.000000,30.006797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.144341,0.000000,9.697997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.291656,0.000000,9.697997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<29.144341,0.000000,9.697997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.327584,0.000000,10.924941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.626322,0.000000,10.801200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<29.327584,0.000000,10.924941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.432413,0.000000,29.883056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.464409,0.000000,26.851056>}
box{<0,0,-0.203200><4.287893,0.035000,0.203200> rotate<0,44.997060,0> translate<29.432413,0.000000,29.883056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.626322,0.000000,10.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.053300,0.000000,10.801200>}
box{<0,0,-0.203200><5.426978,0.035000,0.203200> rotate<0,0.000000,0> translate<29.626322,0.000000,10.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.648269,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,29.667200>}
box{<0,0,-0.203200><12.644131,0.035000,0.203200> rotate<0,0.000000,0> translate<29.648269,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.054669,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,29.260800>}
box{<0,0,-0.203200><12.237731,0.035000,0.203200> rotate<0,0.000000,0> translate<30.054669,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.291656,0.000000,9.697997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.515709,0.000000,9.605191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<30.291656,0.000000,9.697997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.461069,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,28.854400>}
box{<0,0,-0.203200><11.831331,0.035000,0.203200> rotate<0,0.000000,0> translate<30.461069,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.515709,0.000000,9.605191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.687191,0.000000,9.433709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<30.515709,0.000000,9.605191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.562797,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.562797,0.000000,7.713894>}
box{<0,0,-0.203200><0.347897,0.035000,0.203200> rotate<0,90.000000,0> translate<30.562797,0.000000,7.713894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.562797,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.196000,0.000000,7.365997>}
box{<0,0,-0.203200><0.633203,0.035000,0.203200> rotate<0,0.000000,0> translate<30.562797,0.000000,7.365997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.562797,0.000000,7.713894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.687191,0.000000,7.838288>}
box{<0,0,-0.203200><0.175919,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.562797,0.000000,7.713894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.570503,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.196000,0.000000,7.721600>}
box{<0,0,-0.203200><0.625497,0.035000,0.203200> rotate<0,0.000000,0> translate<30.570503,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.687191,0.000000,7.838288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.779997,0.000000,8.062341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<30.687191,0.000000,7.838288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.687191,0.000000,9.433709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.779997,0.000000,9.209656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<30.687191,0.000000,9.433709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.723025,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.932894,0.000000,9.347200>}
box{<0,0,-0.203200><4.209869,0.035000,0.203200> rotate<0,0.000000,0> translate<30.723025,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.779997,0.000000,8.062341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.779997,0.000000,9.209656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<30.779997,0.000000,9.209656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.779997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.196000,0.000000,8.128000>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<30.779997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.779997,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.231931,0.000000,8.534400>}
box{<0,0,-0.203200><0.451934,0.035000,0.203200> rotate<0,0.000000,0> translate<30.779997,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.779997,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.850253,0.000000,8.940800>}
box{<0,0,-0.203200><4.070256,0.035000,0.203200> rotate<0,0.000000,0> translate<30.779997,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.867469,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,28.448000>}
box{<0,0,-0.203200><11.424931,0.035000,0.203200> rotate<0,0.000000,0> translate<30.867469,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.196000,0.000000,8.447656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.196000,0.000000,7.365997>}
box{<0,0,-0.203200><1.081659,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.196000,0.000000,7.365997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.196000,0.000000,8.447656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.288806,0.000000,8.671709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<31.196000,0.000000,8.447656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.273869,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.303316,0.000000,28.041600>}
box{<0,0,-0.203200><11.029447,0.035000,0.203200> rotate<0,0.000000,0> translate<31.273869,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.288806,0.000000,8.671709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.460287,0.000000,8.843191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.288806,0.000000,8.671709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,15.951197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,16.718000>}
box{<0,0,-0.203200><0.766803,0.035000,0.203200> rotate<0,90.000000,0> translate<31.362797,0.000000,16.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,15.951197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.950656,0.000000,15.951197>}
box{<0,0,-0.203200><3.587859,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,15.951197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,16.256000>}
box{<0,0,-0.203200><3.719603,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.229800,0.000000,16.662400>}
box{<0,0,-0.203200><3.867003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.362797,0.000000,16.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.323656,0.000000,16.718000>}
box{<0,0,-0.203200><0.960859,0.035000,0.203200> rotate<0,0.000000,0> translate<31.362797,0.000000,16.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.460287,0.000000,8.843191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.684341,0.000000,8.935997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<31.460287,0.000000,8.843191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.680269,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,27.635200>}
box{<0,0,-0.203200><10.612131,0.035000,0.203200> rotate<0,0.000000,0> translate<31.680269,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.684341,0.000000,8.935997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.831656,0.000000,8.935997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<31.684341,0.000000,8.935997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.086669,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,27.228800>}
box{<0,0,-0.203200><10.205731,0.035000,0.203200> rotate<0,0.000000,0> translate<32.086669,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.323656,0.000000,16.718000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.547709,0.000000,16.810806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<32.323656,0.000000,16.718000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.464409,0.000000,26.851056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.464413,0.000000,26.851056>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<32.464409,0.000000,26.851056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.464413,0.000000,26.851056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.693056,0.000000,26.622413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<32.464413,0.000000,26.851056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.493069,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.822400>}
box{<0,0,-0.203200><9.799331,0.035000,0.203200> rotate<0,0.000000,0> translate<32.493069,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.547709,0.000000,16.810806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.719191,0.000000,16.982288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.547709,0.000000,16.810806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.693056,0.000000,26.622413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,26.323675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<32.693056,0.000000,26.622413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.719191,0.000000,16.982288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.811997,0.000000,17.206341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<32.719191,0.000000,16.982288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.755025,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.229800,0.000000,17.068800>}
box{<0,0,-0.203200><2.474775,0.035000,0.203200> rotate<0,0.000000,0> translate<32.755025,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.778556,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.416000>}
box{<0,0,-0.203200><9.513844,0.035000,0.203200> rotate<0,0.000000,0> translate<32.778556,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.811997,0.000000,17.206341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.811997,0.000000,17.860734>}
box{<0,0,-0.203200><0.654394,0.035000,0.203200> rotate<0,90.000000,0> translate<32.811997,0.000000,17.860734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.811997,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.174163,0.000000,17.475200>}
box{<0,0,-0.203200><2.362166,0.035000,0.203200> rotate<0,0.000000,0> translate<32.811997,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.811997,0.000000,17.860734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,17.872322>}
box{<0,0,-0.203200><0.012542,0.035000,0.203200> rotate<0,-67.494278,0> translate<32.811997,0.000000,17.860734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,17.872322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,26.323675>}
box{<0,0,-0.203200><8.451353,0.035000,0.203200> rotate<0,90.000000,0> translate<32.816797,0.000000,26.323675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,17.881600>}
box{<0,0,-0.203200><2.265603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,18.288000>}
box{<0,0,-0.203200><2.265603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.206297,0.000000,18.694400>}
box{<0,0,-0.203200><2.389500,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.605331,0.000000,19.100800>}
box{<0,0,-0.203200><10.788534,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.011731,0.000000,19.507200>}
box{<0,0,-0.203200><11.194934,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.710244,0.000000,19.913600>}
box{<0,0,-0.203200><9.893447,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.314244,0.000000,20.320000>}
box{<0,0,-0.203200><9.497447,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,20.726400>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,21.132800>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.923894,0.000000,21.539200>}
box{<0,0,-0.203200><6.107097,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.816000,0.000000,21.945600>}
box{<0,0,-0.203200><5.999203,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.816000,0.000000,22.352000>}
box{<0,0,-0.203200><5.999203,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.816000,0.000000,22.758400>}
box{<0,0,-0.203200><5.999203,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.923897,0.000000,23.164800>}
box{<0,0,-0.203200><6.107100,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.947728,0.000000,23.571200>}
box{<0,0,-0.203200><7.130931,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,23.977600>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.384000>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.790400>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,25.196800>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,25.603200>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,26.009600>}
box{<0,0,-0.203200><9.475603,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.831656,0.000000,8.935997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.055709,0.000000,8.843191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<32.831656,0.000000,8.935997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.055709,0.000000,8.843191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.227191,0.000000,8.671709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<33.055709,0.000000,8.843191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.227191,0.000000,8.671709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,8.447656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<33.227191,0.000000,8.671709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.284069,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,8.534400>}
box{<0,0,-0.203200><1.513931,0.035000,0.203200> rotate<0,0.000000,0> translate<33.284069,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,8.447656>}
box{<0,0,-0.203200><1.081659,0.035000,0.203200> rotate<0,90.000000,0> translate<33.319997,0.000000,8.447656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.349341,0.000000,7.365997>}
box{<0,0,-0.203200><0.029344,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,7.365997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,7.721600>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.319997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,8.128000>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<33.319997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.349341,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.149341,0.000000,7.365997>}
box{<0,0,-0.203200><0.800000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.349341,0.000000,7.365997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.149341,0.000000,7.365997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,0.000000,7.365997>}
box{<0,0,-0.203200><0.648659,0.035000,0.203200> rotate<0,0.000000,0> translate<34.149341,0.000000,7.365997> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.950656,0.000000,15.951197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,15.896625>}
box{<0,0,-0.203200><0.142599,0.035000,0.203200> rotate<0,22.499193,0> translate<34.950656,0.000000,15.951197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.062288,0.000000,9.210191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.071484,0.000000,9.213997>}
box{<0,0,-0.203200><0.009953,0.035000,0.203200> rotate<0,-22.481390,0> translate<35.062288,0.000000,9.210191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.062288,0.000000,9.217806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.071484,0.000000,9.213997>}
box{<0,0,-0.203200><0.009955,0.035000,0.203200> rotate<0,22.498008,0> translate<35.062288,0.000000,9.217806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,16.339256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,15.896625>}
box{<0,0,-0.203200><0.442631,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.082400,0.000000,15.896625> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,16.339256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.175206,0.000000,16.563309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<35.082400,0.000000,16.339256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,17.696741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.175206,0.000000,17.472687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<35.082400,0.000000,17.696741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,18.439256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,17.696741>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.082400,0.000000,17.696741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.082400,0.000000,18.439256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.175206,0.000000,18.663309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<35.082400,0.000000,18.439256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.175206,0.000000,16.563309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.229800,0.000000,16.617903>}
box{<0,0,-0.203200><0.077207,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.175206,0.000000,16.563309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.175206,0.000000,17.472687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.282400,0.000000,17.365494>}
box{<0,0,-0.203200><0.151595,0.035000,0.203200> rotate<0,44.997030,0> translate<35.175206,0.000000,17.472687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.175206,0.000000,18.663309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.346688,0.000000,18.834791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.175206,0.000000,18.663309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.229800,0.000000,17.130275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.229800,0.000000,16.617903>}
box{<0,0,-0.203200><0.512372,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.229800,0.000000,16.617903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.229800,0.000000,17.130275>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.282400,0.000000,17.257259>}
box{<0,0,-0.203200><0.137447,0.035000,0.203200> rotate<0,-67.495026,0> translate<35.229800,0.000000,17.130275> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.282400,0.000000,17.365494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.282400,0.000000,17.257259>}
box{<0,0,-0.203200><0.108234,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.282400,0.000000,17.257259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.346688,0.000000,18.834791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.570741,0.000000,18.927597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.346688,0.000000,18.834791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.570741,0.000000,18.927597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.613256,0.000000,18.927597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.570741,0.000000,18.927597> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,16.848597>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<38.279200,0.000000,16.856322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.279200,0.000000,17.179675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.279200,0.000000,16.856322>}
box{<0,0,-0.203200><0.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.279200,0.000000,16.856322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.279200,0.000000,17.179675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,17.187400>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,-67.494278,0> translate<38.279200,0.000000,17.179675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,16.848597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,16.757534>}
box{<0,0,-0.203200><0.091062,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.282400,0.000000,16.757534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,17.278462>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.282400,0.000000,17.187400>}
box{<0,0,-0.203200><0.091062,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.282400,0.000000,17.187400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,9.347200>}
box{<0,0,-0.203200><8.723078,0.035000,0.203200> rotate<0,0.000000,0> translate<38.806672,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.816000,0.000000,21.778341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.908806,0.000000,21.554288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.816000,0.000000,21.778341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.816000,0.000000,22.925656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.816000,0.000000,21.778341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.816000,0.000000,21.778341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.816000,0.000000,22.925656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.908806,0.000000,23.149709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.816000,0.000000,22.925656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.908806,0.000000,21.554288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.080288,0.000000,21.382806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<38.908806,0.000000,21.554288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.908806,0.000000,23.149709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.080288,0.000000,23.321191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.908806,0.000000,23.149709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.917872,0.000000,9.458400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.499256,0.000000,9.458400>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,0.000000,0> translate<38.917872,0.000000,9.458400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.991675,0.000000,9.226797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.290413,0.000000,9.103056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<38.991675,0.000000,9.226797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.080288,0.000000,21.382806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.304341,0.000000,21.290000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<39.080288,0.000000,21.382806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.080288,0.000000,23.321191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.304341,0.000000,23.413997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<39.080288,0.000000,23.321191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.290413,0.000000,9.103056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.925872,0.000000,7.467597>}
box{<0,0,-0.203200><2.312889,0.035000,0.203200> rotate<0,44.997030,0> translate<39.290413,0.000000,9.103056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.304341,0.000000,21.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.451656,0.000000,21.290000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<39.304341,0.000000,21.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.304341,0.000000,23.413997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790525,0.000000,23.413997>}
box{<0,0,-0.203200><0.486184,0.035000,0.203200> rotate<0,0.000000,0> translate<39.304341,0.000000,23.413997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.452669,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,8.940800>}
box{<0,0,-0.203200><8.077081,0.035000,0.203200> rotate<0,0.000000,0> translate<39.452669,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.499256,0.000000,9.458400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.723309,0.000000,9.551206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<39.499256,0.000000,9.458400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.613256,0.000000,18.927597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.837309,0.000000,18.834791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<39.613256,0.000000,18.927597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.723309,0.000000,9.551206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,9.722688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.723309,0.000000,9.551206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790525,0.000000,23.413997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.179584,0.000000,23.803056>}
box{<0,0,-0.203200><0.550213,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.790525,0.000000,23.413997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.717300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.904697>}
box{<0,0,-0.203200><0.187397,0.035000,0.203200> rotate<0,90.000000,0> translate<39.790797,0.000000,11.904697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.717300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,11.613309>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<39.790797,0.000000,11.717300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,11.785600>}
box{<0,0,-0.203200><25.131603,0.035000,0.203200> rotate<0,0.000000,0> translate<39.790797,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790797,0.000000,11.904697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.894791,0.000000,12.008688>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<39.790797,0.000000,11.904697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.837309,0.000000,18.834791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.008791,0.000000,18.663309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<39.837309,0.000000,18.834791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.859069,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.564819,0.000000,8.534400>}
box{<0,0,-0.203200><7.705750,0.035000,0.203200> rotate<0,0.000000,0> translate<39.859069,0.000000,8.534400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,9.753600>}
box{<0,0,-0.203200><7.622156,0.035000,0.203200> rotate<0,0.000000,0> translate<39.907594,0.000000,9.753600> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,12.192000>}
box{<0,0,-0.203200><24.951681,0.035000,0.203200> rotate<0,0.000000,0> translate<39.970719,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.977700,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.198931,0.000000,18.694400>}
box{<0,0,-0.203200><3.221231,0.035000,0.203200> rotate<0,0.000000,0> translate<39.977700,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,9.946741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,11.389256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<39.987597,0.000000,11.389256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,10.160000>}
box{<0,0,-0.203200><7.542153,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.869622,0.000000,10.566400>}
box{<0,0,-0.203200><7.882025,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.276022,0.000000,10.972800>}
box{<0,0,-0.203200><8.288425,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.682422,0.000000,11.379200>}
box{<0,0,-0.203200><8.694825,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,12.232741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,13.184125>}
box{<0,0,-0.203200><0.951384,0.035000,0.203200> rotate<0,90.000000,0> translate<39.987597,0.000000,13.184125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.178259,0.000000,12.598400>}
box{<0,0,-0.203200><21.190663,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.987597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.771859,0.000000,13.004800>}
box{<0,0,-0.203200><20.784263,0.035000,0.203200> rotate<0,0.000000,0> translate<39.987597,0.000000,13.004800> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.179584,0.000000,23.803056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.478322,0.000000,23.926797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<40.179584,0.000000,23.803056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.214672,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,13.411200>}
box{<0,0,-0.203200><20.262728,0.035000,0.203200> rotate<0,0.000000,0> translate<40.214672,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.265469,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.971219,0.000000,8.128000>}
box{<0,0,-0.203200><7.705750,0.035000,0.203200> rotate<0,0.000000,0> translate<40.265469,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.451656,0.000000,21.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.675709,0.000000,21.382806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<40.451656,0.000000,21.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.478322,0.000000,23.926797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,23.926797>}
box{<0,0,-0.203200><1.814078,0.035000,0.203200> rotate<0,0.000000,0> translate<40.478322,0.000000,23.926797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.621072,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.636294,0.000000,13.817600>}
box{<0,0,-0.203200><9.015222,0.035000,0.203200> rotate<0,0.000000,0> translate<40.621072,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.671869,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.377619,0.000000,7.721600>}
box{<0,0,-0.203200><7.705750,0.035000,0.203200> rotate<0,0.000000,0> translate<40.671869,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.675709,0.000000,21.382806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.847191,0.000000,21.554288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.675709,0.000000,21.382806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.832103,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,21.539200>}
box{<0,0,-0.203200><1.460297,0.035000,0.203200> rotate<0,0.000000,0> translate<40.832103,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.847191,0.000000,21.554288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.939997,0.000000,21.778341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<40.847191,0.000000,21.554288> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.939997,0.000000,21.778341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.939997,0.000000,22.264525>}
box{<0,0,-0.203200><0.486184,0.035000,0.203200> rotate<0,90.000000,0> translate<40.939997,0.000000,22.264525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.939997,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,21.945600>}
box{<0,0,-0.203200><1.352403,0.035000,0.203200> rotate<0,0.000000,0> translate<40.939997,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.939997,0.000000,22.264525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.976672,0.000000,22.301200>}
box{<0,0,-0.203200><0.051866,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.939997,0.000000,22.264525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.976672,0.000000,22.301200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.322034,0.000000,22.301200>}
box{<0,0,-0.203200><1.345363,0.035000,0.203200> rotate<0,0.000000,0> translate<40.976672,0.000000,22.301200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.027472,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,14.224000>}
box{<0,0,-0.203200><8.434928,0.035000,0.203200> rotate<0,0.000000,0> translate<41.027472,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.433872,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,14.630400>}
box{<0,0,-0.203200><8.028528,0.035000,0.203200> rotate<0,0.000000,0> translate<41.433872,0.000000,14.630400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,15.036800>}
box{<0,0,-0.203200><7.622128,0.035000,0.203200> rotate<0,0.000000,0> translate<41.840272,0.000000,15.036800> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,15.443200>}
box{<0,0,-0.203200><7.215728,0.035000,0.203200> rotate<0,0.000000,0> translate<42.246672,0.000000,15.443200> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,24.015256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.292400,0.000000,23.926797>}
box{<0,0,-0.203200><0.088459,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.292400,0.000000,23.926797> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.322034,0.000000,22.301200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.366441,0.000000,22.193997>}
box{<0,0,-0.203200><0.116036,0.035000,0.203200> rotate<0,67.494970,0> translate<42.322034,0.000000,22.301200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.325728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.050272,0.000000,4.064000>}
box{<0,0,-0.203200><2.724544,0.035000,0.203200> rotate<0,0.000000,0> translate<42.325728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.385206,0.000000,20.148688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.556688,0.000000,19.977206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<42.385206,0.000000,20.148688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.385206,0.000000,36.239309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.556688,0.000000,36.410791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.385206,0.000000,36.239309> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.653072,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,15.849600>}
box{<0,0,-0.203200><6.809328,0.035000,0.203200> rotate<0,0.000000,0> translate<42.653072,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.780741,0.000000,19.884400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.420931,0.000000,19.884400>}
box{<0,0,-0.203200><3.640191,0.035000,0.203200> rotate<0,0.000000,0> translate<42.780741,0.000000,19.884400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.780741,0.000000,36.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.023256,0.000000,36.503597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<42.780741,0.000000,36.503597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.059472,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,16.256000>}
box{<0,0,-0.203200><6.402928,0.035000,0.203200> rotate<0,0.000000,0> translate<43.059472,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.465872,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.462400,0.000000,16.662400>}
box{<0,0,-0.203200><5.996528,0.035000,0.203200> rotate<0,0.000000,0> translate<43.465872,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.872272,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.546713,0.000000,17.068800>}
box{<0,0,-0.203200><5.674441,0.035000,0.203200> rotate<0,0.000000,0> translate<43.872272,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.014941,0.000000,19.510413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.243584,0.000000,19.739056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.014941,0.000000,19.510413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.243584,0.000000,19.739056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.542322,0.000000,19.862797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<44.243584,0.000000,19.739056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.278672,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,17.475200>}
box{<0,0,-0.203200><6.608528,0.035000,0.203200> rotate<0,0.000000,0> translate<44.278672,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.542322,0.000000,19.862797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.399325,0.000000,19.862797>}
box{<0,0,-0.203200><1.857003,0.035000,0.203200> rotate<0,0.000000,0> translate<44.542322,0.000000,19.862797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.579241,0.000000,2.184397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.992556,0.000000,2.597713>}
box{<0,0,-0.203200><0.584517,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.579241,0.000000,2.184397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.685072,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,17.881600>}
box{<0,0,-0.203200><6.202128,0.035000,0.203200> rotate<0,0.000000,0> translate<44.685072,0.000000,17.881600> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,7.315200>}
box{<0,0,-0.203200><17.973872,0.035000,0.203200> rotate<0,0.000000,0> translate<46.948528,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.003188,0.000000,2.022031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.084806,0.000000,2.219075>}
box{<0,0,-0.203200><0.213279,0.035000,0.203200> rotate<0,-67.495407,0> translate<47.003188,0.000000,2.022031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.007316,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,2.032000>}
box{<0,0,-0.203200><14.535484,0.035000,0.203200> rotate<0,0.000000,0> translate<47.007316,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.020316,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,18.288000>}
box{<0,0,-0.203200><3.866884,0.035000,0.203200> rotate<0,0.000000,0> translate<47.020316,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.023256,0.000000,36.503597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.247309,0.000000,36.410791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<47.023256,0.000000,36.503597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.084806,0.000000,2.219075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.599597,0.000000,2.733866>}
box{<0,0,-0.203200><0.728024,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.084806,0.000000,2.219075> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.304131,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.542800,0.000000,2.438400>}
box{<0,0,-0.203200><14.238669,0.035000,0.203200> rotate<0,0.000000,0> translate<47.304131,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.354928,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,5.283200>}
box{<0,0,-0.203200><17.567472,0.035000,0.203200> rotate<0,0.000000,0> translate<47.354928,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.354928,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,6.908800>}
box{<0,0,-0.203200><17.567472,0.035000,0.203200> rotate<0,0.000000,0> translate<47.354928,0.000000,6.908800> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,8.569469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701469,0.000000,7.397750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<47.529750,0.000000,8.569469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,10.226528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,8.569469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.529750,0.000000,8.569469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529750,0.000000,10.226528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701469,0.000000,11.398247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<47.529750,0.000000,10.226528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.529872,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,18.694400>}
box{<0,0,-0.203200><3.357328,0.035000,0.203200> rotate<0,0.000000,0> translate<47.529872,0.000000,18.694400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,6.502400>}
box{<0,0,-0.203200><17.322803,0.035000,0.203200> rotate<0,0.000000,0> translate<47.599597,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.936272,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,19.100800>}
box{<0,0,-0.203200><2.950928,0.035000,0.203200> rotate<0,0.000000,0> translate<47.936272,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.342672,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.728316,0.000000,19.507200>}
box{<0,0,-0.203200><2.385644,0.035000,0.203200> rotate<0,0.000000,0> translate<48.342672,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701469,0.000000,7.397750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.358528,0.000000,7.397750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<48.701469,0.000000,7.397750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701469,0.000000,11.398247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.358528,0.000000,11.398247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<48.701469,0.000000,11.398247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.749072,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,19.913600>}
box{<0,0,-0.203200><1.941328,0.035000,0.203200> rotate<0,0.000000,0> translate<48.749072,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.155472,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,20.320000>}
box{<0,0,-0.203200><1.534928,0.035000,0.203200> rotate<0,0.000000,0> translate<49.155472,0.000000,20.320000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,20.726400>}
box{<0,0,-0.203200><1.128528,0.035000,0.203200> rotate<0,0.000000,0> translate<49.561872,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.423256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.006797>}
box{<0,0,-0.203200><0.416459,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.718400,0.000000,36.006797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.718400,0.000000,36.423256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.811206,0.000000,36.647309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<49.718400,0.000000,36.423256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.726688,0.000000,13.727206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.950741,0.000000,13.634400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<49.726688,0.000000,13.727206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.726688,0.000000,17.260791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.950741,0.000000,17.353597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.726688,0.000000,17.260791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.811206,0.000000,36.647309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.982688,0.000000,36.818791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.811206,0.000000,36.647309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.950741,0.000000,13.634400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393256,0.000000,13.634400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<49.950741,0.000000,13.634400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.950741,0.000000,17.353597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,17.353597>}
box{<0,0,-0.203200><0.936459,0.035000,0.203200> rotate<0,0.000000,0> translate<49.950741,0.000000,17.353597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.968272,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.728322,0.000000,21.132800>}
box{<0,0,-0.203200><0.760050,0.035000,0.203200> rotate<0,0.000000,0> translate<49.968272,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.982688,0.000000,36.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.206741,0.000000,36.911597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.982688,0.000000,36.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.206741,0.000000,36.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649256,0.000000,36.911597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<50.206741,0.000000,36.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.358528,0.000000,7.397750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,8.569469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.358528,0.000000,7.397750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.358528,0.000000,11.398247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,10.226528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<50.358528,0.000000,11.398247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.374672,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.539200>}
box{<0,0,-0.203200><0.512528,0.035000,0.203200> rotate<0,0.000000,0> translate<50.374672,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.377575,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.794422,0.000000,11.379200>}
box{<0,0,-0.203200><5.416847,0.035000,0.203200> rotate<0,0.000000,0> translate<50.377575,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.531562,0.000000,21.696091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.645309,0.000000,21.743206>}
box{<0,0,-0.203200><0.123119,0.035000,0.203200> rotate<0,-22.498570,0> translate<50.531562,0.000000,21.696091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.645309,0.000000,21.743206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,21.897897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.645309,0.000000,21.743206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.682378,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.489619,0.000000,7.721600>}
box{<0,0,-0.203200><4.807241,0.035000,0.203200> rotate<0,0.000000,0> translate<50.682378,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,19.598741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783206,0.000000,19.374688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<50.690400,0.000000,19.598741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,21.041256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,19.598741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.690400,0.000000,19.598741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.690400,0.000000,21.041256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783206,0.000000,21.265309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.690400,0.000000,21.041256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783206,0.000000,19.374688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,19.270694>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,44.997030,0> translate<50.783206,0.000000,19.374688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783206,0.000000,21.265309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.369303>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.783206,0.000000,21.265309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.783975,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.388022,0.000000,10.972800>}
box{<0,0,-0.203200><4.604047,0.035000,0.203200> rotate<0,0.000000,0> translate<50.783975,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,21.897897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.810694>}
box{<0,0,-0.203200><0.123322,0.035000,0.203200> rotate<0,44.998057,0> translate<50.800000,0.000000,21.897897> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,19.270694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,17.353597>}
box{<0,0,-0.203200><1.917097,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.887200,0.000000,17.353597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.810694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.887200,0.000000,21.369303>}
box{<0,0,-0.203200><0.441391,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.887200,0.000000,21.369303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.954688,0.000000,23.976791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.178741,0.000000,24.069597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<50.954688,0.000000,23.976791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.088778,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.083219,0.000000,8.128000>}
box{<0,0,-0.203200><3.994441,0.035000,0.203200> rotate<0,0.000000,0> translate<51.088778,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.178741,0.000000,24.069597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.221256,0.000000,24.069597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<51.178741,0.000000,24.069597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.187472,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.830528,0.000000,24.384000>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<51.187472,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.190375,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.981622,0.000000,10.566400>}
box{<0,0,-0.203200><3.791247,0.035000,0.203200> rotate<0,0.000000,0> translate<51.190375,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.393256,0.000000,13.634400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.617309,0.000000,13.727206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<51.393256,0.000000,13.634400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.495178,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.676819,0.000000,8.534400>}
box{<0,0,-0.203200><3.181641,0.035000,0.203200> rotate<0,0.000000,0> translate<51.495178,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,8.569469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,10.226528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<51.530247,0.000000,10.226528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,8.940800>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.530247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,9.347200>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.530247,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,9.753600>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.530247,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.530247,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,10.160000>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<51.530247,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.593872,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.236928,0.000000,24.790400>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<51.593872,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.617309,0.000000,13.727206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.788791,0.000000,13.898688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.617309,0.000000,13.727206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649256,0.000000,36.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.873309,0.000000,36.818791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<51.649256,0.000000,36.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.707703,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,13.817600>}
box{<0,0,-0.203200><8.769697,0.035000,0.203200> rotate<0,0.000000,0> translate<51.707703,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.788791,0.000000,13.898688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,14.122741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<51.788791,0.000000,13.898688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.873309,0.000000,36.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.044791,0.000000,36.647309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<51.873309,0.000000,36.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,14.122741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,15.554128>}
box{<0,0,-0.203200><1.431387,0.035000,0.203200> rotate<0,90.000000,0> translate<51.881597,0.000000,15.554128> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.881597,0.000000,15.554128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.389056,0.000000,16.061584>}
box{<0,0,-0.203200><0.717654,0.035000,0.203200> rotate<0,-44.996854,0> translate<51.881597,0.000000,15.554128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.000272,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.643328,0.000000,25.196800>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<52.000272,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.044791,0.000000,36.647309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.423256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<52.044791,0.000000,36.647309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.074328,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.896888,0.000000,36.576000>}
box{<0,0,-0.203200><9.822559,0.035000,0.203200> rotate<0,0.000000,0> translate<52.074328,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,34.991872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.423256>}
box{<0,0,-0.203200><1.431384,0.035000,0.203200> rotate<0,90.000000,0> translate<52.137597,0.000000,36.423256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,34.991872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.875056,0.000000,34.254413>}
box{<0,0,-0.203200><1.042925,0.035000,0.203200> rotate<0,44.997030,0> translate<52.137597,0.000000,34.991872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,35.356800>}
box{<0,0,-0.203200><12.784803,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.004175,0.000000,35.763200>}
box{<0,0,-0.203200><10.866578,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.137597,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.303288,0.000000,36.169600>}
box{<0,0,-0.203200><10.165691,0.035000,0.203200> rotate<0,0.000000,0> translate<52.137597,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.177069,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.784294,0.000000,15.849600>}
box{<0,0,-0.203200><0.607225,0.035000,0.203200> rotate<0,0.000000,0> translate<52.177069,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.179069,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,34.950400>}
box{<0,0,-0.203200><12.743331,0.035000,0.203200> rotate<0,0.000000,0> translate<52.179069,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.221256,0.000000,24.069597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.232844,0.000000,24.064797>}
box{<0,0,-0.203200><0.012542,0.035000,0.203200> rotate<0,22.499783,0> translate<52.221256,0.000000,24.069597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.232844,0.000000,24.064797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.798694,0.000000,24.064797>}
box{<0,0,-0.203200><0.565850,0.035000,0.203200> rotate<0,0.000000,0> translate<52.232844,0.000000,24.064797> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,19.270694>}
box{<0,0,-0.203200><2.910372,0.035000,0.203200> rotate<0,90.000000,0> translate<52.512797,0.000000,19.270694> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,18.694400>}
box{<0,0,-0.203200><0.522403,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,19.100800>}
box{<0,0,-0.203200><0.522403,0.035000,0.203200> rotate<0,0.000000,0> translate<52.512797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.512797,0.000000,19.270694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.616791,0.000000,19.374688>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.512797,0.000000,19.270694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.585469,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,34.544000>}
box{<0,0,-0.203200><12.336931,0.035000,0.203200> rotate<0,0.000000,0> translate<52.585469,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.616791,0.000000,19.374688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,19.598741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<52.616791,0.000000,19.374688> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.671678,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,19.507200>}
box{<0,0,-0.203200><0.363522,0.035000,0.203200> rotate<0,0.000000,0> translate<52.671678,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,19.598741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,20.758862>}
box{<0,0,-0.203200><1.160122,0.035000,0.203200> rotate<0,90.000000,0> translate<52.709597,0.000000,20.758862> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,19.913600>}
box{<0,0,-0.203200><0.325603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.709597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,20.320000>}
box{<0,0,-0.203200><0.325603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.709597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.723041,0.000000,20.726400>}
box{<0,0,-0.203200><0.013444,0.035000,0.203200> rotate<0,0.000000,0> translate<52.709597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.709597,0.000000,20.758862>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.731206,0.000000,20.706688>}
box{<0,0,-0.203200><0.056473,0.035000,0.203200> rotate<0,67.497624,0> translate<52.709597,0.000000,20.758862> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.798694,0.000000,24.064797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.902688,0.000000,24.168791>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.798694,0.000000,24.064797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.813072,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.456128,0.000000,26.009600>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<52.813072,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.875056,0.000000,26.071584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,26.370322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<52.875056,0.000000,26.071584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.875056,0.000000,34.254413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,33.955675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<52.875056,0.000000,34.254413> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.923444,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,34.137600>}
box{<0,0,-0.203200><11.998956,0.035000,0.203200> rotate<0,0.000000,0> translate<52.923444,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,26.370322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,30.700697>}
box{<0,0,-0.203200><4.330375,0.035000,0.203200> rotate<0,90.000000,0> translate<52.998797,0.000000,30.700697> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.771866,0.000000,27.635200>}
box{<0,0,-0.203200><7.773069,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.178266,0.000000,28.041600>}
box{<0,0,-0.203200><8.179469,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,28.448000>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,28.854400>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.540419,0.000000,29.260800>}
box{<0,0,-0.203200><2.541622,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.134019,0.000000,29.667200>}
box{<0,0,-0.203200><2.135222,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.727619,0.000000,30.073600>}
box{<0,0,-0.203200><1.728822,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,30.480000>}
box{<0,0,-0.203200><1.642953,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,30.700697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102791,0.000000,30.804688>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<52.998797,0.000000,30.700697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,32.799300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,33.955675>}
box{<0,0,-0.203200><1.156375,0.035000,0.203200> rotate<0,90.000000,0> translate<52.998797,0.000000,33.955675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,32.799300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102791,0.000000,32.695309>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<52.998797,0.000000,32.799300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.743622,0.000000,32.918400>}
box{<0,0,-0.203200><2.744825,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,33.324800>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.998797,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,33.731200>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.998797,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,20.480319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.035200,0.000000,17.619678>}
box{<0,0,-0.203200><2.860641,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.035200,0.000000,17.619678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102791,0.000000,30.804688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,31.028741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<53.102791,0.000000,30.804688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102791,0.000000,32.695309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,32.471256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<53.102791,0.000000,32.695309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.126741,0.000000,13.838400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.569256,0.000000,13.838400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<53.126741,0.000000,13.838400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.126741,0.000000,24.261597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.708125,0.000000,24.261597>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,0.000000,0> translate<53.126741,0.000000,24.261597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.136634,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,30.886400>}
box{<0,0,-0.203200><1.505116,0.035000,0.203200> rotate<0,0.000000,0> translate<53.136634,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.178722,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.337222,0.000000,32.512000>}
box{<0,0,-0.203200><2.158500,0.035000,0.203200> rotate<0,0.000000,0> translate<53.178722,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,31.028741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,32.471256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<53.195597,0.000000,32.471256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,31.292800>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<53.195597,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,31.699200>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<53.195597,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.195597,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.930822,0.000000,32.105600>}
box{<0,0,-0.203200><1.735225,0.035000,0.203200> rotate<0,0.000000,0> translate<53.195597,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.708125,0.000000,24.261597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.626941,0.000000,27.180413>}
box{<0,0,-0.203200><4.127829,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.708125,0.000000,24.261597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.569256,0.000000,13.838400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.793309,0.000000,13.931206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<54.569256,0.000000,13.838400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,8.569469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,7.397750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<54.641750,0.000000,8.569469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,10.226528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,8.569469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.641750,0.000000,8.569469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,10.226528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,11.398247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.641750,0.000000,10.226528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,30.159469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,28.987750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<54.641750,0.000000,30.159469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,31.816528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,30.159469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.641750,0.000000,30.159469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.641750,0.000000,31.816528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,32.988247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.641750,0.000000,31.816528> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,7.397750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,7.397750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813469,0.000000,7.397750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,11.398247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,11.398247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813469,0.000000,11.398247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,28.987750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,28.987750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813469,0.000000,28.987750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813469,0.000000,32.988247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,32.988247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813469,0.000000,32.988247> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.669463,0.000000,27.532797>}
box{<0,0,-0.203200><3.515141,0.035000,0.203200> rotate<0,0.000000,0> translate<57.154322,0.000000,27.532797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.348672,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.973459,0.000000,25.603200>}
box{<0,0,-0.203200><3.624788,0.035000,0.203200> rotate<0,0.000000,0> translate<57.348672,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,7.397750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,8.569469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.470528,0.000000,7.397750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,11.398247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,10.226528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<57.470528,0.000000,11.398247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,28.987750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,30.159469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.470528,0.000000,28.987750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.470528,0.000000,32.988247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,31.816528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<57.470528,0.000000,32.988247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.489575,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,11.379200>}
box{<0,0,-0.203200><7.432825,0.035000,0.203200> rotate<0,0.000000,0> translate<57.489575,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.540375,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,32.918400>}
box{<0,0,-0.203200><7.382025,0.035000,0.203200> rotate<0,0.000000,0> translate<57.540375,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.652672,0.000000,25.907200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.669463,0.000000,25.907200>}
box{<0,0,-0.203200><3.016791,0.035000,0.203200> rotate<0,0.000000,0> translate<57.652672,0.000000,25.907200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.743578,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,29.260800>}
box{<0,0,-0.203200><7.178822,0.035000,0.203200> rotate<0,0.000000,0> translate<57.743578,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.794378,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,7.721600>}
box{<0,0,-0.203200><7.128022,0.035000,0.203200> rotate<0,0.000000,0> translate<57.794378,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.895975,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,10.972800>}
box{<0,0,-0.203200><7.026425,0.035000,0.203200> rotate<0,0.000000,0> translate<57.895975,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.946775,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,32.512000>}
box{<0,0,-0.203200><6.975625,0.035000,0.203200> rotate<0,0.000000,0> translate<57.946775,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.149978,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,29.667200>}
box{<0,0,-0.203200><6.772422,0.035000,0.203200> rotate<0,0.000000,0> translate<58.149978,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.200778,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,8.128000>}
box{<0,0,-0.203200><6.721622,0.035000,0.203200> rotate<0,0.000000,0> translate<58.200778,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.302375,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,10.566400>}
box{<0,0,-0.203200><6.620025,0.035000,0.203200> rotate<0,0.000000,0> translate<58.302375,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.353175,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,32.105600>}
box{<0,0,-0.203200><6.569225,0.035000,0.203200> rotate<0,0.000000,0> translate<58.353175,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.556378,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,30.073600>}
box{<0,0,-0.203200><6.366022,0.035000,0.203200> rotate<0,0.000000,0> translate<58.556378,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.607178,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,8.534400>}
box{<0,0,-0.203200><6.315222,0.035000,0.203200> rotate<0,0.000000,0> translate<58.607178,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,8.569469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,10.226528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<58.642247,0.000000,10.226528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,8.940800>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,9.347200>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,9.753600>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,10.160000>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,30.159469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,31.816528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<58.642247,0.000000,31.816528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,30.480000>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,30.886400>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,31.292800>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.642247,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.922400,0.000000,31.699200>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<58.642247,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,13.299259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,12.421400>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<60.477400,0.000000,13.299259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,14.035200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.477400,0.000000,13.299259>}
box{<0,0,-0.203200><0.735941,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.477400,0.000000,13.299259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.669463,0.000000,25.907200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,25.221400>}
box{<0,0,-0.203200><0.969865,0.035000,0.203200> rotate<0,44.997161,0> translate<60.669463,0.000000,25.907200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.669463,0.000000,27.532797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.355259,0.000000,28.218597>}
box{<0,0,-0.203200><0.969865,0.035000,0.203200> rotate<0,-44.997161,0> translate<60.669463,0.000000,27.532797> }
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
cylinder{<56.642000,0.038000,30.988000><56.642000,-1.538000,30.988000>0.927100}
cylinder{<49.530000,0.038000,30.988000><49.530000,-1.538000,30.988000>0.927100}
cylinder{<6.350000,0.038000,30.988000><6.350000,-1.538000,30.988000>0.927100}
cylinder{<13.462000,0.038000,30.988000><13.462000,-1.538000,30.988000>0.927100}
cylinder{<6.350000,0.038000,9.398000><6.350000,-1.538000,9.398000>0.927100}
cylinder{<13.462000,0.038000,9.398000><13.462000,-1.538000,9.398000>0.927100}
cylinder{<56.642000,0.038000,9.398000><56.642000,-1.538000,9.398000>0.927100}
cylinder{<49.530000,0.038000,9.398000><49.530000,-1.538000,9.398000>0.927100}
cylinder{<61.976000,0.038000,26.720000><61.976000,-1.538000,26.720000>0.508000}
cylinder{<61.976000,0.038000,13.920000><61.976000,-1.538000,13.920000>0.508000}
cylinder{<17.526000,0.038000,3.302000><17.526000,-1.538000,3.302000>0.508000}
cylinder{<20.066000,0.038000,3.302000><20.066000,-1.538000,3.302000>0.508000}
cylinder{<22.606000,0.038000,3.302000><22.606000,-1.538000,3.302000>0.508000}
cylinder{<25.146000,0.038000,3.302000><25.146000,-1.538000,3.302000>0.508000}
cylinder{<20.320000,0.038000,28.448000><20.320000,-1.538000,28.448000>0.508000}
cylinder{<17.780000,0.038000,28.448000><17.780000,-1.538000,28.448000>0.508000}
cylinder{<20.320000,0.038000,30.988000><20.320000,-1.538000,30.988000>0.508000}
cylinder{<17.780000,0.038000,30.988000><17.780000,-1.538000,30.988000>0.508000}
cylinder{<20.320000,0.038000,33.528000><20.320000,-1.538000,33.528000>0.508000}
cylinder{<17.780000,0.038000,33.528000><17.780000,-1.538000,33.528000>0.508000}
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
//Holes(fast)/Vias
cylinder{<27.178000,0.038000,6.096000><27.178000,-1.538000,6.096000>0.300000 }
cylinder{<29.718000,0.038000,8.636000><29.718000,-1.538000,8.636000>0.300000 }
cylinder{<36.322000,0.038000,6.096000><36.322000,-1.538000,6.096000>0.300000 }
cylinder{<39.878000,0.038000,22.352000><39.878000,-1.538000,22.352000>0.300000 }
cylinder{<28.442000,0.038000,19.310000><28.442000,-1.538000,19.310000>0.300000 }
cylinder{<28.448000,0.038000,27.178000><28.448000,-1.538000,27.178000>0.300000 }
cylinder{<29.496000,0.038000,21.050000><29.496000,-1.538000,21.050000>0.300000 }
cylinder{<29.718000,0.038000,25.146000><29.718000,-1.538000,25.146000>0.300000 }
cylinder{<32.258000,0.038000,7.874000><32.258000,-1.538000,7.874000>0.300000 }
cylinder{<31.750000,0.038000,17.780000><31.750000,-1.538000,17.780000>0.300000 }
cylinder{<27.432000,0.038000,17.780000><27.432000,-1.538000,17.780000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.880100,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.880100,0.000000,25.429841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.880100,0.000000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.880100,0.000000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.125841,0.000000,25.184100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<5.880100,0.000000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.125841,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.371584,0.000000,25.429841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<6.125841,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.371584,0.000000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.371584,0.000000,25.921328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<6.371584,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.628516,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.628516,0.000000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<6.628516,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.628516,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.997128,0.000000,25.921328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<6.628516,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.997128,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.120000,0.000000,25.798456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<6.997128,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.120000,0.000000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.120000,0.000000,25.675584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.120000,0.000000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.120000,0.000000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.997128,0.000000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.997128,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.997128,0.000000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.120000,0.000000,25.429841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<6.997128,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.120000,0.000000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.120000,0.000000,25.306969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.120000,0.000000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.120000,0.000000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.997128,0.000000,25.184100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<6.997128,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.997128,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.628516,0.000000,25.184100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<6.628516,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.628516,0.000000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.997128,0.000000,25.552713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<6.628516,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.376931,0.000000,25.061231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.868416,0.000000,25.061231>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<7.376931,0.000000,25.061231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.616831,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.125347,0.000000,25.921328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<8.125347,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.125347,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.125347,0.000000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.125347,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.125347,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.616831,0.000000,25.184100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<8.125347,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.125347,0.000000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.371087,0.000000,25.552713>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<8.125347,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.873762,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.873762,0.000000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<8.873762,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.873762,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.365247,0.000000,25.184100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<8.873762,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.365247,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.365247,0.000000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<9.365247,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.370594,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.370594,0.000000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.370594,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.368481,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.368481,0.000000,25.429841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.368481,0.000000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.368481,0.000000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.614222,0.000000,25.184100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<11.368481,0.000000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.614222,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.859966,0.000000,25.429841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<11.614222,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.859966,0.000000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.859966,0.000000,25.921328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<11.859966,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.116897,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.116897,0.000000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<12.116897,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.116897,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.485509,0.000000,25.921328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<12.116897,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.485509,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.608381,0.000000,25.798456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.485509,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.608381,0.000000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.608381,0.000000,25.675584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.608381,0.000000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.608381,0.000000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.485509,0.000000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<12.485509,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.485509,0.000000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.608381,0.000000,25.429841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.485509,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.608381,0.000000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.608381,0.000000,25.306969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<12.608381,0.000000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.608381,0.000000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.485509,0.000000,25.184100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<12.485509,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.485509,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.116897,0.000000,25.184100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<12.116897,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.116897,0.000000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.485509,0.000000,25.552713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<12.116897,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.865312,0.000000,25.061231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.356797,0.000000,25.061231>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<12.865312,0.000000,25.061231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.613728,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.613728,0.000000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.613728,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.613728,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.982341,0.000000,25.184100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<13.613728,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.982341,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.105213,0.000000,25.306969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<13.982341,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.105213,0.000000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.105213,0.000000,25.798456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<14.105213,0.000000,25.798456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.105213,0.000000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.982341,0.000000,25.921328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.982341,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.982341,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.613728,0.000000,25.921328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<13.613728,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.362144,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.607884,0.000000,25.184100>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<14.362144,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.485012,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.485012,0.000000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<14.485012,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.362144,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.607884,0.000000,25.921328>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<14.362144,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.352572,0.000000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.229700,0.000000,25.921328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.229700,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.229700,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.983956,0.000000,25.921328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.983956,0.000000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.983956,0.000000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.861088,0.000000,25.798456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<14.861088,0.000000,25.798456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.861088,0.000000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.861088,0.000000,25.675584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.861088,0.000000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.861088,0.000000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.983956,0.000000,25.552713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<14.861088,0.000000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.983956,0.000000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.229700,0.000000,25.552713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.983956,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.229700,0.000000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.352572,0.000000,25.429841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<15.229700,0.000000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.352572,0.000000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.352572,0.000000,25.306969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.352572,0.000000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.352572,0.000000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.229700,0.000000,25.184100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<15.229700,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.229700,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.983956,0.000000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.983956,0.000000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.983956,0.000000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.861088,0.000000,25.306969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<14.861088,0.000000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.564100,0.000000,20.587328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.564100,0.000000,20.095841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.564100,0.000000,20.095841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.564100,0.000000,20.095841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.809841,0.000000,19.850100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<17.564100,0.000000,20.095841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.809841,0.000000,19.850100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.055584,0.000000,20.095841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<17.809841,0.000000,19.850100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.055584,0.000000,20.095841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.055584,0.000000,20.587328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<18.055584,0.000000,20.587328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.312516,0.000000,19.850100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.312516,0.000000,20.587328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.312516,0.000000,20.587328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.312516,0.000000,20.587328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.681128,0.000000,20.587328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<18.312516,0.000000,20.587328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.681128,0.000000,20.587328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.804000,0.000000,20.464456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.681128,0.000000,20.587328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.804000,0.000000,20.464456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.804000,0.000000,20.341584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.804000,0.000000,20.341584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.804000,0.000000,20.341584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.681128,0.000000,20.218713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.681128,0.000000,20.218713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.681128,0.000000,20.218713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.804000,0.000000,20.095841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.681128,0.000000,20.218713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.804000,0.000000,20.095841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.804000,0.000000,19.972969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.804000,0.000000,19.972969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.804000,0.000000,19.972969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.681128,0.000000,19.850100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<18.681128,0.000000,19.850100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.681128,0.000000,19.850100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.312516,0.000000,19.850100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<18.312516,0.000000,19.850100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.312516,0.000000,20.218713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.681128,0.000000,20.218713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<18.312516,0.000000,20.218713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.060931,0.000000,19.727231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.552416,0.000000,19.727231>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<19.060931,0.000000,19.727231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.300831,0.000000,20.587328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.809347,0.000000,20.587328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<19.809347,0.000000,20.587328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.809347,0.000000,20.587328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.809347,0.000000,19.850100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.809347,0.000000,19.850100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.809347,0.000000,19.850100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.300831,0.000000,19.850100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<19.809347,0.000000,19.850100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.809347,0.000000,20.218713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.055088,0.000000,20.218713>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<19.809347,0.000000,20.218713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.557763,0.000000,19.850100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.557763,0.000000,20.587328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<20.557763,0.000000,20.587328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.557763,0.000000,20.587328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.049247,0.000000,19.850100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<20.557763,0.000000,20.587328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.049247,0.000000,19.850100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.049247,0.000000,20.587328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<21.049247,0.000000,20.587328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.278100,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.769584,0.000000,1.168713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<15.278100,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523841,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.523841,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.523841,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.026516,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.149384,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<16.026516,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.149384,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.395128,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.149384,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.395128,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.395128,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.518000,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.395128,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.395128,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.395128,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.272256,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<16.272256,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.395128,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.395128,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.518000,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.518000,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.395128,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<16.395128,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.395128,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.149384,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.149384,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.149384,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.026516,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<16.026516,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.774931,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.774931,0.000000,1.045841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.774931,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.774931,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.020672,0.000000,0.800100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<16.774931,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.020672,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.045841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<17.020672,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.266416,0.000000,1.537328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<17.266416,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.523347,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.646216,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<17.523347,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.646216,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.891959,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.646216,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.891959,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.014831,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.891959,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.014831,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.014831,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.014831,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.014831,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.891959,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<17.891959,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.891959,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.769088,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<17.769088,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.891959,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.014831,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.891959,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.014831,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.014831,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.014831,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.014831,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.891959,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<17.891959,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.891959,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.646216,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.646216,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.646216,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.523347,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<17.523347,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.388791,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<19.388791,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.388791,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.143047,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<19.143047,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.143047,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<19.020178,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.020178,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.020178,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.143047,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<19.020178,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.143047,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.388791,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<19.143047,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.388791,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<19.388791,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<19.511662,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.511662,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.265919,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<19.265919,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.768594,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.768594,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<19.768594,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.260078,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<20.260078,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.517009,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.517009,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.517009,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.517009,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.885622,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<20.517009,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.885622,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.008494,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<20.885622,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.008494,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.008494,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<21.008494,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.008494,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.885622,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<20.885622,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.885622,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.517009,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<20.517009,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<22.382453,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.136709,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<22.136709,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.136709,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<22.013841,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.013841,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.136709,0.000000,1.168713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<22.013841,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.136709,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<22.136709,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<22.382453,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.505325,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.505325,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<22.382453,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.382453,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.136709,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<22.136709,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.136709,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.013841,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<22.013841,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.762256,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.762256,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.762256,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.762256,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.130869,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<22.762256,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.130869,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.253741,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<23.130869,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.253741,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.253741,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<23.253741,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.253741,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.130869,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<23.130869,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.130869,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.762256,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<22.762256,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.510672,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.510672,0.000000,1.291584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<23.510672,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.510672,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.756412,0.000000,1.537328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<23.510672,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.756412,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.002156,0.000000,1.291584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<23.756412,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.002156,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.002156,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.002156,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.510672,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.002156,0.000000,1.168713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<23.510672,0.000000,1.168713> }
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
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.007503,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.007503,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.007503,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.130372,0.000000,1.168713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<25.007503,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.130372,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.376116,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<25.130372,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.376116,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.498988,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<25.376116,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.498988,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.498988,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.498988,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.498988,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.376116,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<25.376116,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.376116,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.130372,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<25.130372,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.130372,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.007503,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<25.007503,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.247403,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.124531,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<26.124531,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.124531,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.878788,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<25.878788,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.878788,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.755919,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<25.755919,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.755919,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.755919,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.755919,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.755919,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.878788,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<25.755919,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.878788,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.124531,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<25.878788,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.124531,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.247403,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<26.124531,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.504334,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.504334,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<26.504334,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.504334,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.995819,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<26.504334,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.532100,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.023584,0.000000,8.280712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<15.532100,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.777841,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.777841,0.000000,8.034969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.777841,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.280516,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.403384,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<16.280516,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.403384,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.649128,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.403384,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.649128,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.649128,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.772000,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.649128,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.649128,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.649128,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.526256,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<16.526256,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.649128,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.649128,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.772000,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.772000,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.649128,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<16.649128,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.649128,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.403384,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.403384,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.403384,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.280516,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<16.280516,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.028931,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.028931,0.000000,8.157841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.028931,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.028931,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.274672,0.000000,7.912100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<17.028931,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.274672,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.157841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<17.274672,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.520416,0.000000,8.649328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<17.520416,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.777347,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.900216,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<17.777347,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.900216,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.145959,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.900216,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.145959,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.268831,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.145959,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.268831,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.268831,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.268831,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.268831,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.145959,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.145959,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.145959,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.023088,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<18.023088,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.145959,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.268831,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<18.145959,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.268831,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.268831,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.268831,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.268831,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.145959,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<18.145959,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.145959,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.900216,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.900216,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.900216,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.777347,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<17.777347,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.765663,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.642791,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<19.642791,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.642791,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.397047,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<19.397047,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.397047,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.274178,0.000000,8.526456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<19.274178,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.274178,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.274178,0.000000,8.034969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.274178,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.274178,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.397047,0.000000,7.912100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<19.274178,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.397047,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.642791,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<19.397047,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.642791,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.765663,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<19.642791,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.765663,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.765663,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<19.765663,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.765663,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.519919,0.000000,8.280712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<19.519919,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.022594,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.022594,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<20.022594,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.022594,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.514078,0.000000,7.912100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<20.022594,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.514078,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.514078,0.000000,8.649328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<20.514078,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.771009,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.771009,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.771009,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.771009,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.139622,0.000000,7.912100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<20.771009,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.139622,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.262494,0.000000,8.034969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<21.139622,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.262494,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.262494,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<21.262494,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.262494,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.139622,0.000000,8.649328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.139622,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.139622,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.771009,0.000000,8.649328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<20.771009,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,8.403584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<22.267841,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.513581,0.000000,8.649328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<22.267841,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.513581,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,8.403584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<22.513581,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,7.912100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.759325,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.267841,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.759325,0.000000,8.280712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<22.267841,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.016256,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.016256,0.000000,8.526456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<23.016256,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.016256,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.139125,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<23.016256,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.139125,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.384869,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.139125,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.384869,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.507741,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<23.384869,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.507741,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.507741,0.000000,8.034969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.507741,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.507741,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.384869,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<23.384869,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.384869,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.139125,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.139125,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.139125,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.016256,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<23.016256,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.016256,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.507741,0.000000,8.526456>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<23.016256,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.513088,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.513088,0.000000,8.403584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<24.513088,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.513088,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.758828,0.000000,8.649328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<24.513088,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.758828,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.004572,0.000000,8.403584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<24.758828,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.004572,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.004572,0.000000,7.912100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.004572,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.513088,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.004572,0.000000,8.280712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<24.513088,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.261503,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.507244,0.000000,8.649328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<25.261503,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.507244,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.507244,0.000000,7.912100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.507244,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.261503,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.752987,0.000000,7.912100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<25.261503,0.000000,7.912100> }
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
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.114256,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.605741,0.000000,8.280712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<45.114256,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.359997,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.359997,0.000000,8.034969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.359997,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.862672,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.985541,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<45.862672,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.985541,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.231284,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.985541,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.231284,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<46.231284,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.354156,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.231284,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<46.231284,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.231284,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.108413,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<46.108413,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.231284,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<46.231284,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.354156,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.354156,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.231284,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<46.231284,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.231284,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.985541,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.985541,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.985541,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.862672,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<45.862672,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.611088,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.611088,0.000000,8.157841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.611088,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.611088,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.856828,0.000000,7.912100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<46.611088,0.000000,8.157841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.856828,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.157841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<46.856828,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.102572,0.000000,8.649328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<47.102572,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.359503,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.482372,0.000000,8.649328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<47.359503,0.000000,8.526456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.482372,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.728116,0.000000,8.649328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<47.482372,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.728116,0.000000,8.649328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.850988,0.000000,8.526456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<47.728116,0.000000,8.649328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.850988,0.000000,8.526456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.850988,0.000000,8.403584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.850988,0.000000,8.403584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.850988,0.000000,8.403584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.728116,0.000000,8.280712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<47.728116,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.728116,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.605244,0.000000,8.280712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<47.605244,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.728116,0.000000,8.280712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.850988,0.000000,8.157841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<47.728116,0.000000,8.280712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.850988,0.000000,8.157841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.850988,0.000000,8.034969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.850988,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.850988,0.000000,8.034969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.728116,0.000000,7.912100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<47.728116,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.728116,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.482372,0.000000,7.912100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<47.482372,0.000000,7.912100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.482372,0.000000,7.912100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.359503,0.000000,8.034969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<47.359503,0.000000,8.034969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.376100,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,1.537328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.376100,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<37.744712,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.867584,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.744712,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<37.744712,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.867584,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.867584,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<37.744712,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,0.800100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.376100,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.376100,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.744712,0.000000,1.168713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.376100,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<38.124516,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.247384,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<38.124516,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.247384,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.493128,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.247384,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.493128,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.493128,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.616000,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.493128,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<38.493128,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.493128,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.247384,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.247384,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.247384,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<38.124516,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.124516,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.616000,0.000000,1.414456>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<38.124516,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<39.621347,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<39.621347,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<39.989959,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.112831,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.989959,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<39.989959,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.112831,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.112831,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<39.989959,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<39.621347,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.621347,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.989959,0.000000,1.168713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<39.621347,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.369763,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.615503,0.000000,1.537328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<40.369763,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.615503,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.615503,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.615503,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.369763,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.861247,0.000000,0.800100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.369763,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.235206,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.235206,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.235206,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.989463,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.989463,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.989463,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.866594,0.000000,1.414456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<41.866594,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.866594,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.866594,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.866594,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.866594,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.989463,0.000000,0.800100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<41.866594,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.989463,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.235206,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.989463,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.235206,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<42.235206,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.358078,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.358078,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.112334,0.000000,1.168713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.112334,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.615009,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.615009,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.615009,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.615009,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.106494,0.000000,0.800100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<42.615009,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.106494,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.106494,0.000000,1.537328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<43.106494,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.363425,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.363425,0.000000,0.800100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.363425,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.363425,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.732038,0.000000,0.800100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<43.363425,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.732038,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.854909,0.000000,0.922969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<43.732038,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.854909,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.854909,0.000000,1.414456>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<43.854909,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.854909,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.732038,0.000000,1.537328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<43.732038,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.732038,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.363425,0.000000,1.537328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<43.363425,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.860256,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.351741,0.000000,1.168713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<44.860256,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.105997,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.105997,0.000000,0.922969>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.105997,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.608672,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.731541,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<45.608672,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.731541,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.977284,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.731541,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.977284,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.977284,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.100156,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.977284,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.977284,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.977284,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.854413,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<45.854413,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.977284,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.977284,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.100156,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.100156,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.977284,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<45.977284,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.977284,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.731541,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.731541,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.731541,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.608672,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<45.608672,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.357088,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.357088,0.000000,1.045841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.357088,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.357088,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.602828,0.000000,0.800100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<46.357088,0.000000,1.045841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.602828,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,1.045841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<46.602828,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.848572,0.000000,1.537328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<46.848572,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.105503,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.228372,0.000000,1.537328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<47.105503,0.000000,1.414456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.228372,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.474116,0.000000,1.537328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<47.228372,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.474116,0.000000,1.537328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.596988,0.000000,1.414456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<47.474116,0.000000,1.537328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.596988,0.000000,1.414456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.596988,0.000000,1.291584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.596988,0.000000,1.291584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.596988,0.000000,1.291584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.474116,0.000000,1.168713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<47.474116,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.474116,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.351244,0.000000,1.168713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<47.351244,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.474116,0.000000,1.168713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.596988,0.000000,1.045841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<47.474116,0.000000,1.168713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.596988,0.000000,1.045841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.596988,0.000000,0.922969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.596988,0.000000,0.922969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.596988,0.000000,0.922969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.474116,0.000000,0.800100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<47.474116,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.474116,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.228372,0.000000,0.800100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<47.228372,0.000000,0.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.228372,0.000000,0.800100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.105503,0.000000,0.922969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<47.105503,0.000000,0.922969> }
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
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.492575,0.000000,2.781300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.492575,0.000000,3.594794>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<57.492575,0.000000,3.594794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.763738,0.000000,3.594794>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<57.221409,0.000000,3.594794>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<57.221409,0.000000,3.594794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.557056,0.000000,2.781300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.557056,0.000000,3.594794>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<56.557056,0.000000,3.594794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.828219,0.000000,3.594794>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<56.285891,0.000000,3.594794>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<56.285891,0.000000,3.594794> }
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
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,27.910784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<45.945381,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.699641,-1.536000,28.156528>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<45.699641,-1.536000,28.156528> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.699641,-1.536000,28.156528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,27.910784>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.453897,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,27.419300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.453897,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,27.787913>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<45.453897,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,27.910784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<45.196966,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,27.910784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<44.828353,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.705481,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,27.419300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.705481,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,28.033656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,27.542169>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.325681,-1.536000,27.542169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,27.542169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.202809,-1.536000,27.419300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<44.202809,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.202809,-1.536000,27.910784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<44.202809,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.580994,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.826738,-1.536000,27.419300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.580994,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.826738,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.949606,-1.536000,27.542169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.826738,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.949606,-1.536000,27.542169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.949606,-1.536000,27.787913>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<43.949606,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.949606,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.826738,-1.536000,27.910784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<43.826738,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.826738,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.580994,-1.536000,27.910784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.580994,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.580994,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.458122,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.458122,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.458122,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.458122,-1.536000,27.665041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.458122,-1.536000,27.665041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.458122,-1.536000,27.665041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.949606,-1.536000,27.665041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<43.458122,-1.536000,27.665041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.201191,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.201191,-1.536000,27.910784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<43.201191,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.201191,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.832578,-1.536000,27.910784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<42.832578,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.832578,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709706,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.709706,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709706,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.709706,-1.536000,27.419300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.709706,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.452775,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.452775,-1.536000,27.910784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<42.452775,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.452775,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.084163,-1.536000,27.910784>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<42.084163,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.084163,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.961291,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.961291,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.961291,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.961291,-1.536000,27.419300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.961291,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.581491,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.335747,-1.536000,27.910784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.335747,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.335747,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.212875,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.212875,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.212875,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.212875,-1.536000,27.419300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.212875,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.212875,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.581491,-1.536000,27.419300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<41.212875,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.581491,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.704359,-1.536000,27.542169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.581491,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.704359,-1.536000,27.542169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.581491,-1.536000,27.665041>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<41.581491,-1.536000,27.665041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.581491,-1.536000,27.665041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.212875,-1.536000,27.665041>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<41.212875,-1.536000,27.665041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.207528,-1.536000,28.156528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.207528,-1.536000,27.419300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.207528,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.207528,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.716044,-1.536000,27.419300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.716044,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.090500,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.336244,-1.536000,27.419300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.090500,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.336244,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.459113,-1.536000,27.542169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.336244,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.459113,-1.536000,27.542169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.459113,-1.536000,27.787913>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<39.459113,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.459113,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.336244,-1.536000,27.910784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<39.336244,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.336244,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.090500,-1.536000,27.910784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.090500,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.090500,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.967628,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.967628,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.967628,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.967628,-1.536000,27.665041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.967628,-1.536000,27.665041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.967628,-1.536000,27.665041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.459113,-1.536000,27.665041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<38.967628,-1.536000,27.665041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.710697,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.710697,-1.536000,27.910784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<38.710697,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.710697,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.342084,-1.536000,27.910784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<38.342084,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.342084,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.219213,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.219213,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.219213,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.219213,-1.536000,27.419300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.219213,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.716541,-1.536000,27.173559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.593669,-1.536000,27.173559>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<37.593669,-1.536000,27.173559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.593669,-1.536000,27.173559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.470797,-1.536000,27.296431>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<37.470797,-1.536000,27.296431> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.470797,-1.536000,27.296431>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.470797,-1.536000,27.910784>}
box{<0,0,-0.038100><0.614353,0.036000,0.038100> rotate<0,90.000000,0> translate<37.470797,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.470797,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.839413,-1.536000,27.910784>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<37.470797,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.839413,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.962281,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<37.839413,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.962281,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.962281,-1.536000,27.542169>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.962281,-1.536000,27.542169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.962281,-1.536000,27.542169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.839413,-1.536000,27.419300>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.839413,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.839413,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.470797,-1.536000,27.419300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<37.470797,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.090997,-1.536000,28.033656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.090997,-1.536000,27.542169>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.090997,-1.536000,27.542169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.090997,-1.536000,27.542169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.968125,-1.536000,27.419300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<36.968125,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.213866,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.968125,-1.536000,27.910784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<36.968125,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.714922,-1.536000,28.156528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.714922,-1.536000,27.419300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.714922,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.714922,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.592053,-1.536000,27.910784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.592053,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.592053,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346309,-1.536000,27.910784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.346309,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346309,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.223438,-1.536000,27.787913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.223438,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.223438,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.223438,-1.536000,27.419300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.223438,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966506,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.843637,-1.536000,27.910784>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<35.843637,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.843637,-1.536000,27.910784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.843637,-1.536000,27.787913>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.843637,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.843637,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966506,-1.536000,27.787913>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<35.843637,-1.536000,27.787913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966506,-1.536000,27.787913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966506,-1.536000,27.910784>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<35.966506,-1.536000,27.910784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966506,-1.536000,27.542169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.843637,-1.536000,27.542169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<35.843637,-1.536000,27.542169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.843637,-1.536000,27.542169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.843637,-1.536000,27.419300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.843637,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.843637,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966506,-1.536000,27.419300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<35.843637,-1.536000,27.419300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966506,-1.536000,27.419300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966506,-1.536000,27.542169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<35.966506,-1.536000,27.542169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,26.937328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<45.576769,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,26.568713>}
box{<0,0,-0.038100><0.521299,0.036000,0.038100> rotate<0,44.997273,0> translate<45.576769,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,26.568713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<45.453897,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,26.814456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.074097,-1.536000,26.937328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<45.074097,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.074097,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,26.937328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.828353,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,26.814456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.705481,-1.536000,26.814456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,26.814456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,26.691584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.705481,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,26.568713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<44.705481,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.951225,-1.536000,26.568713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<44.828353,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,26.445841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.705481,-1.536000,26.445841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,26.445841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,26.322969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.705481,-1.536000,26.322969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,26.322969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,26.200100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<44.705481,-1.536000,26.322969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.074097,-1.536000,26.200100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.828353,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.074097,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,26.322969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.074097,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,26.814456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,26.937328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<44.325681,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,26.937328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.079937,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,26.814456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.957066,-1.536000,26.814456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,26.814456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,26.691584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.957066,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,26.568713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<43.957066,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.202809,-1.536000,26.568713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<44.079937,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,26.445841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.957066,-1.536000,26.445841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,26.445841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,26.322969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.957066,-1.536000,26.322969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,26.322969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,26.200100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<43.957066,-1.536000,26.322969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,26.200100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.079937,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,26.322969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.325681,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,26.937328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.951719,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.705978,-1.536000,26.691584>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<42.705978,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.705978,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,26.937328>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<42.460234,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,26.200100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.460234,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,26.937328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.203303,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,26.568713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<41.711819,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,26.200100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.711819,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,26.691584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.963403,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,26.200100>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<40.963403,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,26.200100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.963403,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.958056,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.466572,-1.536000,26.568713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.466572,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209641,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.718156,-1.536000,26.568713>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<38.718156,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.718156,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209641,-1.536000,26.200100>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<38.718156,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.712809,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.467069,-1.536000,26.937328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<37.467069,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.467069,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.467069,-1.536000,26.200100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.467069,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.712809,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.221325,-1.536000,26.200100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<37.221325,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.718653,-1.536000,26.814456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<36.472909,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.718653,-1.536000,26.814456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,26.568713>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<36.718653,-1.536000,26.814456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,26.322969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.964394,-1.536000,26.322969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,26.322969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,26.200100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.841525,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,26.200100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.595781,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,26.322969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<36.472909,-1.536000,26.322969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,26.322969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,26.445841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<36.472909,-1.536000,26.445841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,26.445841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,26.568713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.472909,-1.536000,26.445841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,26.568713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<36.595781,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,26.937328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.724494,-1.536000,26.937328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,26.937328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,26.568713>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.215978,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.970238,-1.536000,26.691584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<35.970238,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.970238,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,26.691584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<35.847366,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,26.568713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.724494,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,26.322969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.724494,-1.536000,26.322969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,26.322969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,26.200100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<35.724494,-1.536000,26.322969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,26.200100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.847366,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,26.322969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.093109,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,26.691584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<34.719147,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.596278,-1.536000,26.691584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<34.596278,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.596278,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,26.568713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.473406,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,26.200100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.473406,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.350534,-1.536000,26.691584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<34.350534,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.350534,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,26.568713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.227663,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,26.200100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.227663,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,26.200100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,26.691584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<33.970731,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.847863,-1.536000,26.691584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<33.847863,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.847863,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,26.568713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.724991,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,26.200100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.724991,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.602119,-1.536000,26.691584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<33.602119,-1.536000,26.691584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.602119,-1.536000,26.691584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,26.568713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.479247,-1.536000,26.568713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,26.568713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,26.200100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.479247,-1.536000,26.200100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,25.595256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,25.718128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<45.822513,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,25.718128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.576769,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,25.595256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.453897,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,25.595256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,25.472384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.453897,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.453897,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,25.226641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.453897,-1.536000,25.226641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,25.226641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,25.103769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.453897,-1.536000,25.103769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,25.103769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,24.980900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<45.453897,-1.536000,25.103769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,24.980900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.576769,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,25.103769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.822513,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,25.103769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,25.226641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<45.945381,-1.536000,25.226641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,25.226641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<45.822513,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,25.472384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<45.822513,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,25.595256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<45.945381,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,25.349512>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.576769,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.951225,-1.536000,25.595256>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<44.705481,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.951225,-1.536000,25.595256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,25.349512>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<44.951225,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,25.103769>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.196966,-1.536000,25.103769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,25.103769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.074097,-1.536000,24.980900>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.074097,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.074097,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,24.980900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.828353,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,25.103769>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<44.705481,-1.536000,25.103769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,25.103769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,25.226641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<44.705481,-1.536000,25.226641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,25.226641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.705481,-1.536000,25.226641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.828353,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,25.349512>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<44.828353,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,25.595256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,25.718128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<44.325681,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,25.718128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.079937,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,25.595256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.957066,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,25.595256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,25.472384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.957066,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<43.957066,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,25.226641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.957066,-1.536000,25.226641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,25.226641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,25.103769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.957066,-1.536000,25.103769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,25.103769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,24.980900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<43.957066,-1.536000,25.103769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,24.980900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.079937,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,25.103769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.325681,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,25.103769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,25.226641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<44.448550,-1.536000,25.226641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,25.226641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<44.325681,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,25.472384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<44.325681,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,25.595256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<44.448550,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,25.349512>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.079937,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,25.718128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.951719,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.705978,-1.536000,25.472384>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<42.705978,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.705978,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,25.718128>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<42.460234,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,24.980900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.460234,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,25.718128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.203303,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,25.349512>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<41.711819,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,24.980900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.711819,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,25.472384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.963403,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,24.980900>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<40.963403,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,24.980900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.963403,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.958056,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.466572,-1.536000,25.349512>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.466572,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209641,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.718156,-1.536000,25.349512>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<38.718156,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.718156,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209641,-1.536000,24.980900>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<38.718156,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,25.595256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,25.718128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.841525,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,25.718128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.595781,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,25.595256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.472909,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,25.595256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,25.472384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.472909,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.472909,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,25.226641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.472909,-1.536000,25.226641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,25.226641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,25.103769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.472909,-1.536000,25.103769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,25.103769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,24.980900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<36.472909,-1.536000,25.103769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,24.980900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.595781,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,25.103769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.841525,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,25.103769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,25.226641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<36.964394,-1.536000,25.226641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,25.226641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.841525,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,25.472384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<36.841525,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,25.595256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<36.964394,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.841525,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.595781,-1.536000,25.349512>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.595781,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,24.980900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.724494,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,25.472384>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<35.724494,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,25.595256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<35.724494,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,25.595256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,25.718128>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.724494,-1.536000,25.595256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,25.718128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.847366,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,25.718128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,25.595256>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.093109,-1.536000,25.718128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,25.472384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<34.719147,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.596278,-1.536000,25.472384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<34.596278,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.596278,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.473406,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,24.980900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.473406,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.350534,-1.536000,25.472384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<34.350534,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.350534,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.227663,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,24.980900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.227663,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,24.980900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,25.472384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<33.970731,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.847863,-1.536000,25.472384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<33.847863,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.847863,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.724991,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,24.980900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.724991,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.602119,-1.536000,25.472384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<33.602119,-1.536000,25.472384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.602119,-1.536000,25.472384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,25.349512>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.479247,-1.536000,25.349512> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,25.349512>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,24.980900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.479247,-1.536000,24.980900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,23.884569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,23.761700>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.822513,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,23.761700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.576769,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,23.884569>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<45.453897,-1.536000,23.884569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,23.884569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,24.376056>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<45.453897,-1.536000,24.376056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,24.376056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,24.498928>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.453897,-1.536000,24.376056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.576769,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,24.498928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.576769,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,24.376056>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<45.822513,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,24.376056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,24.253184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.945381,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.945381,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,24.130313>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<45.822513,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.822513,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.453897,-1.536000,24.130313>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<45.453897,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.951225,-1.536000,24.498928>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<44.951225,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.951225,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.951225,-1.536000,23.761700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.951225,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.196966,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.705481,-1.536000,23.761700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<44.705481,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,24.498928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<43.957066,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,24.130313>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.448550,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.202809,-1.536000,24.253184>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<44.202809,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.202809,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,24.253184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<44.079937,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,24.130313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.957066,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,23.884569>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.957066,-1.536000,23.884569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.957066,-1.536000,23.884569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,23.761700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<43.957066,-1.536000,23.884569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.079937,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,23.761700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.079937,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.325681,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.448550,-1.536000,23.884569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.325681,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,24.498928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.951719,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.951719,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.705978,-1.536000,24.253184>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<42.705978,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.705978,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,24.498928>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<42.460234,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.460234,-1.536000,23.761700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.460234,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,24.498928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<42.203303,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.203303,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,24.130313>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<41.711819,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.711819,-1.536000,23.761700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.711819,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,24.253184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.963403,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,23.761700>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<40.963403,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.454888,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.963403,-1.536000,23.761700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<40.963403,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.958056,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.466572,-1.536000,24.130313>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.466572,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209641,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.718156,-1.536000,24.130313>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<38.718156,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.718156,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209641,-1.536000,23.761700>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<38.718156,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,24.498928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<36.472909,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,24.376056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.472909,-1.536000,24.376056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.472909,-1.536000,24.376056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,23.884569>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,44.997212,0> translate<36.472909,-1.536000,24.376056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,23.884569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.964394,-1.536000,23.761700>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.964394,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,24.376056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,24.498928>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.093109,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,24.498928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.847366,-1.536000,24.498928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,24.498928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,24.376056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.724494,-1.536000,24.376056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,24.376056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,24.253184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.724494,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,24.130313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<35.724494,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,24.007441>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.724494,-1.536000,24.007441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,24.007441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,23.884569>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.724494,-1.536000,23.884569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.724494,-1.536000,23.884569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,23.761700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<35.724494,-1.536000,23.884569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,23.761700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.847366,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,23.884569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.093109,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,23.884569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,24.007441>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<36.215978,-1.536000,24.007441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,24.007441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,24.130313>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.093109,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,24.253184>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<36.093109,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.215978,-1.536000,24.376056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<36.215978,-1.536000,24.376056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.093109,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.847366,-1.536000,24.130313>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<35.847366,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,24.253184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<34.719147,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.719147,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.596278,-1.536000,24.253184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<34.596278,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.596278,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,24.130313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.473406,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,23.761700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.473406,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.473406,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.350534,-1.536000,24.253184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<34.350534,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.350534,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,24.130313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.227663,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.227663,-1.536000,23.761700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.227663,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,23.761700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,24.253184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<33.970731,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.970731,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.847863,-1.536000,24.253184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<33.847863,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.847863,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,24.130313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.724991,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,23.761700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.724991,-1.536000,23.761700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.724991,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.602119,-1.536000,24.253184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<33.602119,-1.536000,24.253184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.602119,-1.536000,24.253184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,24.130313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.479247,-1.536000,24.130313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,24.130313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.479247,-1.536000,23.761700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.479247,-1.536000,23.761700> }
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<58.375550,0.000000,5.378450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<58.375550,0.000000,4.743450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<58.375550,0.000000,4.108450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<55.200550,0.000000,5.378450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<55.200550,0.000000,4.743450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<55.200550,0.000000,4.108450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<56.788050,0.000000,4.743450>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-180.000000,0> translate<56.813450,0.000000,2.266950>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-180.000000,0> translate<56.813450,0.000000,6.013450>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-90.000000,0> translate<53.975000,0.000000,4.140200>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-90.000000,0> translate<59.639200,0.000000,4.140200>}
//BAT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.022000,-1.536000,26.162000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.022000,-1.536000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.022000,-1.536000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,35.814000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.022000,-1.536000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,26.162000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.547000,-1.536000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.826000,-1.536000,23.368000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.166000,-1.536000,23.368000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.826000,-1.536000,23.368000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.166000,-1.536000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.826000,-1.536000,38.608000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.826000,-1.536000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,-1.536000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,35.814000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.445000,-1.536000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,26.162000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<4.445000,-1.536000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,-1.536000,26.162000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.445000,-1.536000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,28.448000>}
box{<0,0,-0.203200><12.700000,0.036000,0.203200> rotate<0,0.000000,0> translate<25.146000,-1.536000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,30.403800>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,90.000000,0> translate<25.146000,-1.536000,30.403800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,30.403800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,31.673800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<25.146000,-1.536000,31.673800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,31.673800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,33.528000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,90.000000,0> translate<25.146000,-1.536000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,33.528000>}
box{<0,0,-0.203200><12.700000,0.036000,0.203200> rotate<0,0.000000,0> translate<25.146000,-1.536000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,28.448000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,-90.000000,0> translate<37.846000,-1.536000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,30.403800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.876000,-1.536000,30.403800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<23.876000,-1.536000,30.403800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.876000,-1.536000,30.403800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.876000,-1.536000,31.673800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<23.876000,-1.536000,31.673800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.876000,-1.536000,31.673800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,31.673800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<23.876000,-1.536000,31.673800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.941000,-1.536000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.671000,-1.536000,30.988000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<34.671000,-1.536000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<28.321000,-1.536000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<27.051000,-1.536000,30.988000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<27.051000,-1.536000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<27.686000,-1.536000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<27.686000,-1.536000,31.623000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<27.686000,-1.536000,31.623000> }
//BAT4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,-1.536000,14.224000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.445000,-1.536000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,-1.536000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,4.572000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.445000,-1.536000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.445000,-1.536000,14.224000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<4.445000,-1.536000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.166000,-1.536000,17.018000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.826000,-1.536000,17.018000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.826000,-1.536000,17.018000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.826000,-1.536000,1.778000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.166000,-1.536000,1.778000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.826000,-1.536000,1.778000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.022000,-1.536000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,4.572000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.022000,-1.536000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,14.224000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<58.547000,-1.536000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.547000,-1.536000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.022000,-1.536000,14.224000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.022000,-1.536000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,11.938000>}
box{<0,0,-0.203200><12.700000,0.036000,0.203200> rotate<0,0.000000,0> translate<25.146000,-1.536000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,11.938000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,9.982200>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,-90.000000,0> translate<37.846000,-1.536000,9.982200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,9.982200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,8.712200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<37.846000,-1.536000,8.712200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,8.712200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,6.858000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,-90.000000,0> translate<37.846000,-1.536000,6.858000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,6.858000>}
box{<0,0,-0.203200><12.700000,0.036000,0.203200> rotate<0,0.000000,0> translate<25.146000,-1.536000,6.858000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,6.858000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.146000,-1.536000,11.938000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,90.000000,0> translate<25.146000,-1.536000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,9.982200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.116000,-1.536000,9.982200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<37.846000,-1.536000,9.982200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.116000,-1.536000,9.982200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.116000,-1.536000,8.712200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<39.116000,-1.536000,8.712200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.116000,-1.536000,8.712200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.846000,-1.536000,8.712200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<37.846000,-1.536000,8.712200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<27.051000,-1.536000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<28.321000,-1.536000,9.398000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<27.051000,-1.536000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.671000,-1.536000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.941000,-1.536000,9.398000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<34.671000,-1.536000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.306000,-1.536000,10.033000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<35.306000,-1.536000,8.763000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<35.306000,-1.536000,8.763000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.786000,0.000000,32.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.386000,0.000000,32.350000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.786000,0.000000,32.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.786000,0.000000,31.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.386000,0.000000,31.150000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.786000,0.000000,31.150000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.478000,0.000000,36.652000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,36.652000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.478000,0.000000,36.652000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,36.652000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,33.502000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<55.178000,0.000000,33.502000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.178000,0.000000,33.502000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.478000,0.000000,33.502000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<53.478000,0.000000,33.502000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,36.602000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,36.602000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,36.602000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,36.602000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,36.252000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<49.978000,0.000000,36.252000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,36.252000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,33.802000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.978000,0.000000,33.802000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.978000,0.000000,33.802000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,33.502000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<49.978000,0.000000,33.802000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,33.502000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,33.502000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,33.502000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.378000,0.000000,33.502000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.578000,0.000000,33.502000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<50.378000,0.000000,33.502000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.969000,0.000000,33.741000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.969000,0.000000,36.338000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<51.969000,0.000000,36.338000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.178000,0.000000,10.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.578000,0.000000,10.068000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.578000,0.000000,10.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.178000,0.000000,11.268000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.578000,0.000000,11.268000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.578000,0.000000,11.268000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.012000,0.000000,24.206000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.712000,0.000000,24.206000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.012000,0.000000,24.206000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.712000,0.000000,24.206000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.712000,0.000000,21.056000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<9.712000,0.000000,21.056000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.712000,0.000000,21.056000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.012000,0.000000,21.056000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.012000,0.000000,21.056000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.112000,0.000000,24.156000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.912000,0.000000,24.156000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.912000,0.000000,24.156000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.912000,0.000000,24.156000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.512000,0.000000,23.806000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<4.512000,0.000000,23.806000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.512000,0.000000,23.806000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.512000,0.000000,21.356000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.512000,0.000000,21.356000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.512000,0.000000,21.356000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.912000,0.000000,21.056000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<4.512000,0.000000,21.356000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.912000,0.000000,21.056000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.112000,0.000000,21.056000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.912000,0.000000,21.056000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.912000,0.000000,21.056000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.112000,0.000000,21.056000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.912000,0.000000,21.056000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.503000,0.000000,21.295000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.503000,0.000000,23.892000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<6.503000,0.000000,23.892000> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.888000,0.000000,15.356000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.888000,0.000000,13.656000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<19.888000,0.000000,13.656000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.888000,0.000000,13.656000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,13.656000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.738000,0.000000,13.656000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,13.656000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,15.356000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.738000,0.000000,15.356000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.838000,0.000000,17.256000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.838000,0.000000,18.456000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.838000,0.000000,18.456000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.838000,0.000000,18.456000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.488000,0.000000,18.856000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,48.810853,0> translate<19.488000,0.000000,18.856000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.488000,0.000000,18.856000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.038000,0.000000,18.856000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.038000,0.000000,18.856000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.038000,0.000000,18.856000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,18.456000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-53.126596,0> translate<16.738000,0.000000,18.456000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,18.456000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,17.256000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.738000,0.000000,17.256000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,18.456000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.738000,0.000000,17.256000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.738000,0.000000,17.256000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.977000,0.000000,16.865000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.574000,0.000000,16.865000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,0.000000,0> translate<16.977000,0.000000,16.865000> }
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
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,27.813000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.955000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,29.718000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.955000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,30.353000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.955000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,32.258000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.955000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,32.893000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<20.955000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,34.798000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<20.955000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,27.178000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.145000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,27.813000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<16.510000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,29.083000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.510000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,29.718000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<16.510000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,30.353000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<16.510000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,31.623000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.510000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,32.258000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<16.510000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,32.893000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<16.510000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,34.163000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.510000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.510000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,34.798000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<16.510000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,29.718000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.145000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,32.258000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.145000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.145000,0.000000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.955000,0.000000,34.798000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.145000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,34.163000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.590000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,31.623000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.590000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,29.083000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<21.590000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.925000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.925000,0.000000,27.813000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<21.925000,0.000000,27.813000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.320000,0.000000,28.448000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.780000,0.000000,28.448000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.780000,0.000000,30.988000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.320000,0.000000,30.988000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.780000,0.000000,33.528000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<20.320000,0.000000,33.528000>}
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
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.112000,0.000000,14.256000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,14.256000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.112000,0.000000,14.256000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,14.256000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,18.256000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.112000,0.000000,18.256000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.112000,0.000000,18.256000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.112000,0.000000,14.256000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.112000,0.000000,14.256000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.112000,0.000000,18.256000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,18.256000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.112000,0.000000,18.256000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.100000,0.000000,22.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.500000,0.000000,22.260000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.500000,0.000000,22.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.100000,0.000000,23.460000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.500000,0.000000,23.460000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.500000,0.000000,23.460000> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.500000,0.000000,20.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.100000,0.000000,20.920000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.500000,0.000000,20.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.500000,0.000000,19.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.100000,0.000000,19.720000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.500000,0.000000,19.720000> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.604000,0.000000,3.094000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.604000,0.000000,2.494000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.604000,0.000000,2.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.404000,0.000000,3.094000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.404000,0.000000,2.494000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.404000,0.000000,2.494000> }
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
//SJ1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,28.448000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.255000,0.000000,28.448000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<8.255000,0.000000,26.670000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<12.573000,0.000000,26.670000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<12.573000,0.000000,28.194000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<8.255000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.001000,0.000000,26.670000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.001000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,26.670000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.827000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.255000,0.000000,26.416000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.255000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.128000,0.000000,27.432000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.128000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,27.432000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.192000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,26.416000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.414000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,28.194000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.414000,0.000000,28.194000> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<9.398000,0.000000,27.432000>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<11.430000,0.000000,27.432000>}
box{<-0.508000,0,-0.762000><0.508000,0.036000,0.762000> rotate<0,-180.000000,0> translate<10.414000,0.000000,27.432000>}
//SJ2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,20.828000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,20.828000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.701000,0.000000,22.606000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.907000,0.000000,22.606000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.907000,0.000000,21.082000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.701000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,22.606000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.955000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,22.606000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.653000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,22.860000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.828000,0.000000,21.844000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.288000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,21.844000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,21.844000> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<19.050000,0.000000,21.844000>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<19.558000,0.000000,21.844000>}
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
