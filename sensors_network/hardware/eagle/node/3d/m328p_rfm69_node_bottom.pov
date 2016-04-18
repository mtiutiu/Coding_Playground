//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/Work/AVR_Playground/sensors_network/hardware/eagle/node/m328p_rfm69_node.brd
//4/18/16 10:41 AM

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
#declare global_seed=seed(986);
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
box{<64.008000,0,38.862000><-1.524000,-1.500000,-1.016000> texture{col_brd}}

//Holes(real)/Parts
//Holes(real)/Board
cylinder{<0.508000,1,36.830000><0.508000,-5,36.830000>1.500000 texture{col_hls}}
cylinder{<0.508000,1,1.016000><0.508000,-5,1.016000>1.500000 texture{col_hls}}
cylinder{<61.976000,1,1.016000><61.976000,-5,1.016000>1.500000 texture{col_hls}}
cylinder{<61.976000,1,36.830000><61.976000,-5,36.830000>1.500000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.812000,0.000000,14.986000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100n 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<47.244000,0.000000,14.478000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C2 10uF EIA3528
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.352000,0.000000,10.160000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C4 100n 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<51.308000,0.000000,30.734000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<50.800000,0.000000,34.036000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C6 10uF EIA3528
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<38.100000,0.000000,9.652000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C7 100n 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<5.334000,0.000000,21.590000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C8 47uF EIA3528
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.510000,0.000000,15.240000>translate<0,0.035000,0> }#end		//SMD Tantal Chip Bauform B  C9 47uF EIA3528
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<38.100000,0.000000,11.938000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C10 100n 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<11.938000,0.000000,12.192000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 100n 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.352000,0.000000,12.192000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_TSSOP8("L6920","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.938000,0.000000,17.526000>translate<0,0.035000,0> }#end		//TSSOP8 IC2 L6920 TSSOP8
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.558000,0.000000,2.286000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP2 HTU21D 1X04
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.272000,0.000000,29.972000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) JP3 ISP 2X3-NS
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.558000,0.000000,5.080000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP4 OTHER 1X04
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.640000,0.000000,5.080000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP5 OTHER 1X04
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.640000,0.000000,2.286000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP6 OTHER 1X04
#ifndef(pack_L1) #declare global_pack_L1=yes; object {SPC_L_MURATA_2012_LQH3C("10uH",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<5.334000,0.000000,15.240000>}#end		//Inductor MURATA Chip Coil L1 10uH DLJ-4018
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.022000,0.000000,21.844000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 100K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<49.022000,0.000000,19.304000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 100K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.226000,0.000000,1.778000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_RB1) #declare global_pack_RB1=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<52.070000,0.000000,14.732000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB1 470 0805
#ifndef(pack_RB2) #declare global_pack_RB2=yes; object {RES_SMD_CHIP_0805("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<52.070000,0.000000,21.336000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB2 330 0805
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ1 V_BOOST1
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ2 V_BOOST2
#ifndef(pack_U1) #declare global_pack_U1=yes; object {QFP_TQFP_32_080MM("M328P","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<29.972000,0.000000,9.398000>translate<0,0.035000,0> }#end		//TQFP-32 U1 M328P TQFP32-08
#ifndef(pack_U2) #declare global_pack_U2=yes; object {RFM69HW_SMD("RFM69W",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<33.274000,0.000000,27.178000>}#end		//RFM69HW SMD U2 RFM69W RFM69W
#ifndef(pack_Y1) #declare global_pack_Y1=yes; object {RESONATOR_SMD("8MHz",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<35.814000,0.000000,16.002000>}#end		//RESONATOR SMD Y1 8MHz RESONATOR-SMD_MED
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<54.864000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<47.752000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<4.572000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<11.684000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<4.572000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<11.684000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<54.864000,0,8.382000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<47.752000,0,8.382000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.812000,0.000000,15.886000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.812000,0.000000,14.086000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<48.894000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<45.594000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.452000,0.000000,10.160000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.252000,0.000000,10.160000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.408000,0.000000,30.734000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.208000,0.000000,30.734000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<49.150000,0.000000,34.036000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<52.450000,0.000000,34.036000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.000000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.200000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<3.684000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<6.984000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.510000,0.000000,16.890000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.510000,0.000000,13.590000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.000000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.200000,0.000000,11.938000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.938000,0.000000,13.092000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.938000,0.000000,11.292000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.452000,0.000000,12.192000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.252000,0.000000,12.192000>}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<60.198000,0,25.704000> texture{col_thl}}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<60.198000,0,12.904000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.963000,0.000000,14.626000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.613000,0.000000,14.626000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.263000,0.000000,14.626000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.913000,0.000000,14.626000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.913000,0.000000,20.426000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<12.263000,0.000000,20.426000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<11.613000,0.000000,20.426000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.963000,0.000000,20.426000>}
object{TOOLS_PCB_SMD(3.900000,2.400000,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<8.128000,0.000000,36.322000>}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<15.748000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<18.288000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<20.828000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<23.368000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<18.542000,0,27.432000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.002000,0,27.432000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<18.542000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.002000,0,29.972000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<18.542000,0,32.512000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.002000,0,32.512000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<15.748000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<18.288000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<20.828000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<23.368000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<36.830000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<39.370000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<41.910000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<44.450000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<36.830000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<39.370000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<41.910000,0,2.286000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,100) rotate<0,-90.000000,0>translate<44.450000,0,2.286000> texture{col_thl}}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.834000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<3.834000,0.000000,15.240000>}
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
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.160000,0.000000,26.416000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.636000,0.000000,26.416000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.112000,0.000000,26.416000>}
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
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<25.400000,0,5.080000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.940000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<34.544000,0,5.080000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<38.100000,0,21.336000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<26.664000,0,18.294000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<26.670000,0,26.162000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.718000,0,20.034000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<27.940000,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<30.480000,0,6.858000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<29.972000,0,16.764000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.904800,0.600000,1,16,0,0) translate<25.654000,0,16.764000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.270000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.270000,0.000000,30.480000>}
box{<0,0,-0.304800><23.876000,0.035000,0.304800> rotate<0,90.000000,0> translate<1.270000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.270000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.794000,0.000000,5.080000>}
box{<0,0,-0.304800><2.155261,0.035000,0.304800> rotate<0,44.997030,0> translate<1.270000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.270000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.794000,0.000000,32.512000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-53.126596,0> translate<1.270000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.684000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.810000,0.000000,21.716000>}
box{<0,0,-0.304800><0.178191,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.684000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.810000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.810000,0.000000,21.716000>}
box{<0,0,-0.304800><2.160000,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.810000,0.000000,21.716000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.834000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.834000,0.000000,15.240000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.834000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.684000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.834000,0.000000,21.590000>}
box{<0,0,-0.304800><0.150000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.684000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.834000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.192000,0.000000,14.120000>}
box{<0,0,-0.203200><1.175825,0.035000,0.203200> rotate<0,72.269123,0> translate<3.834000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.572000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.572000,-1.535000,29.972000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<4.572000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,23.622000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<5.334000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<4.572000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<5.334000,0.000000,29.972000>}
box{<0,0,-0.635000><0.762000,0.035000,0.635000> rotate<0,0.000000,0> translate<4.572000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.842000,0.000000,24.130000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.334000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.810000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.842000,0.000000,25.908000>}
box{<0,0,-0.304800><2.873682,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.810000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.842000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.604000,0.000000,25.908000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.842000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.572000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,0.000000,8.382000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.572000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.984000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.492000,0.000000,19.432000>}
box{<0,0,-0.203200><2.216986,0.035000,0.203200> rotate<0,76.748495,0> translate<6.984000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.834000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,0.000000,14.248000>}
box{<0,0,-0.203200><1.265646,0.035000,0.203200> rotate<0,51.605446,0> translate<6.834000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.620000,0.000000,14.248000>}
box{<0,0,-0.203200><1.246000,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.620000,0.000000,14.248000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,16.256000>}
box{<0,0,-0.304800><3.232892,0.035000,0.304800> rotate<0,44.997030,0> translate<5.334000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,16.256000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,90.000000,0> translate<7.620000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.492000,0.000000,19.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,18.542000>}
box{<0,0,-0.203200><1.258650,0.035000,0.203200> rotate<0,44.997030,0> translate<7.492000,0.000000,19.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.842000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.382000,0.000000,24.130000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.842000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.636000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.636000,0.000000,26.416000>}
box{<0,0,-0.635000><1.778000,0.035000,0.635000> rotate<0,-90.000000,0> translate<8.636000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<5.334000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.636000,0.000000,28.194000>}
box{<0,0,-0.635000><3.750265,0.035000,0.635000> rotate<0,28.298888,0> translate<5.334000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.398000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.398000,0.000000,19.558000>}
box{<0,0,-0.304800><3.556000,0.035000,0.304800> rotate<0,-90.000000,0> translate<9.398000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.382000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.398000,0.000000,23.114000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,44.997030,0> translate<8.382000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,11.176000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.858000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,18.542000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.382000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,18.542000>}
box{<0,0,-0.203200><7.366000,0.035000,0.203200> rotate<0,90.000000,0> translate<9.652000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.398000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,19.304000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<9.398000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.768000,0.000000,11.292000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.652000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,14.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,15.789000>}
box{<0,0,-0.203200><1.163000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.963000,0.000000,15.789000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.963000,0.000000,21.631000>}
box{<0,0,-0.203200><1.205000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.963000,0.000000,21.631000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,19.304000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.652000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<10.963000,0.000000,21.631000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<11.430000,0.000000,22.098000>}
box{<0,0,-0.228600><0.660438,0.035000,0.228600> rotate<0,-44.997030,0> translate<10.963000,0.000000,21.631000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.613000,0.000000,19.487000>}
box{<0,0,-0.203200><0.258801,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.430000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.613000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.613000,0.000000,19.487000>}
box{<0,0,-0.203200><0.939000,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.613000,0.000000,19.487000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.768000,0.000000,11.292000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,11.292000>}
box{<0,0,-0.203200><2.170000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.768000,0.000000,11.292000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,13.092000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.054000,0.000000,13.208000>}
box{<0,0,-0.203200><0.164049,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.938000,0.000000,13.092000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<10.963000,0.000000,15.789000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.192000,0.000000,17.018000>}
box{<0,0,-0.228600><1.738068,0.035000,0.228600> rotate<0,-44.997030,0> translate<10.963000,0.000000,15.789000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.652000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.263000,0.000000,18.542000>}
box{<0,0,-0.203200><2.611000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.652000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.263000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.263000,0.000000,18.542000>}
box{<0,0,-0.203200><1.884000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.263000,0.000000,18.542000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.054000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,13.208000>}
box{<0,0,-0.203200><0.646000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.054000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.794000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,0.000000,32.512000>}
box{<0,0,-0.304800><9.906000,0.035000,0.304800> rotate<0,0.000000,0> translate<2.794000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<11.430000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.872000,0.000000,22.098000>}
box{<0,0,-0.228600><1.442000,0.035000,0.228600> rotate<0,0.000000,0> translate<11.430000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,13.421000>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.700000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,14.626000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,13.421000>}
box{<0,0,-0.203200><1.205000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.913000,0.000000,13.421000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.872000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.913000,0.000000,22.057000>}
box{<0,0,-0.228600><0.057983,0.035000,0.228600> rotate<0,44.997030,0> translate<12.872000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,20.426000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,22.057000>}
box{<0,0,-0.203200><1.631000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.913000,0.000000,22.057000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.913000,0.000000,22.057000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.954000,0.000000,22.098000>}
box{<0,0,-0.203200><0.057983,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.913000,0.000000,22.057000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.938000,0.000000,11.292000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.212000,0.000000,11.292000>}
box{<0,0,-0.203200><2.274000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.938000,0.000000,11.292000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.224000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.224000,0.000000,28.702000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.224000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.224000,0.000000,31.242000>}
box{<0,0,-0.304800><1.983803,0.035000,0.304800> rotate<0,39.802944,0> translate<12.700000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.986000,0.000000,26.416000>}
box{<0,0,-0.304800><4.826000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.160000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.986000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.113000,0.000000,26.543000>}
box{<0,0,-0.304800><0.179605,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.986000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.954000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<15.494000,0.000000,22.098000>}
box{<0,0,-0.228600><2.540000,0.035000,0.228600> rotate<0,0.000000,0> translate<12.954000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,1.016000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,-90.000000,0> translate<15.748000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.794000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,5.080000>}
box{<0,0,-0.304800><12.954000,0.035000,0.304800> rotate<0,0.000000,0> translate<2.794000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,5.080000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.748000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.224000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,27.432000>}
box{<0,0,-0.304800><2.184991,0.035000,0.304800> rotate<0,35.535332,0> translate<14.224000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.113000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,27.432000>}
box{<0,0,-0.304800><1.257236,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.113000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.748000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,0.000000,27.432000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.748000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<12.192000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<16.382000,0.000000,17.018000>}
box{<0,0,-0.228600><4.190000,0.035000,0.228600> rotate<0,0.000000,0> translate<12.192000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.748000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,0.000000,0.254000>}
box{<0,0,-0.304800><1.077631,0.035000,0.304800> rotate<0,44.997030,0> translate<15.748000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.212000,0.000000,11.292000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,13.590000>}
box{<0,0,-0.203200><3.249863,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.212000,0.000000,11.292000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.382000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,16.890000>}
box{<0,0,-0.203200><0.181019,0.035000,0.203200> rotate<0,44.997030,0> translate<16.382000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.764000,0.000000,17.144000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.510000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,17.144000>}
box{<0,0,-0.304800><3.684000,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.764000,0.000000,17.144000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<15.494000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<16.764000,0.000000,20.828000>}
box{<0,0,-0.228600><1.796051,0.035000,0.228600> rotate<0,44.997030,0> translate<15.494000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.272000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.272000,0.000000,26.162000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.272000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.272000,0.000000,28.702000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<16.002000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<16.510000,0.000000,16.890000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<17.514000,0.000000,15.886000>}
box{<0,0,-0.228600><1.419870,0.035000,0.228600> rotate<0,44.997030,0> translate<16.510000,0.000000,16.890000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.002000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,31.242000>}
box{<0,0,-0.152400><1.983803,0.035000,0.152400> rotate<0,39.802944,0> translate<16.002000,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,36.322000>}
box{<0,0,-0.203200><9.398000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.128000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,2.286000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.288000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,20.828000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<18.288000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.113000,0.000000,26.543000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,23.368000>}
box{<0,0,-0.304800><4.490128,0.035000,0.304800> rotate<0,44.997030,0> translate<15.113000,0.000000,26.543000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.272000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,0.000000,24.130000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,44.997030,0> translate<17.272000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,13.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.316000,0.000000,13.590000>}
box{<0,0,-0.203200><2.806000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.510000,0.000000,13.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.796000,0.000000,26.178000>}
box{<0,0,-0.203200><1.773424,0.035000,0.203200> rotate<0,44.997030,0> translate<18.542000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.316000,0.000000,13.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,14.086000>}
box{<0,0,-0.203200><0.701450,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.316000,0.000000,13.590000> }
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<17.514000,0.000000,15.886000>}
cylinder{<0,0,0><0,0.035000,0>0.228600 translate<19.812000,0.000000,15.886000>}
box{<0,0,-0.228600><2.298000,0.035000,0.228600> rotate<0,0.000000,0> translate<17.514000,0.000000,15.886000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,28.194000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<18.542000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.526000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,31.242000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.526000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,30.226000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,44.997030,0> translate<20.320000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,10.160000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,-90.000000,0> translate<21.452000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.812000,0.000000,14.086000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,12.446000>}
box{<0,0,-0.203200><2.319310,0.035000,0.203200> rotate<0,44.997030,0> translate<19.812000,0.000000,14.086000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,12.446000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.452000,0.000000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.288000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,8.382000>}
box{<0,0,-0.203200><4.669733,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.288000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.452000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,10.022000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,44.997030,0> translate<21.452000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,10.022000>}
box{<0,0,-0.203200><1.640000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.590000,0.000000,10.022000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.526000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.670000,0.000000,32.178000>}
box{<0,0,-0.203200><5.860501,0.035000,0.203200> rotate<0,44.997030,0> translate<17.526000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.542000,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,29.210000>}
box{<0,0,-0.203200><4.669733,0.035000,0.203200> rotate<0,44.997030,0> translate<18.542000,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,29.210000>}
box{<0,0,-0.203200><11.430000,0.035000,0.203200> rotate<0,90.000000,0> translate<21.844000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,3.556000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.828000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.828000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.146000,0.000000,7.398000>}
box{<0,0,-0.203200><3.278147,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.828000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.288000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.252000,0.000000,15.864000>}
box{<0,0,-0.304800><7.020156,0.035000,0.304800> rotate<0,44.997030,0> translate<18.288000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.252000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.252000,0.000000,15.864000>}
box{<0,0,-0.304800><3.672000,0.035000,0.304800> rotate<0,90.000000,0> translate<23.252000,0.000000,15.864000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.376000,0.000000,24.130000>}
box{<0,0,-0.152400><4.072000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.304000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.376000,0.000000,30.226000>}
box{<0,0,-0.152400><2.040000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.336000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.408000,0.000000,28.194000>}
box{<0,0,-0.203200><3.088000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.320000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.376000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.424000,0.000000,24.178000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.376000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.796000,0.000000,26.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,26.178000>}
box{<0,0,-0.203200><3.628000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.796000,0.000000,26.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.408000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,28.178000>}
box{<0,0,-0.203200><0.022627,0.035000,0.203200> rotate<0,44.997030,0> translate<23.408000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.376000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.424000,0.000000,30.178000>}
box{<0,0,-0.152400><0.067882,0.035000,0.152400> rotate<0,44.997030,0> translate<23.376000,0.000000,30.226000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.252000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.614000,0.000000,9.798000>}
box{<0,0,-0.203200><0.511945,0.035000,0.203200> rotate<0,44.997030,0> translate<23.252000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,8.382000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.590000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.252000,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.046000,0.000000,11.398000>}
box{<0,0,-0.203200><1.122886,0.035000,0.203200> rotate<0,44.997030,0> translate<23.252000,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.622000,0.000000,8.382000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.238000,0.000000,8.998000>}
box{<0,0,-0.203200><0.871156,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.622000,0.000000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.886000,0.000000,6.598000>}
box{<0,0,-0.203200><2.146776,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.368000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.572000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,-1.535000,5.080000>}
box{<0,0,-0.203200><29.455240,0.035000,0.203200> rotate<0,44.997030,0> translate<4.572000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.425400,0.000000,5.105400>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.400000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,12.223400>}
box{<0,0,-0.203200><4.540600,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.654000,0.000000,12.223400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.886000,0.000000,6.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,6.598000>}
box{<0,0,-0.203200><0.793400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.886000,0.000000,6.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.146000,0.000000,7.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,7.398000>}
box{<0,0,-0.203200><2.533400,0.035000,0.203200> rotate<0,0.000000,0> translate<23.146000,0.000000,7.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.238000,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,8.998000>}
box{<0,0,-0.203200><1.441400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.238000,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.614000,0.000000,9.798000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,9.798000>}
box{<0,0,-0.203200><2.065400,0.035000,0.203200> rotate<0,0.000000,0> translate<23.614000,0.000000,9.798000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.046000,0.000000,11.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,11.398000>}
box{<0,0,-0.203200><1.633400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.046000,0.000000,11.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,12.223400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,12.198000>}
box{<0,0,-0.203200><0.035921,0.035000,0.203200> rotate<0,44.997030,0> translate<25.654000,0.000000,12.223400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.679400,0.000000,11.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.711400,0.000000,11.430000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.679400,0.000000,11.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.664000,-1.535000,18.294000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.664000,-1.535000,26.156000>}
box{<0,0,-0.203200><7.862000,0.035000,0.203200> rotate<0,90.000000,0> translate<26.664000,-1.535000,26.156000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.440000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,0.000000,26.162000>}
box{<0,0,-0.203200><3.230000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.440000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.664000,-1.535000,26.156000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,26.162000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.664000,-1.535000,26.156000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.425400,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.172000,0.000000,5.105400>}
box{<0,0,-0.203200><1.746600,0.035000,0.203200> rotate<0,0.000000,0> translate<25.425400,0.000000,5.105400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.664000,0.000000,18.294000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.172000,0.000000,17.532000>}
box{<0,0,-0.203200><0.915810,0.035000,0.203200> rotate<0,56.306216,0> translate<26.664000,0.000000,18.294000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.172000,0.000000,13.690600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.172000,0.000000,17.532000>}
box{<0,0,-0.203200><3.841400,0.035000,0.203200> rotate<0,90.000000,0> translate<27.172000,0.000000,17.532000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.711400,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,11.430000>}
box{<0,0,-0.203200><1.466600,0.035000,0.203200> rotate<0,0.000000,0> translate<25.711400,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.424000,0.000000,28.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.194000,0.000000,28.178000>}
box{<0,0,-0.203200><3.770000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.424000,0.000000,28.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.504000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,22.098000>}
box{<0,0,-0.203200><4.182000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.504000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,23.876000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.686000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718000,-1.535000,20.034000>}
box{<0,0,-0.203200><0.224294,0.035000,0.203200> rotate<0,-81.792247,0> translate<27.686000,-1.535000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,2.286000>}
box{<0,0,-0.203200><4.572000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.368000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,7.620000>}
box{<0,0,-0.203200><6.858000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.940000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,24.130000>}
box{<0,0,-0.203200><4.468000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.472000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,24.130000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.686000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,7.588000>}
box{<0,0,-0.203200><0.045255,0.035000,0.203200> rotate<0,44.997030,0> translate<27.940000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,7.588000>}
box{<0,0,-0.203200><2.482600,0.035000,0.203200> rotate<0,90.000000,0> translate<27.972000,0.000000,7.588000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.718000,0.000000,20.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,19.780000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<27.718000,0.000000,20.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,13.690600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.972000,0.000000,19.780000>}
box{<0,0,-0.203200><6.089400,0.035000,0.203200> rotate<0,90.000000,0> translate<27.972000,0.000000,19.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.178000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.010000,0.000000,10.598000>}
box{<0,0,-0.203200><1.176626,0.035000,0.203200> rotate<0,44.997030,0> translate<27.178000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.098000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.194000,0.000000,3.556000>}
box{<0,0,-0.203200><6.096000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.098000,0.000000,3.556000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.848000,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.648000,0.000000,9.798000>}
box{<0,0,-0.203200><1.131371,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.848000,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.848000,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.718000,0.000000,8.128000>}
box{<0,0,-0.203200><1.230366,0.035000,0.203200> rotate<0,44.997030,0> translate<28.848000,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,-1.535000,16.764000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.654000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.226000,0.000000,0.254000>}
box{<0,0,-0.304800><13.716000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.510000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.226000,0.000000,0.878000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.226000,0.000000,0.254000>}
box{<0,0,-0.304800><0.624000,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.226000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.972000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,17.018000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.972000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.194000,0.000000,28.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,25.146000>}
box{<0,0,-0.203200><4.287896,0.035000,0.203200> rotate<0,44.997030,0> translate<27.194000,0.000000,28.178000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.226000,0.000000,25.146000>}
box{<0,0,-0.203200><8.128000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.226000,0.000000,25.146000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.844000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,9.144000>}
box{<0,0,-0.203200><12.213148,0.035000,0.203200> rotate<0,44.997030,0> translate<21.844000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,6.858000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.480000,-1.535000,9.144000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,90.000000,0> translate<30.480000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.172000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.172000,0.000000,3.880000>}
box{<0,0,-0.203200><1.225400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.172000,0.000000,3.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.972000,0.000000,5.105400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.972000,0.000000,4.096000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.972000,0.000000,4.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.172000,0.000000,3.880000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,2.794000>}
box{<0,0,-0.203200><1.535836,0.035000,0.203200> rotate<0,44.997030,0> translate<31.172000,0.000000,3.880000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.772000,0.000000,5.074000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.538000,0.000000,5.074000>}
box{<0,0,-0.203200><1.766000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.772000,0.000000,5.074000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.538000,0.000000,5.074000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,0.000000,5.080000>}
box{<0,0,-0.203200><0.008485,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.538000,0.000000,5.074000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,17.780000>}
box{<0,0,-0.203200><12.700000,0.035000,0.203200> rotate<0,90.000000,0> translate<34.544000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,11.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.274000,0.000000,11.398000>}
box{<0,0,-0.203200><1.009400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,11.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,6.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.312000,0.000000,6.598000>}
box{<0,0,-0.203200><1.047400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,6.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.472000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,30.226000>}
box{<0,0,-0.203200><12.088000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.472000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.274000,0.000000,11.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,11.938000>}
box{<0,0,-0.203200><0.763675,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.274000,0.000000,11.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,13.462000>}
box{<0,0,-0.203200><1.524000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.814000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,29.972000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<35.560000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,29.972000>}
box{<0,0,-0.203200><13.970000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.814000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,33.528000>}
box{<0,0,-0.203200><3.556000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.814000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,10.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.860000,0.000000,10.598000>}
box{<0,0,-0.203200><1.595400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,10.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,0.000000,2.794000>}
box{<0,0,-0.203200><4.064000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.258000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.546000,0.000000,8.998000>}
box{<0,0,-0.203200><2.281400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.322000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,2.286000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,44.997030,0> translate<36.322000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.312000,0.000000,6.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.830000,0.000000,5.080000>}
box{<0,0,-0.203200><2.146776,0.035000,0.203200> rotate<0,44.997030,0> translate<35.312000,0.000000,6.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,7.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.052000,0.000000,7.398000>}
box{<0,0,-0.203200><2.787400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,7.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.546000,0.000000,8.998000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,9.652000>}
box{<0,0,-0.203200><0.924896,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.546000,0.000000,8.998000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,9.652000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.200000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.546000>}
box{<0,0,-0.203200><0.392000,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.200000,0.000000,11.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.860000,0.000000,10.598000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.938000>}
box{<0,0,-0.203200><1.895046,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.860000,0.000000,10.598000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,12.308000>}
box{<0,0,-0.203200><0.370000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.200000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,14.986000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.814000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.314000,0.000000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,15.978000>}
box{<0,0,-0.203200><0.033941,0.035000,0.203200> rotate<0,44.997030,0> translate<37.314000,0.000000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.338000,0.000000,15.978000>}
box{<0,0,-0.203200><0.992000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.338000,0.000000,15.978000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.258000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,0.000000,3.810000>}
box{<0,0,-0.203200><5.588000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.258000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.264600,0.000000,8.198000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.916000,0.000000,8.198000>}
box{<0,0,-0.203200><3.651400,0.035000,0.203200> rotate<0,0.000000,0> translate<34.264600,0.000000,8.198000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,21.336000>}
box{<0,0,-0.203200><5.028943,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.544000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,-1.535000,21.336000>}
box{<0,0,-0.203200><0.254000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.846000,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.814000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,36.068000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.814000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.916000,0.000000,8.198000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,9.144000>}
box{<0,0,-0.203200><1.337846,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.916000,0.000000,8.198000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,9.514000>}
box{<0,0,-0.203200><0.370000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.862000,0.000000,9.514000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,22.098000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.100000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,9.514000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,9.652000>}
box{<0,0,-0.203200><0.195161,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.862000,0.000000,9.514000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,9.652000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.000000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.846000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,2.286000>}
box{<0,0,-0.203200><2.155261,0.035000,0.203200> rotate<0,44.997030,0> translate<37.846000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.052000,0.000000,7.398000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,5.080000>}
box{<0,0,-0.203200><3.278147,0.035000,0.203200> rotate<0,44.997030,0> translate<37.052000,0.000000,7.398000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,2.286000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.910000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,0.000000,5.980000>}
box{<0,0,-0.203200><5.192992,0.035000,0.203200> rotate<0,44.997030,0> translate<39.000000,0.000000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672000,0.000000,5.980000>}
box{<0,0,-0.203200><1.179256,0.035000,0.203200> rotate<0,-49.743240,0> translate<41.910000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.200000,0.000000,12.308000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,0.000000,18.034000>}
box{<0,0,-0.203200><8.097787,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.200000,0.000000,12.308000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.862000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.044000,0.000000,22.098000>}
box{<0,0,-0.203200><4.182000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.862000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.044000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.124000,0.000000,22.178000>}
box{<0,0,-0.203200><0.113137,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.044000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.226000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,0.000000,0.254000>}
box{<0,0,-0.304800><12.954000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.226000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,0.000000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,0.000000,1.524000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.180000,0.000000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,0.000000,2.286000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,0.000000,1.524000>}
box{<0,0,-0.304800><0.762000,0.035000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,1.524000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,0.000000,2.286000>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,-90.000000,0> translate<44.450000,0.000000,2.286000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.958000,0.000000,18.034000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<42.926000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.594000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.594000,0.000000,12.064000>}
box{<0,0,-0.203200><2.414000,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.594000,0.000000,12.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.000000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,11.938000>}
box{<0,0,-0.203200><6.720000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.000000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.594000,0.000000,12.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,11.938000>}
box{<0,0,-0.203200><0.178191,0.035000,0.203200> rotate<0,44.997030,0> translate<45.594000,0.000000,12.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.594000,0.000000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,17.006000>}
box{<0,0,-0.203200><3.575132,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.594000,0.000000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,17.006000>}
box{<0,0,-0.203200><2.298000,0.035000,0.203200> rotate<0,-90.000000,0> translate<48.122000,0.000000,17.006000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.958000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.122000,0.000000,21.198000>}
box{<0,0,-0.203200><4.474572,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.958000,0.000000,18.034000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.246000,0.000000,34.178000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.150000,0.000000,34.036000>}
box{<0,0,-0.203200><0.915085,0.035000,0.203200> rotate<0,8.926466,0> translate<48.246000,0.000000,34.178000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.408000,0.000000,25.516000>}
box{<0,0,-0.203200><3.037731,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.260000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.408000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.408000,0.000000,25.516000>}
box{<0,0,-0.203200><5.218000,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.408000,0.000000,25.516000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.150000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.408000,0.000000,32.778000>}
box{<0,0,-0.203200><1.779081,0.035000,0.203200> rotate<0,44.997030,0> translate<49.150000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.408000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.408000,0.000000,32.778000>}
box{<0,0,-0.203200><2.044000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.408000,0.000000,32.778000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,20.436000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,15.632000>}
box{<0,0,-0.203200><4.804000,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.070000,0.000000,15.632000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.314000,0.000000,22.236000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,22.236000>}
box{<0,0,-0.203200><1.756000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.314000,0.000000,22.236000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.208000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,30.238000>}
box{<0,0,-0.203200><0.551888,0.035000,0.203200> rotate<0,63.987879,0> translate<52.208000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,30.238000>}
box{<0,0,-0.203200><3.798000,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.450000,0.000000,30.238000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,35.940000>}
box{<0,0,-0.203200><1.904000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.450000,0.000000,35.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.578000,0.000000,36.068000>}
box{<0,0,-0.203200><14.224000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.354000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.450000,0.000000,35.940000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.578000,0.000000,36.068000>}
box{<0,0,-0.203200><0.181019,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.450000,0.000000,35.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.448000,-1.535000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,-1.535000,0.254000>}
box{<0,0,-0.203200><24.384000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.448000,-1.535000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.864000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<54.864000,-1.535000,8.382000>}
box{<0,0,-0.635000><21.590000,0.035000,0.635000> rotate<0,-90.000000,0> translate<54.864000,-1.535000,8.382000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.578000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,36.068000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.578000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,22.236000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.538000,0.000000,25.704000>}
box{<0,0,-0.203200><4.904493,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.070000,0.000000,22.236000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,0.000000,11.938000>}
box{<0,0,-0.203200><10.414000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.720000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,0.000000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.404000,0.000000,10.668000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<56.134000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,0.000000,13.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.270000,0.000000,13.832000>}
box{<0,0,-0.203200><7.200000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.070000,0.000000,13.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,-1.535000,0.254000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,7.620000>}
box{<0,0,-0.203200><10.417097,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.832000,-1.535000,0.254000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,12.904000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,-1.535000,7.620000>}
box{<0,0,-0.203200><5.284000,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.198000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.270000,0.000000,13.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,0.000000,12.904000>}
box{<0,0,-0.203200><1.312390,0.035000,0.203200> rotate<0,44.997030,0> translate<59.270000,0.000000,13.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.538000,0.000000,25.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.198000,0.000000,25.704000>}
box{<0,0,-0.203200><4.660000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.538000,0.000000,25.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.404000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.722000,0.000000,10.668000>}
box{<0,0,-0.203200><4.318000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.404000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.722000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.992000,0.000000,11.938000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.722000,0.000000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.992000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.992000,0.000000,11.938000>}
box{<0,0,-0.203200><16.256000,0.035000,0.203200> rotate<0,-90.000000,0> translate<62.992000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.118000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.992000,0.000000,28.194000>}
box{<0,0,-0.203200><11.135518,0.035000,0.203200> rotate<0,44.997030,0> translate<55.118000,0.000000,36.068000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,2.925413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,34.920584>}
box{<0,0,-0.203200><31.995172,0.035000,0.203200> rotate<0,90.000000,0> translate<-0.660400,0.000000,34.920584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,2.925413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.068163,0.000000,3.227197>}
box{<0,0,-0.203200><0.788592,0.035000,0.203200> rotate<0,-22.498777,0> translate<-0.660400,0.000000,2.925413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.773469,0.000000,3.251200>}
box{<0,0,-0.203200><15.433869,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,3.657600>}
box{<0,0,-0.203200><15.494000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.824269,0.000000,4.064000>}
box{<0,0,-0.203200><15.484669,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.110441,0.000000,4.470400>}
box{<0,0,-0.203200><2.770841,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.704044,0.000000,4.876800>}
box{<0,0,-0.203200><2.364444,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.297644,0.000000,5.283200>}
box{<0,0,-0.203200><1.958044,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.891244,0.000000,5.689600>}
box{<0,0,-0.203200><1.551644,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.490678,0.000000,6.096000>}
box{<0,0,-0.203200><1.151078,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,6.502400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,6.908800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,7.315200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,7.721600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,8.128000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,8.534400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,8.940800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,9.347200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,9.753600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,10.160000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,10.566400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,10.972800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,11.379200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,11.785600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,12.192000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,12.598400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,13.004800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,13.411200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,13.817600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,14.224000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,14.630400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,15.036800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,15.443200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,15.849600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,16.256000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,16.662400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,17.068800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,17.475200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,17.881600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,18.288000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,18.694400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,19.100800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,19.507200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,19.913600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,20.320000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,20.726400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,21.132800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,21.539200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,21.945600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,22.352000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,22.758400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,23.164800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,23.571200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,23.977600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,24.384000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,24.790400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,25.196800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,25.603200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,26.009600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,26.416000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,26.822400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,27.228800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,27.635200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,28.041600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,28.448000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,28.854400>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,29.260800>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,29.667200>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,30.073600>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.346316,0.000000,30.480000>}
box{<0,0,-0.203200><1.006716,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.431803,0.000000,30.886400>}
box{<0,0,-0.203200><1.092203,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.736606,0.000000,31.292800>}
box{<0,0,-0.203200><1.397006,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.041403,0.000000,31.699200>}
box{<0,0,-0.203200><1.701803,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.346203,0.000000,32.105600>}
box{<0,0,-0.203200><2.006603,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.651003,0.000000,32.512000>}
box{<0,0,-0.203200><2.311403,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.955803,0.000000,32.918400>}
box{<0,0,-0.203200><2.616203,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.366841,0.000000,33.324800>}
box{<0,0,-0.203200><3.027241,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.570022,0.000000,33.731200>}
box{<0,0,-0.203200><18.230422,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.560925,0.000000,34.137600>}
box{<0,0,-0.203200><19.221325,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.220775,0.000000,34.544000>}
box{<0,0,-0.203200><6.881175,0.035000,0.203200> rotate<0,0.000000,0> translate<-0.660400,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<-0.660400,0.000000,34.920584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.068163,0.000000,34.618800>}
box{<0,0,-0.203200><0.788592,0.035000,0.203200> rotate<0,22.498777,0> translate<-0.660400,0.000000,34.920584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.068163,0.000000,3.227197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.947834,0.000000,3.227197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<0.068163,0.000000,3.227197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.068163,0.000000,34.618800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.947834,0.000000,34.618800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<0.068163,0.000000,34.618800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.339069,0.000000,30.530741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,30.415019>}
box{<0,0,-0.203200><0.116897,0.035000,0.203200> rotate<0,81.864711,0> translate<0.339069,0.000000,30.530741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.339069,0.000000,30.530741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,30.595266>}
box{<0,0,-0.203200><0.066609,0.035000,0.203200> rotate<0,-75.624964,0> translate<0.339069,0.000000,30.530741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,6.422112>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.494809,0.000000,6.086031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<0.355600,0.000000,6.422112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,30.415019>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,6.422112>}
box{<0,0,-0.203200><23.992906,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.355600,0.000000,6.422112> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,30.661884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,30.595266>}
box{<0,0,-0.203200><0.066619,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.355600,0.000000,30.595266> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.355600,0.000000,30.661884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.400341,0.000000,30.769891>}
box{<0,0,-0.203200><0.116906,0.035000,0.203200> rotate<0,-67.494200,0> translate<0.355600,0.000000,30.661884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.400341,0.000000,30.769891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.429350,0.000000,30.883131>}
box{<0,0,-0.203200><0.116897,0.035000,0.203200> rotate<0,-75.626282,0> translate<0.400341,0.000000,30.769891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.429350,0.000000,30.883131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.469319,0.000000,30.936419>}
box{<0,0,-0.203200><0.066611,0.035000,0.203200> rotate<0,-53.124446,0> translate<0.429350,0.000000,30.883131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.469319,0.000000,30.936419>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.494809,0.000000,30.997966>}
box{<0,0,-0.203200><0.066617,0.035000,0.203200> rotate<0,-67.497870,0> translate<0.469319,0.000000,30.936419> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.494809,0.000000,6.086031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.752031,0.000000,5.828809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<0.494809,0.000000,6.086031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.494809,0.000000,30.997966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.577475,0.000000,31.080628>}
box{<0,0,-0.203200><0.116905,0.035000,0.203200> rotate<0,-44.995947,0> translate<0.494809,0.000000,30.997966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.577475,0.000000,31.080628>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.993319,0.000000,32.968425>}
box{<0,0,-0.203200><2.359744,0.035000,0.203200> rotate<0,-53.126672,0> translate<0.577475,0.000000,31.080628> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.752031,0.000000,5.828809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.752034,0.000000,5.828809>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<0.752031,0.000000,5.828809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.752034,0.000000,5.828809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,4.562034>}
box{<0,0,-0.203200><1.791490,0.035000,0.203200> rotate<0,44.997030,0> translate<0.752034,0.000000,5.828809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.947834,0.000000,3.227197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.760544,0.000000,2.890563>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<0.947834,0.000000,3.227197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.947834,0.000000,34.618800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.760544,0.000000,34.955434>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<0.947834,0.000000,34.618800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.748387,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.688797,0.000000,34.950400>}
box{<0,0,-0.203200><3.940409,0.035000,0.203200> rotate<0,0.000000,0> translate<1.748387,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.760544,0.000000,2.890563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.382563,0.000000,2.268544>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<1.760544,0.000000,2.890563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.760544,0.000000,34.955434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.382563,0.000000,35.577453>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<1.760544,0.000000,34.955434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.806306,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.376400,0.000000,2.844800>}
box{<0,0,-0.203200><12.570094,0.035000,0.203200> rotate<0,0.000000,0> translate<1.806306,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.993319,0.000000,32.968425>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,33.029966>}
box{<0,0,-0.203200><0.066611,0.035000,0.203200> rotate<0,-67.495813,0> translate<1.993319,0.000000,32.968425> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,4.562031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.276031,0.000000,4.304809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<2.018809,0.000000,4.562031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,4.562034>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,4.562031>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.018809,0.000000,4.562031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.018809,0.000000,33.029966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.101469,0.000000,33.112622>}
box{<0,0,-0.203200><0.116896,0.035000,0.203200> rotate<0,-44.995947,0> translate<2.018809,0.000000,33.029966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.101469,0.000000,33.112622>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.171609,0.000000,33.206147>}
box{<0,0,-0.203200><0.116904,0.035000,0.203200> rotate<0,-53.127821,0> translate<2.101469,0.000000,33.112622> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.161909,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,35.356800>}
box{<0,0,-0.203200><3.406491,0.035000,0.203200> rotate<0,0.000000,0> translate<2.161909,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.171609,0.000000,33.206147>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.228931,0.000000,33.240084>}
box{<0,0,-0.203200><0.066615,0.035000,0.203200> rotate<0,-30.625695,0> translate<2.171609,0.000000,33.206147> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,6.982753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,30.175197>}
box{<0,0,-0.203200><23.192444,0.035000,0.203200> rotate<0,90.000000,0> translate<2.184397,0.000000,30.175197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,6.982753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.172753,0.000000,5.994397>}
box{<0,0,-0.203200><1.397747,0.035000,0.203200> rotate<0,44.997030,0> translate<2.184397,0.000000,6.982753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.922019,0.000000,7.315200>}
box{<0,0,-0.203200><7.737622,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683750,0.000000,7.721600>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683750,0.000000,8.128000>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683750,0.000000,8.534400>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683750,0.000000,8.940800>}
box{<0,0,-0.203200><7.499353,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.820422,0.000000,9.347200>}
box{<0,0,-0.203200><7.636025,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.226822,0.000000,9.753600>}
box{<0,0,-0.203200><8.042425,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.633222,0.000000,10.160000>}
box{<0,0,-0.203200><8.448825,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.566400>}
box{<0,0,-0.203200><20.058003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.280322,0.000000,10.972800>}
box{<0,0,-0.203200><20.095925,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.280316,0.000000,11.379200>}
box{<0,0,-0.203200><20.095919,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,11.785600>}
box{<0,0,-0.203200><20.058003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.975894,0.000000,12.192000>}
box{<0,0,-0.203200><8.791497,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728400,0.000000,12.598400>}
box{<0,0,-0.203200><8.544003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.271594,0.000000,13.004800>}
box{<0,0,-0.203200><0.087197,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,13.411200>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,13.817600>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,14.224000>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,14.630400>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,15.036800>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,15.443200>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,15.849600>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,16.256000>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,16.662400>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,17.068800>}
box{<0,0,-0.203200><0.040003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.271600,0.000000,17.475200>}
box{<0,0,-0.203200><0.087203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,17.881600>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,18.288000>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,18.694400>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,19.100800>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,19.507200>}
box{<0,0,-0.203200><0.735203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.648294,0.000000,19.913600>}
box{<0,0,-0.203200><0.463897,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,20.320000>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,20.726400>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,21.132800>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,21.539200>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,21.945600>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,22.352000>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,22.758400>}
box{<0,0,-0.203200><0.290003,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.558712,0.000000,23.164800>}
box{<0,0,-0.203200><0.374316,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.895600,0.000000,23.571200>}
box{<0,0,-0.203200><0.711203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.895600,0.000000,23.977600>}
box{<0,0,-0.203200><0.711203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.030684,0.000000,24.384000>}
box{<0,0,-0.203200><0.846288,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.431244,0.000000,24.790400>}
box{<0,0,-0.203200><1.246847,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.837644,0.000000,25.196800>}
box{<0,0,-0.203200><1.653247,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.244044,0.000000,25.603200>}
box{<0,0,-0.203200><2.059647,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.650444,0.000000,26.009600>}
box{<0,0,-0.203200><2.466047,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.056844,0.000000,26.416000>}
box{<0,0,-0.203200><2.872447,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,26.822400>}
box{<0,0,-0.203200><3.733803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,27.228800>}
box{<0,0,-0.203200><3.733803,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.084797,0.000000,27.635200>}
box{<0,0,-0.203200><3.900400,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.673619,0.000000,28.041600>}
box{<0,0,-0.203200><1.489222,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.267219,0.000000,28.448000>}
box{<0,0,-0.203200><1.082822,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.860819,0.000000,28.854400>}
box{<0,0,-0.203200><0.676422,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.571750,0.000000,29.260800>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.571750,0.000000,29.667200>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.571750,0.000000,30.073600>}
box{<0,0,-0.203200><0.387353,0.035000,0.203200> rotate<0,0.000000,0> translate<2.184397,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.184397,0.000000,30.175197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.571750,0.000000,30.691672>}
box{<0,0,-0.203200><0.645592,0.035000,0.203200> rotate<0,-53.126818,0> translate<2.184397,0.000000,30.175197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.212706,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.376400,0.000000,2.438400>}
box{<0,0,-0.203200><12.163694,0.035000,0.203200> rotate<0,0.000000,0> translate<2.212706,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,13.118741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.317206,0.000000,12.894687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<2.224400,0.000000,13.118741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,17.361256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,13.118741>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.224400,0.000000,13.118741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.224400,0.000000,17.361256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.317206,0.000000,17.585309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<2.224400,0.000000,17.361256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.228931,0.000000,33.240084>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.276031,0.000000,33.287188>}
box{<0,0,-0.203200><0.066612,0.035000,0.203200> rotate<0,-44.998931,0> translate<2.228931,0.000000,33.240084> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.258350,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.328419,0.000000,6.908800>}
box{<0,0,-0.203200><8.070069,0.035000,0.203200> rotate<0,0.000000,0> translate<2.258350,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.276031,0.000000,4.304809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.612113,0.000000,4.165600>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,22.498510,0> translate<2.276031,0.000000,4.304809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.276031,0.000000,33.287188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.384034,0.000000,33.331922>}
box{<0,0,-0.203200><0.116901,0.035000,0.203200> rotate<0,-22.497617,0> translate<2.276031,0.000000,33.287188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.317206,0.000000,12.894687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.488688,0.000000,12.723206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<2.317206,0.000000,12.894687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.317206,0.000000,17.585309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.488688,0.000000,17.756791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.317206,0.000000,17.585309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.382563,0.000000,2.268544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,1.455834>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<2.382563,0.000000,2.268544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.382563,0.000000,35.577453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,36.390163>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<2.382563,0.000000,35.577453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.384034,0.000000,33.331922>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.484625,0.000000,33.391484>}
box{<0,0,-0.203200><0.116902,0.035000,0.203200> rotate<0,-30.628931,0> translate<2.384034,0.000000,33.331922> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.412997,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.571750,0.000000,30.480000>}
box{<0,0,-0.203200><0.158753,0.035000,0.203200> rotate<0,0.000000,0> translate<2.412997,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.417413,0.000000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,0.576163>}
box{<0,0,-0.203200><0.788592,0.035000,0.203200> rotate<0,-67.495283,0> translate<2.417413,0.000000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.417413,0.000000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.623247,0.000000,-0.152400>}
box{<0,0,-0.203200><13.205834,0.035000,0.203200> rotate<0,0.000000,0> translate<2.417413,0.000000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.417413,0.000000,37.998400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,37.269834>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,67.495370,0> translate<2.417413,0.000000,37.998400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.417413,0.000000,37.998400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.975513,0.000000,37.998400>}
box{<0,0,-0.203200><3.558100,0.035000,0.203200> rotate<0,0.000000,0> translate<2.417413,0.000000,37.998400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.459500,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,35.763200>}
box{<0,0,-0.203200><3.108900,0.035000,0.203200> rotate<0,0.000000,0> translate<2.459500,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,20.218741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.567206,0.000000,19.994688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<2.474400,0.000000,20.218741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,22.961256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,20.218741>}
box{<0,0,-0.203200><2.742516,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.474400,0.000000,20.218741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.474400,0.000000,22.961256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.567206,0.000000,23.185309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<2.474400,0.000000,22.961256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.480538,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.470844,0.000000,0.000000>}
box{<0,0,-0.203200><12.990306,0.035000,0.203200> rotate<0,0.000000,0> translate<2.480538,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.480544,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.376400,0.000000,2.032000>}
box{<0,0,-0.203200><11.895856,0.035000,0.203200> rotate<0,0.000000,0> translate<2.480544,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.484625,0.000000,33.391484>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.550572,0.000000,33.400903>}
box{<0,0,-0.203200><0.066616,0.035000,0.203200> rotate<0,-8.127665,0> translate<2.484625,0.000000,33.391484> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.488688,0.000000,12.723206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.712741,0.000000,12.630400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<2.488688,0.000000,12.723206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.488688,0.000000,17.756791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.712741,0.000000,17.849597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<2.488688,0.000000,17.756791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.501584,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.764834,0.000000,37.795200>}
box{<0,0,-0.203200><3.263250,0.035000,0.203200> rotate<0,0.000000,0> translate<2.501584,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.550572,0.000000,33.400903>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.612113,0.000000,33.426397>}
box{<0,0,-0.203200><0.066612,0.035000,0.203200> rotate<0,-22.500731,0> translate<2.550572,0.000000,33.400903> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.567206,0.000000,19.994688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.738688,0.000000,19.823206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<2.567206,0.000000,19.994688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.567206,0.000000,23.185309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.738688,0.000000,23.356791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.567206,0.000000,23.185309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.571750,0.000000,29.143469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.743469,0.000000,27.971750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<2.571750,0.000000,29.143469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.571750,0.000000,30.691672>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.571750,0.000000,29.143469>}
box{<0,0,-0.203200><1.548203,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.571750,0.000000,29.143469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.612113,0.000000,4.165600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.722669,0.000000,4.165600>}
box{<0,0,-0.203200><12.110556,0.035000,0.203200> rotate<0,0.000000,0> translate<2.612113,0.000000,4.165600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.612113,0.000000,33.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.729019,0.000000,33.426397>}
box{<0,0,-0.203200><0.116906,0.035000,0.203200> rotate<0,0.000000,0> translate<2.612113,0.000000,33.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.627834,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,36.169600>}
box{<0,0,-0.203200><2.940566,0.035000,0.203200> rotate<0,0.000000,0> translate<2.627834,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.648875,0.000000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.064441,0.000000,0.406400>}
box{<0,0,-0.203200><12.415566,0.035000,0.203200> rotate<0,0.000000,0> translate<2.648875,0.000000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.648878,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.468666,0.000000,1.625600>}
box{<0,0,-0.203200><11.819788,0.035000,0.203200> rotate<0,0.000000,0> translate<2.648878,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.664750,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.734819,0.000000,6.502400>}
box{<0,0,-0.203200><8.070069,0.035000,0.203200> rotate<0,0.000000,0> translate<2.664750,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.669922,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,37.388800>}
box{<0,0,-0.203200><2.898478,0.035000,0.203200> rotate<0,0.000000,0> translate<2.669922,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.712741,0.000000,12.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.955256,0.000000,12.630400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<2.712741,0.000000,12.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.712741,0.000000,17.849597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,17.849597>}
box{<0,0,-0.203200><0.206859,0.035000,0.203200> rotate<0,0.000000,0> translate<2.712741,0.000000,17.849597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,0.576163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,1.455834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<2.719197,0.000000,1.455834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.842425,0.000000,0.812800>}
box{<0,0,-0.203200><12.123228,0.035000,0.203200> rotate<0,0.000000,0> translate<2.719197,0.000000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,1.219200>}
box{<0,0,-0.203200><12.114403,0.035000,0.203200> rotate<0,0.000000,0> translate<2.719197,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,36.390163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,37.269834>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,90.000000,0> translate<2.719197,0.000000,37.269834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,36.576000>}
box{<0,0,-0.203200><2.849203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.719197,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.719197,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,36.982400>}
box{<0,0,-0.203200><2.849203,0.035000,0.203200> rotate<0,0.000000,0> translate<2.719197,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.729019,0.000000,33.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.844741,0.000000,33.442928>}
box{<0,0,-0.203200><0.116897,0.035000,0.203200> rotate<0,-8.129349,0> translate<2.729019,0.000000,33.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.738688,0.000000,19.823206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,19.748272>}
box{<0,0,-0.203200><0.195817,0.035000,0.203200> rotate<0,22.497965,0> translate<2.738688,0.000000,19.823206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.738688,0.000000,23.356791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.895600,0.000000,23.421784>}
box{<0,0,-0.203200><0.169840,0.035000,0.203200> rotate<0,-22.498037,0> translate<2.738688,0.000000,23.356791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.844741,0.000000,33.442928>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.909266,0.000000,33.426397>}
box{<0,0,-0.203200><0.066609,0.035000,0.203200> rotate<0,14.369096,0> translate<2.844741,0.000000,33.442928> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.895600,0.000000,24.057884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.895600,0.000000,23.421784>}
box{<0,0,-0.203200><0.636100,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.895600,0.000000,23.421784> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.895600,0.000000,24.057884>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.034809,0.000000,24.393966>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-67.495551,0> translate<2.895600,0.000000,24.057884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.909266,0.000000,33.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658513,0.000000,33.426397>}
box{<0,0,-0.203200><9.749247,0.035000,0.203200> rotate<0,0.000000,0> translate<2.909266,0.000000,33.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,19.748272>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.919600,0.000000,17.849597>}
box{<0,0,-0.203200><1.898675,0.035000,0.203200> rotate<0,-90.000000,0> translate<2.919600,0.000000,17.849597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.034809,0.000000,24.393966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.324031,0.000000,26.683188>}
box{<0,0,-0.203200><3.237449,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.034809,0.000000,24.393966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.071150,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.824272,0.000000,6.096000>}
box{<0,0,-0.203200><11.753122,0.035000,0.203200> rotate<0,0.000000,0> translate<3.071150,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.172753,0.000000,5.994397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.722669,0.000000,5.994397>}
box{<0,0,-0.203200><11.549916,0.035000,0.203200> rotate<0,0.000000,0> translate<3.172753,0.000000,5.994397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.743469,0.000000,27.971750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.400528,0.000000,27.971750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<3.743469,0.000000,27.971750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.955256,0.000000,12.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.179309,0.000000,12.723206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<4.955256,0.000000,12.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.179309,0.000000,12.723206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,0.000000,12.877897>}
box{<0,0,-0.203200><0.218766,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.179309,0.000000,12.723206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.324031,0.000000,26.683188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.660113,0.000000,26.822397>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,-22.498510,0> translate<5.324031,0.000000,26.683188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,0.000000,12.877897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.488688,0.000000,12.723206>}
box{<0,0,-0.203200><0.218763,0.035000,0.203200> rotate<0,44.997609,0> translate<5.334000,0.000000,12.877897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.400528,0.000000,27.971750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.758591,0.000000,28.329813>}
box{<0,0,-0.203200><0.506377,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.400528,0.000000,27.971750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.470378,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.293844,0.000000,28.041600>}
box{<0,0,-0.203200><0.823466,0.035000,0.203200> rotate<0,0.000000,0> translate<5.470378,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.488688,0.000000,12.723206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.712741,0.000000,12.630400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<5.488688,0.000000,12.723206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,35.241066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.706878,0.000000,34.906753>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<5.568400,0.000000,35.241066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,37.402931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,35.241066>}
box{<0,0,-0.203200><2.161866,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.568400,0.000000,35.241066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.568400,0.000000,37.402931>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.706878,0.000000,37.737244>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<5.568400,0.000000,37.402931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.660113,0.000000,26.822397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,26.822397>}
box{<0,0,-0.203200><0.258088,0.035000,0.203200> rotate<0,0.000000,0> translate<5.660113,0.000000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.706878,0.000000,34.906753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.962753,0.000000,34.650878>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<5.706878,0.000000,34.906753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.706878,0.000000,37.737244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.962753,0.000000,37.993119>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.706878,0.000000,37.737244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.712741,0.000000,12.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.955256,0.000000,12.630400>}
box{<0,0,-0.203200><2.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<5.712741,0.000000,12.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.758591,0.000000,28.329813>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.694809,0.000000,27.825697>}
box{<0,0,-0.203200><1.063315,0.035000,0.203200> rotate<0,28.298785,0> translate<5.758591,0.000000,28.329813> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,27.337356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,26.822397>}
box{<0,0,-0.203200><0.514959,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.918200,0.000000,26.822397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918200,0.000000,27.337356>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.011006,0.000000,27.561409>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<5.918200,0.000000,27.337356> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.962753,0.000000,34.650878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.297066,0.000000,34.512400>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,22.498713,0> translate<5.962753,0.000000,34.650878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.962753,0.000000,37.993119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.975513,0.000000,37.998400>}
box{<0,0,-0.203200><0.013809,0.035000,0.203200> rotate<0,-22.483734,0> translate<5.962753,0.000000,37.993119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.011006,0.000000,27.561409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.182488,0.000000,27.732891>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.011006,0.000000,27.561409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.182488,0.000000,27.732891>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.406541,0.000000,27.825697>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<6.182488,0.000000,27.732891> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,18.920756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,23.215600>}
box{<0,0,-0.203200><4.294844,0.035000,0.203200> rotate<0,90.000000,0> translate<6.248397,0.000000,23.215600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,18.920756>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.319553,0.000000,17.849597>}
box{<0,0,-0.203200><1.514846,0.035000,0.203200> rotate<0,44.997114,0> translate<6.248397,0.000000,18.920756> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.597638,0.000000,19.100800>}
box{<0,0,-0.203200><2.349241,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,19.507200>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,19.913600>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,20.320000>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,20.726400>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,21.132800>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,21.539200>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,21.945600>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,22.352000>}
box{<0,0,-0.203200><2.235203,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.460441,0.000000,22.758400>}
box{<0,0,-0.203200><2.212044,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.054041,0.000000,23.164800>}
box{<0,0,-0.203200><1.805644,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.248397,0.000000,23.215600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.003241,0.000000,23.215600>}
box{<0,0,-0.203200><1.754844,0.035000,0.203200> rotate<0,0.000000,0> translate<6.248397,0.000000,23.215600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.297066,0.000000,34.512400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.958931,0.000000,34.512400>}
box{<0,0,-0.203200><3.661866,0.035000,0.203200> rotate<0,0.000000,0> translate<6.297066,0.000000,34.512400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.406541,0.000000,27.825697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.694809,0.000000,27.825697>}
box{<0,0,-0.203200><0.288269,0.035000,0.203200> rotate<0,0.000000,0> translate<6.406541,0.000000,27.825697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.474753,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.093472,0.000000,18.694400>}
box{<0,0,-0.203200><2.618719,0.035000,0.203200> rotate<0,0.000000,0> translate<6.474753,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.881153,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.849600,0.000000,18.288000>}
box{<0,0,-0.203200><8.968447,0.035000,0.203200> rotate<0,0.000000,0> translate<6.881153,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.287553,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.789497,0.000000,17.881600>}
box{<0,0,-0.203200><7.501944,0.035000,0.203200> rotate<0,0.000000,0> translate<7.287553,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.319553,0.000000,17.849597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.955256,0.000000,17.849597>}
box{<0,0,-0.203200><0.635703,0.035000,0.203200> rotate<0,0.000000,0> translate<7.319553,0.000000,17.849597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.955256,0.000000,12.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.179309,0.000000,12.723206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<7.955256,0.000000,12.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.955256,0.000000,17.849597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.179309,0.000000,17.756791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<7.955256,0.000000,17.849597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.003241,0.000000,23.215600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,22.735241>}
box{<0,0,-0.203200><0.679331,0.035000,0.203200> rotate<0,44.997030,0> translate<8.003241,0.000000,23.215600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.179309,0.000000,12.723206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.350791,0.000000,12.894687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.179309,0.000000,12.723206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.179309,0.000000,17.756791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.350791,0.000000,17.585309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<8.179309,0.000000,17.756791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.350791,0.000000,12.894687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,13.118741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<8.350791,0.000000,12.894687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.350791,0.000000,17.585309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,17.361256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<8.350791,0.000000,17.585309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.396400,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728400,0.000000,13.004800>}
box{<0,0,-0.203200><2.332000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.396400,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.396400,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.463809,0.000000,17.475200>}
box{<0,0,-0.203200><3.067409,0.035000,0.203200> rotate<0,0.000000,0> translate<8.396400,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,13.118741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,14.294294>}
box{<0,0,-0.203200><1.175553,0.035000,0.203200> rotate<0,90.000000,0> translate<8.443597,0.000000,14.294294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728400,0.000000,13.411200>}
box{<0,0,-0.203200><2.284803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.443597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.259294,0.000000,13.817600>}
box{<0,0,-0.203200><1.815697,0.035000,0.203200> rotate<0,0.000000,0> translate<8.443597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.224000>}
box{<0,0,-0.203200><1.709803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.443597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,14.294294>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.446003,0.000000,14.315056>}
box{<0,0,-0.203200><0.020901,0.035000,0.203200> rotate<0,-83.383749,0> translate<8.443597,0.000000,14.294294> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,14.323503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,15.092906>}
box{<0,0,-0.203200><0.769403,0.035000,0.203200> rotate<0,90.000000,0> translate<8.443597,0.000000,15.092906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,14.323503>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.446003,0.000000,14.315056>}
box{<0,0,-0.203200><0.008783,0.035000,0.203200> rotate<0,74.094518,0> translate<8.443597,0.000000,14.323503> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,14.630400>}
box{<0,0,-0.203200><1.706603,0.035000,0.203200> rotate<0,0.000000,0> translate<8.443597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.036800>}
box{<0,0,-0.203200><1.706603,0.035000,0.203200> rotate<0,0.000000,0> translate<8.443597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,15.092906>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.534397,0.000000,15.312113>}
box{<0,0,-0.203200><0.237268,0.035000,0.203200> rotate<0,-67.495144,0> translate<8.443597,0.000000,15.092906> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,16.657091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,17.361256>}
box{<0,0,-0.203200><0.704166,0.035000,0.203200> rotate<0,90.000000,0> translate<8.443597,0.000000,17.361256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,16.657091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.534397,0.000000,16.437884>}
box{<0,0,-0.203200><0.237268,0.035000,0.203200> rotate<0,67.495144,0> translate<8.443597,0.000000,16.657091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.651009,0.000000,16.662400>}
box{<0,0,-0.203200><2.207413,0.035000,0.203200> rotate<0,0.000000,0> translate<8.443597,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.443597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.057409,0.000000,17.068800>}
box{<0,0,-0.203200><2.613812,0.035000,0.203200> rotate<0,0.000000,0> translate<8.443597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,19.376113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.622809,0.000000,19.040031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<8.483600,0.000000,19.376113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,22.735241>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,0.000000,19.376113>}
box{<0,0,-0.203200><3.359128,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,0.000000,19.376113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.534397,0.000000,15.312113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.534397,0.000000,16.437884>}
box{<0,0,-0.203200><1.125772,0.035000,0.203200> rotate<0,90.000000,0> translate<8.534397,0.000000,16.437884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.534397,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.443200>}
box{<0,0,-0.203200><1.615803,0.035000,0.203200> rotate<0,0.000000,0> translate<8.534397,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.534397,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.124800,0.000000,15.849600>}
box{<0,0,-0.203200><1.590403,0.035000,0.203200> rotate<0,0.000000,0> translate<8.534397,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.534397,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.249181,0.000000,16.256000>}
box{<0,0,-0.203200><1.714784,0.035000,0.203200> rotate<0,0.000000,0> translate<8.534397,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.622809,0.000000,19.040031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.880031,0.000000,18.782809>}
box{<0,0,-0.203200><0.363767,0.035000,0.203200> rotate<0,44.997030,0> translate<8.622809,0.000000,19.040031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.880031,0.000000,18.782809>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.125319,0.000000,18.681209>}
box{<0,0,-0.203200><0.265497,0.035000,0.203200> rotate<0,22.498234,0> translate<8.880031,0.000000,18.782809> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.125319,0.000000,18.681209>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.191584,0.000000,18.614941>}
box{<0,0,-0.203200><0.093716,0.035000,0.203200> rotate<0,44.998381,0> translate<9.125319,0.000000,18.681209> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.191584,0.000000,18.614941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.490322,0.000000,18.491200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<9.191584,0.000000,18.614941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.490322,0.000000,18.491200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.591675,0.000000,18.491200>}
box{<0,0,-0.203200><2.101353,0.035000,0.203200> rotate<0,0.000000,0> translate<9.490322,0.000000,18.491200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.855469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<9.683750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.683750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.683750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.855469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.683750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.958931,0.000000,34.512400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.293244,0.000000,34.650878>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-22.498713,0> translate<9.958931,0.000000,34.512400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.035219,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.154525,0.000000,34.544000>}
box{<0,0,-0.203200><8.119306,0.035000,0.203200> rotate<0,0.000000,0> translate<10.035219,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.124800,0.000000,15.622269>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.560950>}
box{<0,0,-0.203200><0.066371,0.035000,0.203200> rotate<0,67.494794,0> translate<10.124800,0.000000,15.622269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.124800,0.000000,15.955728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.124800,0.000000,15.622269>}
box{<0,0,-0.203200><0.333459,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.124800,0.000000,15.622269> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.124800,0.000000,15.955728>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.252409,0.000000,16.263800>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-67.495255,0> translate<10.124800,0.000000,15.955728> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,14.464322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.456597>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<10.150200,0.000000,14.464322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,15.560950>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.150200,0.000000,14.464322>}
box{<0,0,-0.203200><1.096628,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.150200,0.000000,14.464322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.054741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.246206,0.000000,13.830687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<10.153400,0.000000,14.054741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.456597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.153400,0.000000,14.054741>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.153400,0.000000,14.054741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.246206,0.000000,13.830687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.417688,0.000000,13.659206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<10.246206,0.000000,13.830687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.252409,0.000000,16.263800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.481409,0.000000,17.492800>}
box{<0,0,-0.203200><1.738068,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.252409,0.000000,16.263800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.280484,0.000000,37.998400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.293244,0.000000,37.993119>}
box{<0,0,-0.203200><0.013809,0.035000,0.203200> rotate<0,22.483734,0> translate<10.280484,0.000000,37.998400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.280484,0.000000,37.998400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.066584,0.000000,37.998400>}
box{<0,0,-0.203200><49.786100,0.035000,0.203200> rotate<0,0.000000,0> translate<10.280484,0.000000,37.998400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.293244,0.000000,34.650878>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.549119,0.000000,34.906753>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.293244,0.000000,34.650878> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.293244,0.000000,37.993119>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.549119,0.000000,37.737244>}
box{<0,0,-0.203200><0.361862,0.035000,0.203200> rotate<0,44.997030,0> translate<10.293244,0.000000,37.993119> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.417688,0.000000,13.659206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.641741,0.000000,13.566400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<10.417688,0.000000,13.659206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.491162,0.000000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.982416,0.000000,37.795200>}
box{<0,0,-0.203200><49.491253,0.035000,0.203200> rotate<0,0.000000,0> translate<10.491162,0.000000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.549119,0.000000,34.906753>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,35.241066>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,-67.495347,0> translate<10.549119,0.000000,34.906753> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.549119,0.000000,37.737244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,37.402931>}
box{<0,0,-0.203200><0.361858,0.035000,0.203200> rotate<0,67.495347,0> translate<10.549119,0.000000,37.737244> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.567197,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.748125,0.000000,34.950400>}
box{<0,0,-0.203200><7.180928,0.035000,0.203200> rotate<0,0.000000,0> translate<10.567197,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.641741,0.000000,13.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728400,0.000000,13.566400>}
box{<0,0,-0.203200><0.086659,0.035000,0.203200> rotate<0,0.000000,0> translate<10.641741,0.000000,13.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,35.241066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,35.509200>}
box{<0,0,-0.203200><0.268134,0.035000,0.203200> rotate<0,90.000000,0> translate<10.687597,0.000000,35.509200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.341725,0.000000,35.356800>}
box{<0,0,-0.203200><6.654128,0.035000,0.203200> rotate<0,0.000000,0> translate<10.687597,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,35.509200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.189325,0.000000,35.509200>}
box{<0,0,-0.203200><6.501728,0.035000,0.203200> rotate<0,0.000000,0> translate<10.687597,0.000000,35.509200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,37.134797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,37.402931>}
box{<0,0,-0.203200><0.268134,0.035000,0.203200> rotate<0,90.000000,0> translate<10.687597,0.000000,37.402931> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,37.134797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.687675,0.000000,37.134797>}
box{<0,0,-0.203200><7.000078,0.035000,0.203200> rotate<0,0.000000,0> translate<10.687597,0.000000,37.134797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.687597,0.000000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.814078,0.000000,37.388800>}
box{<0,0,-0.203200><49.126481,0.035000,0.203200> rotate<0,0.000000,0> translate<10.687597,0.000000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728400,0.000000,12.570741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.821206,0.000000,12.346687>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<10.728400,0.000000,12.570741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728400,0.000000,13.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.728400,0.000000,12.570741>}
box{<0,0,-0.203200><0.995659,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.728400,0.000000,12.570741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.821206,0.000000,12.346687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.992688,0.000000,12.175206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<10.821206,0.000000,12.346687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.855469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.512528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<10.855469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.855469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.512528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<10.855469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.992688,0.000000,12.175206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.216741,0.000000,12.082400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<10.992688,0.000000,12.175206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.216741,0.000000,12.082400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.659256,0.000000,12.082400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<11.216741,0.000000,12.082400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.481409,0.000000,17.492800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.717197,0.000000,17.728587>}
box{<0,0,-0.203200><0.333454,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.481409,0.000000,17.492800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.591675,0.000000,18.491200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.890413,0.000000,18.614941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<11.591675,0.000000,18.491200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.717197,0.000000,17.728587>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025269,0.000000,17.856197>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,-22.498805,0> translate<11.717197,0.000000,17.728587> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.890413,0.000000,18.614941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.302056,0.000000,19.026584>}
box{<0,0,-0.203200><0.582152,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.890413,0.000000,18.614941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.969872,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.849600,0.000000,18.694400>}
box{<0,0,-0.203200><3.879728,0.035000,0.203200> rotate<0,0.000000,0> translate<11.969872,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.025269,0.000000,17.856197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.764094,0.000000,17.856197>}
box{<0,0,-0.203200><2.738825,0.035000,0.203200> rotate<0,0.000000,0> translate<12.025269,0.000000,17.856197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.044984,0.000000,15.685597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.539191,0.000000,16.179800>}
box{<0,0,-0.203200><0.698911,0.035000,0.203200> rotate<0,-44.996849,0> translate<12.044984,0.000000,15.685597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.044984,0.000000,15.685597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.584256,0.000000,15.685597>}
box{<0,0,-0.203200><0.539272,0.035000,0.203200> rotate<0,0.000000,0> translate<12.044984,0.000000,15.685597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.208988,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.838294,0.000000,15.849600>}
box{<0,0,-0.203200><2.629306,0.035000,0.203200> rotate<0,0.000000,0> translate<12.208988,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.302056,0.000000,19.026584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.425797,0.000000,19.325322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<12.302056,0.000000,19.026584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.332797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.849600,0.000000,19.100800>}
box{<0,0,-0.203200><3.516803,0.035000,0.203200> rotate<0,0.000000,0> translate<12.332797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.425797,0.000000,19.325322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.425797,0.000000,19.435137>}
box{<0,0,-0.203200><0.109816,0.035000,0.203200> rotate<0,90.000000,0> translate<12.425797,0.000000,19.435137> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.425797,0.000000,19.435137>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.591741,0.000000,19.366400>}
box{<0,0,-0.203200><0.179617,0.035000,0.203200> rotate<0,22.498912,0> translate<12.425797,0.000000,19.435137> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.512528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.684247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.512528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.512528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.684247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<12.512528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.539191,0.000000,16.179800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.650400,0.000000,16.179800>}
box{<0,0,-0.203200><2.111209,0.035000,0.203200> rotate<0,0.000000,0> translate<12.539191,0.000000,16.179800> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.633178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.100931,0.000000,6.502400>}
box{<0,0,-0.203200><8.467753,0.035000,0.203200> rotate<0,0.000000,0> translate<12.633178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.658513,0.000000,33.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.798353,0.000000,33.439109>}
box{<0,0,-0.203200><0.140417,0.035000,0.203200> rotate<0,-5.193971,0> translate<12.658513,0.000000,33.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.659256,0.000000,12.082400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.883309,0.000000,12.175206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<12.659256,0.000000,12.082400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.734775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.160000>}
box{<0,0,-0.203200><9.507625,0.035000,0.203200> rotate<0,0.000000,0> translate<12.734775,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.798353,0.000000,33.439109>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.839153,0.000000,33.426397>}
box{<0,0,-0.203200><0.042735,0.035000,0.203200> rotate<0,17.304894,0> translate<12.798353,0.000000,33.439109> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.839153,0.000000,33.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.881884,0.000000,33.426397>}
box{<0,0,-0.203200><0.042731,0.035000,0.203200> rotate<0,0.000000,0> translate<12.839153,0.000000,33.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.881884,0.000000,33.426397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.011588,0.000000,33.372669>}
box{<0,0,-0.203200><0.140391,0.035000,0.203200> rotate<0,22.499771,0> translate<12.881884,0.000000,33.426397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.883309,0.000000,12.175206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.054791,0.000000,12.346687>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.883309,0.000000,12.175206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.900103,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,12.192000>}
box{<0,0,-0.203200><9.342297,0.035000,0.203200> rotate<0,0.000000,0> translate<12.900103,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.011588,0.000000,33.372669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.145656,0.000000,33.330900>}
box{<0,0,-0.203200><0.140425,0.035000,0.203200> rotate<0,17.303137,0> translate<13.011588,0.000000,33.372669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.039578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.507331,0.000000,6.908800>}
box{<0,0,-0.203200><8.467753,0.035000,0.203200> rotate<0,0.000000,0> translate<13.039578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.054791,0.000000,12.346687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.119041,0.000000,12.501806>}
box{<0,0,-0.203200><0.167898,0.035000,0.203200> rotate<0,-67.496267,0> translate<13.054791,0.000000,12.346687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.119041,0.000000,12.501806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.160413,0.000000,12.518941>}
box{<0,0,-0.203200><0.044780,0.035000,0.203200> rotate<0,-22.495658,0> translate<13.119041,0.000000,12.501806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.141175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,9.753600>}
box{<0,0,-0.203200><9.101225,0.035000,0.203200> rotate<0,0.000000,0> translate<13.141175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.145656,0.000000,33.330900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.178488,0.000000,33.303538>}
box{<0,0,-0.203200><0.042739,0.035000,0.203200> rotate<0,39.806162,0> translate<13.145656,0.000000,33.330900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.152978,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.163622,0.000000,33.324800>}
box{<0,0,-0.203200><4.010644,0.035000,0.203200> rotate<0,0.000000,0> translate<13.152978,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.160413,0.000000,12.518941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.389056,0.000000,12.747584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.160413,0.000000,12.518941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.178488,0.000000,33.303538>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.217966,0.000000,33.287188>}
box{<0,0,-0.203200><0.042730,0.035000,0.203200> rotate<0,22.495573,0> translate<13.178488,0.000000,33.303538> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.217966,0.000000,33.287188>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317238,0.000000,33.187913>}
box{<0,0,-0.203200><0.140394,0.035000,0.203200> rotate<0,44.997932,0> translate<13.217966,0.000000,33.287188> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.234256,0.000000,15.685597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458309,0.000000,15.592791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<13.234256,0.000000,15.685597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.234256,0.000000,19.366400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458309,0.000000,19.459206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<13.234256,0.000000,19.366400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.239872,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,12.598400>}
box{<0,0,-0.203200><9.002528,0.035000,0.203200> rotate<0,0.000000,0> translate<13.239872,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.317238,0.000000,33.187913>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.702481,0.000000,32.033541>}
box{<0,0,-0.203200><1.803185,0.035000,0.203200> rotate<0,39.802995,0> translate<13.317238,0.000000,33.187913> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.389056,0.000000,12.747584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.602056,0.000000,12.960584>}
box{<0,0,-0.203200><0.301227,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.389056,0.000000,12.747584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.445978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.913731,0.000000,7.315200>}
box{<0,0,-0.203200><8.467753,0.035000,0.203200> rotate<0,0.000000,0> translate<13.445978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458309,0.000000,15.592791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.629791,0.000000,15.421309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<13.458309,0.000000,15.592791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.458309,0.000000,19.459206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.629791,0.000000,19.630688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.458309,0.000000,19.459206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.506303,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.843916,0.000000,19.507200>}
box{<0,0,-0.203200><2.337613,0.035000,0.203200> rotate<0,0.000000,0> translate<13.506303,0.000000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.547575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.280316,0.000000,9.347200>}
box{<0,0,-0.203200><8.732741,0.035000,0.203200> rotate<0,0.000000,0> translate<13.547575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.602056,0.000000,12.960584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,13.259322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<13.602056,0.000000,12.960584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.607900,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.771406,0.000000,15.443200>}
box{<0,0,-0.203200><3.163506,0.035000,0.203200> rotate<0,0.000000,0> translate<13.607900,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.620369,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.280322,0.000000,13.004800>}
box{<0,0,-0.203200><8.659953,0.035000,0.203200> rotate<0,0.000000,0> translate<13.620369,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.629791,0.000000,15.421309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,15.197256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<13.629791,0.000000,15.421309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.629791,0.000000,19.630688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,19.854741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<13.629791,0.000000,19.630688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.640653,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992600,0.000000,32.918400>}
box{<0,0,-0.203200><3.351947,0.035000,0.203200> rotate<0,0.000000,0> translate<13.640653,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.684247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.684247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<13.684247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.684247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.320131,0.000000,7.721600>}
box{<0,0,-0.203200><8.635884,0.035000,0.203200> rotate<0,0.000000,0> translate<13.684247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.684247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.784434,0.000000,8.128000>}
box{<0,0,-0.203200><9.100187,0.035000,0.203200> rotate<0,0.000000,0> translate<13.684247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.684247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.534400>}
box{<0,0,-0.203200><10.750553,0.035000,0.203200> rotate<0,0.000000,0> translate<13.684247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.684247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.645700,0.000000,8.940800>}
box{<0,0,-0.203200><10.961453,0.035000,0.203200> rotate<0,0.000000,0> translate<13.684247,0.000000,8.940800> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,20.256597>}
box{<0,0,-0.203200><0.401856,0.035000,0.203200> rotate<0,90.000000,0> translate<13.722597,0.000000,20.256597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,19.913600>}
box{<0,0,-0.203200><1.847603,0.035000,0.203200> rotate<0,0.000000,0> translate<13.722597,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.722597,0.000000,20.256597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,20.264322>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,-67.494278,0> translate<13.722597,0.000000,20.256597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,13.259322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,14.787675>}
box{<0,0,-0.203200><1.528353,0.035000,0.203200> rotate<0,90.000000,0> translate<13.725797,0.000000,14.787675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,13.411200>}
box{<0,0,-0.203200><8.611803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,13.817600>}
box{<0,0,-0.203200><8.611803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,14.224000>}
box{<0,0,-0.203200><8.611803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,14.630400>}
box{<0,0,-0.203200><8.611803,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,20.264322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,21.259800>}
box{<0,0,-0.203200><0.995478,0.035000,0.203200> rotate<0,90.000000,0> translate<13.725797,0.000000,21.259800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,20.320000>}
box{<0,0,-0.203200><1.844403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,20.726400>}
box{<0,0,-0.203200><1.844403,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.273806,0.000000,21.132800>}
box{<0,0,-0.203200><1.548009,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.725797,0.000000,21.259800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.146806,0.000000,21.259800>}
box{<0,0,-0.203200><1.421009,0.035000,0.203200> rotate<0,0.000000,0> translate<13.725797,0.000000,21.259800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.128331,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992600,0.000000,32.512000>}
box{<0,0,-0.203200><2.864269,0.035000,0.203200> rotate<0,0.000000,0> translate<14.128331,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.376400,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,1.260669>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<14.376400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.376400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.376400,0.000000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.376400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.376400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,3.311331>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.376400,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.616013,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992600,0.000000,32.105600>}
box{<0,0,-0.203200><2.376587,0.035000,0.203200> rotate<0,0.000000,0> translate<14.616013,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.650400,0.000000,16.168741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.743206,0.000000,15.944688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<14.650400,0.000000,16.168741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.650400,0.000000,16.179800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.650400,0.000000,16.168741>}
box{<0,0,-0.203200><0.011059,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.650400,0.000000,16.168741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.702481,0.000000,32.033541>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.741966,0.000000,32.017187>}
box{<0,0,-0.203200><0.042737,0.035000,0.203200> rotate<0,22.496238,0> translate<14.702481,0.000000,32.033541> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.722669,0.000000,4.165600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,4.054669>}
box{<0,0,-0.203200><0.156880,0.035000,0.203200> rotate<0,44.997030,0> translate<14.722669,0.000000,4.165600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.722669,0.000000,5.994397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.179866,0.000000,6.451597>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.997226,0> translate<14.722669,0.000000,5.994397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.741966,0.000000,32.017187>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841256,0.000000,31.917894>}
box{<0,0,-0.203200><0.140420,0.035000,0.203200> rotate<0,44.997932,0> translate<14.741966,0.000000,32.017187> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.743206,0.000000,15.944688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.914688,0.000000,15.773206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<14.743206,0.000000,15.944688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.764094,0.000000,17.856197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.914688,0.000000,18.006791>}
box{<0,0,-0.203200><0.212972,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.764094,0.000000,17.856197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,0.834113>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.972809,0.000000,0.498031>}
box{<0,0,-0.203200><0.363772,0.035000,0.203200> rotate<0,67.495551,0> translate<14.833600,0.000000,0.834113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,1.260669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,0.834113>}
box{<0,0,-0.203200><0.426556,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.833600,0.000000,0.834113> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,4.054669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.833600,0.000000,3.311331>}
box{<0,0,-0.203200><0.743337,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.833600,0.000000,3.311331> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.841256,0.000000,31.917894>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.949109,0.000000,31.828019>}
box{<0,0,-0.203200><0.140392,0.035000,0.203200> rotate<0,39.802128,0> translate<14.841256,0.000000,31.917894> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.914688,0.000000,15.773206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138741,0.000000,15.680400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<14.914688,0.000000,15.773206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.914688,0.000000,18.006791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138741,0.000000,18.099597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<14.914688,0.000000,18.006791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.949109,0.000000,31.828019>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.968966,0.000000,31.790184>}
box{<0,0,-0.203200><0.042728,0.035000,0.203200> rotate<0,62.304485,0> translate<14.949109,0.000000,31.828019> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.968966,0.000000,31.790184>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.999188,0.000000,31.759966>}
box{<0,0,-0.203200><0.042738,0.035000,0.203200> rotate<0,44.994068,0> translate<14.968966,0.000000,31.790184> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.972809,0.000000,0.498031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.623247,0.000000,-0.152400>}
box{<0,0,-0.203200><0.919853,0.035000,0.203200> rotate<0,44.996755,0> translate<14.972809,0.000000,0.498031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.999188,0.000000,31.759966>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.052916,0.000000,31.630247>}
box{<0,0,-0.203200><0.140405,0.035000,0.203200> rotate<0,67.496729,0> translate<14.999188,0.000000,31.759966> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.024356,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.163619,0.000000,31.699200>}
box{<0,0,-0.203200><2.139263,0.035000,0.203200> rotate<0,0.000000,0> translate<15.024356,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.052916,0.000000,31.630247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.118175,0.000000,31.505925>}
box{<0,0,-0.203200><0.140409,0.035000,0.203200> rotate<0,62.299887,0> translate<15.052916,0.000000,31.630247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.118175,0.000000,31.505925>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.122044,0.000000,31.463363>}
box{<0,0,-0.203200><0.042738,0.035000,0.203200> rotate<0,84.800733,0> translate<15.118175,0.000000,31.505925> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.122044,0.000000,31.463363>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138397,0.000000,31.423884>}
box{<0,0,-0.203200><0.042731,0.035000,0.203200> rotate<0,67.494616,0> translate<15.122044,0.000000,31.463363> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138397,0.000000,31.299572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138397,0.000000,31.423884>}
box{<0,0,-0.203200><0.124312,0.035000,0.203200> rotate<0,90.000000,0> translate<15.138397,0.000000,31.423884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138397,0.000000,31.299572>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.360219,0.000000,31.521397>}
box{<0,0,-0.203200><0.313706,0.035000,0.203200> rotate<0,-44.997434,0> translate<15.138397,0.000000,31.299572> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138741,0.000000,15.680400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.534206,0.000000,15.680400>}
box{<0,0,-0.203200><1.395466,0.035000,0.203200> rotate<0,0.000000,0> translate<15.138741,0.000000,15.680400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.138741,0.000000,18.099597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.849600,0.000000,18.099597>}
box{<0,0,-0.203200><0.710859,0.035000,0.203200> rotate<0,0.000000,0> translate<15.138741,0.000000,18.099597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.146806,0.000000,21.259800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,20.836406>}
box{<0,0,-0.203200><0.598769,0.035000,0.203200> rotate<0,44.997030,0> translate<15.146806,0.000000,21.259800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.179866,0.000000,6.451597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.316131,0.000000,6.451597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<15.179866,0.000000,6.451597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.360219,0.000000,31.521397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.643778,0.000000,31.521397>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,0.000000,0> translate<15.360219,0.000000,31.521397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,19.906641>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.663006,0.000000,19.682588>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<15.570200,0.000000,19.906641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,20.836406>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.570200,0.000000,19.906641>}
box{<0,0,-0.203200><0.929766,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.570200,0.000000,19.906641> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.663006,0.000000,19.682588>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.834488,0.000000,19.511106>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<15.663006,0.000000,19.682588> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.834488,0.000000,19.511106>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.849600,0.000000,19.504847>}
box{<0,0,-0.203200><0.016357,0.035000,0.203200> rotate<0,22.497132,0> translate<15.834488,0.000000,19.511106> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.849600,0.000000,19.504847>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.849600,0.000000,18.099597>}
box{<0,0,-0.203200><1.405250,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.849600,0.000000,18.099597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.316131,0.000000,6.451597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,5.648131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<16.316131,0.000000,6.451597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.534206,0.000000,15.680400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.039197,0.000000,15.175409>}
box{<0,0,-0.203200><0.714165,0.035000,0.203200> rotate<0,44.997030,0> translate<16.534206,0.000000,15.680400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.643778,0.000000,31.521397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.272000,0.000000,30.893175>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<16.643778,0.000000,31.521397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,3.311331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,4.054669>}
box{<0,0,-0.203200><0.743337,0.035000,0.203200> rotate<0,90.000000,0> translate<16.662397,0.000000,4.054669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,3.311331>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,2.854131>}
box{<0,0,-0.203200><0.646578,0.035000,0.203200> rotate<0,44.997030,0> translate<16.662397,0.000000,3.311331> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.050131,0.000000,3.657600>}
box{<0,0,-0.203200><4.387734,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662397,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662397,0.000000,4.054669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,4.511866>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<16.662397,0.000000,4.054669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.671728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.904266,0.000000,4.064000>}
box{<0,0,-0.203200><3.232537,0.035000,0.203200> rotate<0,0.000000,0> translate<16.671728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.671728,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.904269,0.000000,6.096000>}
box{<0,0,-0.203200><3.232541,0.035000,0.203200> rotate<0,0.000000,0> translate<16.671728,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.722528,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.853469,0.000000,3.251200>}
box{<0,0,-0.203200><3.130941,0.035000,0.203200> rotate<0,0.000000,0> translate<16.722528,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.729441,0.000000,1.327713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.888756,0.000000,1.168397>}
box{<0,0,-0.203200><0.225306,0.035000,0.203200> rotate<0,44.997030,0> translate<16.729441,0.000000,1.327713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.729441,0.000000,1.327713>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,1.717866>}
box{<0,0,-0.203200><0.551762,0.035000,0.203200> rotate<0,-44.996801,0> translate<16.729441,0.000000,1.327713> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.837953,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.955066,0.000000,1.219200>}
box{<0,0,-0.203200><3.117112,0.035000,0.203200> rotate<0,0.000000,0> translate<16.837953,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.872375,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.570019,0.000000,31.292800>}
box{<0,0,-0.203200><0.697644,0.035000,0.203200> rotate<0,0.000000,0> translate<16.872375,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.888756,0.000000,1.168397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.005872,0.000000,1.168397>}
box{<0,0,-0.203200><3.117116,0.035000,0.203200> rotate<0,0.000000,0> translate<16.888756,0.000000,1.168397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992600,0.000000,31.870219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.620822,0.000000,31.241997>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,44.997030,0> translate<16.992600,0.000000,31.870219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992600,0.000000,33.153778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992600,0.000000,31.870219>}
box{<0,0,-0.203200><1.283559,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.992600,0.000000,31.870219> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.992600,0.000000,33.153778>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.900219,0.000000,34.061397>}
box{<0,0,-0.203200><1.283567,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.992600,0.000000,33.153778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.027328,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.548666,0.000000,1.625600>}
box{<0,0,-0.203200><2.521338,0.035000,0.203200> rotate<0,0.000000,0> translate<17.027328,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.039197,0.000000,15.175409>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.347269,0.000000,15.047800>}
box{<0,0,-0.203200><0.333455,0.035000,0.203200> rotate<0,22.498805,0> translate<17.039197,0.000000,15.175409> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.078128,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497866,0.000000,4.470400>}
box{<0,0,-0.203200><2.419738,0.035000,0.203200> rotate<0,0.000000,0> translate<17.078128,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.078128,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.497869,0.000000,5.689600>}
box{<0,0,-0.203200><2.419741,0.035000,0.203200> rotate<0,0.000000,0> translate<17.078128,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<17.119597,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,2.032000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<17.119597,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,2.438400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<17.119597,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<17.119597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,4.511866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,5.648131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<17.119597,0.000000,5.648131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,4.876800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<17.119597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.119597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,5.283200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<17.119597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.189325,0.000000,35.509200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.637131,0.000000,34.061397>}
box{<0,0,-0.203200><2.047505,0.035000,0.203200> rotate<0,44.996968,0> translate<17.189325,0.000000,35.509200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.272000,0.000000,30.893175>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.620822,0.000000,31.241997>}
box{<0,0,-0.203200><0.493309,0.035000,0.203200> rotate<0,-44.997030,0> translate<17.272000,0.000000,30.893175> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.347269,0.000000,15.047800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.788097,0.000000,15.047800>}
box{<0,0,-0.203200><1.440828,0.035000,0.203200> rotate<0,0.000000,0> translate<17.347269,0.000000,15.047800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,0.000000,18.099597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,0.000000,19.418300>}
box{<0,0,-0.203200><1.318703,0.035000,0.203200> rotate<0,90.000000,0> translate<17.678397,0.000000,19.418300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,0.000000,18.099597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.881256,0.000000,18.099597>}
box{<0,0,-0.203200><0.202859,0.035000,0.203200> rotate<0,0.000000,0> translate<17.678397,0.000000,18.099597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.534844,0.000000,18.288000>}
box{<0,0,-0.203200><1.856447,0.035000,0.203200> rotate<0,0.000000,0> translate<17.678397,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.128444,0.000000,18.694400>}
box{<0,0,-0.203200><1.450047,0.035000,0.203200> rotate<0,0.000000,0> translate<17.678397,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.722044,0.000000,19.100800>}
box{<0,0,-0.203200><1.043647,0.035000,0.203200> rotate<0,0.000000,0> translate<17.678397,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.678397,0.000000,19.418300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.404544,0.000000,19.418300>}
box{<0,0,-0.203200><0.726147,0.035000,0.203200> rotate<0,0.000000,0> translate<17.678397,0.000000,19.418300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.687675,0.000000,37.134797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.986413,0.000000,37.011056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<17.687675,0.000000,37.134797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.881256,0.000000,18.099597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.105309,0.000000,18.006791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<17.881256,0.000000,18.099597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.900219,0.000000,34.061397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.637131,0.000000,34.061397>}
box{<0,0,-0.203200><0.736912,0.035000,0.203200> rotate<0,0.000000,0> translate<17.900219,0.000000,34.061397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.986413,0.000000,37.011056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.215056,0.000000,36.782412>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<17.986413,0.000000,37.011056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.015069,0.000000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,36.982400>}
box{<0,0,-0.203200><41.749731,0.035000,0.203200> rotate<0,0.000000,0> translate<18.015069,0.000000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.105309,0.000000,18.006791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.276791,0.000000,17.835309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<18.105309,0.000000,18.006791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.215056,0.000000,36.782412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.183066>}
box{<0,0,-0.203200><3.676029,0.035000,0.203200> rotate<0,44.997065,0> translate<18.215056,0.000000,36.782412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.230500,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.941244,0.000000,17.881600>}
box{<0,0,-0.203200><1.710744,0.035000,0.203200> rotate<0,0.000000,0> translate<18.230500,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.276791,0.000000,17.835309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,17.611256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<18.276791,0.000000,17.835309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,16.724197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,17.611256>}
box{<0,0,-0.203200><0.887059,0.035000,0.203200> rotate<0,90.000000,0> translate<18.369597,0.000000,17.611256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,16.724197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.788097,0.000000,16.724197>}
box{<0,0,-0.203200><0.418500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.369597,0.000000,16.724197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.754044,0.000000,17.068800>}
box{<0,0,-0.203200><2.384447,0.035000,0.203200> rotate<0,0.000000,0> translate<18.369597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.369597,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.347644,0.000000,17.475200>}
box{<0,0,-0.203200><1.978047,0.035000,0.203200> rotate<0,0.000000,0> translate<18.369597,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.404544,0.000000,19.418300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,15.485244>}
box{<0,0,-0.203200><5.562181,0.035000,0.203200> rotate<0,44.997030,0> translate<18.404544,0.000000,19.418300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.421469,0.000000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,36.576000>}
box{<0,0,-0.203200><41.343331,0.035000,0.203200> rotate<0,0.000000,0> translate<18.421469,0.000000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.788097,0.000000,15.047800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.866688,0.000000,14.969206>}
box{<0,0,-0.203200><0.111146,0.035000,0.203200> rotate<0,44.998169,0> translate<18.788097,0.000000,15.047800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.788097,0.000000,16.724197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.866688,0.000000,16.802791>}
box{<0,0,-0.203200><0.111146,0.035000,0.203200> rotate<0,-44.998169,0> translate<18.788097,0.000000,16.724197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.827869,0.000000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.856159,0.000000,36.169600>}
box{<0,0,-0.203200><41.028291,0.035000,0.203200> rotate<0,0.000000,0> translate<18.827869,0.000000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.866688,0.000000,14.969206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090741,0.000000,14.876400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<18.866688,0.000000,14.969206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.866688,0.000000,16.802791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090741,0.000000,16.895597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<18.866688,0.000000,16.802791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090741,0.000000,14.876400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.533256,0.000000,14.876400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<19.090741,0.000000,14.876400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090741,0.000000,16.895597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.533256,0.000000,16.895597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<19.090741,0.000000,16.895597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.234269,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.165097,0.000000,35.763200>}
box{<0,0,-0.203200><28.930828,0.035000,0.203200> rotate<0,0.000000,0> translate<19.234269,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.005872,0.000000,1.168397>}
box{<0,0,-0.203200><0.777068,0.035000,0.203200> rotate<0,44.996867,0> translate<19.456400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.456400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.259866,0.000000,3.657597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.456400,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,4.511866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.259866,0.000000,3.708400>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<19.456400,0.000000,4.511866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,5.648131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,4.511866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.456400,0.000000,4.511866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456400,0.000000,5.648131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.259866,0.000000,6.451597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.456400,0.000000,5.648131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.463175,0.000000,31.241997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,30.613778>}
box{<0,0,-0.203200><0.888438,0.035000,0.203200> rotate<0,44.996888,0> translate<19.463175,0.000000,31.241997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.463175,0.000000,31.241997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,31.870219>}
box{<0,0,-0.203200><0.888440,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.463175,0.000000,31.241997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.513978,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.840884,0.000000,31.292800>}
box{<0,0,-0.203200><1.326906,0.035000,0.203200> rotate<0,0.000000,0> translate<19.513978,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.640669,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.040697,0.000000,35.356800>}
box{<0,0,-0.203200><1.400028,0.035000,0.203200> rotate<0,0.000000,0> translate<19.640669,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.818775,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.259284,0.000000,30.886400>}
box{<0,0,-0.203200><1.440509,0.035000,0.203200> rotate<0,0.000000,0> translate<19.818775,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.920378,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,31.699200>}
box{<0,0,-0.203200><0.894022,0.035000,0.203200> rotate<0,0.000000,0> translate<19.920378,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.047069,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.950400>}
box{<0,0,-0.203200><0.767331,0.035000,0.203200> rotate<0,0.000000,0> translate<20.047069,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,29.572072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,30.613778>}
box{<0,0,-0.203200><1.041706,0.035000,0.203200> rotate<0,90.000000,0> translate<20.091397,0.000000,30.613778> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,29.572072>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.656669,0.000000,29.006797>}
box{<0,0,-0.203200><0.799417,0.035000,0.203200> rotate<0,44.997189,0> translate<20.091397,0.000000,29.572072> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,29.667200>}
box{<0,0,-0.203200><20.423003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.091397,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,30.073600>}
box{<0,0,-0.203200><20.423003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.091397,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,30.480000>}
box{<0,0,-0.203200><20.423003,0.035000,0.203200> rotate<0,0.000000,0> translate<20.091397,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,31.870219>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,32.607131>}
box{<0,0,-0.203200><0.736912,0.035000,0.203200> rotate<0,90.000000,0> translate<20.091397,0.000000,32.607131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.592925,0.000000,32.105600>}
box{<0,0,-0.203200><0.501528,0.035000,0.203200> rotate<0,0.000000,0> translate<20.091397,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.186525,0.000000,32.512000>}
box{<0,0,-0.203200><0.095128,0.035000,0.203200> rotate<0,0.000000,0> translate<20.091397,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.091397,0.000000,32.607131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,31.884125>}
box{<0,0,-0.203200><1.022483,0.035000,0.203200> rotate<0,44.997154,0> translate<20.091397,0.000000,32.607131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.259866,0.000000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.050125,0.000000,3.657597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<20.259866,0.000000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.259866,0.000000,3.708400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.100931,0.000000,3.708400>}
box{<0,0,-0.203200><0.841066,0.035000,0.203200> rotate<0,0.000000,0> translate<20.259866,0.000000,3.708400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.259866,0.000000,6.451597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.050128,0.000000,6.451597>}
box{<0,0,-0.203200><0.790263,0.035000,0.203200> rotate<0,0.000000,0> translate<20.259866,0.000000,6.451597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.402669,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.944697,0.000000,29.260800>}
box{<0,0,-0.203200><0.542028,0.035000,0.203200> rotate<0,0.000000,0> translate<20.402669,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.453469,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.814400,0.000000,34.544000>}
box{<0,0,-0.203200><0.360931,0.035000,0.203200> rotate<0,0.000000,0> translate<20.453469,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.533256,0.000000,14.876400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.757309,0.000000,14.969206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<20.533256,0.000000,14.876400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.533256,0.000000,16.895597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.757309,0.000000,16.802791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<20.533256,0.000000,16.895597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.656669,0.000000,29.006797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.817525,0.000000,29.006797>}
box{<0,0,-0.203200><0.160856,0.035000,0.203200> rotate<0,0.000000,0> translate<20.656669,0.000000,29.006797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.757309,0.000000,14.969206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.928791,0.000000,15.140688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.757309,0.000000,14.969206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.757309,0.000000,16.802791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.928791,0.000000,16.631309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<20.757309,0.000000,16.802791> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.817525,0.000000,29.006797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.907206,0.000000,29.223309>}
box{<0,0,-0.203200><0.234351,0.035000,0.203200> rotate<0,-67.495808,0> translate<20.817525,0.000000,29.006797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.824903,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,15.036800>}
box{<0,0,-0.203200><1.512697,0.035000,0.203200> rotate<0,0.000000,0> translate<20.824903,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.897700,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.160444,0.000000,16.662400>}
box{<0,0,-0.203200><0.262744,0.035000,0.203200> rotate<0,0.000000,0> translate<20.897700,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.907206,0.000000,29.223309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078688,0.000000,29.394791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.907206,0.000000,29.223309> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,15.364741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,16.407256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<21.021597,0.000000,16.407256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,15.443200>}
box{<0,0,-0.203200><1.316003,0.035000,0.203200> rotate<0,0.000000,0> translate<21.021597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.973244,0.000000,15.849600>}
box{<0,0,-0.203200><0.951647,0.035000,0.203200> rotate<0,0.000000,0> translate<21.021597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.021597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.566844,0.000000,16.256000>}
box{<0,0,-0.203200><0.545247,0.035000,0.203200> rotate<0,0.000000,0> translate<21.021597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.050125,0.000000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.100931,0.000000,3.708400>}
box{<0,0,-0.203200><0.071849,0.035000,0.203200> rotate<0,-44.995268,0> translate<21.050125,0.000000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.050128,0.000000,6.451597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.685584,0.000000,8.087056>}
box{<0,0,-0.203200><2.312887,0.035000,0.203200> rotate<0,-44.997085,0> translate<21.050128,0.000000,6.451597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078688,0.000000,29.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,29.487597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<21.078688,0.000000,29.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078688,0.000000,30.961206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,30.868400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<21.078688,0.000000,30.961206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.078688,0.000000,35.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,35.487597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<21.078688,0.000000,35.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,29.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,29.487597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<21.302741,0.000000,29.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,30.868400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,30.868400>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<21.302741,0.000000,30.868400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.302741,0.000000,35.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.545256,0.000000,35.487597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<21.302741,0.000000,35.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,9.438741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,9.214688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<22.242400,0.000000,9.438741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.881256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,9.438741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.242400,0.000000,9.438741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,10.881256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,11.105309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<22.242400,0.000000,10.881256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,11.470741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,11.246688>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<22.242400,0.000000,11.470741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,12.913256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,11.470741>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.242400,0.000000,11.470741> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.242400,0.000000,12.913256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,13.137309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<22.242400,0.000000,12.913256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,9.214688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.506688,0.000000,9.043206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<22.335206,0.000000,9.214688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,11.105309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.405897,0.000000,11.175997>}
box{<0,0,-0.203200><0.099969,0.035000,0.203200> rotate<0,-44.995764,0> translate<22.335206,0.000000,11.105309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,11.246688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.405897,0.000000,11.175997>}
box{<0,0,-0.203200><0.099972,0.035000,0.203200> rotate<0,44.997030,0> translate<22.335206,0.000000,11.246688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.335206,0.000000,13.137309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,13.139700>}
box{<0,0,-0.203200><0.003383,0.035000,0.203200> rotate<0,-44.959609,0> translate<22.335206,0.000000,13.137309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,15.485244>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.337600,0.000000,13.139700>}
box{<0,0,-0.203200><2.345544,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.337600,0.000000,13.139700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.506688,0.000000,9.043206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.730741,0.000000,8.950400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<22.506688,0.000000,9.043206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.685584,0.000000,8.087056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.984322,0.000000,8.210797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<22.685584,0.000000,8.087056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.730741,0.000000,8.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.773256,0.000000,8.950400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<22.730741,0.000000,8.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.984322,0.000000,8.210797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.210797>}
box{<0,0,-0.203200><1.450478,0.035000,0.203200> rotate<0,0.000000,0> translate<22.984322,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.773256,0.000000,8.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.857269,0.000000,8.985200>}
box{<0,0,-0.203200><0.090935,0.035000,0.203200> rotate<0,-22.499029,0> translate<23.773256,0.000000,8.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.857269,0.000000,8.985200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.690100,0.000000,8.985200>}
box{<0,0,-0.203200><0.832831,0.035000,0.203200> rotate<0,0.000000,0> translate<23.857269,0.000000,8.985200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.598656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.210797>}
box{<0,0,-0.203200><0.387859,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.434800,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.434800,0.000000,8.598656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.527606,0.000000,8.822709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<24.434800,0.000000,8.598656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.527606,0.000000,8.822709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.690100,0.000000,8.985200>}
box{<0,0,-0.203200><0.229799,0.035000,0.203200> rotate<0,-44.996479,0> translate<24.527606,0.000000,8.822709> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.831191,0.000000,8.822709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,8.598656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<26.831191,0.000000,8.822709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.831191,0.000000,9.173288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.923997,0.000000,9.397341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<26.831191,0.000000,9.173288> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.970806,0.000000,8.417709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.142288,0.000000,8.589191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.970806,0.000000,8.417709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.142288,0.000000,8.589191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.366341,0.000000,8.681997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<27.142288,0.000000,8.589191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.355675,0.000000,28.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.654413,0.000000,28.867056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<27.355675,0.000000,28.990797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.366341,0.000000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.513656,0.000000,8.681997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<27.366341,0.000000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.549584,0.000000,9.908941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.848322,0.000000,9.785200>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<27.549584,0.000000,9.908941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.654413,0.000000,28.867056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.686409,0.000000,25.835056>}
box{<0,0,-0.203200><4.287893,0.035000,0.203200> rotate<0,44.997060,0> translate<27.654413,0.000000,28.867056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.667069,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,28.854400>}
box{<0,0,-0.203200><12.847331,0.035000,0.203200> rotate<0,0.000000,0> translate<27.667069,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.848322,0.000000,9.785200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.275300,0.000000,9.785200>}
box{<0,0,-0.203200><5.426978,0.035000,0.203200> rotate<0,0.000000,0> translate<27.848322,0.000000,9.785200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.073469,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,28.448000>}
box{<0,0,-0.203200><12.440931,0.035000,0.203200> rotate<0,0.000000,0> translate<28.073469,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.479869,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,28.041600>}
box{<0,0,-0.203200><12.034531,0.035000,0.203200> rotate<0,0.000000,0> translate<28.479869,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.513656,0.000000,8.681997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737709,0.000000,8.589191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<28.513656,0.000000,8.681997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.737709,0.000000,8.589191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,0.000000,8.417709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<28.737709,0.000000,8.589191> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.792500,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.046069,0.000000,8.534400>}
box{<0,0,-0.203200><4.253569,0.035000,0.203200> rotate<0,0.000000,0> translate<28.792500,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.886269,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,27.635200>}
box{<0,0,-0.203200><11.628131,0.035000,0.203200> rotate<0,0.000000,0> translate<28.886269,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,0.000000,6.822288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,7.046341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<28.909191,0.000000,6.822288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.909191,0.000000,8.417709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,8.193656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<28.909191,0.000000,8.417709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.945025,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,6.908800>}
box{<0,0,-0.203200><0.472975,0.035000,0.203200> rotate<0,0.000000,0> translate<28.945025,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,7.046341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,8.193656>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,90.000000,0> translate<29.001997,0.000000,8.193656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,7.315200>}
box{<0,0,-0.203200><0.416003,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.576697,0.000000,7.721600>}
box{<0,0,-0.203200><0.574700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.001997,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.218097,0.000000,8.128000>}
box{<0,0,-0.203200><4.216100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.001997,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.292669,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.567394,0.000000,27.228800>}
box{<0,0,-0.203200><11.274725,0.035000,0.203200> rotate<0,0.000000,0> translate<29.292669,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,7.431656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,6.349997>}
box{<0,0,-0.203200><1.081659,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.418000,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.418000,0.000000,7.431656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.510806,0.000000,7.655709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<29.418000,0.000000,7.431656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.510806,0.000000,7.655709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.682288,0.000000,7.827191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.510806,0.000000,7.655709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,14.935197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,15.702000>}
box{<0,0,-0.203200><0.766803,0.035000,0.203200> rotate<0,90.000000,0> translate<29.584797,0.000000,15.702000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,14.935197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.172656,0.000000,14.935197>}
box{<0,0,-0.203200><3.587859,0.035000,0.203200> rotate<0,0.000000,0> translate<29.584797,0.000000,14.935197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.304400,0.000000,15.036800>}
box{<0,0,-0.203200><3.719603,0.035000,0.203200> rotate<0,0.000000,0> translate<29.584797,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.354084,0.000000,15.443200>}
box{<0,0,-0.203200><3.769287,0.035000,0.203200> rotate<0,0.000000,0> translate<29.584797,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.584797,0.000000,15.702000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.545656,0.000000,15.702000>}
box{<0,0,-0.203200><0.960859,0.035000,0.203200> rotate<0,0.000000,0> translate<29.584797,0.000000,15.702000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.682288,0.000000,7.827191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906341,0.000000,7.919997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<29.682288,0.000000,7.827191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.699069,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,26.822400>}
box{<0,0,-0.203200><10.815331,0.035000,0.203200> rotate<0,0.000000,0> translate<29.699069,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906341,0.000000,7.919997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.053656,0.000000,7.919997>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<29.906341,0.000000,7.919997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.105469,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,26.416000>}
box{<0,0,-0.203200><10.408931,0.035000,0.203200> rotate<0,0.000000,0> translate<30.105469,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.511869,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,26.009600>}
box{<0,0,-0.203200><10.002531,0.035000,0.203200> rotate<0,0.000000,0> translate<30.511869,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.545656,0.000000,15.702000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.769709,0.000000,15.794806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<30.545656,0.000000,15.702000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.686409,0.000000,25.835056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.686413,0.000000,25.835056>}
box{<0,0,-0.203200><0.000003,0.035000,0.203200> rotate<0,0.000000,0> translate<30.686409,0.000000,25.835056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.686413,0.000000,25.835056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.915056,0.000000,25.606413>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,44.997030,0> translate<30.686413,0.000000,25.835056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.769709,0.000000,15.794806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.941191,0.000000,15.966287>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.769709,0.000000,15.794806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.824503,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.451800,0.000000,15.849600>}
box{<0,0,-0.203200><2.627297,0.035000,0.203200> rotate<0,0.000000,0> translate<30.824503,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.915056,0.000000,25.606413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,25.307675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<30.915056,0.000000,25.606413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.916388,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,25.603200>}
box{<0,0,-0.203200><9.598012,0.035000,0.203200> rotate<0,0.000000,0> translate<30.916388,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.941191,0.000000,15.966287>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,16.190341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<30.941191,0.000000,15.966287> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,16.190341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,16.844734>}
box{<0,0,-0.203200><0.654394,0.035000,0.203200> rotate<0,90.000000,0> translate<31.033997,0.000000,16.844734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.504400,0.000000,16.256000>}
box{<0,0,-0.203200><2.470403,0.035000,0.203200> rotate<0,0.000000,0> translate<31.033997,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.311997,0.000000,16.662400>}
box{<0,0,-0.203200><2.278000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.033997,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033997,0.000000,16.844734>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,16.856322>}
box{<0,0,-0.203200><0.012542,0.035000,0.203200> rotate<0,-67.494278,0> translate<31.033997,0.000000,16.844734> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,16.856322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,25.307675>}
box{<0,0,-0.203200><8.451353,0.035000,0.203200> rotate<0,90.000000,0> translate<31.038797,0.000000,25.307675> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.030531,0.000000,18.288000>}
box{<0,0,-0.203200><10.991734,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.436928,0.000000,18.694400>}
box{<0,0,-0.203200><11.398131,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,18.694400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.415284,0.000000,20.320000>}
box{<0,0,-0.203200><6.376487,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.052884,0.000000,20.726400>}
box{<0,0,-0.203200><6.014088,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.038000,0.000000,21.132800>}
box{<0,0,-0.203200><5.999203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.038000,0.000000,21.539200>}
box{<0,0,-0.203200><5.999203,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.052891,0.000000,21.945600>}
box{<0,0,-0.203200><6.014094,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.415297,0.000000,22.352000>}
box{<0,0,-0.203200><6.376500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038797,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.372928,0.000000,22.758400>}
box{<0,0,-0.203200><7.334131,0.035000,0.203200> rotate<0,0.000000,0> translate<31.038797,0.000000,22.758400> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.053656,0.000000,7.919997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.277709,0.000000,7.827191>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<31.053656,0.000000,7.919997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.277709,0.000000,7.827191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.449191,0.000000,7.655709>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<31.277709,0.000000,7.827191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.383300,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,7.721600>}
box{<0,0,-0.203200><1.636700,0.035000,0.203200> rotate<0,0.000000,0> translate<31.383300,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.449191,0.000000,7.655709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,7.431656>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<31.449191,0.000000,7.655709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,7.431656>}
box{<0,0,-0.203200><1.081659,0.035000,0.203200> rotate<0,90.000000,0> translate<31.541997,0.000000,7.431656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.571341,0.000000,6.349997>}
box{<0,0,-0.203200><0.029344,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,6.502400>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,6.908800>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.541997,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,7.315200>}
box{<0,0,-0.203200><1.478003,0.035000,0.203200> rotate<0,0.000000,0> translate<31.541997,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.571341,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.371341,0.000000,6.349997>}
box{<0,0,-0.203200><0.800000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.571341,0.000000,6.349997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.371341,0.000000,6.349997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020000,0.000000,6.349997>}
box{<0,0,-0.203200><0.648659,0.035000,0.203200> rotate<0,0.000000,0> translate<32.371341,0.000000,6.349997> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.835256,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.059309,0.000000,17.818791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<34.835256,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.907675,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.220325,0.000000,17.881600>}
box{<0,0,-0.203200><0.312650,0.035000,0.203200> rotate<0,0.000000,0> translate<34.907675,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.059309,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.064000,0.000000,17.814100>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,44.997030,0> translate<35.059309,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.064000,0.000000,17.814100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.068688,0.000000,17.818791>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,-45.016121,0> translate<35.064000,0.000000,17.814100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.068688,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,17.911597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<35.068688,0.000000,17.818791> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,15.811597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,15.811597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.292741,0.000000,15.811597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,16.192400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,16.192400>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.292741,0.000000,16.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.292741,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,17.911597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<35.292741,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,15.811597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,15.741534>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,22.498765,0> translate<36.335256,0.000000,15.811597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,16.192400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.262463>}
box{<0,0,-0.203200><0.183080,0.035000,0.203200> rotate<0,-22.498765,0> translate<36.335256,0.000000,16.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.335256,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.559309,0.000000,17.818791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<36.335256,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.407675,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.720325,0.000000,17.881600>}
box{<0,0,-0.203200><0.312650,0.035000,0.203200> rotate<0,0.000000,0> translate<36.407675,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.488797,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.256000>}
box{<0,0,-0.203200><0.015603,0.035000,0.203200> rotate<0,0.000000,0> translate<36.488797,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,15.840322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,15.832597>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,67.494278,0> translate<36.501200,0.000000,15.840322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,16.163675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,15.840322>}
box{<0,0,-0.203200><0.323353,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.501200,0.000000,15.840322> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.501200,0.000000,16.163675>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.171400>}
box{<0,0,-0.203200><0.008362,0.035000,0.203200> rotate<0,-67.494278,0> translate<36.501200,0.000000,16.163675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,15.832597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,15.741534>}
box{<0,0,-0.203200><0.091062,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.504400,0.000000,15.741534> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.262463>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.504400,0.000000,16.171400>}
box{<0,0,-0.203200><0.091062,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.504400,0.000000,16.171400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.559309,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.563997,0.000000,17.814100>}
box{<0,0,-0.203200><0.006631,0.035000,0.203200> rotate<0,45.016121,0> translate<36.559309,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.563997,0.000000,17.814100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.568688,0.000000,17.818791>}
box{<0,0,-0.203200><0.006634,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.563997,0.000000,17.814100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.568688,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.792741,0.000000,17.911597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<36.568688,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.769466,0.000000,8.210797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.006413,0.000000,8.308941>}
box{<0,0,-0.203200><0.256468,0.035000,0.203200> rotate<0,-22.497925,0> translate<36.769466,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.769466,0.000000,8.210797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.213675,0.000000,8.210797>}
box{<0,0,-0.203200><0.444209,0.035000,0.203200> rotate<0,0.000000,0> translate<36.769466,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.792741,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.835256,0.000000,17.911597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<36.792741,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.006413,0.000000,8.308941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.139872,0.000000,8.442400>}
box{<0,0,-0.203200><0.188740,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.006413,0.000000,8.308941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.038000,0.000000,20.762341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.130806,0.000000,20.538288>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<37.038000,0.000000,20.762341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.038000,0.000000,21.909656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.038000,0.000000,20.762341>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.038000,0.000000,20.762341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.038000,0.000000,21.909656>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.130806,0.000000,22.133709>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<37.038000,0.000000,21.909656> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.130806,0.000000,20.538288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.302287,0.000000,20.366806>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<37.130806,0.000000,20.538288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.130806,0.000000,22.133709>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.302287,0.000000,22.305191>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.130806,0.000000,22.133709> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.139872,0.000000,8.442400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.721256,0.000000,8.442400>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,0.000000,0> translate<37.139872,0.000000,8.442400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.213675,0.000000,8.210797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.512413,0.000000,8.087056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<37.213675,0.000000,8.210797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.302287,0.000000,20.366806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.526341,0.000000,20.274000>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<37.302287,0.000000,20.366806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.302287,0.000000,22.305191>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.526341,0.000000,22.397997>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<37.302287,0.000000,22.305191> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.413566,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.751750,0.000000,8.128000>}
box{<0,0,-0.203200><8.338184,0.035000,0.203200> rotate<0,0.000000,0> translate<37.413566,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.512413,0.000000,8.087056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.147872,0.000000,6.451597>}
box{<0,0,-0.203200><2.312889,0.035000,0.203200> rotate<0,44.997030,0> translate<37.512413,0.000000,8.087056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.526341,0.000000,20.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.673656,0.000000,20.274000>}
box{<0,0,-0.203200><1.147316,0.035000,0.203200> rotate<0,0.000000,0> translate<37.526341,0.000000,20.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.526341,0.000000,22.397997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.012525,0.000000,22.397997>}
box{<0,0,-0.203200><0.486184,0.035000,0.203200> rotate<0,0.000000,0> translate<37.526341,0.000000,22.397997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.721256,0.000000,8.442400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.945309,0.000000,8.535206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<37.721256,0.000000,8.442400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.835256,0.000000,17.911597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.059309,0.000000,17.818791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<37.835256,0.000000,17.911597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.877869,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.751750,0.000000,7.721600>}
box{<0,0,-0.203200><7.873881,0.035000,0.203200> rotate<0,0.000000,0> translate<37.877869,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.907675,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.624131,0.000000,17.881600>}
box{<0,0,-0.203200><3.716456,0.035000,0.203200> rotate<0,0.000000,0> translate<37.907675,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.943362,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.751750,0.000000,8.534400>}
box{<0,0,-0.203200><7.808388,0.035000,0.203200> rotate<0,0.000000,0> translate<37.943362,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.945309,0.000000,8.535206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,8.706688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.945309,0.000000,8.535206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.012525,0.000000,22.397997>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.401584,0.000000,22.787056>}
box{<0,0,-0.203200><0.550213,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.012525,0.000000,22.397997> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.012797,0.000000,10.701300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.012797,0.000000,10.888697>}
box{<0,0,-0.203200><0.187397,0.035000,0.203200> rotate<0,90.000000,0> translate<38.012797,0.000000,10.888697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.012797,0.000000,10.701300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,10.597309>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<38.012797,0.000000,10.701300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.012797,0.000000,10.888697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,10.992688>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<38.012797,0.000000,10.888697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.059309,0.000000,17.818791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,17.647309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<38.059309,0.000000,17.818791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.096900,0.000000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,10.972800>}
box{<0,0,-0.203200><25.047500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.096900,0.000000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,8.706688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,8.930741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.116791,0.000000,8.706688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,10.597309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.373256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.116791,0.000000,10.597309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.116791,0.000000,10.992688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,11.216741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.116791,0.000000,10.992688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.205341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.349494>}
box{<0,0,-0.203200><0.144153,0.035000,0.203200> rotate<0,90.000000,0> translate<38.123597,0.000000,16.349494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.205341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.150797,0.000000,16.139675>}
box{<0,0,-0.203200><0.071076,0.035000,0.203200> rotate<0,67.495242,0> translate<38.123597,0.000000,16.205341> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.998531,0.000000,16.256000>}
box{<0,0,-0.203200><1.874934,0.035000,0.203200> rotate<0,0.000000,0> translate<38.123597,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.123597,0.000000,16.349494>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,16.456688>}
box{<0,0,-0.203200><0.151595,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.123597,0.000000,16.349494> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.129597,0.000000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,10.566400>}
box{<0,0,-0.203200><25.014803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.129597,0.000000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.150797,0.000000,15.627303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.150797,0.000000,16.139675>}
box{<0,0,-0.203200><0.512372,0.035000,0.203200> rotate<0,90.000000,0> translate<38.150797,0.000000,16.139675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.150797,0.000000,15.627303>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,15.547309>}
box{<0,0,-0.203200><0.113128,0.035000,0.203200> rotate<0,44.997030,0> translate<38.150797,0.000000,15.627303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.150797,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.592131,0.000000,15.849600>}
box{<0,0,-0.203200><1.441334,0.035000,0.203200> rotate<0,0.000000,0> translate<38.150797,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,8.930741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.373256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<38.209597,0.000000,10.373256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.751750,0.000000,8.940800>}
box{<0,0,-0.203200><7.542153,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.888422,0.000000,9.347200>}
box{<0,0,-0.203200><7.678825,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.294822,0.000000,9.753600>}
box{<0,0,-0.203200><8.085225,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.701222,0.000000,10.160000>}
box{<0,0,-0.203200><8.491625,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,11.216741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,12.168125>}
box{<0,0,-0.203200><0.951384,0.035000,0.203200> rotate<0,90.000000,0> translate<38.209597,0.000000,12.168125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,11.379200>}
box{<0,0,-0.203200><24.934803,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.197059,0.000000,11.785600>}
box{<0,0,-0.203200><20.987462,0.035000,0.203200> rotate<0,0.000000,0> translate<38.209597,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.209597,0.000000,12.168125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.262672,0.000000,17.221200>}
box{<0,0,-0.203200><7.146127,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.209597,0.000000,12.168125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,15.547309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,15.323256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.230791,0.000000,15.547309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,16.456688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,16.680741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<38.230791,0.000000,16.456688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.230791,0.000000,17.647309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,17.423256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<38.230791,0.000000,17.647309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.233472,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.790659,0.000000,12.192000>}
box{<0,0,-0.203200><20.557188,0.035000,0.203200> rotate<0,0.000000,0> translate<38.233472,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.273916,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.185731,0.000000,15.443200>}
box{<0,0,-0.203200><0.911816,0.035000,0.203200> rotate<0,0.000000,0> translate<38.273916,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.284269,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.990019,0.000000,7.315200>}
box{<0,0,-0.203200><7.705750,0.035000,0.203200> rotate<0,0.000000,0> translate<38.284269,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.302081,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.217731,0.000000,17.475200>}
box{<0,0,-0.203200><2.915650,0.035000,0.203200> rotate<0,0.000000,0> translate<38.302081,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.315997,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.404931,0.000000,16.662400>}
box{<0,0,-0.203200><2.088934,0.035000,0.203200> rotate<0,0.000000,0> translate<38.315997,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,14.581066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,15.323256>}
box{<0,0,-0.203200><0.742191,0.035000,0.203200> rotate<0,90.000000,0> translate<38.323597,0.000000,15.323256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,14.581066>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.236941,0.000000,18.494412>}
box{<0,0,-0.203200><5.534306,0.035000,0.203200> rotate<0,-44.997053,0> translate<38.323597,0.000000,14.581066> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.372931,0.000000,14.630400>}
box{<0,0,-0.203200><0.049334,0.035000,0.203200> rotate<0,0.000000,0> translate<38.323597,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.779331,0.000000,15.036800>}
box{<0,0,-0.203200><0.455734,0.035000,0.203200> rotate<0,0.000000,0> translate<38.323597,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,16.680741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,17.423256>}
box{<0,0,-0.203200><0.742516,0.035000,0.203200> rotate<0,90.000000,0> translate<38.323597,0.000000,17.423256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.323597,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.811331,0.000000,17.068800>}
box{<0,0,-0.203200><2.487734,0.035000,0.203200> rotate<0,0.000000,0> translate<38.323597,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.401584,0.000000,22.787056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.700322,0.000000,22.910797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<38.401584,0.000000,22.787056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.639872,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.699400,0.000000,12.598400>}
box{<0,0,-0.203200><20.059528,0.035000,0.203200> rotate<0,0.000000,0> translate<38.639872,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.673656,0.000000,20.274000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.897709,0.000000,20.366806>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<38.673656,0.000000,20.274000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.690669,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.396419,0.000000,6.908800>}
box{<0,0,-0.203200><7.705750,0.035000,0.203200> rotate<0,0.000000,0> translate<38.690669,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.700322,0.000000,22.910797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,22.910797>}
box{<0,0,-0.203200><1.814078,0.035000,0.203200> rotate<0,0.000000,0> translate<38.700322,0.000000,22.910797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.784709,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,20.320000>}
box{<0,0,-0.203200><1.729691,0.035000,0.203200> rotate<0,0.000000,0> translate<38.784709,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.897709,0.000000,20.366806>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.069191,0.000000,20.538288>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.897709,0.000000,20.366806> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.046272,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.726625,0.000000,13.004800>}
box{<0,0,-0.203200><8.680353,0.035000,0.203200> rotate<0,0.000000,0> translate<39.046272,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.069191,0.000000,20.538288>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.161997,0.000000,20.762341>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<39.069191,0.000000,20.538288> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.097066,0.000000,3.708400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.147872,0.000000,3.657597>}
box{<0,0,-0.203200><0.071849,0.035000,0.203200> rotate<0,44.995268,0> translate<39.097066,0.000000,3.708400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.097066,0.000000,3.708400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.938131,0.000000,3.708400>}
box{<0,0,-0.203200><0.841066,0.035000,0.203200> rotate<0,0.000000,0> translate<39.097066,0.000000,3.708400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.097069,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.802819,0.000000,6.502400>}
box{<0,0,-0.203200><7.705750,0.035000,0.203200> rotate<0,0.000000,0> translate<39.097069,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.147109,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.514400,0.000000,20.726400>}
box{<0,0,-0.203200><1.367291,0.035000,0.203200> rotate<0,0.000000,0> translate<39.147109,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.147869,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.535600,0.000000,3.657600>}
box{<0,0,-0.203200><4.387731,0.035000,0.203200> rotate<0,0.000000,0> translate<39.147869,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.147872,0.000000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.938131,0.000000,3.657597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<39.147872,0.000000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.147872,0.000000,6.451597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.938131,0.000000,6.451597>}
box{<0,0,-0.203200><0.790259,0.035000,0.203200> rotate<0,0.000000,0> translate<39.147872,0.000000,6.451597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.161997,0.000000,20.762341>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.161997,0.000000,21.248525>}
box{<0,0,-0.203200><0.486184,0.035000,0.203200> rotate<0,90.000000,0> translate<39.161997,0.000000,21.248525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.161997,0.000000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.569719,0.000000,21.132800>}
box{<0,0,-0.203200><1.407722,0.035000,0.203200> rotate<0,0.000000,0> translate<39.161997,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.161997,0.000000,21.248525>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.198672,0.000000,21.285200>}
box{<0,0,-0.203200><0.051866,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.161997,0.000000,21.248525> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.198672,0.000000,21.285200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.544034,0.000000,21.285200>}
box{<0,0,-0.203200><1.345363,0.035000,0.203200> rotate<0,0.000000,0> translate<39.198672,0.000000,21.285200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.452672,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,13.411200>}
box{<0,0,-0.203200><8.231728,0.035000,0.203200> rotate<0,0.000000,0> translate<39.452672,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.859072,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,13.817600>}
box{<0,0,-0.203200><7.825328,0.035000,0.203200> rotate<0,0.000000,0> translate<39.859072,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.938131,0.000000,3.657597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,2.854131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<39.938131,0.000000,3.657597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.938131,0.000000,3.708400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,4.511866>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.938131,0.000000,3.708400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.938131,0.000000,6.451597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,5.648131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<39.938131,0.000000,6.451597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.192125,0.000000,1.168397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,1.717866>}
box{<0,0,-0.203200><0.777068,0.035000,0.203200> rotate<0,-44.996867,0> translate<40.192125,0.000000,1.168397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.192125,0.000000,1.168397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.801241,0.000000,1.168397>}
box{<0,0,-0.203200><2.609116,0.035000,0.203200> rotate<0,0.000000,0> translate<40.192125,0.000000,1.168397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.242928,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.852044,0.000000,1.219200>}
box{<0,0,-0.203200><2.609116,0.035000,0.203200> rotate<0,0.000000,0> translate<40.242928,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.265472,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,14.224000>}
box{<0,0,-0.203200><7.418928,0.035000,0.203200> rotate<0,0.000000,0> translate<40.265472,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.293728,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.526269,0.000000,6.096000>}
box{<0,0,-0.203200><3.232541,0.035000,0.203200> rotate<0,0.000000,0> translate<40.293728,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.293731,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.526266,0.000000,4.064000>}
box{<0,0,-0.203200><3.232534,0.035000,0.203200> rotate<0,0.000000,0> translate<40.293731,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.344528,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.475472,0.000000,3.251200>}
box{<0,0,-0.203200><3.130944,0.035000,0.203200> rotate<0,0.000000,0> translate<40.344528,0.000000,3.251200> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.607206,0.000000,19.132687>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778688,0.000000,18.961206>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<40.607206,0.000000,19.132687> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.607206,0.000000,35.223309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778688,0.000000,35.394791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.607206,0.000000,35.223309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.649328,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.170666,0.000000,1.625600>}
box{<0,0,-0.203200><2.521338,0.035000,0.203200> rotate<0,0.000000,0> translate<40.649328,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.671872,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,14.630400>}
box{<0,0,-0.203200><7.012528,0.035000,0.203200> rotate<0,0.000000,0> translate<40.671872,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700128,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.119869,0.000000,5.689600>}
box{<0,0,-0.203200><2.419741,0.035000,0.203200> rotate<0,0.000000,0> translate<40.700128,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.700131,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.119866,0.000000,4.470400>}
box{<0,0,-0.203200><2.419734,0.035000,0.203200> rotate<0,0.000000,0> translate<40.700131,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<40.741597,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,2.032000>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<40.741597,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,2.438400>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<40.741597,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,2.844800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<40.741597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,4.511866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,5.648131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<40.741597,0.000000,5.648131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,4.876800>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<40.741597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.741597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,5.283200>}
box{<0,0,-0.203200><2.336803,0.035000,0.203200> rotate<0,0.000000,0> translate<40.741597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778688,0.000000,18.961206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.002741,0.000000,18.868400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<40.778688,0.000000,18.961206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.778688,0.000000,35.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.002741,0.000000,35.487597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<40.778688,0.000000,35.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.002741,0.000000,18.868400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.642931,0.000000,18.868400>}
box{<0,0,-0.203200><3.640191,0.035000,0.203200> rotate<0,0.000000,0> translate<41.002741,0.000000,18.868400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.002741,0.000000,35.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.245256,0.000000,35.487597>}
box{<0,0,-0.203200><4.242516,0.035000,0.203200> rotate<0,0.000000,0> translate<41.002741,0.000000,35.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.078272,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,15.036800>}
box{<0,0,-0.203200><6.606128,0.035000,0.203200> rotate<0,0.000000,0> translate<41.078272,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.484672,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684400,0.000000,15.443200>}
box{<0,0,-0.203200><6.199728,0.035000,0.203200> rotate<0,0.000000,0> translate<41.484672,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.891072,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.684544,0.000000,15.849600>}
box{<0,0,-0.203200><5.793472,0.035000,0.203200> rotate<0,0.000000,0> translate<41.891072,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.236941,0.000000,18.494412>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.465584,0.000000,18.723056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.236941,0.000000,18.494412> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.297472,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.975750,0.000000,16.256000>}
box{<0,0,-0.203200><5.678278,0.035000,0.203200> rotate<0,0.000000,0> translate<42.297472,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.465584,0.000000,18.723056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.764322,0.000000,18.846797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<42.465584,0.000000,18.723056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.703872,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,16.662400>}
box{<0,0,-0.203200><6.405328,0.035000,0.203200> rotate<0,0.000000,0> translate<42.703872,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.764322,0.000000,18.846797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.621325,0.000000,18.846797>}
box{<0,0,-0.203200><1.857003,0.035000,0.203200> rotate<0,0.000000,0> translate<42.764322,0.000000,18.846797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.801241,0.000000,1.168397>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.214556,0.000000,1.581713>}
box{<0,0,-0.203200><0.584517,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.801241,0.000000,1.168397> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.214556,0.000000,1.581713>}
box{<0,0,-0.203200><0.192552,0.035000,0.203200> rotate<0,44.996373,0> translate<43.078400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,1.717866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.078400,0.000000,1.717866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,2.854131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.535600,0.000000,3.311328>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<43.078400,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,4.511866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.535600,0.000000,4.054669>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<43.078400,0.000000,4.511866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,5.648131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,4.511866>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.078400,0.000000,4.511866> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.078400,0.000000,5.648131>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.881866,0.000000,6.451597>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.078400,0.000000,5.648131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.110272,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,17.068800>}
box{<0,0,-0.203200><5.998928,0.035000,0.203200> rotate<0,0.000000,0> translate<43.110272,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.262672,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.119675,0.000000,17.221200>}
box{<0,0,-0.203200><1.857003,0.035000,0.203200> rotate<0,0.000000,0> translate<43.262672,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.535600,0.000000,4.054669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.535600,0.000000,3.311328>}
box{<0,0,-0.203200><0.743341,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.535600,0.000000,3.311328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.881866,0.000000,6.451597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.018131,0.000000,6.451597>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,0.000000,0> translate<43.881866,0.000000,6.451597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.066750,0.000000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.225188,0.000000,1.006031>}
box{<0,0,-0.203200><1.638274,0.035000,0.203200> rotate<0,-44.996876,0> translate<44.066750,0.000000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.066750,0.000000,-0.152400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.066584,0.000000,-0.152400>}
box{<0,0,-0.203200><15.999834,0.035000,0.203200> rotate<0,0.000000,0> translate<44.066750,0.000000,-0.152400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.219150,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.003456,0.000000,0.000000>}
box{<0,0,-0.203200><15.784306,0.035000,0.203200> rotate<0,0.000000,0> translate<44.219150,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.621325,0.000000,18.846797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.642931,0.000000,18.868400>}
box{<0,0,-0.203200><0.030554,0.035000,0.203200> rotate<0,-44.992887,0> translate<44.621325,0.000000,18.846797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.625550,0.000000,0.406400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.835119,0.000000,0.406400>}
box{<0,0,-0.203200><15.209569,0.035000,0.203200> rotate<0,0.000000,0> translate<44.625550,0.000000,0.406400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.018131,0.000000,6.451597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,5.648131>}
box{<0,0,-0.203200><1.136272,0.035000,0.203200> rotate<0,44.997030,0> translate<45.018131,0.000000,6.451597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.031953,0.000000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,0.812800>}
box{<0,0,-0.203200><14.732847,0.035000,0.203200> rotate<0,0.000000,0> translate<45.031953,0.000000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.119675,0.000000,17.221200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.418413,0.000000,17.344941>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<45.119675,0.000000,17.221200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.225188,0.000000,1.006031>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.306806,0.000000,1.203075>}
box{<0,0,-0.203200><0.213279,0.035000,0.203200> rotate<0,-67.495407,0> translate<45.225188,0.000000,1.006031> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.245256,0.000000,35.487597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.469309,0.000000,35.394791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<45.245256,0.000000,35.487597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.306806,0.000000,1.203075>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,1.717866>}
box{<0,0,-0.203200><0.728024,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.306806,0.000000,1.203075> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.322931,0.000000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,1.219200>}
box{<0,0,-0.203200><14.441869,0.035000,0.203200> rotate<0,0.000000,0> translate<45.322931,0.000000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.364397,0.000000,3.311328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.364397,0.000000,4.054669>}
box{<0,0,-0.203200><0.743341,0.035000,0.203200> rotate<0,90.000000,0> translate<45.364397,0.000000,4.054669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.364397,0.000000,3.311328>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,2.854131>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,44.996834,0> translate<45.364397,0.000000,3.311328> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.364397,0.000000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,3.657600>}
box{<0,0,-0.203200><17.780003,0.035000,0.203200> rotate<0,0.000000,0> translate<45.364397,0.000000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.364397,0.000000,4.054669>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,4.511866>}
box{<0,0,-0.203200><0.646576,0.035000,0.203200> rotate<0,-44.996834,0> translate<45.364397,0.000000,4.054669> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.373728,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,4.064000>}
box{<0,0,-0.203200><17.770672,0.035000,0.203200> rotate<0,0.000000,0> translate<45.373728,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.373728,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,6.096000>}
box{<0,0,-0.203200><17.770672,0.035000,0.203200> rotate<0,0.000000,0> translate<45.373728,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.418413,0.000000,17.344941>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.647056,0.000000,17.573584>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.418413,0.000000,17.344941> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.424528,0.000000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,3.251200>}
box{<0,0,-0.203200><17.719872,0.035000,0.203200> rotate<0,0.000000,0> translate<45.424528,0.000000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.469309,0.000000,35.394791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.640791,0.000000,35.223309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<45.469309,0.000000,35.394791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.507300,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.940400,0.000000,35.356800>}
box{<0,0,-0.203200><2.433100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.507300,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.548672,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,17.475200>}
box{<0,0,-0.203200><3.560528,0.035000,0.203200> rotate<0,0.000000,0> translate<45.548672,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.640791,0.000000,35.223309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.733597,0.000000,34.999256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<45.640791,0.000000,35.223309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.647056,0.000000,17.573584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.753563,0.000000,20.680091>}
box{<0,0,-0.203200><4.393263,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.647056,0.000000,17.573584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.729331,0.000000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.835122,0.000000,1.625600>}
box{<0,0,-0.203200><14.105791,0.035000,0.203200> rotate<0,0.000000,0> translate<45.729331,0.000000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.733597,0.000000,34.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.733597,0.000000,34.999256>}
box{<0,0,-0.203200><0.008459,0.035000,0.203200> rotate<0,90.000000,0> translate<45.733597,0.000000,34.999256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.733597,0.000000,34.990797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.940400,0.000000,34.990797>}
box{<0,0,-0.203200><2.206803,0.035000,0.203200> rotate<0,0.000000,0> translate<45.733597,0.000000,34.990797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.751750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.923469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<45.751750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.751750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.751750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.751750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.751750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.923469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.751750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780128,0.000000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,4.470400>}
box{<0,0,-0.203200><17.364272,0.035000,0.203200> rotate<0,0.000000,0> translate<45.780128,0.000000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.780128,0.000000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,5.689600>}
box{<0,0,-0.203200><17.364272,0.035000,0.203200> rotate<0,0.000000,0> translate<45.780128,0.000000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,1.717866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,2.854131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<45.821597,0.000000,2.854131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.003456,0.000000,2.032000>}
box{<0,0,-0.203200><14.181859,0.035000,0.203200> rotate<0,0.000000,0> translate<45.821597,0.000000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.271291,0.000000,2.438400>}
box{<0,0,-0.203200><14.449694,0.035000,0.203200> rotate<0,0.000000,0> translate<45.821597,0.000000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.677691,0.000000,2.844800>}
box{<0,0,-0.203200><14.856094,0.035000,0.203200> rotate<0,0.000000,0> translate<45.821597,0.000000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,4.511866>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,5.648131>}
box{<0,0,-0.203200><1.136266,0.035000,0.203200> rotate<0,90.000000,0> translate<45.821597,0.000000,5.648131> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,4.876800>}
box{<0,0,-0.203200><17.322803,0.035000,0.203200> rotate<0,0.000000,0> translate<45.821597,0.000000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.821597,0.000000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,5.283200>}
box{<0,0,-0.203200><17.322803,0.035000,0.203200> rotate<0,0.000000,0> translate<45.821597,0.000000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.955072,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,17.881600>}
box{<0,0,-0.203200><3.154128,0.035000,0.203200> rotate<0,0.000000,0> translate<45.955072,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.361472,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.075894,0.000000,18.288000>}
box{<0,0,-0.203200><2.714422,0.035000,0.203200> rotate<0,0.000000,0> translate<46.361472,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.767872,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,18.694400>}
box{<0,0,-0.203200><2.144528,0.035000,0.203200> rotate<0,0.000000,0> translate<46.767872,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.923469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.580528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<46.923469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.923469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.580528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<46.923469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.174272,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,19.100800>}
box{<0,0,-0.203200><1.738128,0.035000,0.203200> rotate<0,0.000000,0> translate<47.174272,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.580672,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,19.507200>}
box{<0,0,-0.203200><1.331728,0.035000,0.203200> rotate<0,0.000000,0> translate<47.580672,0.000000,19.507200> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.940400,0.000000,35.407256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.940400,0.000000,34.990797>}
box{<0,0,-0.203200><0.416459,0.035000,0.203200> rotate<0,-90.000000,0> translate<47.940400,0.000000,34.990797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.940400,0.000000,35.407256>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.033206,0.000000,35.631309>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<47.940400,0.000000,35.407256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.948688,0.000000,12.711206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.172741,0.000000,12.618400>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<47.948688,0.000000,12.711206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.948688,0.000000,16.244791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.172741,0.000000,16.337597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<47.948688,0.000000,16.244791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.987072,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.912400,0.000000,19.913600>}
box{<0,0,-0.203200><0.925328,0.035000,0.203200> rotate<0,0.000000,0> translate<47.987072,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.033206,0.000000,35.631309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.204688,0.000000,35.802791>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.033206,0.000000,35.631309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.172741,0.000000,12.618400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.615256,0.000000,12.618400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<48.172741,0.000000,12.618400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.172741,0.000000,16.337597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,16.337597>}
box{<0,0,-0.203200><0.936459,0.035000,0.203200> rotate<0,0.000000,0> translate<48.172741,0.000000,16.337597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.204688,0.000000,35.802791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.428741,0.000000,35.895597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<48.204688,0.000000,35.802791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.393472,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.075897,0.000000,20.320000>}
box{<0,0,-0.203200><0.682425,0.035000,0.203200> rotate<0,0.000000,0> translate<48.393472,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.428741,0.000000,35.895597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.871256,0.000000,35.895597>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<48.428741,0.000000,35.895597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.580528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.752247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.580528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.580528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.752247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<48.580528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.701178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.914819,0.000000,6.502400>}
box{<0,0,-0.203200><5.213641,0.035000,0.203200> rotate<0,0.000000,0> translate<48.701178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.753563,0.000000,20.680091>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.867309,0.000000,20.727206>}
box{<0,0,-0.203200><0.123119,0.035000,0.203200> rotate<0,-22.498570,0> translate<48.753563,0.000000,20.680091> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.802775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.813222,0.000000,10.160000>}
box{<0,0,-0.203200><5.010447,0.035000,0.203200> rotate<0,0.000000,0> translate<48.802775,0.000000,10.160000> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,18.254694>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,44.997030,0> translate<49.005206,0.000000,18.358688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.005206,0.000000,20.249309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.353303>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.005206,0.000000,20.249309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.022000,0.000000,20.881897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.794694>}
box{<0,0,-0.203200><0.123322,0.035000,0.203200> rotate<0,44.998057,0> translate<49.022000,0.000000,20.881897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.072797,0.000000,22.856897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.072797,0.000000,23.031325>}
box{<0,0,-0.203200><0.174428,0.035000,0.203200> rotate<0,90.000000,0> translate<49.072797,0.000000,23.031325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.072797,0.000000,22.856897>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.176687,0.000000,22.960791>}
box{<0,0,-0.203200><0.146926,0.035000,0.203200> rotate<0,-44.997892,0> translate<49.072797,0.000000,22.856897> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.072797,0.000000,23.031325>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.097056,0.000000,25.055584>}
box{<0,0,-0.203200><2.862735,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.072797,0.000000,23.031325> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.107578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.508419,0.000000,6.908800>}
box{<0,0,-0.203200><4.400841,0.035000,0.203200> rotate<0,0.000000,0> translate<49.107578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,18.254694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,16.337597>}
box{<0,0,-0.203200><1.917097,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.109200,0.000000,16.337597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.794694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.109200,0.000000,20.353303>}
box{<0,0,-0.203200><0.441391,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.109200,0.000000,20.353303> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.176687,0.000000,22.960791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.400741,0.000000,23.053597>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.176687,0.000000,22.960791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.206272,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.153681,0.000000,23.164800>}
box{<0,0,-0.203200><1.947409,0.035000,0.203200> rotate<0,0.000000,0> translate<49.206272,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.209175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.406822,0.000000,9.753600>}
box{<0,0,-0.203200><4.197647,0.035000,0.203200> rotate<0,0.000000,0> translate<49.209175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.400741,0.000000,23.053597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.443256,0.000000,23.053597>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,0.000000,0> translate<49.400741,0.000000,23.053597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.513978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.102019,0.000000,7.315200>}
box{<0,0,-0.203200><3.588041,0.035000,0.203200> rotate<0,0.000000,0> translate<49.513978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.612672,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.255728,0.000000,23.571200>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<49.612672,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.615256,0.000000,12.618400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.839309,0.000000,12.711206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<49.615256,0.000000,12.618400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.615575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.000422,0.000000,9.347200>}
box{<0,0,-0.203200><3.384847,0.035000,0.203200> rotate<0,0.000000,0> translate<49.615575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.752247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.752247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<49.752247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.752247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,7.721600>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<49.752247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.752247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,8.128000>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<49.752247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.752247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,8.534400>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<49.752247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.752247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,8.940800>}
box{<0,0,-0.203200><3.111503,0.035000,0.203200> rotate<0,0.000000,0> translate<49.752247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.839309,0.000000,12.711206>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.010791,0.000000,12.882688>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.839309,0.000000,12.711206> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.871256,0.000000,35.895597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.095309,0.000000,35.802791>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,22.498604,0> translate<49.871256,0.000000,35.895597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.010791,0.000000,12.882688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,13.106741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.010791,0.000000,12.882688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.019072,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.662128,0.000000,23.977600>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<50.019072,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.061369,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.035094,0.000000,13.004800>}
box{<0,0,-0.203200><0.973725,0.035000,0.203200> rotate<0,0.000000,0> translate<50.061369,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.095309,0.000000,35.802791>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.266791,0.000000,35.631309>}
box{<0,0,-0.203200><0.242511,0.035000,0.203200> rotate<0,44.997030,0> translate<50.095309,0.000000,35.802791> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,13.106741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,14.538128>}
box{<0,0,-0.203200><1.431387,0.035000,0.203200> rotate<0,90.000000,0> translate<50.103597,0.000000,14.538128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,13.411200>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.103597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,13.817600>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.103597,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.860400,0.000000,14.224000>}
box{<0,0,-0.203200><0.756803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.103597,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.103597,0.000000,14.538128>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.611056,0.000000,15.045584>}
box{<0,0,-0.203200><0.717654,0.035000,0.203200> rotate<0,-44.996854,0> translate<50.103597,0.000000,14.538128> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.134900,0.000000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.024494,0.000000,35.763200>}
box{<0,0,-0.203200><9.889594,0.035000,0.203200> rotate<0,0.000000,0> translate<50.134900,0.000000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.195869,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.006300,0.000000,14.630400>}
box{<0,0,-0.203200><0.810431,0.035000,0.203200> rotate<0,0.000000,0> translate<50.195869,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.266791,0.000000,35.631309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,35.407256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<50.266791,0.000000,35.631309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,33.975872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,35.407256>}
box{<0,0,-0.203200><1.431384,0.035000,0.203200> rotate<0,90.000000,0> translate<50.359597,0.000000,35.407256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,33.975872>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.097056,0.000000,33.238413>}
box{<0,0,-0.203200><1.042925,0.035000,0.203200> rotate<0,44.997030,0> translate<50.359597,0.000000,33.975872> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,34.137600>}
box{<0,0,-0.203200><12.784803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,34.544000>}
box{<0,0,-0.203200><12.784803,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.735606,0.000000,34.950400>}
box{<0,0,-0.203200><10.376009,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.359597,0.000000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.322088,0.000000,35.356800>}
box{<0,0,-0.203200><9.962491,0.035000,0.203200> rotate<0,0.000000,0> translate<50.359597,0.000000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.425472,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.068528,0.000000,24.384000>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<50.425472,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.443256,0.000000,23.053597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.454844,0.000000,23.048797>}
box{<0,0,-0.203200><0.012542,0.035000,0.203200> rotate<0,22.499783,0> translate<50.443256,0.000000,23.053597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.454844,0.000000,23.048797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.020694,0.000000,23.048797>}
box{<0,0,-0.203200><0.565850,0.035000,0.203200> rotate<0,0.000000,0> translate<50.454844,0.000000,23.048797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.602269,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.891025,0.000000,15.036800>}
box{<0,0,-0.203200><0.288756,0.035000,0.203200> rotate<0,0.000000,0> translate<50.602269,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.604269,0.000000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,33.731200>}
box{<0,0,-0.203200><12.540131,0.035000,0.203200> rotate<0,0.000000,0> translate<50.604269,0.000000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.611056,0.000000,15.045584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,15.344322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<50.611056,0.000000,15.045584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,15.344322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,18.254694>}
box{<0,0,-0.203200><2.910372,0.035000,0.203200> rotate<0,90.000000,0> translate<50.734797,0.000000,18.254694> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.734797,0.000000,18.254694>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.838791,0.000000,18.358688>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<50.734797,0.000000,18.254694> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.768103,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,18.288000>}
box{<0,0,-0.203200><0.489097,0.035000,0.203200> rotate<0,0.000000,0> translate<50.768103,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.831872,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.474928,0.000000,24.790400>}
box{<0,0,-0.203200><2.643056,0.035000,0.203200> rotate<0,0.000000,0> translate<50.831872,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.838791,0.000000,18.358688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.931597,0.000000,18.582741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<50.838791,0.000000,18.358688> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.010669,0.000000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,33.324800>}
box{<0,0,-0.203200><12.133731,0.035000,0.203200> rotate<0,0.000000,0> translate<51.010669,0.000000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.020694,0.000000,23.048797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.124688,0.000000,23.152791>}
box{<0,0,-0.203200><0.147069,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.020694,0.000000,23.048797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.097056,0.000000,25.055584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,25.354322>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-67.495627,0> translate<51.097056,0.000000,25.055584> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.097056,0.000000,33.238413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,32.939675>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,67.495627,0> translate<51.097056,0.000000,33.238413> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.155547,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.881328,0.000000,25.196800>}
box{<0,0,-0.203200><2.725781,0.035000,0.203200> rotate<0,0.000000,0> translate<51.155547,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,25.354322>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,29.684697>}
box{<0,0,-0.203200><4.330375,0.035000,0.203200> rotate<0,90.000000,0> translate<51.220797,0.000000,29.684697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.287728,0.000000,25.603200>}
box{<0,0,-0.203200><3.066931,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.694128,0.000000,26.009600>}
box{<0,0,-0.203200><3.473331,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.132978,0.000000,26.416000>}
box{<0,0,-0.203200><3.912181,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.197066,0.000000,26.822400>}
box{<0,0,-0.203200><7.976269,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,27.228800>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,27.635200>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.965619,0.000000,28.041600>}
box{<0,0,-0.203200><2.744822,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.559219,0.000000,28.448000>}
box{<0,0,-0.203200><2.338422,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.152819,0.000000,28.854400>}
box{<0,0,-0.203200><1.932022,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,29.260800>}
box{<0,0,-0.203200><1.642953,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,29.667200>}
box{<0,0,-0.203200><1.642953,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,29.684697>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.324791,0.000000,29.788688>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,-44.996169,0> translate<51.220797,0.000000,29.684697> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,31.783300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,32.939675>}
box{<0,0,-0.203200><1.156375,0.035000,0.203200> rotate<0,90.000000,0> translate<51.220797,0.000000,32.939675> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,31.783300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.324791,0.000000,31.679309>}
box{<0,0,-0.203200><0.147067,0.035000,0.203200> rotate<0,44.996169,0> translate<51.220797,0.000000,31.783300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,32.105600>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,32.512000>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.220797,0.000000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,32.918400>}
box{<0,0,-0.203200><11.923603,0.035000,0.203200> rotate<0,0.000000,0> translate<51.220797,0.000000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,19.464319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.257200,0.000000,16.603678>}
box{<0,0,-0.203200><2.860641,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.257200,0.000000,16.603678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.304900,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.762422,0.000000,31.699200>}
box{<0,0,-0.203200><2.457522,0.035000,0.203200> rotate<0,0.000000,0> translate<51.304900,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.324791,0.000000,29.788688>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.417597,0.000000,30.012741>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-67.495456,0> translate<51.324791,0.000000,29.788688> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.324791,0.000000,31.679309>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.417597,0.000000,31.455256>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,67.495456,0> translate<51.324791,0.000000,31.679309> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.348741,0.000000,12.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.791256,0.000000,12.822400>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,0.000000,0> translate<51.348741,0.000000,12.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.348741,0.000000,23.245597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.930125,0.000000,23.245597>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,0.000000,0> translate<51.348741,0.000000,23.245597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.417597,0.000000,30.012741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.417597,0.000000,31.455256>}
box{<0,0,-0.203200><1.442516,0.035000,0.203200> rotate<0,90.000000,0> translate<51.417597,0.000000,31.455256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.417597,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,30.073600>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<51.417597,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.417597,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,30.480000>}
box{<0,0,-0.203200><1.446153,0.035000,0.203200> rotate<0,0.000000,0> translate<51.417597,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.417597,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.949622,0.000000,30.886400>}
box{<0,0,-0.203200><1.532025,0.035000,0.203200> rotate<0,0.000000,0> translate<51.417597,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.417597,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.356022,0.000000,31.292800>}
box{<0,0,-0.203200><1.938425,0.035000,0.203200> rotate<0,0.000000,0> translate<51.417597,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.930125,0.000000,23.245597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.848941,0.000000,26.164413>}
box{<0,0,-0.203200><4.127829,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.930125,0.000000,23.245597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.791256,0.000000,12.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,12.915206>}
box{<0,0,-0.203200><0.242514,0.035000,0.203200> rotate<0,-22.498604,0> translate<52.791256,0.000000,12.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.035469,0.000000,6.381750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<52.863750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,7.553469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.863750,0.000000,7.553469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,9.210528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.035469,0.000000,10.382247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.863750,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,29.143469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.035469,0.000000,27.971750>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<52.863750,0.000000,29.143469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,30.800528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,29.143469>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.863750,0.000000,29.143469> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.863750,0.000000,30.800528>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.035469,0.000000,31.972247>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.863750,0.000000,30.800528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,16.603678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,19.464319>}
box{<0,0,-0.203200><2.860641,0.035000,0.203200> rotate<0,90.000000,0> translate<52.882797,0.000000,19.464319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,16.603678>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,16.548791>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,22.498155,0> translate<52.882797,0.000000,16.603678> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,16.662400>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,17.068800>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,17.475200>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,17.881600>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,18.288000>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,18.694400>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,19.100800>}
box{<0,0,-0.203200><10.261603,0.035000,0.203200> rotate<0,0.000000,0> translate<52.882797,0.000000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.882797,0.000000,19.464319>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.015309,0.000000,19.519206>}
box{<0,0,-0.203200><0.143430,0.035000,0.203200> rotate<0,-22.498155,0> translate<52.882797,0.000000,19.464319> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.986322,0.000000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,19.507200>}
box{<0,0,-0.203200><10.158078,0.035000,0.203200> rotate<0,0.000000,0> translate<52.986322,0.000000,19.507200> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.699400,0.000000,13.004800>}
box{<0,0,-0.203200><5.594497,0.035000,0.203200> rotate<0,0.000000,0> translate<53.104903,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.119303,0.000000,13.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.699400,0.000000,13.019200>}
box{<0,0,-0.203200><5.580097,0.035000,0.203200> rotate<0,0.000000,0> translate<53.119303,0.000000,13.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.119303,0.000000,14.644797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.431675,0.000000,14.644797>}
box{<0,0,-0.203200><6.312372,0.035000,0.203200> rotate<0,0.000000,0> translate<53.119303,0.000000,14.644797> }
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
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,21.132800>}
box{<0,0,-0.203200><9.937516,0.035000,0.203200> rotate<0,0.000000,0> translate<53.206884,0.000000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.206884,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,21.539200>}
box{<0,0,-0.203200><9.937516,0.035000,0.203200> rotate<0,0.000000,0> translate<53.206884,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.237041,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,16.256000>}
box{<0,0,-0.203200><9.907359,0.035000,0.203200> rotate<0,0.000000,0> translate<53.237041,0.000000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.248969,0.000000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,15.036800>}
box{<0,0,-0.203200><9.895431,0.035000,0.203200> rotate<0,0.000000,0> translate<53.248969,0.000000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279122,0.000000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,19.913600>}
box{<0,0,-0.203200><9.865278,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279122,0.000000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,15.110741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,16.153256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<53.279597,0.000000,16.153256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,15.443200>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,15.849600>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,19.914741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,20.957256>}
box{<0,0,-0.203200><1.042516,0.035000,0.203200> rotate<0,90.000000,0> translate<53.279597,0.000000,20.957256> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,20.320000>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,20.726400>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,21.714741>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,22.296125>}
box{<0,0,-0.203200><0.581384,0.035000,0.203200> rotate<0,90.000000,0> translate<53.279597,0.000000,22.296125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,21.945600>}
box{<0,0,-0.203200><9.864803,0.035000,0.203200> rotate<0,0.000000,0> translate<53.279597,0.000000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.279597,0.000000,22.296125>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.874672,0.000000,24.891200>}
box{<0,0,-0.203200><3.669990,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.279597,0.000000,22.296125> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.335472,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,22.352000>}
box{<0,0,-0.203200><9.808928,0.035000,0.203200> rotate<0,0.000000,0> translate<53.335472,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.741872,0.000000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,22.758400>}
box{<0,0,-0.203200><9.402528,0.035000,0.203200> rotate<0,0.000000,0> translate<53.741872,0.000000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.035469,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692528,0.000000,6.381750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<54.035469,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.035469,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692528,0.000000,10.382247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<54.035469,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.035469,0.000000,27.971750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692528,0.000000,27.971750>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<54.035469,0.000000,27.971750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.035469,0.000000,31.972247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692528,0.000000,31.972247>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,0.000000,0> translate<54.035469,0.000000,31.972247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.148272,0.000000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,23.164800>}
box{<0,0,-0.203200><8.996128,0.035000,0.203200> rotate<0,0.000000,0> translate<54.148272,0.000000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.554672,0.000000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,23.571200>}
box{<0,0,-0.203200><8.589728,0.035000,0.203200> rotate<0,0.000000,0> translate<54.554672,0.000000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.848941,0.000000,26.164413>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.077584,0.000000,26.393056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.848941,0.000000,26.164413> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.961072,0.000000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,23.977600>}
box{<0,0,-0.203200><8.183328,0.035000,0.203200> rotate<0,0.000000,0> translate<54.961072,0.000000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.077584,0.000000,26.393056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.376322,0.000000,26.516797>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,-22.498433,0> translate<55.077584,0.000000,26.393056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.367472,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.398659,0.000000,24.384000>}
box{<0,0,-0.203200><4.031188,0.035000,0.203200> rotate<0,0.000000,0> translate<55.367472,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.376322,0.000000,26.516797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.891463,0.000000,26.516797>}
box{<0,0,-0.203200><3.515141,0.035000,0.203200> rotate<0,0.000000,0> translate<55.376322,0.000000,26.516797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692528,0.000000,6.381750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,7.553469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.692528,0.000000,6.381750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692528,0.000000,10.382247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<55.692528,0.000000,10.382247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692528,0.000000,27.971750>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,29.143469>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.692528,0.000000,27.971750> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.692528,0.000000,31.972247>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,30.800528>}
box{<0,0,-0.203200><1.657061,0.035000,0.203200> rotate<0,44.997030,0> translate<55.692528,0.000000,31.972247> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.762378,0.000000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,28.041600>}
box{<0,0,-0.203200><7.382022,0.035000,0.203200> rotate<0,0.000000,0> translate<55.762378,0.000000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.773872,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.992259,0.000000,24.790400>}
box{<0,0,-0.203200><3.218387,0.035000,0.203200> rotate<0,0.000000,0> translate<55.773872,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.813178,0.000000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,6.502400>}
box{<0,0,-0.203200><7.331222,0.035000,0.203200> rotate<0,0.000000,0> translate<55.813178,0.000000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.874672,0.000000,24.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.891463,0.000000,24.891200>}
box{<0,0,-0.203200><3.016791,0.035000,0.203200> rotate<0,0.000000,0> translate<55.874672,0.000000,24.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.914775,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,10.160000>}
box{<0,0,-0.203200><7.229625,0.035000,0.203200> rotate<0,0.000000,0> translate<55.914775,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.965575,0.000000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,31.699200>}
box{<0,0,-0.203200><7.178825,0.035000,0.203200> rotate<0,0.000000,0> translate<55.965575,0.000000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.168778,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,28.448000>}
box{<0,0,-0.203200><6.975622,0.035000,0.203200> rotate<0,0.000000,0> translate<56.168778,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.219578,0.000000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,6.908800>}
box{<0,0,-0.203200><6.924822,0.035000,0.203200> rotate<0,0.000000,0> translate<56.219578,0.000000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.321175,0.000000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,9.753600>}
box{<0,0,-0.203200><6.823225,0.035000,0.203200> rotate<0,0.000000,0> translate<56.321175,0.000000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.371975,0.000000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,31.292800>}
box{<0,0,-0.203200><6.772425,0.035000,0.203200> rotate<0,0.000000,0> translate<56.371975,0.000000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.575178,0.000000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,28.854400>}
box{<0,0,-0.203200><6.569222,0.035000,0.203200> rotate<0,0.000000,0> translate<56.575178,0.000000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.625978,0.000000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,7.315200>}
box{<0,0,-0.203200><6.518422,0.035000,0.203200> rotate<0,0.000000,0> translate<56.625978,0.000000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.727575,0.000000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,9.347200>}
box{<0,0,-0.203200><6.416825,0.035000,0.203200> rotate<0,0.000000,0> translate<56.727575,0.000000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.778375,0.000000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,30.886400>}
box{<0,0,-0.203200><6.366025,0.035000,0.203200> rotate<0,0.000000,0> translate<56.778375,0.000000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,7.553469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,9.210528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<56.864247,0.000000,9.210528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,7.721600>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<56.864247,0.000000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,8.128000>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<56.864247,0.000000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,8.534400>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<56.864247,0.000000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,8.940800>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<56.864247,0.000000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,29.143469>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,30.800528>}
box{<0,0,-0.203200><1.657059,0.035000,0.203200> rotate<0,90.000000,0> translate<56.864247,0.000000,30.800528> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,29.260800>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<56.864247,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,29.667200>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<56.864247,0.000000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,30.073600>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<56.864247,0.000000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.864247,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,30.480000>}
box{<0,0,-0.203200><6.280153,0.035000,0.203200> rotate<0,0.000000,0> translate<56.864247,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.699400,0.000000,12.283259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.577259,0.000000,11.405400>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<58.699400,0.000000,12.283259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.699400,0.000000,13.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.699400,0.000000,12.283259>}
box{<0,0,-0.203200><0.735941,0.035000,0.203200> rotate<0,-90.000000,0> translate<58.699400,0.000000,12.283259> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.891463,0.000000,24.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.577259,0.000000,24.205400>}
box{<0,0,-0.203200><0.969865,0.035000,0.203200> rotate<0,44.997161,0> translate<58.891463,0.000000,24.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.891463,0.000000,26.516797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.577259,0.000000,27.202597>}
box{<0,0,-0.203200><0.969865,0.035000,0.203200> rotate<0,-44.997161,0> translate<58.891463,0.000000,26.516797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.431675,0.000000,14.644797>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.730412,0.000000,14.521056>}
box{<0,0,-0.203200><0.323351,0.035000,0.203200> rotate<0,22.498433,0> translate<59.431675,0.000000,14.644797> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.466434,0.000000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,14.630400>}
box{<0,0,-0.203200><3.677966,0.035000,0.203200> rotate<0,0.000000,0> translate<59.466434,0.000000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.577259,0.000000,11.405400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.818738,0.000000,11.405400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<59.577259,0.000000,11.405400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.577259,0.000000,24.205400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.818738,0.000000,24.205400>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<59.577259,0.000000,24.205400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.577259,0.000000,27.202597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.818738,0.000000,27.202597>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,0.000000,0> translate<59.577259,0.000000,27.202597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.730412,0.000000,14.521056>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.848872,0.000000,14.402597>}
box{<0,0,-0.203200><0.167527,0.035000,0.203200> rotate<0,44.997030,0> translate<59.730412,0.000000,14.521056> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,0.576163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.066584,0.000000,-0.152400>}
box{<0,0,-0.203200><0.788592,0.035000,0.203200> rotate<0,67.495283,0> translate<59.764800,0.000000,0.576163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,1.455834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,0.576163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.764800,0.000000,0.576163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,1.455834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.101434,0.000000,2.268544>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-67.495598,0> translate<59.764800,0.000000,1.455834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,36.390163>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.101434,0.000000,35.577453>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,67.495598,0> translate<59.764800,0.000000,36.390163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,37.269834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,36.390163>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.764800,0.000000,36.390163> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.764800,0.000000,37.269834>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.066584,0.000000,37.998400>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-67.495370,0> translate<59.764800,0.000000,37.269834> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.848872,0.000000,14.402597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.818738,0.000000,14.402597>}
box{<0,0,-0.203200><0.969866,0.035000,0.203200> rotate<0,0.000000,0> translate<59.848872,0.000000,14.402597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.101434,0.000000,2.268544>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.723453,0.000000,2.890563>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.101434,0.000000,2.268544> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.101434,0.000000,35.577453>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.723453,0.000000,34.955434>}
box{<0,0,-0.203200><0.879667,0.035000,0.203200> rotate<0,44.997030,0> translate<60.101434,0.000000,35.577453> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.723453,0.000000,2.890563>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.536163,0.000000,3.227197>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,-22.498463,0> translate<60.723453,0.000000,2.890563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.723453,0.000000,34.955434>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.536163,0.000000,34.618800>}
box{<0,0,-0.203200><0.879670,0.035000,0.203200> rotate<0,22.498463,0> translate<60.723453,0.000000,34.955434> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.818738,0.000000,11.405400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,12.283259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.818738,0.000000,11.405400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.818738,0.000000,14.402597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,13.524738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<60.818738,0.000000,14.402597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.818738,0.000000,24.205400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,25.083259>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.818738,0.000000,24.205400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.818738,0.000000,27.202597>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,26.324738>}
box{<0,0,-0.203200><1.241481,0.035000,0.203200> rotate<0,44.997030,0> translate<60.818738,0.000000,27.202597> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.997334,0.000000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,14.224000>}
box{<0,0,-0.203200><2.147066,0.035000,0.203200> rotate<0,0.000000,0> translate<60.997334,0.000000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.997338,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,24.384000>}
box{<0,0,-0.203200><2.147063,0.035000,0.203200> rotate<0,0.000000,0> translate<60.997338,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.198934,0.000000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,26.822400>}
box{<0,0,-0.203200><1.945466,0.035000,0.203200> rotate<0,0.000000,0> translate<61.198934,0.000000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.198937,0.000000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,11.785600>}
box{<0,0,-0.203200><1.945463,0.035000,0.203200> rotate<0,0.000000,0> translate<61.198937,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.403734,0.000000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,13.817600>}
box{<0,0,-0.203200><1.740666,0.035000,0.203200> rotate<0,0.000000,0> translate<61.403734,0.000000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.403738,0.000000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,24.790400>}
box{<0,0,-0.203200><1.740662,0.035000,0.203200> rotate<0,0.000000,0> translate<61.403738,0.000000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.536163,0.000000,3.227197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.415834,0.000000,3.227197>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<61.536163,0.000000,3.227197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.536163,0.000000,34.618800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.415834,0.000000,34.618800>}
box{<0,0,-0.203200><0.879672,0.035000,0.203200> rotate<0,0.000000,0> translate<61.536163,0.000000,34.618800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.605334,0.000000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,26.416000>}
box{<0,0,-0.203200><1.539066,0.035000,0.203200> rotate<0,0.000000,0> translate<61.605334,0.000000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.605338,0.000000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,12.192000>}
box{<0,0,-0.203200><1.539062,0.035000,0.203200> rotate<0,0.000000,0> translate<61.605338,0.000000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,12.283259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,13.524738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<61.696597,0.000000,13.524738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,12.598400>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<61.696597,0.000000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,13.004800>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<61.696597,0.000000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,13.411200>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<61.696597,0.000000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,25.083259>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,26.324738>}
box{<0,0,-0.203200><1.241478,0.035000,0.203200> rotate<0,90.000000,0> translate<61.696597,0.000000,26.324738> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,25.196800>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<61.696597,0.000000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,25.603200>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<61.696597,0.000000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.696597,0.000000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,26.009600>}
box{<0,0,-0.203200><1.447803,0.035000,0.203200> rotate<0,0.000000,0> translate<61.696597,0.000000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.415834,0.000000,3.227197>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,2.925413>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,22.498690,0> translate<62.415834,0.000000,3.227197> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.415834,0.000000,34.618800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,34.920584>}
box{<0,0,-0.203200><0.788595,0.035000,0.203200> rotate<0,-22.498690,0> translate<62.415834,0.000000,34.618800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,34.920584>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.144400,0.000000,2.925413>}
box{<0,0,-0.203200><31.995172,0.035000,0.203200> rotate<0,-90.000000,0> translate<63.144400,0.000000,2.925413> }
texture{col_pol}
}
#end
union{
cylinder{<54.864000,0.038000,29.972000><54.864000,-1.538000,29.972000>0.927100}
cylinder{<47.752000,0.038000,29.972000><47.752000,-1.538000,29.972000>0.927100}
cylinder{<4.572000,0.038000,29.972000><4.572000,-1.538000,29.972000>0.927100}
cylinder{<11.684000,0.038000,29.972000><11.684000,-1.538000,29.972000>0.927100}
cylinder{<4.572000,0.038000,8.382000><4.572000,-1.538000,8.382000>0.927100}
cylinder{<11.684000,0.038000,8.382000><11.684000,-1.538000,8.382000>0.927100}
cylinder{<54.864000,0.038000,8.382000><54.864000,-1.538000,8.382000>0.927100}
cylinder{<47.752000,0.038000,8.382000><47.752000,-1.538000,8.382000>0.927100}
cylinder{<60.198000,0.038000,25.704000><60.198000,-1.538000,25.704000>0.508000}
cylinder{<60.198000,0.038000,12.904000><60.198000,-1.538000,12.904000>0.508000}
cylinder{<15.748000,0.038000,2.286000><15.748000,-1.538000,2.286000>0.508000}
cylinder{<18.288000,0.038000,2.286000><18.288000,-1.538000,2.286000>0.508000}
cylinder{<20.828000,0.038000,2.286000><20.828000,-1.538000,2.286000>0.508000}
cylinder{<23.368000,0.038000,2.286000><23.368000,-1.538000,2.286000>0.508000}
cylinder{<18.542000,0.038000,27.432000><18.542000,-1.538000,27.432000>0.508000}
cylinder{<16.002000,0.038000,27.432000><16.002000,-1.538000,27.432000>0.508000}
cylinder{<18.542000,0.038000,29.972000><18.542000,-1.538000,29.972000>0.508000}
cylinder{<16.002000,0.038000,29.972000><16.002000,-1.538000,29.972000>0.508000}
cylinder{<18.542000,0.038000,32.512000><18.542000,-1.538000,32.512000>0.508000}
cylinder{<16.002000,0.038000,32.512000><16.002000,-1.538000,32.512000>0.508000}
cylinder{<15.748000,0.038000,5.080000><15.748000,-1.538000,5.080000>0.508000}
cylinder{<18.288000,0.038000,5.080000><18.288000,-1.538000,5.080000>0.508000}
cylinder{<20.828000,0.038000,5.080000><20.828000,-1.538000,5.080000>0.508000}
cylinder{<23.368000,0.038000,5.080000><23.368000,-1.538000,5.080000>0.508000}
cylinder{<36.830000,0.038000,5.080000><36.830000,-1.538000,5.080000>0.508000}
cylinder{<39.370000,0.038000,5.080000><39.370000,-1.538000,5.080000>0.508000}
cylinder{<41.910000,0.038000,5.080000><41.910000,-1.538000,5.080000>0.508000}
cylinder{<44.450000,0.038000,5.080000><44.450000,-1.538000,5.080000>0.508000}
cylinder{<36.830000,0.038000,2.286000><36.830000,-1.538000,2.286000>0.508000}
cylinder{<39.370000,0.038000,2.286000><39.370000,-1.538000,2.286000>0.508000}
cylinder{<41.910000,0.038000,2.286000><41.910000,-1.538000,2.286000>0.508000}
cylinder{<44.450000,0.038000,2.286000><44.450000,-1.538000,2.286000>0.508000}
//Holes(fast)/Vias
cylinder{<25.400000,0.038000,5.080000><25.400000,-1.538000,5.080000>0.300000 }
cylinder{<27.940000,0.038000,7.620000><27.940000,-1.538000,7.620000>0.300000 }
cylinder{<34.544000,0.038000,5.080000><34.544000,-1.538000,5.080000>0.300000 }
cylinder{<38.100000,0.038000,21.336000><38.100000,-1.538000,21.336000>0.300000 }
cylinder{<26.664000,0.038000,18.294000><26.664000,-1.538000,18.294000>0.300000 }
cylinder{<26.670000,0.038000,26.162000><26.670000,-1.538000,26.162000>0.300000 }
cylinder{<27.718000,0.038000,20.034000><27.718000,-1.538000,20.034000>0.300000 }
cylinder{<27.940000,0.038000,24.130000><27.940000,-1.538000,24.130000>0.300000 }
cylinder{<30.480000,0.038000,6.858000><30.480000,-1.538000,6.858000>0.300000 }
cylinder{<29.972000,0.038000,16.764000><29.972000,-1.538000,16.764000>0.300000 }
cylinder{<25.654000,0.038000,16.764000><25.654000,-1.538000,16.764000>0.300000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.102100,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.102100,0.000000,24.413841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.102100,0.000000,24.413841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.102100,0.000000,24.413841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347841,0.000000,24.168100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<4.102100,0.000000,24.413841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.347841,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.593584,0.000000,24.413841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<4.347841,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.593584,0.000000,24.413841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.593584,0.000000,24.905328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<4.593584,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.850516,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.850516,0.000000,24.905328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<4.850516,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.850516,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.219128,0.000000,24.905328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<4.850516,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.219128,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.342000,0.000000,24.782456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<5.219128,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.342000,0.000000,24.782456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.342000,0.000000,24.659584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.342000,0.000000,24.659584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.342000,0.000000,24.659584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.219128,0.000000,24.536713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.219128,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.219128,0.000000,24.536713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.342000,0.000000,24.413841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<5.219128,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.342000,0.000000,24.413841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.342000,0.000000,24.290969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.342000,0.000000,24.290969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.342000,0.000000,24.290969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.219128,0.000000,24.168100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<5.219128,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.219128,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.850516,0.000000,24.168100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<4.850516,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.850516,0.000000,24.536713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.219128,0.000000,24.536713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<4.850516,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.598931,0.000000,24.045231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.090416,0.000000,24.045231>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<5.598931,0.000000,24.045231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.838831,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.347347,0.000000,24.905328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<6.347347,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.347347,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.347347,0.000000,24.168100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.347347,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.347347,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.838831,0.000000,24.168100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<6.347347,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.347347,0.000000,24.536713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.593088,0.000000,24.536713>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<6.347347,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.095763,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.095763,0.000000,24.905328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<7.095763,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.095763,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587247,0.000000,24.168100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<7.095763,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587247,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587247,0.000000,24.905328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<7.587247,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.592594,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.592594,0.000000,24.168100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.592594,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.590481,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.590481,0.000000,24.413841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.590481,0.000000,24.413841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.590481,0.000000,24.413841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.836222,0.000000,24.168100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<9.590481,0.000000,24.413841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.836222,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.081966,0.000000,24.413841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<9.836222,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.081966,0.000000,24.413841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.081966,0.000000,24.905328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<10.081966,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.338897,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.338897,0.000000,24.905328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<10.338897,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.338897,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707509,0.000000,24.905328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<10.338897,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707509,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.830381,0.000000,24.782456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<10.707509,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.830381,0.000000,24.782456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.830381,0.000000,24.659584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.830381,0.000000,24.659584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.830381,0.000000,24.659584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707509,0.000000,24.536713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<10.707509,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707509,0.000000,24.536713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.830381,0.000000,24.413841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<10.707509,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.830381,0.000000,24.413841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.830381,0.000000,24.290969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<10.830381,0.000000,24.290969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.830381,0.000000,24.290969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707509,0.000000,24.168100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<10.707509,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707509,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.338897,0.000000,24.168100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<10.338897,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.338897,0.000000,24.536713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<10.707509,0.000000,24.536713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<10.338897,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.087313,0.000000,24.045231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.578797,0.000000,24.045231>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<11.087313,0.000000,24.045231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.835728,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.835728,0.000000,24.168100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<11.835728,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.835728,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.204341,0.000000,24.168100>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<11.835728,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.204341,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.327212,0.000000,24.290969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<12.204341,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.327212,0.000000,24.290969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.327212,0.000000,24.782456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<12.327212,0.000000,24.782456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.327212,0.000000,24.782456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.204341,0.000000,24.905328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<12.204341,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.204341,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<11.835728,0.000000,24.905328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<11.835728,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.584144,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829884,0.000000,24.168100>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<12.584144,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.707013,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.707013,0.000000,24.905328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<12.707013,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.584144,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<12.829884,0.000000,24.905328>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<12.584144,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.574572,0.000000,24.782456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.451700,0.000000,24.905328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.451700,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.451700,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.205956,0.000000,24.905328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<13.205956,0.000000,24.905328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.205956,0.000000,24.905328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.083088,0.000000,24.782456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<13.083088,0.000000,24.782456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.083088,0.000000,24.782456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.083088,0.000000,24.659584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.083088,0.000000,24.659584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.083088,0.000000,24.659584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.205956,0.000000,24.536713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<13.083088,0.000000,24.659584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.205956,0.000000,24.536713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.451700,0.000000,24.536713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<13.205956,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.451700,0.000000,24.536713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.574572,0.000000,24.413841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<13.451700,0.000000,24.536713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.574572,0.000000,24.413841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.574572,0.000000,24.290969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.574572,0.000000,24.290969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.574572,0.000000,24.290969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.451700,0.000000,24.168100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<13.451700,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.451700,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.205956,0.000000,24.168100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<13.205956,0.000000,24.168100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.205956,0.000000,24.168100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.083088,0.000000,24.290969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<13.083088,0.000000,24.290969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.786100,0.000000,19.571328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.786100,0.000000,19.079841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.786100,0.000000,19.079841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.786100,0.000000,19.079841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.031841,0.000000,18.834100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<15.786100,0.000000,19.079841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.031841,0.000000,18.834100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.277584,0.000000,19.079841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<16.031841,0.000000,18.834100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.277584,0.000000,19.079841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.277584,0.000000,19.571328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<16.277584,0.000000,19.571328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.534516,0.000000,18.834100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.534516,0.000000,19.571328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<16.534516,0.000000,19.571328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.534516,0.000000,19.571328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.903128,0.000000,19.571328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<16.534516,0.000000,19.571328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.903128,0.000000,19.571328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.026000,0.000000,19.448456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.903128,0.000000,19.571328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.026000,0.000000,19.448456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.026000,0.000000,19.325584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.026000,0.000000,19.325584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.026000,0.000000,19.325584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.903128,0.000000,19.202713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.903128,0.000000,19.202713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.903128,0.000000,19.202713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.026000,0.000000,19.079841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.903128,0.000000,19.202713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.026000,0.000000,19.079841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.026000,0.000000,18.956969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.026000,0.000000,18.956969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.026000,0.000000,18.956969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.903128,0.000000,18.834100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<16.903128,0.000000,18.834100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.903128,0.000000,18.834100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.534516,0.000000,18.834100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<16.534516,0.000000,18.834100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.534516,0.000000,19.202713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.903128,0.000000,19.202713>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<16.534516,0.000000,19.202713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.282931,0.000000,18.711231>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.774416,0.000000,18.711231>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<17.282931,0.000000,18.711231> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.522831,0.000000,19.571328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031347,0.000000,19.571328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<18.031347,0.000000,19.571328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031347,0.000000,19.571328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031347,0.000000,18.834100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.031347,0.000000,18.834100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031347,0.000000,18.834100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.522831,0.000000,18.834100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<18.031347,0.000000,18.834100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.031347,0.000000,19.202713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.277088,0.000000,19.202713>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<18.031347,0.000000,19.202713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.779763,0.000000,18.834100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.779763,0.000000,19.571328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.779763,0.000000,19.571328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.779763,0.000000,19.571328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.271247,0.000000,18.834100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<18.779763,0.000000,19.571328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.271247,0.000000,18.834100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.271247,0.000000,19.571328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<19.271247,0.000000,19.571328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.500100,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.991584,0.000000,0.152713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<13.500100,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.745841,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.745841,0.000000,-0.093031>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.745841,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.248516,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.371384,0.000000,0.521328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<14.248516,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.371384,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.617128,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.371384,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.617128,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.740000,0.000000,0.398456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<14.617128,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.740000,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.740000,0.000000,0.275584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.740000,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.740000,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.617128,0.000000,0.152713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.617128,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.617128,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.494256,0.000000,0.152713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<14.494256,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.617128,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.740000,0.000000,0.029841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<14.617128,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.740000,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.740000,0.000000,-0.093031>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.740000,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.740000,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.617128,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<14.617128,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.617128,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.371384,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.371384,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.371384,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.248516,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<14.248516,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.996931,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.996931,0.000000,0.029841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.996931,0.000000,0.029841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.996931,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.242672,0.000000,-0.215900>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<14.996931,0.000000,0.029841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.242672,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.488416,0.000000,0.029841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<15.242672,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.488416,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.488416,0.000000,0.521328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<15.488416,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.745347,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.868216,0.000000,0.521328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<15.745347,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.868216,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.113959,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.868216,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.113959,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.236831,0.000000,0.398456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.113959,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.236831,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.236831,0.000000,0.275584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.236831,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.236831,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.113959,0.000000,0.152713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.113959,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.113959,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.991088,0.000000,0.152713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<15.991088,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.113959,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.236831,0.000000,0.029841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.113959,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.236831,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.236831,0.000000,-0.093031>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.236831,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.236831,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.113959,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<16.113959,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.113959,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.868216,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<15.868216,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.868216,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.745347,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<15.745347,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.733663,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.610791,0.000000,0.521328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.610791,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.610791,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.365047,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.365047,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.365047,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.242178,0.000000,0.398456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<17.242178,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.242178,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.242178,0.000000,-0.093031>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.242178,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.242178,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.365047,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<17.242178,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.365047,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.610791,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.365047,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.610791,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.733663,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<17.610791,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.733663,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.733663,0.000000,0.152713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<17.733663,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.733663,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.487919,0.000000,0.152713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.487919,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.990594,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.990594,0.000000,0.521328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<17.990594,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.990594,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.482078,0.000000,-0.215900>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<17.990594,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.482078,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.482078,0.000000,0.521328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.482078,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.739009,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.739009,0.000000,-0.215900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.739009,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.739009,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.107622,0.000000,-0.215900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<18.739009,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.107622,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.230494,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<19.107622,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.230494,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.230494,0.000000,0.398456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<19.230494,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.230494,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.107622,0.000000,0.521328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<19.107622,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.107622,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.739009,0.000000,0.521328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<18.739009,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.727325,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.604453,0.000000,0.521328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<20.604453,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.604453,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.358709,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<20.358709,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.358709,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.235841,0.000000,0.398456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<20.235841,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.235841,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.235841,0.000000,0.275584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.235841,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.235841,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.358709,0.000000,0.152713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<20.235841,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.358709,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.604453,0.000000,0.152713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<20.358709,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.604453,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.727325,0.000000,0.029841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<20.604453,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.727325,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.727325,0.000000,-0.093031>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.727325,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.727325,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.604453,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<20.604453,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.604453,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.358709,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<20.358709,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.358709,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.235841,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<20.235841,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.984256,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.984256,0.000000,-0.215900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.984256,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.984256,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.352869,0.000000,-0.215900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<20.984256,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.352869,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.475741,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<21.352869,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.475741,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.475741,0.000000,0.398456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<21.475741,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.475741,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.352869,0.000000,0.521328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.352869,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.352869,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.984256,0.000000,0.521328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<20.984256,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.732672,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.732672,0.000000,0.275584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<21.732672,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.732672,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.978413,0.000000,0.521328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<21.732672,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.978413,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.224156,0.000000,0.275584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<21.978413,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.224156,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.224156,0.000000,-0.215900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.224156,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.732672,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.224156,0.000000,0.152713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<21.732672,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.720987,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.598116,0.000000,0.521328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<23.598116,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.598116,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.352372,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.352372,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.352372,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.229503,0.000000,0.398456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<23.229503,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.229503,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.229503,0.000000,0.275584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.229503,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.229503,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.352372,0.000000,0.152713>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<23.229503,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.352372,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.598116,0.000000,0.152713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.352372,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.598116,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.720987,0.000000,0.029841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<23.598116,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.720987,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.720987,0.000000,-0.093031>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.720987,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.720987,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.598116,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<23.598116,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.598116,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.352372,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<23.352372,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.352372,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.229503,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<23.229503,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.469403,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.346531,0.000000,0.521328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<24.346531,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.346531,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.100788,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.100788,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.100788,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.977919,0.000000,0.398456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<23.977919,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.977919,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.977919,0.000000,-0.093031>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.977919,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.977919,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.100788,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<23.977919,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.100788,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.346531,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<24.100788,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.346531,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.469403,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<24.346531,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.726334,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.726334,0.000000,-0.215900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<24.726334,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.726334,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.217819,0.000000,-0.215900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<24.726334,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.754100,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.245584,0.000000,7.264712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<13.754100,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.999841,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<13.999841,0.000000,7.018969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<13.999841,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.502516,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.625384,0.000000,7.633328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<14.502516,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.625384,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.871128,0.000000,7.633328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.625384,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.871128,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.994000,0.000000,7.510456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<14.871128,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.994000,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.994000,0.000000,7.387584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.994000,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.994000,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.871128,0.000000,7.264712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<14.871128,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.871128,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.748256,0.000000,7.264712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<14.748256,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.871128,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.994000,0.000000,7.141841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<14.871128,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.994000,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.994000,0.000000,7.018969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<14.994000,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.994000,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.871128,0.000000,6.896100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<14.871128,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.871128,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.625384,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<14.625384,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.625384,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<14.502516,0.000000,7.018969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<14.502516,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.250931,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.250931,0.000000,7.141841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<15.250931,0.000000,7.141841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.250931,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.496672,0.000000,6.896100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<15.250931,0.000000,7.141841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.496672,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.742416,0.000000,7.141841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<15.496672,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.742416,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.742416,0.000000,7.633328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<15.742416,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.999347,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.122216,0.000000,7.633328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<15.999347,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.122216,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.367959,0.000000,7.633328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.122216,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.367959,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.490831,0.000000,7.510456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.367959,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.490831,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.490831,0.000000,7.387584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.490831,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.490831,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.367959,0.000000,7.264712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<16.367959,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.367959,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.245088,0.000000,7.264712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<16.245088,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.367959,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.490831,0.000000,7.141841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<16.367959,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.490831,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.490831,0.000000,7.018969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<16.490831,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.490831,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.367959,0.000000,6.896100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<16.367959,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.367959,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.122216,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<16.122216,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<16.122216,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<15.999347,0.000000,7.018969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<15.999347,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.987663,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.864791,0.000000,7.633328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<17.864791,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.864791,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.619047,0.000000,7.633328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.619047,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.619047,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.496178,0.000000,7.510456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<17.496178,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.496178,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.496178,0.000000,7.018969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<17.496178,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.496178,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.619047,0.000000,6.896100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<17.496178,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.619047,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.864791,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.619047,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.864791,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.987663,0.000000,7.018969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<17.864791,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.987663,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.987663,0.000000,7.264712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<17.987663,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.987663,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<17.741919,0.000000,7.264712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<17.741919,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.244594,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.244594,0.000000,7.633328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.244594,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.244594,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.736078,0.000000,6.896100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<18.244594,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.736078,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.736078,0.000000,7.633328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<18.736078,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.993009,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.993009,0.000000,6.896100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<18.993009,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.993009,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.361622,0.000000,6.896100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<18.993009,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.361622,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.484494,0.000000,7.018969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<19.361622,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.484494,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.484494,0.000000,7.510456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<19.484494,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.484494,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.361622,0.000000,7.633328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<19.361622,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.361622,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.993009,0.000000,7.633328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<18.993009,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.489841,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.489841,0.000000,7.387584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<20.489841,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.489841,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.735581,0.000000,7.633328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<20.489841,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.735581,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.981325,0.000000,7.387584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<20.735581,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.981325,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.981325,0.000000,6.896100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<20.981325,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.489841,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<20.981325,0.000000,7.264712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<20.489841,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.238256,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.238256,0.000000,7.510456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<21.238256,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.238256,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.361125,0.000000,7.633328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<21.238256,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.361125,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.606869,0.000000,7.633328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.361125,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.606869,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.729741,0.000000,7.510456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<21.606869,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.729741,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.729741,0.000000,7.018969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<21.729741,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.729741,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.606869,0.000000,6.896100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<21.606869,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.606869,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.361125,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<21.361125,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.361125,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.238256,0.000000,7.018969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<21.238256,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.238256,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<21.729741,0.000000,7.510456>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<21.238256,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.735088,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.735088,0.000000,7.387584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<22.735088,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.735088,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.980828,0.000000,7.633328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<22.735088,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.980828,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.226572,0.000000,7.387584>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<22.980828,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.226572,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.226572,0.000000,6.896100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.226572,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.735088,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.226572,0.000000,7.264712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<22.735088,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.483503,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.729244,0.000000,7.633328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<23.483503,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.729244,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.729244,0.000000,6.896100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.729244,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.483503,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.974988,0.000000,6.896100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<23.483503,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,6.896100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.852100,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,6.896100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<35.852100,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,7.018969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<36.220713,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,7.510456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<36.343584,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.343584,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,7.633328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.220713,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.220713,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.852100,0.000000,7.633328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<35.852100,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,7.633328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<36.600516,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,7.264712>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.600516,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.846256,0.000000,7.387584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,-26.563589,0> translate<36.600516,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.846256,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.969128,0.000000,7.387584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<36.846256,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.969128,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,7.264712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.969128,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,7.018969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.092000,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.092000,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.969128,0.000000,6.896100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<36.969128,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.969128,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.723384,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.723384,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.723384,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.600516,0.000000,7.018969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<36.600516,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.097347,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.097347,0.000000,6.896100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.097347,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.097347,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.465959,0.000000,6.896100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<38.097347,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.465959,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,7.018969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<38.465959,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,7.510456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<38.588831,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.588831,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.465959,0.000000,7.633328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.465959,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.465959,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.097347,0.000000,7.633328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<38.097347,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.337247,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.091503,0.000000,7.510456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,-26.563298,0> translate<39.091503,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.091503,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.845762,0.000000,7.264712>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<38.845762,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.845762,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.845762,0.000000,7.018969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.845762,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.845762,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.968631,0.000000,6.896100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<38.845762,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.968631,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.214375,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<38.968631,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.214375,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.337247,0.000000,7.018969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<39.214375,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.337247,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.337247,0.000000,7.141841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<39.337247,0.000000,7.141841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.337247,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.214375,0.000000,7.264712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<39.214375,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.214375,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.845762,0.000000,7.264712>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<38.845762,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,7.633328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.711206,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.465463,0.000000,7.633328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.465463,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.465463,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,7.510456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<40.342594,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,7.018969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.342594,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.342594,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.465463,0.000000,6.896100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<40.342594,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.465463,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.465463,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.711206,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,7.018969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<40.711206,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,7.264712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<40.834078,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.834078,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.588334,0.000000,7.264712>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.588334,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.091009,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.091009,0.000000,7.633328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<41.091009,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.091009,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.582494,0.000000,6.896100>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<41.091009,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.582494,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.582494,0.000000,7.633328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<41.582494,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.839425,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.839425,0.000000,6.896100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.839425,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.839425,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.208038,0.000000,6.896100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<41.839425,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.208038,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.330909,0.000000,7.018969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<42.208038,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.330909,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.330909,0.000000,7.510456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<42.330909,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.330909,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.208038,0.000000,7.633328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.208038,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.208038,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.839425,0.000000,7.633328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<41.839425,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.336256,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.827741,0.000000,7.264712>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<43.336256,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.581997,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.581997,0.000000,7.018969>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.581997,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.084672,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.207541,0.000000,7.633328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<44.084672,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.207541,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.453284,0.000000,7.633328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.207541,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.453284,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.576156,0.000000,7.510456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<44.453284,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.576156,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.576156,0.000000,7.387584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.576156,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.576156,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.453284,0.000000,7.264712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.453284,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.453284,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.330413,0.000000,7.264712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<44.330413,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.453284,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.576156,0.000000,7.141841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<44.453284,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.576156,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.576156,0.000000,7.018969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.576156,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.576156,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.453284,0.000000,6.896100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<44.453284,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.453284,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.207541,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<44.207541,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.207541,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.084672,0.000000,7.018969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<44.084672,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.833088,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.833088,0.000000,7.141841>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.833088,0.000000,7.141841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.833088,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.078828,0.000000,6.896100>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<44.833088,0.000000,7.141841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.078828,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.324572,0.000000,7.141841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<45.078828,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.324572,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.324572,0.000000,7.633328>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<45.324572,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.581503,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.704372,0.000000,7.633328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<45.581503,0.000000,7.510456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.704372,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.950116,0.000000,7.633328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.704372,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.950116,0.000000,7.633328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,7.510456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.950116,0.000000,7.633328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,7.510456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,7.387584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.072988,0.000000,7.387584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,7.387584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.950116,0.000000,7.264712>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.950116,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.950116,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.827244,0.000000,7.264712>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<45.827244,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.950116,0.000000,7.264712>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,7.141841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.950116,0.000000,7.264712> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,7.141841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,7.018969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<46.072988,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.072988,0.000000,7.018969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.950116,0.000000,6.896100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<45.950116,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.950116,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.704372,0.000000,6.896100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.704372,0.000000,6.896100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.704372,0.000000,6.896100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.581503,0.000000,7.018969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<45.581503,0.000000,7.018969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,0.521328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<35.598100,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,0.521328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<35.598100,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,0.398456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<35.966712,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,0.275584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.089584,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,0.152713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.966712,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,0.029841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<35.966712,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,-0.093031>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.089584,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.089584,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<35.966712,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,-0.215900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<35.598100,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.598100,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.966712,0.000000,0.152713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<35.598100,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,0.398456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<36.346516,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.469384,0.000000,0.521328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<36.346516,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.469384,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.715128,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.469384,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.715128,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,0.398456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<36.715128,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,-0.093031>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.838000,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.715128,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<36.715128,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.715128,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.469384,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<36.469384,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.469384,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<36.346516,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.346516,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.838000,0.000000,0.398456>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,-44.997212,0> translate<36.346516,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,0.521328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<37.843347,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,0.521328>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.843347,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,0.398456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.211959,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,0.275584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.334831,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,0.152713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.211959,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,0.029841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<38.211959,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,-0.093031>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.334831,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.334831,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<38.211959,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,-0.215900>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.843347,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.843347,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.211959,0.000000,0.152713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<37.843347,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.591763,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.837503,0.000000,0.521328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<38.591763,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.837503,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.837503,0.000000,-0.215900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.837503,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.591763,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.083247,0.000000,-0.215900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<38.591763,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,0.521328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<40.457206,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.211463,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.211463,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.211463,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,0.398456>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<40.088594,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,-0.093031>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.088594,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.088594,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.211463,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<40.088594,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.211463,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.211463,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.457206,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<40.457206,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,0.152713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<40.580078,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.580078,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.334334,0.000000,0.152713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<40.334334,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.837009,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.837009,0.000000,0.521328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<40.837009,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.837009,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.328494,0.000000,-0.215900>}
box{<0,0,-0.038100><0.886037,0.036000,0.038100> rotate<0,56.306272,0> translate<40.837009,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.328494,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.328494,0.000000,0.521328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<41.328494,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.585425,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.585425,0.000000,-0.215900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.585425,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.585425,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.954038,0.000000,-0.215900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<41.585425,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.954038,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.076909,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<41.954038,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.076909,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.076909,0.000000,0.398456>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<42.076909,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.076909,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.954038,0.000000,0.521328>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<41.954038,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.954038,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.585425,0.000000,0.521328>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<41.585425,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.082256,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.573741,0.000000,0.152713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<43.082256,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.327997,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.327997,0.000000,-0.093031>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.327997,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.830672,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.953541,0.000000,0.521328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<43.830672,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.953541,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.199284,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.953541,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.199284,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.322156,0.000000,0.398456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<44.199284,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.322156,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.322156,0.000000,0.275584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.322156,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.322156,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.199284,0.000000,0.152713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.199284,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.199284,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.076413,0.000000,0.152713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<44.076413,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.199284,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.322156,0.000000,0.029841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<44.199284,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.322156,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.322156,0.000000,-0.093031>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.322156,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.322156,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.199284,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<44.199284,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.199284,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.953541,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.953541,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.953541,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.830672,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<43.830672,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.579087,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.579087,0.000000,0.029841>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.579087,0.000000,0.029841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.579087,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.824828,0.000000,-0.215900>}
box{<0,0,-0.038100><0.347530,0.036000,0.038100> rotate<0,44.997030,0> translate<44.579087,0.000000,0.029841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.824828,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.070572,0.000000,0.029841>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.996666,0> translate<44.824828,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.070572,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.070572,0.000000,0.521328>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,90.000000,0> translate<45.070572,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.327503,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.450372,0.000000,0.521328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<45.327503,0.000000,0.398456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.450372,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.696116,0.000000,0.521328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.450372,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.696116,0.000000,0.521328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,0.398456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.696116,0.000000,0.521328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,0.398456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,0.275584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.818987,0.000000,0.275584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,0.275584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.696116,0.000000,0.152713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<45.696116,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.696116,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.573244,0.000000,0.152713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<45.573244,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.696116,0.000000,0.152713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,0.029841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<45.696116,0.000000,0.152713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,0.029841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,-0.093031>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.818987,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.818987,0.000000,-0.093031>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.696116,0.000000,-0.215900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<45.696116,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.696116,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.450372,0.000000,-0.215900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<45.450372,0.000000,-0.215900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.450372,0.000000,-0.215900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.327503,0.000000,-0.093031>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,44.997030,0> translate<45.327503,0.000000,-0.093031> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.040344,0.000000,14.753584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.917472,0.000000,14.630713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<55.917472,0.000000,14.630713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.917472,0.000000,14.630713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.917472,0.000000,14.384969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<55.917472,0.000000,14.384969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.917472,0.000000,14.384969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.040344,0.000000,14.262100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<55.917472,0.000000,14.384969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.040344,0.000000,14.262100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,14.262100>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,0.000000,0> translate<56.040344,0.000000,14.262100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,14.262100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,14.384969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.531831,0.000000,14.262100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,14.384969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,14.630713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<56.654700,0.000000,14.630713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,14.630713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,14.753584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<56.531831,0.000000,14.753584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,15.010516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,15.010516>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,15.010516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,15.010516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,15.133384>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.531831,0.000000,15.010516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,15.133384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,15.502000>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<56.654700,0.000000,15.502000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,15.502000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,15.502000>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,15.502000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,15.758931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,15.758931>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,15.758931> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,15.758931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,16.004672>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<56.163216,0.000000,16.004672> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,16.004672>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,16.127544>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,16.127544> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,16.382609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,16.382609>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,16.382609> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,16.382609>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,16.628350>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<56.163216,0.000000,16.628350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,16.628350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,16.751222>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,16.751222> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,17.374900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,17.129156>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.654700,0.000000,17.129156> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,17.129156>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,17.006287>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.531831,0.000000,17.006287> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,17.006287>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,17.006287>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,17.006287> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,17.006287>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,17.129156>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<56.163216,0.000000,17.129156> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,17.129156>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,17.374900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,17.374900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,17.374900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,17.497772>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.163216,0.000000,17.374900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,17.497772>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,17.497772>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,17.497772> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,17.497772>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,17.006287>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.408959,0.000000,17.006287> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,17.754703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,17.754703>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,17.754703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,17.754703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,18.123316>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,18.123316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,18.123316>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,18.246188>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.163216,0.000000,18.123316> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,18.246188>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,18.246188>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,18.246188> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.040344,0.000000,18.625988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,18.625988>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,0.000000,0> translate<56.040344,0.000000,18.625988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,18.625988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,18.748859>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<56.531831,0.000000,18.625988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,18.503119>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,18.748859>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,18.748859> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,19.996219>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.917472,0.000000,19.996219>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<55.917472,0.000000,19.996219> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.917472,0.000000,19.750478>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.917472,0.000000,20.241962>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<55.917472,0.000000,20.241962> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,20.498894>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,20.498894>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,20.498894> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,20.498894>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,20.744634>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<56.163216,0.000000,20.744634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,20.744634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,20.867506>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,20.867506> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,21.245441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,21.491184>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,21.491184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,21.491184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,21.614056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.163216,0.000000,21.491184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,21.614056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,21.614056>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,21.614056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,21.614056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,21.245441>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.654700,0.000000,21.245441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,21.245441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,21.122572>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.531831,0.000000,21.122572> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,21.122572>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,21.245441>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<56.408959,0.000000,21.245441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,21.245441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,21.614056>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<56.408959,0.000000,21.614056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,21.870988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,21.870988>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,21.870988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,21.870988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,22.239600>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,22.239600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,22.239600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,22.362472>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.163216,0.000000,22.239600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,22.362472>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,22.362472>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,22.362472> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,22.619403>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,22.988016>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<56.654700,0.000000,22.988016> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,22.988016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,23.110888>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<56.531831,0.000000,23.110888> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,23.110888>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,22.988016>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.408959,0.000000,22.988016> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,22.988016>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,22.742272>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.408959,0.000000,22.742272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,22.742272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,22.619403>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<56.286088,0.000000,22.619403> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,22.619403>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,22.742272>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<56.163216,0.000000,22.742272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,22.742272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,23.110888>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,23.110888> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,23.490687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.040344,0.000000,23.490687>}
box{<0,0,-0.038100><0.614356,0.036000,0.038100> rotate<0,0.000000,0> translate<56.040344,0.000000,23.490687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.040344,0.000000,23.490687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<55.917472,0.000000,23.613559>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<55.917472,0.000000,23.613559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,23.367819>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,23.613559>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<56.286088,0.000000,23.613559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,23.989631>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,24.235375>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<56.654700,0.000000,24.235375> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,24.235375>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,24.358247>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<56.531831,0.000000,24.358247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,24.358247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,24.358247>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,24.358247> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,24.358247>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,24.235375>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.163216,0.000000,24.235375> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,24.235375>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,23.989631>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.163216,0.000000,23.989631> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,23.989631>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,23.866763>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<56.163216,0.000000,23.989631> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,23.866763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,23.866763>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,23.866763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,23.866763>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,23.989631>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.531831,0.000000,23.866763> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,24.615178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,24.615178>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,24.615178> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,24.615178>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,24.860919>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<56.163216,0.000000,24.860919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,24.860919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,24.983791>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,24.983791> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,25.238856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,25.238856>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,25.238856> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,25.238856>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,25.361725>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,25.361725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,25.361725>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,25.484597>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.163216,0.000000,25.361725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,25.484597>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,25.484597>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,25.484597> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,25.484597>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,25.607469>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<56.163216,0.000000,25.607469> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,25.607469>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,25.730341>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.163216,0.000000,25.607469> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,25.730341>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,25.730341>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,25.730341> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,26.355884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,26.110141>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.654700,0.000000,26.110141> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,26.110141>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,25.987272>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.531831,0.000000,25.987272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.531831,0.000000,25.987272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,25.987272>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,25.987272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,25.987272>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,26.110141>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<56.163216,0.000000,26.110141> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,26.110141>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,26.355884>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,26.355884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,26.355884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,26.478756>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<56.163216,0.000000,26.355884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.286088,0.000000,26.478756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,26.478756>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<56.286088,0.000000,26.478756> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,26.478756>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,25.987272>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<56.408959,0.000000,25.987272> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.654700,0.000000,26.735688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,26.735688>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<56.163216,0.000000,26.735688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.408959,0.000000,26.735688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,26.981428>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<56.163216,0.000000,26.981428> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,26.981428>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<56.163216,0.000000,27.104300>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<56.163216,0.000000,27.104300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.136672,0.000000,21.489325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.136672,0.000000,20.997841>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.136672,0.000000,20.997841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.136672,0.000000,20.997841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,20.997841>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<57.136672,0.000000,20.997841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,20.997841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,21.243581>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,63.430471,0> translate<57.382416,0.000000,21.243581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,21.243581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,21.366453>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<57.382416,0.000000,21.366453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,21.366453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,21.489325>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.382416,0.000000,21.366453> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,21.489325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.751031,0.000000,21.489325>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<57.505288,0.000000,21.489325> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.751031,0.000000,21.489325>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,21.366453>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<57.751031,0.000000,21.489325> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,21.366453>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,21.120709>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.873900,0.000000,21.120709> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,21.120709>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.751031,0.000000,20.997841>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.751031,0.000000,20.997841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,21.746256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,21.746256>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.382416,0.000000,21.746256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,21.746256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.136672,0.000000,21.991997>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<57.136672,0.000000,21.991997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.136672,0.000000,21.991997>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,22.237741>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.136672,0.000000,21.991997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,22.237741>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,22.237741>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.382416,0.000000,22.237741> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,21.746256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,22.237741>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<57.505288,0.000000,22.237741> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,23.243088>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,23.243088>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<57.382416,0.000000,23.243088> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,23.243088>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,23.365956>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<57.382416,0.000000,23.365956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,23.365956>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,23.488828>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.382416,0.000000,23.365956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,23.488828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,23.488828>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<57.505288,0.000000,23.488828> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,23.488828>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,23.611700>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<57.382416,0.000000,23.611700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,23.611700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,23.734572>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.382416,0.000000,23.611700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,23.734572>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,23.734572>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<57.505288,0.000000,23.734572> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,24.114372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,24.360116>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<57.382416,0.000000,24.360116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,24.360116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,24.482988>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.382416,0.000000,24.360116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.505288,0.000000,24.482988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,24.482988>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<57.505288,0.000000,24.482988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,24.482988>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,24.114372>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<57.873900,0.000000,24.114372> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,24.114372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.751031,0.000000,23.991503>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.751031,0.000000,23.991503> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.751031,0.000000,23.991503>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.628159,0.000000,24.114372>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<57.628159,0.000000,24.114372> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.628159,0.000000,24.114372>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.628159,0.000000,24.482988>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<57.628159,0.000000,24.482988> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,24.739919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,25.231403>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,-44.997030,0> translate<57.382416,0.000000,24.739919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.873900,0.000000,24.739919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<57.382416,0.000000,25.231403>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<57.382416,0.000000,25.231403> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.714575,0.000000,1.765300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.714575,0.000000,2.578794>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<55.714575,0.000000,2.578794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.985738,0.000000,2.578794>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.443409,0.000000,2.578794>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<55.443409,0.000000,2.578794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.779056,0.000000,1.765300>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.779056,0.000000,2.578794>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<54.779056,0.000000,2.578794> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<55.050219,0.000000,2.578794>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<54.507891,0.000000,2.578794>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<54.507891,0.000000,2.578794> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.855900,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.855900,-1.536000,36.792703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<40.855900,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.855900,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.542366,-1.536000,36.479169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.542366,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.542366,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.228831,-1.536000,36.792703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<40.228831,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.228831,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.228831,-1.536000,35.852100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.228831,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.920381,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.920381,-1.536000,36.008866>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.920381,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.920381,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.763616,-1.536000,35.852100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.763616,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.763616,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.293312,-1.536000,35.852100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<39.293312,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.293312,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.293312,-1.536000,35.695334>}
box{<0,0,-0.038100><0.783834,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.293312,-1.536000,35.695334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.293312,-1.536000,35.695334>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.450081,-1.536000,35.538566>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<39.293312,-1.536000,35.695334> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.450081,-1.536000,35.538566>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.606847,-1.536000,35.538566>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<39.450081,-1.536000,35.538566> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.357794,-1.536000,36.635934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.514563,-1.536000,36.792703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.357794,-1.536000,36.635934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.514563,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.828097,-1.536000,36.792703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<38.514563,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.828097,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.984862,-1.536000,36.635934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<38.828097,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.984862,-1.536000,36.635934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.984862,-1.536000,36.479169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.984862,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.984862,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.828097,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<38.828097,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.828097,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.514563,-1.536000,36.322400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<38.514563,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.514563,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.357794,-1.536000,36.165634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<38.357794,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.357794,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.357794,-1.536000,36.008866>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.357794,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.357794,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.514563,-1.536000,35.852100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<38.357794,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.514563,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.828097,-1.536000,35.852100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<38.514563,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.828097,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.984862,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.828097,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.579044,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.892578,-1.536000,35.852100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<37.579044,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.892578,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.049344,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.892578,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.049344,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.049344,-1.536000,36.322400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<38.049344,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.049344,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.892578,-1.536000,36.479169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<37.892578,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.892578,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.579044,-1.536000,36.479169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<37.579044,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.579044,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.422275,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.422275,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.422275,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.422275,-1.536000,36.165634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.422275,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.422275,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.049344,-1.536000,36.165634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<37.422275,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.113825,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.113825,-1.536000,36.479169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<37.113825,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.113825,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.643525,-1.536000,36.479169>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<36.643525,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.643525,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.486756,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.486756,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.486756,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.486756,-1.536000,35.852100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.486756,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.178306,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.708006,-1.536000,35.852100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<35.708006,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.708006,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.551237,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<35.551237,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.551237,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.708006,-1.536000,36.165634>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.551237,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.708006,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.021541,-1.536000,36.165634>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<35.708006,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.021541,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.178306,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.021541,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.178306,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.021541,-1.536000,36.479169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<36.021541,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.021541,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.551237,-1.536000,36.479169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<35.551237,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.086022,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.772488,-1.536000,35.852100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<34.772488,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.772488,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.615719,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<34.615719,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.615719,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.615719,-1.536000,36.322400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<34.615719,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.615719,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.772488,-1.536000,36.479169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.615719,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.772488,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.086022,-1.536000,36.479169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<34.772488,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.086022,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.242787,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<35.086022,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.242787,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.242787,-1.536000,36.008866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.242787,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.242787,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.086022,-1.536000,35.852100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.086022,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.307269,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.307269,-1.536000,36.479169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<34.307269,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.307269,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.993734,-1.536000,36.479169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<33.993734,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.993734,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.836969,-1.536000,36.479169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<33.836969,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.527672,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.057372,-1.536000,35.852100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.057372,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.057372,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.900603,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<32.900603,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.900603,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.057372,-1.536000,36.165634>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.900603,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.057372,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.370906,-1.536000,36.165634>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<33.057372,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.370906,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.527672,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.370906,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.527672,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.370906,-1.536000,36.479169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<33.370906,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.370906,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.900603,-1.536000,36.479169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<32.900603,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.656634,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.656634,-1.536000,36.792703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<31.656634,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.656634,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.186334,-1.536000,36.792703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<31.186334,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.186334,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.029566,-1.536000,36.635934>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.029566,-1.536000,36.635934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.029566,-1.536000,36.635934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.029566,-1.536000,36.322400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.029566,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.029566,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.186334,-1.536000,36.165634>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<31.029566,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.186334,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.656634,-1.536000,36.165634>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<31.186334,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.343100,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.029566,-1.536000,35.852100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.029566,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.721116,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.721116,-1.536000,36.792703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<30.721116,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.721116,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.094047,-1.536000,36.792703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<30.094047,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.721116,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.407581,-1.536000,36.322400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<30.407581,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.785597,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.785597,-1.536000,36.792703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<29.785597,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.785597,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.472062,-1.536000,36.479169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.472062,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.472062,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.158528,-1.536000,36.792703>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<29.158528,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.158528,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.158528,-1.536000,35.852100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.158528,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.223009,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.536544,-1.536000,36.635934>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,26.563526,0> translate<28.223009,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.536544,-1.536000,36.635934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.850078,-1.536000,36.322400>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<28.536544,-1.536000,36.635934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.850078,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.850078,-1.536000,36.008866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<28.850078,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.850078,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.693313,-1.536000,35.852100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.693313,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.693313,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.379778,-1.536000,35.852100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<28.379778,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.379778,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.223009,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<28.223009,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.223009,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.223009,-1.536000,36.165634>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,90.000000,0> translate<28.223009,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.223009,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.379778,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<28.223009,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.379778,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.850078,-1.536000,36.322400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<28.379778,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.914559,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.757794,-1.536000,35.852100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.757794,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.757794,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.444259,-1.536000,35.852100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<27.444259,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.444259,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.287491,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<27.287491,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.287491,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.287491,-1.536000,36.635934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<27.287491,-1.536000,36.635934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.287491,-1.536000,36.635934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.444259,-1.536000,36.792703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<27.287491,-1.536000,36.635934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.444259,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.757794,-1.536000,36.792703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<27.444259,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.757794,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.914559,-1.536000,36.635934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<27.757794,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.914559,-1.536000,36.635934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.914559,-1.536000,36.479169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<27.914559,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.914559,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.757794,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<27.757794,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.757794,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<27.287491,-1.536000,36.322400>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<27.287491,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.043522,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.043522,-1.536000,36.792703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<26.043522,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.043522,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.416453,-1.536000,35.852100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,-56.306216,0> translate<25.416453,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.416453,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.416453,-1.536000,36.792703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<25.416453,-1.536000,36.792703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.951238,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.637703,-1.536000,35.852100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<24.637703,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.637703,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.480934,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<24.480934,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.480934,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.480934,-1.536000,36.322400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<24.480934,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.480934,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.637703,-1.536000,36.479169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.480934,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.637703,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.951238,-1.536000,36.479169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<24.637703,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.951238,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.108003,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<24.951238,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.108003,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.108003,-1.536000,36.008866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.108003,-1.536000,36.008866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.108003,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.951238,-1.536000,35.852100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.951238,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.545416,-1.536000,36.792703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.545416,-1.536000,35.852100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.545416,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.545416,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.015719,-1.536000,35.852100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<23.545416,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.015719,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.172484,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<24.015719,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.172484,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.172484,-1.536000,36.322400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<24.172484,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.172484,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.015719,-1.536000,36.479169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<24.015719,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<24.015719,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.545416,-1.536000,36.479169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<23.545416,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.766666,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.080200,-1.536000,35.852100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<22.766666,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.080200,-1.536000,35.852100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.236966,-1.536000,36.008866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.080200,-1.536000,35.852100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.236966,-1.536000,36.008866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.236966,-1.536000,36.322400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<23.236966,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.236966,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.080200,-1.536000,36.479169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<23.080200,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.080200,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.766666,-1.536000,36.479169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<22.766666,-1.536000,36.479169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.766666,-1.536000,36.479169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.609897,-1.536000,36.322400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.609897,-1.536000,36.322400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.609897,-1.536000,36.322400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.609897,-1.536000,36.165634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.609897,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.609897,-1.536000,36.165634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.236966,-1.536000,36.165634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<22.609897,-1.536000,36.165634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,26.894784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<44.167381,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.921641,-1.536000,27.140528>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<43.921641,-1.536000,27.140528> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.921641,-1.536000,27.140528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,26.894784>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.675897,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,26.403300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.675897,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,26.771913>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<43.675897,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,26.894784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<43.418966,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,26.894784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<43.050353,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.927481,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,26.403300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.927481,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,27.017656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,26.526169>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.547681,-1.536000,26.526169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,26.526169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.424809,-1.536000,26.403300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<42.424809,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.424809,-1.536000,26.894784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<42.424809,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.802994,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.048738,-1.536000,26.403300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.802994,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.048738,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.171606,-1.536000,26.526169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.048738,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.171606,-1.536000,26.526169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.171606,-1.536000,26.771913>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<42.171606,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.171606,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.048738,-1.536000,26.894784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<42.048738,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.048738,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.802994,-1.536000,26.894784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<41.802994,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.802994,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.680122,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<41.680122,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.680122,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.680122,-1.536000,26.649041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.680122,-1.536000,26.649041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.680122,-1.536000,26.649041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.171606,-1.536000,26.649041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<41.680122,-1.536000,26.649041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.423191,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.423191,-1.536000,26.894784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<41.423191,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.423191,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.054578,-1.536000,26.894784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<41.054578,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.054578,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.931706,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.931706,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.931706,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.931706,-1.536000,26.403300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.931706,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.674775,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.674775,-1.536000,26.894784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<40.674775,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.674775,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.306162,-1.536000,26.894784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<40.306162,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.306162,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.183291,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<40.183291,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.183291,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.183291,-1.536000,26.403300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.183291,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.803491,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.557747,-1.536000,26.894784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<39.557747,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.557747,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.434875,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.434875,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.434875,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.434875,-1.536000,26.403300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.434875,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.434875,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.803491,-1.536000,26.403300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<39.434875,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.803491,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.926359,-1.536000,26.526169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.803491,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.926359,-1.536000,26.526169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.803491,-1.536000,26.649041>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<39.803491,-1.536000,26.649041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.803491,-1.536000,26.649041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.434875,-1.536000,26.649041>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<39.434875,-1.536000,26.649041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.429528,-1.536000,27.140528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.429528,-1.536000,26.403300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.429528,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.429528,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.938044,-1.536000,26.403300>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<37.938044,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.312500,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.558244,-1.536000,26.403300>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<37.312500,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.558244,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.681113,-1.536000,26.526169>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.558244,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.681113,-1.536000,26.526169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.681113,-1.536000,26.771913>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<37.681113,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.681113,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.558244,-1.536000,26.894784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<37.558244,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.558244,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.312500,-1.536000,26.894784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<37.312500,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.312500,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.189628,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.189628,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.189628,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.189628,-1.536000,26.649041>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.189628,-1.536000,26.649041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.189628,-1.536000,26.649041>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.681113,-1.536000,26.649041>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<37.189628,-1.536000,26.649041> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.932697,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.932697,-1.536000,26.894784>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<36.932697,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.932697,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.564084,-1.536000,26.894784>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<36.564084,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.564084,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.441212,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.441212,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.441212,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.441212,-1.536000,26.403300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.441212,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.938541,-1.536000,26.157559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.815669,-1.536000,26.157559>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<35.815669,-1.536000,26.157559> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.815669,-1.536000,26.157559>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.692797,-1.536000,26.280431>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<35.692797,-1.536000,26.280431> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.692797,-1.536000,26.280431>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.692797,-1.536000,26.894784>}
box{<0,0,-0.038100><0.614353,0.036000,0.038100> rotate<0,90.000000,0> translate<35.692797,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.692797,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.061413,-1.536000,26.894784>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<35.692797,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.061413,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.184281,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<36.061413,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.184281,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.184281,-1.536000,26.526169>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.184281,-1.536000,26.526169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.184281,-1.536000,26.526169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.061413,-1.536000,26.403300>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.061413,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.061413,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.692797,-1.536000,26.403300>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<35.692797,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.312997,-1.536000,27.017656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.312997,-1.536000,26.526169>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.312997,-1.536000,26.526169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.312997,-1.536000,26.526169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.190125,-1.536000,26.403300>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.996302,0> translate<35.190125,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.435866,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.190125,-1.536000,26.894784>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,0.000000,0> translate<35.190125,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.936922,-1.536000,27.140528>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.936922,-1.536000,26.403300>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.936922,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.936922,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.814053,-1.536000,26.894784>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<34.814053,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.814053,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.568309,-1.536000,26.894784>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.568309,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.568309,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.445438,-1.536000,26.771913>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.445438,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.445438,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.445438,-1.536000,26.403300>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.445438,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.188506,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.065638,-1.536000,26.894784>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<34.065638,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.065638,-1.536000,26.894784>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.065638,-1.536000,26.771913>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.065638,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.065638,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.188506,-1.536000,26.771913>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<34.065638,-1.536000,26.771913> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.188506,-1.536000,26.771913>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.188506,-1.536000,26.894784>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<34.188506,-1.536000,26.894784> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.188506,-1.536000,26.526169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.065638,-1.536000,26.526169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<34.065638,-1.536000,26.526169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.065638,-1.536000,26.526169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.065638,-1.536000,26.403300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.065638,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.065638,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.188506,-1.536000,26.403300>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<34.065638,-1.536000,26.403300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.188506,-1.536000,26.403300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.188506,-1.536000,26.526169>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<34.188506,-1.536000,26.526169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<43.798769,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,25.552713>}
box{<0,0,-0.038100><0.521299,0.036000,0.038100> rotate<0,44.997273,0> translate<43.798769,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,25.552713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<43.675897,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.296097,-1.536000,25.921328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<43.296097,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.296097,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,25.921328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.050353,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,25.798456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.927481,-1.536000,25.798456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,25.675584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.927481,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.927481,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.173225,-1.536000,25.552713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<43.050353,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,25.429841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.927481,-1.536000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,25.306969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.927481,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,25.184100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.927481,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.296097,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.050353,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.296097,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.296097,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,25.921328>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<42.547681,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,25.921328>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.301938,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,25.798456>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.179066,-1.536000,25.798456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,25.675584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.179066,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.179066,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.424809,-1.536000,25.552713>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<42.301938,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,25.429841>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.179066,-1.536000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,25.306969>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.179066,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,25.184100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.179066,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.301938,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.547681,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<41.173719,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.927978,-1.536000,25.675584>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<40.927978,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.927978,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,25.921328>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<40.682234,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.682234,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,25.921328>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<40.425303,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,25.552713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.933819,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.933819,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,25.675584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.185403,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,25.184100>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<39.185403,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,25.184100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.185403,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.180056,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.688572,-1.536000,25.552713>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<37.688572,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.431641,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.940156,-1.536000,25.552713>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<36.940156,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.940156,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.431641,-1.536000,25.184100>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<36.940156,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.934809,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.689069,-1.536000,25.921328>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<35.689069,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.689069,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.689069,-1.536000,25.184100>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.689069,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.934809,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.443325,-1.536000,25.184100>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<35.443325,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.940653,-1.536000,25.798456>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<34.694909,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.940653,-1.536000,25.798456>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,25.552713>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<34.940653,-1.536000,25.798456> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,25.306969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.186394,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,25.184100>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.063525,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.817781,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<34.694909,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,25.429841>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<34.694909,-1.536000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,25.429841>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.694909,-1.536000,25.429841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,25.552713>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<34.817781,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,25.921328>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<33.946494,-1.536000,25.921328> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,25.921328>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,25.552713>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.437978,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.192238,-1.536000,25.675584>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<34.192238,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.192238,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,25.675584>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<34.069366,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.946494,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,25.306969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.946494,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,25.306969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,25.184100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<33.946494,-1.536000,25.306969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,25.184100>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.069366,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,25.306969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.315109,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,25.675584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<32.941147,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.818278,-1.536000,25.675584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<32.818278,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.818278,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.695406,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,25.184100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.695406,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.572534,-1.536000,25.675584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<32.572534,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.572534,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.449663,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,25.184100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.449663,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,25.184100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,25.675584>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<32.192731,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.069862,-1.536000,25.675584>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<32.069862,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.069862,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.946991,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,25.184100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.946991,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.824119,-1.536000,25.675584>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<31.824119,-1.536000,25.675584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.824119,-1.536000,25.675584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,25.552713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.701247,-1.536000,25.552713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,25.552713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,25.184100>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.701247,-1.536000,25.184100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,24.579256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,24.702128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<44.044513,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,24.702128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.798769,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,24.579256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.675897,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,24.579256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,24.456384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.675897,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<43.675897,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,24.210641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.675897,-1.536000,24.210641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,24.210641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,24.087769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.675897,-1.536000,24.087769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,24.087769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,23.964900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<43.675897,-1.536000,24.087769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,23.964900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.798769,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,24.087769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.044513,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,24.087769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,24.210641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<44.167381,-1.536000,24.210641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,24.210641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<44.044513,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,24.456384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<44.044513,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,24.579256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<44.167381,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,24.333513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.798769,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.173225,-1.536000,24.579256>}
box{<0,0,-0.038100><0.274750,0.036000,0.038100> rotate<0,26.563298,0> translate<42.927481,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.173225,-1.536000,24.579256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,24.333513>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<43.173225,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,24.087769>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.418966,-1.536000,24.087769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,24.087769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.296097,-1.536000,23.964900>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.296097,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.296097,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,23.964900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.050353,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,24.087769>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.927481,-1.536000,24.087769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,24.087769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,24.210641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<42.927481,-1.536000,24.210641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,24.210641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.927481,-1.536000,24.210641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.050353,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,24.333513>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,0.000000,0> translate<43.050353,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,24.579256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,24.702128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<42.547681,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,24.702128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.301938,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,24.579256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.179066,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,24.579256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,24.456384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.179066,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<42.179066,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,24.210641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.179066,-1.536000,24.210641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,24.210641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,24.087769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.179066,-1.536000,24.087769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,24.087769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,23.964900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.179066,-1.536000,24.087769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,23.964900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.301938,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,24.087769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.547681,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,24.087769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,24.210641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<42.670550,-1.536000,24.210641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,24.210641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<42.547681,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,24.456384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<42.547681,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,24.579256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<42.670550,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,24.333513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.301938,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,24.702128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<41.173719,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.927978,-1.536000,24.456384>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<40.927978,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.927978,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,24.702128>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<40.682234,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,23.964900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.682234,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,24.702128>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<40.425303,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,24.333513>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.933819,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,23.964900>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.933819,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,24.456384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.185403,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,23.964900>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<39.185403,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,23.964900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.185403,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.180056,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.688572,-1.536000,24.333513>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<37.688572,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.431641,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.940156,-1.536000,24.333513>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<36.940156,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.940156,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.431641,-1.536000,23.964900>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<36.940156,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,24.579256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,24.702128>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<35.063525,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,24.702128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.817781,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,24.579256>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.694909,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,24.579256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,24.456384>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.694909,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<34.694909,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,24.210641>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.694909,-1.536000,24.210641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,24.210641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,24.087769>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.694909,-1.536000,24.087769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,24.087769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,23.964900>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<34.694909,-1.536000,24.087769> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,23.964900>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.817781,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,24.087769>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.063525,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,24.087769>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,24.210641>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<35.186394,-1.536000,24.210641> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,24.210641>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<35.063525,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,24.456384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<35.063525,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,24.579256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<35.186394,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.063525,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.817781,-1.536000,24.333513>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.817781,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,23.964900>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<33.946494,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,24.456384>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<33.946494,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,24.579256>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<33.946494,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,24.579256>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,24.702128>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.946494,-1.536000,24.579256> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,24.702128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.069366,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,24.702128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,24.579256>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<34.315109,-1.536000,24.702128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,24.456384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<32.941147,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.818278,-1.536000,24.456384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<32.818278,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.818278,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.695406,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,23.964900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.695406,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.572534,-1.536000,24.456384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<32.572534,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.572534,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.449663,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,23.964900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.449663,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,23.964900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,24.456384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<32.192731,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.069862,-1.536000,24.456384>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<32.069862,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.069862,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.946991,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,23.964900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.946991,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.824119,-1.536000,24.456384>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<31.824119,-1.536000,24.456384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.824119,-1.536000,24.456384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,24.333513>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.701247,-1.536000,24.333513> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,24.333513>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,23.964900>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.701247,-1.536000,23.964900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,22.868569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,22.745700>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.044513,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,22.745700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.798769,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,22.868569>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<43.675897,-1.536000,22.868569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,22.868569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,23.360056>}
box{<0,0,-0.038100><0.491487,0.036000,0.038100> rotate<0,90.000000,0> translate<43.675897,-1.536000,23.360056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,23.360056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,23.482928>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<43.675897,-1.536000,23.360056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.798769,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,23.482928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<43.798769,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,23.360056>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<44.044513,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,23.360056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,23.237184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.167381,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.167381,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,23.114313>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<44.044513,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.044513,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.675897,-1.536000,23.114313>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,0.000000,0> translate<43.675897,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.173225,-1.536000,23.482928>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.997394,0> translate<43.173225,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.173225,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.173225,-1.536000,22.745700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.173225,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.418966,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.927481,-1.536000,22.745700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.927481,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,23.482928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<42.179066,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,23.114313>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.670550,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.424809,-1.536000,23.237184>}
box{<0,0,-0.038100><0.274747,0.036000,0.038100> rotate<0,26.563589,0> translate<42.424809,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.424809,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,23.237184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<42.301938,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,23.114313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.179066,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,22.868569>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.179066,-1.536000,22.868569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.179066,-1.536000,22.868569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,22.745700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<42.179066,-1.536000,22.868569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.301938,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,22.745700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<42.301938,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.547681,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.670550,-1.536000,22.868569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.547681,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,23.482928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<41.173719,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.173719,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.927978,-1.536000,23.237184>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,-44.997394,0> translate<40.927978,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.927978,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,23.482928>}
box{<0,0,-0.038100><0.347534,0.036000,0.038100> rotate<0,44.997030,0> translate<40.682234,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.682234,-1.536000,22.745700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<40.682234,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,23.482928>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,90.000000,0> translate<40.425303,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<40.425303,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,23.114313>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.933819,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.933819,-1.536000,22.745700>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.933819,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,23.237184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.185403,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,22.745700>}
box{<0,0,-0.038100><0.695064,0.036000,0.038100> rotate<0,44.997030,0> translate<39.185403,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.676887,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.185403,-1.536000,22.745700>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<39.185403,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.180056,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.688572,-1.536000,23.114313>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<37.688572,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.431641,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.940156,-1.536000,23.114313>}
box{<0,0,-0.038100><0.614357,0.036000,0.038100> rotate<0,-36.867639,0> translate<36.940156,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.940156,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.431641,-1.536000,22.745700>}
box{<0,0,-0.038100><0.614355,0.036000,0.038100> rotate<0,36.867406,0> translate<36.940156,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,23.482928>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<34.694909,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,23.360056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.694909,-1.536000,23.360056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.694909,-1.536000,23.360056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,22.868569>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,44.997212,0> translate<34.694909,-1.536000,23.360056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,22.868569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.186394,-1.536000,22.745700>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.186394,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,23.360056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,23.482928>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<34.315109,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,23.482928>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.069366,-1.536000,23.482928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,23.482928>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,23.360056>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.946494,-1.536000,23.360056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,23.360056>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,23.237184>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.946494,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,23.114313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<33.946494,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,22.991441>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.946494,-1.536000,22.991441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,22.991441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,22.868569>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.946494,-1.536000,22.868569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.946494,-1.536000,22.868569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,22.745700>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<33.946494,-1.536000,22.868569> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,22.745700>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.069366,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,22.868569>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.315109,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,22.868569>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,22.991441>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<34.437978,-1.536000,22.991441> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,22.991441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,23.114313>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<34.315109,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,23.237184>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<34.315109,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.437978,-1.536000,23.360056>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<34.437978,-1.536000,23.360056> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.315109,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.069366,-1.536000,23.114313>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<34.069366,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,23.237184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<32.941147,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.941147,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.818278,-1.536000,23.237184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<32.818278,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.818278,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,23.114313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.695406,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,22.745700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.695406,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.695406,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.572534,-1.536000,23.237184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<32.572534,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.572534,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,23.114313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<32.449663,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.449663,-1.536000,22.745700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<32.449663,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,22.745700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,23.237184>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<32.192731,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.192731,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.069862,-1.536000,23.237184>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<32.069862,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<32.069862,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,23.114313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.946991,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,22.745700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.946991,-1.536000,22.745700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.946991,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.824119,-1.536000,23.237184>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,44.997030,0> translate<31.824119,-1.536000,23.237184> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.824119,-1.536000,23.237184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,23.114313>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.701247,-1.536000,23.114313> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,23.114313>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.701247,-1.536000,22.745700>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.701247,-1.536000,22.745700> }
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<56.597550,0.000000,4.362450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<56.597550,0.000000,3.727450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<56.597550,0.000000,3.092450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<53.422550,0.000000,4.362450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<53.422550,0.000000,3.727450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-270.000000,0> translate<53.422550,0.000000,3.092450>}
box{<-0.158750,0,-0.793750><0.158750,0.036000,0.793750> rotate<0,-0.000000,0> translate<55.010050,0.000000,3.727450>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-180.000000,0> translate<55.035450,0.000000,1.250950>}
box{<-3.016250,0,-0.158750><3.016250,0.036000,0.158750> rotate<0,-180.000000,0> translate<55.035450,0.000000,4.997450>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-90.000000,0> translate<52.197000,0.000000,3.124200>}
box{<-1.727200,0,-0.177800><1.727200,0.036000,0.177800> rotate<0,-90.000000,0> translate<57.861200,0.000000,3.124200>}
//BAT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.769000,-1.536000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.244000,-1.536000,25.146000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<47.244000,-1.536000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.244000,-1.536000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.769000,-1.536000,34.798000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<47.244000,-1.536000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.769000,-1.536000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.769000,-1.536000,25.146000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.769000,-1.536000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.048000,-1.536000,22.352000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.388000,-1.536000,22.352000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.048000,-1.536000,22.352000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.388000,-1.536000,37.592000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.048000,-1.536000,37.592000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.048000,-1.536000,37.592000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.192000,-1.536000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.667000,-1.536000,34.798000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.667000,-1.536000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.667000,-1.536000,34.798000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.667000,-1.536000,25.146000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<2.667000,-1.536000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.667000,-1.536000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.192000,-1.536000,25.146000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.667000,-1.536000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,27.432000>}
box{<0,0,-0.203200><12.700000,0.036000,0.203200> rotate<0,0.000000,0> translate<23.368000,-1.536000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,29.387800>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,90.000000,0> translate<23.368000,-1.536000,29.387800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,29.387800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,30.657800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<23.368000,-1.536000,30.657800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,30.657800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,32.512000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,90.000000,0> translate<23.368000,-1.536000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,32.512000>}
box{<0,0,-0.203200><12.700000,0.036000,0.203200> rotate<0,0.000000,0> translate<23.368000,-1.536000,32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,27.432000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,-90.000000,0> translate<36.068000,-1.536000,27.432000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,29.387800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.098000,-1.536000,29.387800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.098000,-1.536000,29.387800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.098000,-1.536000,29.387800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.098000,-1.536000,30.657800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<22.098000,-1.536000,30.657800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.098000,-1.536000,30.657800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,30.657800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.098000,-1.536000,30.657800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.163000,-1.536000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<32.893000,-1.536000,29.972000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<32.893000,-1.536000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<26.543000,-1.536000,29.972000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.273000,-1.536000,29.972000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<25.273000,-1.536000,29.972000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.908000,-1.536000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.908000,-1.536000,30.607000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<25.908000,-1.536000,30.607000> }
//BAT4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.667000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.192000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.667000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.192000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.667000,-1.536000,3.556000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.667000,-1.536000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.667000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.667000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<2.667000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.388000,-1.536000,16.002000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.048000,-1.536000,16.002000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.048000,-1.536000,16.002000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.048000,-1.536000,0.762000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.388000,-1.536000,0.762000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.048000,-1.536000,0.762000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.244000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.769000,-1.536000,3.556000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<47.244000,-1.536000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.769000,-1.536000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.769000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<56.769000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.769000,-1.536000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.244000,-1.536000,13.208000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<47.244000,-1.536000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,10.922000>}
box{<0,0,-0.203200><12.700000,0.036000,0.203200> rotate<0,0.000000,0> translate<23.368000,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,8.966200>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,-90.000000,0> translate<36.068000,-1.536000,8.966200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<36.068000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,5.842000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,-90.000000,0> translate<36.068000,-1.536000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,5.842000>}
box{<0,0,-0.203200><12.700000,0.036000,0.203200> rotate<0,0.000000,0> translate<23.368000,-1.536000,5.842000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.368000,-1.536000,10.922000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,90.000000,0> translate<23.368000,-1.536000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.338000,-1.536000,8.966200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<36.068000,-1.536000,8.966200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.338000,-1.536000,8.966200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.338000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<37.338000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<37.338000,-1.536000,7.696200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<36.068000,-1.536000,7.696200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<36.068000,-1.536000,7.696200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<25.273000,-1.536000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<26.543000,-1.536000,8.382000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<25.273000,-1.536000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<32.893000,-1.536000,8.382000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<34.163000,-1.536000,8.382000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<32.893000,-1.536000,8.382000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<33.528000,-1.536000,9.017000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<33.528000,-1.536000,7.747000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<33.528000,-1.536000,7.747000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,10.760000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,10.760000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,10.760000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,9.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,9.560000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,9.560000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.008000,0.000000,31.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.608000,0.000000,31.334000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.008000,0.000000,31.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.008000,0.000000,30.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.608000,0.000000,30.134000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.008000,0.000000,30.134000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.700000,0.000000,35.636000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.400000,0.000000,35.636000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.700000,0.000000,35.636000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.400000,0.000000,35.636000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.400000,0.000000,32.486000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<53.400000,0.000000,32.486000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<53.400000,0.000000,32.486000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.700000,0.000000,32.486000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<51.700000,0.000000,32.486000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,35.586000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,35.586000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.600000,0.000000,35.586000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,35.586000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.200000,0.000000,35.236000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<48.200000,0.000000,35.236000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.200000,0.000000,35.236000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.200000,0.000000,32.786000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<48.200000,0.000000,32.786000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.200000,0.000000,32.786000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,32.486000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<48.200000,0.000000,32.786000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,32.486000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,32.486000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.600000,0.000000,32.486000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.600000,0.000000,32.486000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.800000,0.000000,32.486000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<48.600000,0.000000,32.486000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.191000,0.000000,32.725000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.191000,0.000000,35.322000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<50.191000,0.000000,35.322000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,9.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,9.052000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,9.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,10.252000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,10.252000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,10.252000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.234000,0.000000,23.190000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.934000,0.000000,23.190000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.234000,0.000000,23.190000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.934000,0.000000,23.190000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.934000,0.000000,20.040000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<7.934000,0.000000,20.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.934000,0.000000,20.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.234000,0.000000,20.040000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.234000,0.000000,20.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.334000,0.000000,23.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.134000,0.000000,23.140000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.134000,0.000000,23.140000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.134000,0.000000,23.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.734000,0.000000,22.790000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<2.734000,0.000000,22.790000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.734000,0.000000,22.790000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.734000,0.000000,20.340000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<2.734000,0.000000,20.340000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.734000,0.000000,20.340000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.134000,0.000000,20.040000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<2.734000,0.000000,20.340000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.134000,0.000000,20.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.334000,0.000000,20.040000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.134000,0.000000,20.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.134000,0.000000,20.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.334000,0.000000,20.040000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<3.134000,0.000000,20.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.725000,0.000000,20.279000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.725000,0.000000,22.876000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.725000,0.000000,22.876000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,11.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,11.338000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,11.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.400000,0.000000,12.538000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.800000,0.000000,12.538000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.800000,0.000000,12.538000> }
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.538000,0.000000,12.492000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.538000,0.000000,11.892000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.538000,0.000000,11.892000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.338000,0.000000,12.492000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.338000,0.000000,11.892000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.338000,0.000000,11.892000> }
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,12.792000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,12.792000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,12.792000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.052000,0.000000,11.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.652000,0.000000,11.592000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.052000,0.000000,11.592000> }
//CT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.398400,0.000000,27.711400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.398400,0.000000,10.922000>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.398400,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.398400,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.676800,0.000000,10.922000>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<55.676800,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.676800,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.676800,0.000000,27.711400>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,90.000000,0> translate<55.676800,0.000000,27.711400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.676800,0.000000,27.711400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.398400,0.000000,27.711400>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<55.676800,0.000000,27.711400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.738000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.658000,0.000000,19.304000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<57.658000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.738000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,20.574000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,44.997030,0> translate<61.468000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,18.034000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<61.468000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.468000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.738000,0.000000,19.304000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,-44.997030,0> translate<61.468000,0.000000,18.034000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.558000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.193000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.463000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.098000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.463000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.193000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.558000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.113000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.383000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.018000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.383000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.018000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.653000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.923000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.558000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.923000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.653000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.018000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.478000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.478000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.478000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.113000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.733000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<24.003000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.638000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.003000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.098000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<22.098000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.733000,0.000000,1.016000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.828000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.288000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.748000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.368000,0.000000,2.286000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,26.797000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.177000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,28.702000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.177000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,29.337000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.177000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,31.242000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.177000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,31.877000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.177000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,33.782000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.177000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,26.162000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.367000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,26.797000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.732000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,28.067000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.732000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,28.702000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.732000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,29.337000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.732000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,30.607000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.732000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,31.242000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.732000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,31.877000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.732000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,33.147000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.732000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,33.782000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.732000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,28.702000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.367000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,31.242000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.367000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.367000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.177000,0.000000,33.782000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.367000,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,33.147000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.812000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,30.607000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.812000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.812000,0.000000,28.067000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.812000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.147000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.147000,0.000000,26.797000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<20.147000,0.000000,26.797000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<18.542000,0.000000,27.432000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.002000,0.000000,27.432000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.002000,0.000000,29.972000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<18.542000,0.000000,29.972000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.002000,0.000000,32.512000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<18.542000,0.000000,32.512000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.558000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.193000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.463000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.098000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.463000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.463000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.193000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.558000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.113000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.383000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.018000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.383000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.018000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.653000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.923000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.558000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.558000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.923000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.653000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.018000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.018000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.478000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.478000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.478000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.383000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.113000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.113000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.733000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<24.003000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.638000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.003000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.098000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.098000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<22.098000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.733000,0.000000,3.810000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.828000,0.000000,5.080000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<18.288000,0.000000,5.080000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.748000,0.000000,5.080000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<23.368000,0.000000,5.080000>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.640000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.545000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.180000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.545000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.640000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.195000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.465000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.100000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.465000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.100000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.735000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.005000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.640000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.005000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.735000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,4.445000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.100000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.560000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.560000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.560000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.195000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,6.350000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.815000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<45.085000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,4.445000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.720000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.085000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,5.715000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.815000,0.000000,3.810000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.910000,0.000000,5.080000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<39.370000,0.000000,5.080000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.830000,0.000000,5.080000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<44.450000,0.000000,5.080000>}
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.640000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.545000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.180000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.545000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.275000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.640000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.195000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.465000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.100000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.465000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,3.556000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.100000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.735000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.005000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.640000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.005000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.735000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.100000,0.000000,1.651000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.100000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.560000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.560000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.560000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.560000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.195000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,3.556000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.815000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<45.085000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,1.651000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.720000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.085000,0.000000,1.016000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,2.921000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.180000,0.000000,2.921000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.180000,0.000000,1.651000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,1.016000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.180000,0.000000,1.651000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,1.016000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,1.016000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.815000,0.000000,1.016000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.910000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<39.370000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.830000,0.000000,2.286000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<44.450000,0.000000,2.286000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,13.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.334000,0.000000,13.240000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.334000,0.000000,13.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.334000,0.000000,13.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.334000,0.000000,17.240000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<7.334000,0.000000,17.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,17.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,13.240000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.334000,0.000000,13.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,17.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.334000,0.000000,17.240000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.334000,0.000000,17.240000> }
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,27.432000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.477000,0.000000,27.432000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.477000,0.000000,25.654000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<10.795000,0.000000,25.654000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<10.795000,0.000000,27.178000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.477000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.223000,0.000000,25.654000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.223000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,25.654000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.049000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,25.400000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.477000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.350000,0.000000,26.416000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.350000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.922000,0.000000,26.416000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.414000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,25.400000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.636000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,27.178000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.636000,0.000000,27.178000> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<7.620000,0.000000,26.416000>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<9.652000,0.000000,26.416000>}
box{<-0.508000,0,-0.762000><0.508000,0.036000,0.762000> rotate<0,-180.000000,0> translate<8.636000,0.000000,26.416000>}
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
object{  M328P_RFM69_NODE(-31.242000,0,-18.923000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
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
