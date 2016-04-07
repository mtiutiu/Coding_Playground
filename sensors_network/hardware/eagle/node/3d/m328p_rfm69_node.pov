//POVRay-File created by 3d41.ulp v20110101
///home/mtiutiu/eagle/m328p_rfm69_mysensors/m328p_rfm69_node.brd
//4/7/16 5:32 PM

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
#local cam_y = 192;
#local cam_z = -85;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
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

#local lgt1_pos_x = 22;
#local lgt1_pos_y = 34;
#local lgt1_pos_z = 19;
#local lgt1_intense = 0.731891;
#local lgt2_pos_x = -22;
#local lgt2_pos_y = 34;
#local lgt2_pos_z = 19;
#local lgt2_intense = 0.731891;
#local lgt3_pos_x = 22;
#local lgt3_pos_y = 34;
#local lgt3_pos_z = -13;
#local lgt3_intense = 0.731891;
#local lgt4_pos_x = -22;
#local lgt4_pos_y = 34;
#local lgt4_pos_z = -13;
#local lgt4_intense = 0.731891;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 60.198000;
#declare pcb_y_size = 37.084000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 0;
#declare inc_testmode = off;
#declare global_seed=seed(935);
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
	//translate<-30.099000,0,-18.542000>
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
box{<59.182000,0,37.084000><-1.016000,-1.500000,0.000000> texture{col_brd}}

//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<17.780000,0.000000,15.240000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 100n 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<41.656000,0.000000,9.398000>translate<0,0.035000,0> }#end		//SMD Tantal Chip C2 10uF EIA3528
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.638000,0.000000,10.414000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C4 100n 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<50.292000,0.000000,30.734000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C5 100n 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_TT_SCT_B("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<48.514000,0.000000,34.290000>translate<0,0.035000,0> }#end		//SMD Tantal Chip C6 10uF EIA3528
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<36.322000,0.000000,9.652000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C7 100n 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<3.810000,0.000000,19.812000>translate<0,0.035000,0> }#end		//SMD Tantal Chip C8 47uF EIA3528
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_TT_SCT_B("47uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<14.478000,0.000000,15.494000>translate<0,0.035000,0> }#end		//SMD Tantal Chip C9 47uF EIA3528
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<36.322000,0.000000,11.684000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C10 100n 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<10.414000,0.000000,12.192000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C11 100n 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<24.638000,0.000000,12.954000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C12 100n 0805
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_TSSOP8("L6920TSSOP8","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<9.906000,0.000000,17.780000>translate<0,0.035000,0> }#end		//TSSOP8 IC2 L6920TSSOP8 TSSOP8
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<31.242000,0.000000,35.560000>}#end		//Header 2,54mm Grid 1Pin 1Row (jumper.lib) JP1 ANT 1X01
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<18.796000,0.000000,2.540000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP2 HTU21D 1X04
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.256000,0.000000,29.464000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) JP3 AVR_SPI_PRG_6NS 2X3-NS
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.050000,0.000000,7.366000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP4 OTHER 1X04
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.196000,0.000000,14.478000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R1 100K 0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("104",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<44.958000,0.000000,11.176000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 100K 0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<31.750000,0.000000,4.572000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 10K 0805
#ifndef(pack_RB1) #declare global_pack_RB1=yes; object {RES_SMD_CHIP_0805("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<47.498000,0.000000,21.590000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB1 470 0805
#ifndef(pack_RB2) #declare global_pack_RB2=yes; object {RES_SMD_CHIP_0805("331",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<47.498000,0.000000,17.018000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 RB2 330 0805
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ1 V_BOOST1
//Parts without Macro (e.g. SMD Solderjumper)				SMD-Solder Jumper SJ2 V_BOOST2
#ifndef(pack_U3) #declare global_pack_U3=yes; object {IC_SMD_MLF_32_050MM("ATMEGA328P",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<30.226000,0.000000,9.652000>translate<0,0.035000,0> }#end		//SMD IC MLF32 Package U3 ATMEGA328P MLF32-PAD
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<54.102000,0,28.702000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<46.990000,0,28.702000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.810000,0,28.702000> texture{col_thl}}
#ifndef(global_pack_BAT3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<10.922000,0,28.702000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<3.810000,0,7.874000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<10.922000,0,7.874000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<54.102000,0,7.874000> texture{col_thl}}
#ifndef(global_pack_BAT4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.781300,1.854200,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<46.990000,0,7.874000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.780000,0.000000,16.140000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.780000,0.000000,14.340000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<41.656000,0.000000,11.048000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<41.656000,0.000000,7.748000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.738000,0.000000,10.414000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.538000,0.000000,10.414000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.392000,0.000000,30.734000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.192000,0.000000,30.734000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<46.864000,0.000000,34.290000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<50.164000,0.000000,34.290000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.222000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.422000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<2.160000,0.000000,19.812000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<5.460000,0.000000,19.812000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.478000,0.000000,17.144000>}
object{TOOLS_PCB_SMD(2.500000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.478000,0.000000,13.844000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.222000,0.000000,11.684000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.422000,0.000000,11.684000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.314000,0.000000,12.192000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.514000,0.000000,12.192000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<23.738000,0.000000,12.954000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.538000,0.000000,12.954000>}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<52.578000,0,11.888000> texture{col_thl}}
#ifndef(global_pack_CT1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.778000,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<52.578000,0,24.688000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.931000,0.000000,14.880000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.581000,0.000000,14.880000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.231000,0.000000,14.880000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.881000,0.000000,14.880000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.881000,0.000000,20.680000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<10.231000,0.000000,20.680000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<9.581000,0.000000,20.680000>}
object{TOOLS_PCB_SMD(0.900000,0.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<8.931000,0.000000,20.680000>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<31.242000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<14.986000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<17.526000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.066000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<22.606000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<17.526000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<14.986000,0,26.924000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.526000,0,29.464000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<14.986000,0,29.464000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.526000,0,32.004000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<14.986000,0,32.004000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<15.240000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<17.780000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<20.320000,0,7.366000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<22.860000,0,7.366000> texture{col_thl}}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.310000,0.000000,14.224000>}
object{TOOLS_PCB_SMD(2.000000,4.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<2.310000,0.000000,14.224000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.096000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.296000,0.000000,14.478000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.958000,0.000000,10.276000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<44.958000,0.000000,12.076000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.850000,0.000000,4.572000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.650000,0.000000,4.572000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<47.498000,0.000000,22.490000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<47.498000,0.000000,20.690000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<47.498000,0.000000,17.918000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<47.498000,0.000000,16.118000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.128000,0.000000,24.638000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.604000,0.000000,24.638000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.080000,0.000000,24.638000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.478000,0.000000,20.828000>}
object{TOOLS_PCB_SMD(1.168400,1.600200,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.478000,0.000000,22.352000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.362000,0.000000,18.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.362000,0.000000,20.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.362000,0.000000,22.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.362000,0.000000,24.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.362000,0.000000,26.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.362000,0.000000,28.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.362000,0.000000,30.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.362000,0.000000,32.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.662000,0.000000,32.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.662000,0.000000,30.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.662000,0.000000,28.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.662000,0.000000,26.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.662000,0.000000,24.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.662000,0.000000,22.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.662000,0.000000,20.908000>}
object{TOOLS_PCB_SMD(4.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.662000,0.000000,18.908000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<32.576000,0.000000,7.902000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<32.576000,0.000000,8.402000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<32.576000,0.000000,8.902000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<32.576000,0.000000,9.402000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<32.576000,0.000000,9.902000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<32.576000,0.000000,10.402000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<32.576000,0.000000,10.902000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<32.576000,0.000000,11.402000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<31.976000,0.000000,12.002000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<31.476000,0.000000,12.002000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<30.976000,0.000000,12.002000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<30.476000,0.000000,12.002000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<29.976000,0.000000,12.002000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<29.476000,0.000000,12.002000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<28.976000,0.000000,12.002000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<28.476000,0.000000,12.002000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<27.876000,0.000000,11.402000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<27.876000,0.000000,10.902000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<27.876000,0.000000,10.402000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<27.876000,0.000000,9.902000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<27.876000,0.000000,9.402000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<27.876000,0.000000,8.902000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<27.876000,0.000000,8.402000>}
object{TOOLS_PCB_SMD(0.700000,0.300000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<27.876000,0.000000,7.902000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<28.476000,0.000000,7.302000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<28.976000,0.000000,7.302000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<29.476000,0.000000,7.302000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<29.976000,0.000000,7.302000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<30.476000,0.000000,7.302000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<30.976000,0.000000,7.302000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<31.476000,0.000000,7.302000>}
object{TOOLS_PCB_SMD(0.300000,0.700000,0.037000,50) rotate<0,-180.000000,0> texture{col_pds} translate<31.976000,0.000000,7.302000>}
object{TOOLS_PCB_SMD(3.200000,3.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.226000,0.000000,9.652000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.044000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<34.544000,0.000000,15.240000>}
object{TOOLS_PCB_SMD(0.400000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.044000,0.000000,15.240000>}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
//Text
//Rect
union{
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<34.544000,0.000000,14.190000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<34.544000,0.000000,16.290000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<36.044000,0.000000,14.190000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<36.044000,0.000000,16.290000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<33.044000,0.000000,14.190000>}
box{<-0.400000,0,-0.250000><0.400000,0.037000,0.250000> rotate<0,-180.000000,0> translate<33.044000,0.000000,16.290000>}
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
cylinder{<54.102000,0.038000,28.702000><54.102000,-1.538000,28.702000>0.927100}
cylinder{<46.990000,0.038000,28.702000><46.990000,-1.538000,28.702000>0.927100}
cylinder{<3.810000,0.038000,28.702000><3.810000,-1.538000,28.702000>0.927100}
cylinder{<10.922000,0.038000,28.702000><10.922000,-1.538000,28.702000>0.927100}
cylinder{<3.810000,0.038000,7.874000><3.810000,-1.538000,7.874000>0.927100}
cylinder{<10.922000,0.038000,7.874000><10.922000,-1.538000,7.874000>0.927100}
cylinder{<54.102000,0.038000,7.874000><54.102000,-1.538000,7.874000>0.927100}
cylinder{<46.990000,0.038000,7.874000><46.990000,-1.538000,7.874000>0.927100}
cylinder{<52.578000,0.038000,11.888000><52.578000,-1.538000,11.888000>0.508000}
cylinder{<52.578000,0.038000,24.688000><52.578000,-1.538000,24.688000>0.508000}
cylinder{<31.242000,0.038000,35.560000><31.242000,-1.538000,35.560000>0.508000}
cylinder{<14.986000,0.038000,2.540000><14.986000,-1.538000,2.540000>0.508000}
cylinder{<17.526000,0.038000,2.540000><17.526000,-1.538000,2.540000>0.508000}
cylinder{<20.066000,0.038000,2.540000><20.066000,-1.538000,2.540000>0.508000}
cylinder{<22.606000,0.038000,2.540000><22.606000,-1.538000,2.540000>0.508000}
cylinder{<17.526000,0.038000,26.924000><17.526000,-1.538000,26.924000>0.508000}
cylinder{<14.986000,0.038000,26.924000><14.986000,-1.538000,26.924000>0.508000}
cylinder{<17.526000,0.038000,29.464000><17.526000,-1.538000,29.464000>0.508000}
cylinder{<14.986000,0.038000,29.464000><14.986000,-1.538000,29.464000>0.508000}
cylinder{<17.526000,0.038000,32.004000><17.526000,-1.538000,32.004000>0.508000}
cylinder{<14.986000,0.038000,32.004000><14.986000,-1.538000,32.004000>0.508000}
cylinder{<15.240000,0.038000,7.366000><15.240000,-1.538000,7.366000>0.508000}
cylinder{<17.780000,0.038000,7.366000><17.780000,-1.538000,7.366000>0.508000}
cylinder{<20.320000,0.038000,7.366000><20.320000,-1.538000,7.366000>0.508000}
cylinder{<22.860000,0.038000,7.366000><22.860000,-1.538000,7.366000>0.508000}
//Holes(fast)/Vias
//Holes(fast)/Board
cylinder{<0.254000,0.038000,35.814000><0.254000,-1.538000,35.814000>0.800000 }
cylinder{<0.254000,0.038000,1.270000><0.254000,-1.538000,1.270000>0.800000 }
cylinder{<57.658000,0.038000,1.524000><57.658000,-1.538000,1.524000>0.800000 }
cylinder{<57.912000,0.038000,35.814000><57.912000,-1.538000,35.814000>0.800000 }
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//BAT3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.007000,-1.536000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.482000,-1.536000,23.876000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.482000,-1.536000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.482000,-1.536000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.007000,-1.536000,33.528000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.482000,-1.536000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.007000,-1.536000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.007000,-1.536000,23.876000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.007000,-1.536000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.286000,-1.536000,21.082000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.626000,-1.536000,21.082000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.286000,-1.536000,21.082000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.626000,-1.536000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.286000,-1.536000,36.322000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.286000,-1.536000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,-1.536000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,-1.536000,33.528000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<1.905000,-1.536000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,-1.536000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,-1.536000,23.876000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,-90.000000,0> translate<1.905000,-1.536000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,-1.536000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,-1.536000,23.876000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<1.905000,-1.536000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,26.162000>}
box{<0,0,-0.203200><26.670000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.256000,-1.536000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,26.162000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,28.117800>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,90.000000,0> translate<16.256000,-1.536000,28.117800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,28.117800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,29.387800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<16.256000,-1.536000,29.387800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,29.387800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,31.242000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,90.000000,0> translate<16.256000,-1.536000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,31.242000>}
box{<0,0,-0.203200><26.670000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.256000,-1.536000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,26.162000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,-90.000000,0> translate<42.926000,-1.536000,26.162000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,28.117800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.986000,-1.536000,28.117800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<14.986000,-1.536000,28.117800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.986000,-1.536000,28.117800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.986000,-1.536000,29.387800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<14.986000,-1.536000,29.387800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.986000,-1.536000,29.387800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.256000,-1.536000,29.387800>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<14.986000,-1.536000,29.387800> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.021000,-1.536000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.751000,-1.536000,28.702000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<39.751000,-1.536000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<19.431000,-1.536000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.161000,-1.536000,28.702000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<18.161000,-1.536000,28.702000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.796000,-1.536000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.796000,-1.536000,29.337000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,90.000000,0> translate<18.796000,-1.536000,29.337000> }
//BAT4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,-1.536000,12.700000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<1.905000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,-1.536000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,-1.536000,3.048000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<1.905000,-1.536000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,-1.536000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<1.905000,-1.536000,12.700000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<1.905000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.626000,-1.536000,15.494000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.286000,-1.536000,15.494000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.286000,-1.536000,15.494000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.286000,-1.536000,0.254000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.626000,-1.536000,0.254000>}
box{<0,0,-0.063500><53.340000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.286000,-1.536000,0.254000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.482000,-1.536000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.007000,-1.536000,3.048000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.482000,-1.536000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.007000,-1.536000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.007000,-1.536000,12.700000>}
box{<0,0,-0.127000><9.652000,0.036000,0.127000> rotate<0,90.000000,0> translate<56.007000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.007000,-1.536000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.482000,-1.536000,12.700000>}
box{<0,0,-0.127000><9.525000,0.036000,0.127000> rotate<0,0.000000,0> translate<46.482000,-1.536000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.986000,-1.536000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,10.414000>}
box{<0,0,-0.203200><26.670000,0.036000,0.203200> rotate<0,0.000000,0> translate<14.986000,-1.536000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,10.414000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,8.458200>}
box{<0,0,-0.203200><1.955800,0.036000,0.203200> rotate<0,-90.000000,0> translate<41.656000,-1.536000,8.458200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,8.458200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,7.188200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<41.656000,-1.536000,7.188200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,7.188200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,5.334000>}
box{<0,0,-0.203200><1.854200,0.036000,0.203200> rotate<0,-90.000000,0> translate<41.656000,-1.536000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.986000,-1.536000,5.334000>}
box{<0,0,-0.203200><26.670000,0.036000,0.203200> rotate<0,0.000000,0> translate<14.986000,-1.536000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.986000,-1.536000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<14.986000,-1.536000,10.414000>}
box{<0,0,-0.203200><5.080000,0.036000,0.203200> rotate<0,90.000000,0> translate<14.986000,-1.536000,10.414000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,8.458200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,8.458200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<41.656000,-1.536000,8.458200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,8.458200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,7.188200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<42.926000,-1.536000,7.188200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<42.926000,-1.536000,7.188200>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<41.656000,-1.536000,7.188200>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<41.656000,-1.536000,7.188200> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<16.891000,-1.536000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<18.161000,-1.536000,7.874000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<16.891000,-1.536000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<38.481000,-1.536000,7.874000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.751000,-1.536000,7.874000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,0.000000,0> translate<38.481000,-1.536000,7.874000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.116000,-1.536000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<39.116000,-1.536000,7.239000>}
box{<0,0,-0.203200><1.270000,0.036000,0.203200> rotate<0,-90.000000,0> translate<39.116000,-1.536000,7.239000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.380000,0.000000,15.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.380000,0.000000,14.940000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.380000,0.000000,14.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.180000,0.000000,15.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.180000,0.000000,14.940000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.180000,0.000000,14.940000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.256000,0.000000,8.498000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.256000,0.000000,6.798000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.256000,0.000000,6.798000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.256000,0.000000,6.798000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.106000,0.000000,6.798000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.106000,0.000000,6.798000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.106000,0.000000,6.798000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.106000,0.000000,8.498000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<40.106000,0.000000,8.498000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.206000,0.000000,10.398000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.206000,0.000000,11.598000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<43.206000,0.000000,11.598000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.206000,0.000000,11.598000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.856000,0.000000,11.998000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,48.810853,0> translate<42.856000,0.000000,11.998000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.856000,0.000000,11.998000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.406000,0.000000,11.998000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.406000,0.000000,11.998000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.406000,0.000000,11.998000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.106000,0.000000,11.598000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-53.126596,0> translate<40.106000,0.000000,11.598000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.106000,0.000000,11.598000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.106000,0.000000,10.398000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.106000,0.000000,10.398000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.106000,0.000000,11.598000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.106000,0.000000,10.398000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.106000,0.000000,10.398000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.345000,0.000000,10.007000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.942000,0.000000,10.007000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.345000,0.000000,10.007000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.338000,0.000000,11.014000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.938000,0.000000,11.014000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.338000,0.000000,11.014000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.338000,0.000000,9.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.938000,0.000000,9.814000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.338000,0.000000,9.814000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.992000,0.000000,31.334000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.592000,0.000000,31.334000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.992000,0.000000,31.334000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.992000,0.000000,30.134000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.592000,0.000000,30.134000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.992000,0.000000,30.134000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.414000,0.000000,35.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.114000,0.000000,35.890000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.414000,0.000000,35.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.114000,0.000000,35.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.114000,0.000000,32.740000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.114000,0.000000,32.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.114000,0.000000,32.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.414000,0.000000,32.740000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<49.414000,0.000000,32.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.514000,0.000000,35.840000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.314000,0.000000,35.840000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.314000,0.000000,35.840000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.314000,0.000000,35.840000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.914000,0.000000,35.490000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<45.914000,0.000000,35.490000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.914000,0.000000,35.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.914000,0.000000,33.040000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<45.914000,0.000000,33.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.914000,0.000000,33.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.314000,0.000000,32.740000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<45.914000,0.000000,33.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.314000,0.000000,32.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.514000,0.000000,32.740000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.314000,0.000000,32.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.314000,0.000000,32.740000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.514000,0.000000,32.740000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<46.314000,0.000000,32.740000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.905000,0.000000,32.979000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.905000,0.000000,35.576000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<47.905000,0.000000,35.576000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.622000,0.000000,9.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.022000,0.000000,9.052000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.022000,0.000000,9.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.622000,0.000000,10.252000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.022000,0.000000,10.252000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.022000,0.000000,10.252000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.710000,0.000000,21.412000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.410000,0.000000,21.412000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.710000,0.000000,21.412000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.410000,0.000000,21.412000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.410000,0.000000,18.262000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,-90.000000,0> translate<6.410000,0.000000,18.262000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.410000,0.000000,18.262000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.710000,0.000000,18.262000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,0.000000,0> translate<4.710000,0.000000,18.262000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.810000,0.000000,21.362000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.610000,0.000000,21.362000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.610000,0.000000,21.362000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.610000,0.000000,21.362000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.210000,0.000000,21.012000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,-41.183207,0> translate<1.210000,0.000000,21.012000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.210000,0.000000,21.012000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.210000,0.000000,18.562000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,-90.000000,0> translate<1.210000,0.000000,18.562000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.210000,0.000000,18.562000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.610000,0.000000,18.262000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,36.867464,0> translate<1.210000,0.000000,18.562000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.610000,0.000000,18.262000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.810000,0.000000,18.262000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.610000,0.000000,18.262000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.610000,0.000000,18.262000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.810000,0.000000,18.262000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.610000,0.000000,18.262000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.201000,0.000000,18.501000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.201000,0.000000,21.098000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,90.000000,0> translate<3.201000,0.000000,21.098000> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.078000,0.000000,14.594000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.078000,0.000000,12.894000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<16.078000,0.000000,12.894000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.078000,0.000000,12.894000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.928000,0.000000,12.894000>}
box{<0,0,-0.101600><3.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.928000,0.000000,12.894000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.928000,0.000000,12.894000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.928000,0.000000,14.594000>}
box{<0,0,-0.101600><1.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<12.928000,0.000000,14.594000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.028000,0.000000,16.494000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.028000,0.000000,17.694000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,90.000000,0> translate<16.028000,0.000000,17.694000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.028000,0.000000,17.694000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.678000,0.000000,18.094000>}
box{<0,0,-0.101600><0.531507,0.036000,0.101600> rotate<0,48.810853,0> translate<15.678000,0.000000,18.094000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.678000,0.000000,18.094000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.228000,0.000000,18.094000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.228000,0.000000,18.094000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.228000,0.000000,18.094000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.928000,0.000000,17.694000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-53.126596,0> translate<12.928000,0.000000,17.694000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.928000,0.000000,17.694000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.928000,0.000000,16.494000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<12.928000,0.000000,16.494000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.928000,0.000000,17.694000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.928000,0.000000,16.494000>}
box{<0,0,-0.101600><1.200000,0.036000,0.101600> rotate<0,-90.000000,0> translate<12.928000,0.000000,16.494000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.167000,0.000000,16.103000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.764000,0.000000,16.103000>}
box{<0,0,-0.101600><2.597000,0.036000,0.101600> rotate<0,0.000000,0> translate<13.167000,0.000000,16.103000> }
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.622000,0.000000,11.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.022000,0.000000,11.084000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.022000,0.000000,11.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.622000,0.000000,12.284000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.022000,0.000000,12.284000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.022000,0.000000,12.284000> }
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.714000,0.000000,11.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.114000,0.000000,11.592000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.114000,0.000000,11.592000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.714000,0.000000,12.792000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.114000,0.000000,12.792000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.114000,0.000000,12.792000> }
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.338000,0.000000,13.554000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.938000,0.000000,13.554000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.338000,0.000000,13.554000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.338000,0.000000,12.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.938000,0.000000,12.354000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.338000,0.000000,12.354000> }
//CT1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.377600,0.000000,9.880600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.377600,0.000000,26.670000>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,90.000000,0> translate<49.377600,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.377600,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.099200,0.000000,26.670000>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<49.377600,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.099200,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.099200,0.000000,9.880600>}
box{<0,0,-0.063500><16.789400,0.036000,0.063500> rotate<0,-90.000000,0> translate<57.099200,0.000000,9.880600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.099200,0.000000,9.880600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.377600,0.000000,9.880600>}
box{<0,0,-0.063500><7.721600,0.036000,0.063500> rotate<0,0.000000,0> translate<49.377600,0.000000,9.880600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.038000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.118000,0.000000,18.288000>}
box{<0,0,-0.063500><5.080000,0.036000,0.063500> rotate<0,0.000000,0> translate<50.038000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.038000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.308000,0.000000,17.018000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,44.997030,0> translate<50.038000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.308000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.308000,0.000000,19.558000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,90.000000,0> translate<51.308000,0.000000,19.558000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.308000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.038000,0.000000,18.288000>}
box{<0,0,-0.063500><1.796051,0.036000,0.063500> rotate<0,-44.997030,0> translate<50.038000,0.000000,18.288000> }
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.356000,0.000000,15.530000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.456000,0.000000,15.530000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.356000,0.000000,15.530000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.456000,0.000000,15.530000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.456000,0.000000,20.030000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,90.000000,0> translate<11.456000,0.000000,20.030000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.456000,0.000000,20.030000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.356000,0.000000,20.030000>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.356000,0.000000,20.030000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.356000,0.000000,20.030000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.356000,0.000000,15.530000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.356000,0.000000,15.530000> }
difference{
cylinder{<8.906000,0,16.080000><8.906000,0.036000,16.080000>0.287100 translate<0,0.000000,0>}
cylinder{<8.906000,-0.1,16.080000><8.906000,0.135000,16.080000>0.160100 translate<0,0.000000,0>}}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<10.231000,0.000000,20.530000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<9.581000,0.000000,20.530000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<10.881000,0.000000,20.530000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<8.931000,0.000000,20.530000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<8.931000,0.000000,15.030000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<9.581000,0.000000,15.030000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<10.231000,0.000000,15.030000>}
box{<-0.150000,0,-0.500000><0.150000,0.036000,0.500000> rotate<0,-0.000000,0> translate<10.881000,0.000000,15.030000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,36.830000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.607000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,36.195000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.877000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,34.925000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.512000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.512000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.877000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,34.925000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.972000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,36.195000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.972000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.972000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.972000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,34.290000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.607000,0.000000,34.290000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<31.242000,0.000000,35.560000>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.796000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.701000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.336000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.701000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.796000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<15.621000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.621000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.256000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.161000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.796000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.161000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.891000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.256000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.716000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.716000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<13.716000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.351000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.241000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.876000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.876000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.241000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.336000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.336000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.971000,0.000000,1.270000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.066000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.526000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<14.986000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.606000,0.000000,2.540000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,26.289000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<18.161000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,28.194000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<18.161000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,28.829000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<18.161000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,30.734000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<18.161000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,31.369000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<18.161000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,33.274000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<18.161000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,25.654000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.351000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,26.289000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<13.716000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,27.559000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<13.716000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,28.194000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<13.716000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,28.829000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<13.716000,0.000000,28.829000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,30.099000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<13.716000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,30.734000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<13.716000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,31.369000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<13.716000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,32.639000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<13.716000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.716000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,33.274000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<13.716000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,28.194000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.351000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,30.734000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.351000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.351000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.161000,0.000000,33.274000>}
box{<0,0,-0.101600><3.810000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.351000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,32.639000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<18.796000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,30.099000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<18.796000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.796000,0.000000,27.559000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<18.796000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.131000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.131000,0.000000,26.289000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<19.131000,0.000000,26.289000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.526000,0.000000,26.924000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<14.986000,0.000000,26.924000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<14.986000,0.000000,29.464000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.526000,0.000000,29.464000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<14.986000,0.000000,32.004000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<17.526000,0.000000,32.004000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,8.636000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.050000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,8.636000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,8.001000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.955000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,6.731000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.590000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,6.096000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.955000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,6.096000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.685000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.050000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,8.636000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.001000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<15.875000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,6.731000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,6.096000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.875000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,8.636000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.510000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,8.636000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,8.001000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<18.415000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,6.731000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,6.096000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.415000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,6.096000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,6.731000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<16.510000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,6.731000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,8.001000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.970000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,6.096000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<13.970000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.875000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,6.096000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,8.636000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,8.001000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<23.495000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,6.731000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.130000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.130000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,6.096000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<23.495000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,8.001000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.590000,0.000000,8.001000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,6.096000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.590000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,6.096000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,6.096000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.320000,0.000000,7.366000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.780000,0.000000,7.366000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<15.240000,0.000000,7.366000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<22.860000,0.000000,7.366000>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.810000,0.000000,12.224000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.810000,0.000000,12.224000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.810000,0.000000,12.224000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.810000,0.000000,12.224000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.810000,0.000000,16.224000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<5.810000,0.000000,16.224000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.810000,0.000000,16.224000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.810000,0.000000,12.224000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<1.810000,0.000000,12.224000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.810000,0.000000,16.224000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.810000,0.000000,16.224000>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.810000,0.000000,16.224000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.496000,0.000000,13.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.896000,0.000000,13.878000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.896000,0.000000,13.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.496000,0.000000,15.078000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.896000,0.000000,15.078000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.896000,0.000000,15.078000> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.358000,0.000000,10.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.358000,0.000000,11.476000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.358000,0.000000,11.476000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.558000,0.000000,10.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.558000,0.000000,11.476000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<45.558000,0.000000,11.476000> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.450000,0.000000,5.172000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.050000,0.000000,5.172000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.450000,0.000000,5.172000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.450000,0.000000,3.972000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.050000,0.000000,3.972000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.450000,0.000000,3.972000> }
//RB1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.098000,0.000000,21.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.098000,0.000000,21.290000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.098000,0.000000,21.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.898000,0.000000,21.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.898000,0.000000,21.290000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.898000,0.000000,21.290000> }
//RB2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.098000,0.000000,17.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.098000,0.000000,16.718000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.098000,0.000000,16.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.898000,0.000000,17.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.898000,0.000000,16.718000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.898000,0.000000,16.718000> }
//SJ1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,25.654000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,25.654000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<4.445000,0.000000,23.876000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<8.763000,0.000000,23.876000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<8.763000,0.000000,25.400000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<4.445000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.191000,0.000000,23.876000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.191000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,23.876000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.017000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.445000,0.000000,23.622000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.445000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.318000,0.000000,24.638000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.318000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.382000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,24.638000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.382000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,23.622000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,23.622000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,25.400000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,25.400000> }
object{ARC(0.127000,1.270000,90.000000,270.000000,0.036000) translate<5.588000,0.000000,24.638000>}
object{ARC(0.127000,1.270000,270.000000,450.000000,0.036000) translate<7.620000,0.000000,24.638000>}
box{<-0.508000,0,-0.762000><0.508000,0.036000,0.762000> rotate<0,-180.000000,0> translate<6.604000,0.000000,24.638000>}
//SJ2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,20.193000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.494000,0.000000,20.193000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<13.716000,0.000000,22.987000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<13.716000,0.000000,20.193000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<15.240000,0.000000,20.193000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<15.240000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,23.241000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.716000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,19.939000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.716000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,20.193000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,22.987000>}
box{<0,0,-0.076200><2.794000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.462000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,22.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,23.114000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.478000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.478000,0.000000,20.066000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.478000,0.000000,20.066000> }
object{ARC(0.127000,1.270000,180.000000,360.000000,0.036000) translate<14.478000,0.000000,21.336000>}
object{ARC(0.127000,1.270000,0.000000,180.000000,0.036000) translate<14.478000,0.000000,21.844000>}
//U$2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.362500,0.000000,1.490000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.656384,0.000000,1.490000>}
box{<0,0,-0.075000><0.293884,0.036000,0.075000> rotate<0,0.000000,0> translate<41.362500,0.000000,1.490000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.179613,0.000000,1.490000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.473500,0.000000,1.490000>}
box{<0,0,-0.075000><0.293887,0.036000,0.075000> rotate<0,0.000000,0> translate<43.179613,0.000000,1.490000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.255163,0.000000,1.640000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.840347,0.000000,1.640000>}
box{<0,0,-0.075000><0.585184,0.036000,0.075000> rotate<0,0.000000,0> translate<41.255163,0.000000,1.640000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.920803,0.000000,1.640000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.045172,0.000000,1.640000>}
box{<0,0,-0.075000><0.124369,0.036000,0.075000> rotate<0,0.000000,0> translate<41.920803,0.000000,1.640000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.790825,0.000000,1.640000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.915194,0.000000,1.640000>}
box{<0,0,-0.075000><0.124369,0.036000,0.075000> rotate<0,0.000000,0> translate<42.790825,0.000000,1.640000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.995650,0.000000,1.640000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.580841,0.000000,1.640000>}
box{<0,0,-0.075000><0.585191,0.036000,0.075000> rotate<0,0.000000,0> translate<42.995650,0.000000,1.640000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.377472,0.000000,1.790000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.107312,0.000000,1.790000>}
box{<0,0,-0.075000><0.729841,0.036000,0.075000> rotate<0,0.000000,0> translate<41.377472,0.000000,1.790000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.728684,0.000000,1.790000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.458531,0.000000,1.790000>}
box{<0,0,-0.075000><0.729847,0.036000,0.075000> rotate<0,0.000000,0> translate<42.728684,0.000000,1.790000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.499778,0.000000,1.940000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.169456,0.000000,1.940000>}
box{<0,0,-0.075000><0.669678,0.036000,0.075000> rotate<0,0.000000,0> translate<41.499778,0.000000,1.940000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.666541,0.000000,1.940000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.336225,0.000000,1.940000>}
box{<0,0,-0.075000><0.669684,0.036000,0.075000> rotate<0,0.000000,0> translate<42.666541,0.000000,1.940000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.493688,0.000000,2.090000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.231597,0.000000,2.090000>}
box{<0,0,-0.075000><0.737909,0.036000,0.075000> rotate<0,0.000000,0> translate<41.493688,0.000000,2.090000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.604400,0.000000,2.090000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.342309,0.000000,2.090000>}
box{<0,0,-0.075000><0.737909,0.036000,0.075000> rotate<0,0.000000,0> translate<42.604400,0.000000,2.090000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.434872,0.000000,2.240000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.058531,0.000000,2.240000>}
box{<0,0,-0.075000><0.623659,0.036000,0.075000> rotate<0,0.000000,0> translate<41.434872,0.000000,2.240000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.777906,0.000000,2.240000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.401125,0.000000,2.240000>}
box{<0,0,-0.075000><0.623219,0.036000,0.075000> rotate<0,0.000000,0> translate<42.777906,0.000000,2.240000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<40.929200,0.000000,2.390000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.977106,0.000000,2.390000>}
box{<0,0,-0.075000><1.047906,0.036000,0.075000> rotate<0,0.000000,0> translate<40.929200,0.000000,2.390000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.858497,0.000000,2.390000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.906800,0.000000,2.390000>}
box{<0,0,-0.075000><1.048303,0.036000,0.075000> rotate<0,0.000000,0> translate<42.858497,0.000000,2.390000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<40.929200,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.949200,0.000000,2.540000>}
box{<0,0,-0.075000><1.020000,0.036000,0.075000> rotate<0,0.000000,0> translate<40.929200,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.885534,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.906800,0.000000,2.540000>}
box{<0,0,-0.075000><1.021266,0.036000,0.075000> rotate<0,0.000000,0> translate<42.885534,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<40.929200,0.000000,2.690000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.977191,0.000000,2.690000>}
box{<0,0,-0.075000><1.047991,0.036000,0.075000> rotate<0,0.000000,0> translate<40.929200,0.000000,2.690000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.859119,0.000000,2.690000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.906800,0.000000,2.690000>}
box{<0,0,-0.075000><1.047681,0.036000,0.075000> rotate<0,0.000000,0> translate<42.859119,0.000000,2.690000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.434875,0.000000,2.840000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.059400,0.000000,2.840000>}
box{<0,0,-0.075000><0.624525,0.036000,0.075000> rotate<0,0.000000,0> translate<41.434875,0.000000,2.840000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.775369,0.000000,2.840000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.401128,0.000000,2.840000>}
box{<0,0,-0.075000><0.625759,0.036000,0.075000> rotate<0,0.000000,0> translate<42.775369,0.000000,2.840000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.493691,0.000000,2.990000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.299722,0.000000,2.990000>}
box{<0,0,-0.075000><0.806031,0.036000,0.075000> rotate<0,0.000000,0> translate<41.493691,0.000000,2.990000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.536869,0.000000,2.990000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.342313,0.000000,2.990000>}
box{<0,0,-0.075000><0.805444,0.036000,0.075000> rotate<0,0.000000,0> translate<42.536869,0.000000,2.990000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.499775,0.000000,3.140000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.336222,0.000000,3.140000>}
box{<0,0,-0.075000><1.836447,0.036000,0.075000> rotate<0,0.000000,0> translate<41.499775,0.000000,3.140000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.377469,0.000000,3.290000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.458528,0.000000,3.290000>}
box{<0,0,-0.075000><2.081059,0.036000,0.075000> rotate<0,0.000000,0> translate<41.377469,0.000000,3.290000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.255159,0.000000,3.440000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.840350,0.000000,3.440000>}
box{<0,0,-0.075000><0.585191,0.036000,0.075000> rotate<0,0.000000,0> translate<41.255159,0.000000,3.440000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.920809,0.000000,3.440000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.915194,0.000000,3.440000>}
box{<0,0,-0.075000><0.994384,0.036000,0.075000> rotate<0,0.000000,0> translate<41.920809,0.000000,3.440000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.995653,0.000000,3.440000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.580838,0.000000,3.440000>}
box{<0,0,-0.075000><0.585184,0.036000,0.075000> rotate<0,0.000000,0> translate<42.995653,0.000000,3.440000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.362500,0.000000,3.590000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.656388,0.000000,3.590000>}
box{<0,0,-0.075000><0.293887,0.036000,0.075000> rotate<0,0.000000,0> translate<41.362500,0.000000,3.590000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.190587,0.000000,3.590000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.645416,0.000000,3.590000>}
box{<0,0,-0.075000><0.454828,0.036000,0.075000> rotate<0,0.000000,0> translate<42.190587,0.000000,3.590000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.179616,0.000000,3.590000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.473500,0.000000,3.590000>}
box{<0,0,-0.075000><0.293884,0.036000,0.075000> rotate<0,0.000000,0> translate<43.179616,0.000000,3.590000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.205838,0.000000,3.740000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.630166,0.000000,3.740000>}
box{<0,0,-0.075000><0.424328,0.036000,0.075000> rotate<0,0.000000,0> translate<42.205838,0.000000,3.740000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.221091,0.000000,3.890000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.614913,0.000000,3.890000>}
box{<0,0,-0.075000><0.393822,0.036000,0.075000> rotate<0,0.000000,0> translate<42.221091,0.000000,3.890000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.812700,0.000000,1.587200>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.964500,0.000000,1.665400>}
box{<0,0,-0.075000><0.170759,0.036000,0.075000> rotate<0,-27.253530,0> translate<42.812700,0.000000,1.587200> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.964500,0.000000,1.665400>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.341500,0.000000,1.358000>}
box{<0,0,-0.075000><0.486440,0.036000,0.075000> rotate<0,39.190686,0> translate<42.964500,0.000000,1.665400> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.341500,0.000000,1.358000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.600000,0.000000,1.616500>}
box{<0,0,-0.075000><0.365574,0.036000,0.075000> rotate<0,-44.997030,0> translate<43.341500,0.000000,1.358000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.600000,0.000000,1.616500>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.292600,0.000000,1.993500>}
box{<0,0,-0.075000><0.486440,0.036000,0.075000> rotate<0,50.803374,0> translate<43.292600,0.000000,1.993500> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.292600,0.000000,1.993500>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.370816,0.000000,2.145338>}
box{<0,0,-0.075000><0.170799,0.036000,0.075000> rotate<0,-62.741632,0> translate<43.292600,0.000000,1.993500> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.370816,0.000000,2.145338>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.422900,0.000000,2.308000>}
box{<0,0,-0.075000><0.170798,0.036000,0.075000> rotate<0,-72.240217,0> translate<43.370816,0.000000,2.145338> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.422900,0.000000,2.308000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.906800,0.000000,2.357200>}
box{<0,0,-0.075000><0.486395,0.036000,0.075000> rotate<0,-5.805152,0> translate<43.422900,0.000000,2.308000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.906800,0.000000,2.357200>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.906800,0.000000,2.722800>}
box{<0,0,-0.075000><0.365600,0.036000,0.075000> rotate<0,90.000000,0> translate<43.906800,0.000000,2.722800> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.906800,0.000000,2.722800>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.422900,0.000000,2.772000>}
box{<0,0,-0.075000><0.486395,0.036000,0.075000> rotate<0,5.805152,0> translate<43.422900,0.000000,2.772000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.422900,0.000000,2.772000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.370816,0.000000,2.934662>}
box{<0,0,-0.075000><0.170798,0.036000,0.075000> rotate<0,72.240217,0> translate<43.370816,0.000000,2.934662> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.370816,0.000000,2.934662>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.292600,0.000000,3.086500>}
box{<0,0,-0.075000><0.170799,0.036000,0.075000> rotate<0,62.741632,0> translate<43.292600,0.000000,3.086500> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.292600,0.000000,3.086500>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.600000,0.000000,3.463500>}
box{<0,0,-0.075000><0.486440,0.036000,0.075000> rotate<0,-50.803374,0> translate<43.292600,0.000000,3.086500> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.600000,0.000000,3.463500>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.341500,0.000000,3.722000>}
box{<0,0,-0.075000><0.365574,0.036000,0.075000> rotate<0,44.997030,0> translate<43.341500,0.000000,3.722000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<43.341500,0.000000,3.722000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.964500,0.000000,3.414600>}
box{<0,0,-0.075000><0.486440,0.036000,0.075000> rotate<0,-39.190686,0> translate<42.964500,0.000000,3.414600> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.964500,0.000000,3.414600>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.812663,0.000000,3.492816>}
box{<0,0,-0.075000><0.170799,0.036000,0.075000> rotate<0,27.252428,0> translate<42.812663,0.000000,3.492816> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.812663,0.000000,3.492816>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.650000,0.000000,3.544900>}
box{<0,0,-0.075000><0.170798,0.036000,0.075000> rotate<0,17.753844,0> translate<42.650000,0.000000,3.544900> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.650000,0.000000,3.544900>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.600800,0.000000,4.028800>}
box{<0,0,-0.075000><0.486395,0.036000,0.075000> rotate<0,84.188908,0> translate<42.600800,0.000000,4.028800> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.600800,0.000000,4.028800>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.235200,0.000000,4.028800>}
box{<0,0,-0.075000><0.365600,0.036000,0.075000> rotate<0,0.000000,0> translate<42.235200,0.000000,4.028800> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.235200,0.000000,4.028800>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.186000,0.000000,3.544900>}
box{<0,0,-0.075000><0.486395,0.036000,0.075000> rotate<0,-84.188908,0> translate<42.186000,0.000000,3.544900> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.186000,0.000000,3.544900>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.023338,0.000000,3.492816>}
box{<0,0,-0.075000><0.170798,0.036000,0.075000> rotate<0,-17.753844,0> translate<42.023338,0.000000,3.492816> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.023338,0.000000,3.492816>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.871500,0.000000,3.414600>}
box{<0,0,-0.075000><0.170799,0.036000,0.075000> rotate<0,-27.252428,0> translate<41.871500,0.000000,3.414600> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.871500,0.000000,3.414600>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.494500,0.000000,3.722000>}
box{<0,0,-0.075000><0.486440,0.036000,0.075000> rotate<0,39.190686,0> translate<41.494500,0.000000,3.722000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.494500,0.000000,3.722000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.236000,0.000000,3.463500>}
box{<0,0,-0.075000><0.365574,0.036000,0.075000> rotate<0,-44.997030,0> translate<41.236000,0.000000,3.463500> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.236000,0.000000,3.463500>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.543400,0.000000,3.086500>}
box{<0,0,-0.075000><0.486440,0.036000,0.075000> rotate<0,50.803374,0> translate<41.236000,0.000000,3.463500> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.543400,0.000000,3.086500>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.465184,0.000000,2.934662>}
box{<0,0,-0.075000><0.170799,0.036000,0.075000> rotate<0,-62.741632,0> translate<41.465184,0.000000,2.934662> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.465184,0.000000,2.934662>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.413100,0.000000,2.772000>}
box{<0,0,-0.075000><0.170798,0.036000,0.075000> rotate<0,-72.240217,0> translate<41.413100,0.000000,2.772000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.413100,0.000000,2.772000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<40.929200,0.000000,2.722800>}
box{<0,0,-0.075000><0.486395,0.036000,0.075000> rotate<0,-5.805152,0> translate<40.929200,0.000000,2.722800> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<40.929200,0.000000,2.722800>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<40.929200,0.000000,2.357200>}
box{<0,0,-0.075000><0.365600,0.036000,0.075000> rotate<0,-90.000000,0> translate<40.929200,0.000000,2.357200> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<40.929200,0.000000,2.357200>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.413100,0.000000,2.308000>}
box{<0,0,-0.075000><0.486395,0.036000,0.075000> rotate<0,5.805152,0> translate<40.929200,0.000000,2.357200> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.413100,0.000000,2.308000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.465184,0.000000,2.145338>}
box{<0,0,-0.075000><0.170798,0.036000,0.075000> rotate<0,72.240217,0> translate<41.413100,0.000000,2.308000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.465184,0.000000,2.145338>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.543400,0.000000,1.993500>}
box{<0,0,-0.075000><0.170799,0.036000,0.075000> rotate<0,62.741632,0> translate<41.465184,0.000000,2.145338> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.543400,0.000000,1.993500>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.236000,0.000000,1.616500>}
box{<0,0,-0.075000><0.486440,0.036000,0.075000> rotate<0,-50.803374,0> translate<41.236000,0.000000,1.616500> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.236000,0.000000,1.616500>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.494500,0.000000,1.358000>}
box{<0,0,-0.075000><0.365574,0.036000,0.075000> rotate<0,44.997030,0> translate<41.236000,0.000000,1.616500> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.494500,0.000000,1.358000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.871500,0.000000,1.665400>}
box{<0,0,-0.075000><0.486440,0.036000,0.075000> rotate<0,-39.190686,0> translate<41.494500,0.000000,1.358000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.871500,0.000000,1.665400>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.023300,0.000000,1.587200>}
box{<0,0,-0.075000><0.170759,0.036000,0.075000> rotate<0,27.253530,0> translate<41.871500,0.000000,1.665400> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.023300,0.000000,1.587200>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.238600,0.000000,2.106900>}
box{<0,0,-0.075000><0.562532,0.036000,0.075000> rotate<0,-67.492420,0> translate<42.023300,0.000000,1.587200> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.238600,0.000000,2.106900>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.142441,0.000000,2.160738>}
box{<0,0,-0.075000><0.110205,0.036000,0.075000> rotate<0,29.241566,0> translate<42.142441,0.000000,2.160738> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.142441,0.000000,2.160738>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.061512,0.000000,2.235537>}
box{<0,0,-0.075000><0.110202,0.036000,0.075000> rotate<0,42.743671,0> translate<42.061512,0.000000,2.235537> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.061512,0.000000,2.235537>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.000284,0.000000,2.327166>}
box{<0,0,-0.075000><0.110203,0.036000,0.075000> rotate<0,56.244486,0> translate<42.000284,0.000000,2.327166> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.000284,0.000000,2.327166>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.962144,0.000000,2.430559>}
box{<0,0,-0.075000><0.110204,0.036000,0.075000> rotate<0,69.747027,0> translate<41.962144,0.000000,2.430559> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.962144,0.000000,2.430559>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.949200,0.000000,2.540000>}
box{<0,0,-0.075000><0.110203,0.036000,0.075000> rotate<0,83.249360,0> translate<41.949200,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.949200,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.962653,0.000000,2.651394>}
box{<0,0,-0.075000><0.112203,0.036000,0.075000> rotate<0,-83.108202,0> translate<41.949200,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<41.962653,0.000000,2.651394>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.002197,0.000000,2.756400>}
box{<0,0,-0.075000><0.112205,0.036000,0.075000> rotate<0,-69.359815,0> translate<41.962653,0.000000,2.651394> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.002197,0.000000,2.756400>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.065559,0.000000,2.849000>}
box{<0,0,-0.075000><0.112203,0.036000,0.075000> rotate<0,-55.614044,0> translate<42.002197,0.000000,2.756400> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.065559,0.000000,2.849000>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.149119,0.000000,2.923884>}
box{<0,0,-0.075000><0.112204,0.036000,0.075000> rotate<0,-41.863348,0> translate<42.065559,0.000000,2.849000> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.149119,0.000000,2.923884>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.248078,0.000000,2.976769>}
box{<0,0,-0.075000><0.112204,0.036000,0.075000> rotate<0,-28.118410,0> translate<42.149119,0.000000,2.923884> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.248078,0.000000,2.976769>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.356772,0.000000,3.004616>}
box{<0,0,-0.075000><0.112204,0.036000,0.075000> rotate<0,-14.368913,0> translate<42.248078,0.000000,2.976769> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.356772,0.000000,3.004616>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.468969,0.000000,3.005834>}
box{<0,0,-0.075000><0.112203,0.036000,0.075000> rotate<0,-0.622316,0> translate<42.356772,0.000000,3.004616> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.468969,0.000000,3.005834>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.578241,0.000000,2.980353>}
box{<0,0,-0.075000><0.112204,0.036000,0.075000> rotate<0,13.125438,0> translate<42.468969,0.000000,3.005834> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.578241,0.000000,2.980353>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.678325,0.000000,2.929631>}
box{<0,0,-0.075000><0.112203,0.036000,0.075000> rotate<0,26.873714,0> translate<42.578241,0.000000,2.980353> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.678325,0.000000,2.929631>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.763488,0.000000,2.856578>}
box{<0,0,-0.075000><0.112203,0.036000,0.075000> rotate<0,40.620596,0> translate<42.678325,0.000000,2.929631> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.763488,0.000000,2.856578>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.828850,0.000000,2.765378>}
box{<0,0,-0.075000><0.112204,0.036000,0.075000> rotate<0,54.367467,0> translate<42.763488,0.000000,2.856578> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.828850,0.000000,2.765378>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.870663,0.000000,2.661256>}
box{<0,0,-0.075000><0.112204,0.036000,0.075000> rotate<0,68.116458,0> translate<42.828850,0.000000,2.765378> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.870663,0.000000,2.661256>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.886534,0.000000,2.550178>}
box{<0,0,-0.075000><0.112206,0.036000,0.075000> rotate<0,81.862689,0> translate<42.870663,0.000000,2.661256> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.886534,0.000000,2.550178>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.875550,0.000000,2.438516>}
box{<0,0,-0.075000><0.112201,0.036000,0.075000> rotate<0,-84.376252,0> translate<42.875550,0.000000,2.438516> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.875550,0.000000,2.438516>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.838341,0.000000,2.332659>}
box{<0,0,-0.075000><0.112206,0.036000,0.075000> rotate<0,-70.628329,0> translate<42.838341,0.000000,2.332659> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.838341,0.000000,2.332659>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.777044,0.000000,2.238678>}
box{<0,0,-0.075000><0.112204,0.036000,0.075000> rotate<0,-56.882870,0> translate<42.777044,0.000000,2.238678> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.777044,0.000000,2.238678>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.695166,0.000000,2.161963>}
box{<0,0,-0.075000><0.112202,0.036000,0.075000> rotate<0,-43.132735,0> translate<42.695166,0.000000,2.161963> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.695166,0.000000,2.161963>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.597400,0.000000,2.106900>}
box{<0,0,-0.075000><0.112205,0.036000,0.075000> rotate<0,-29.386672,0> translate<42.597400,0.000000,2.106900> }
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.597400,0.000000,2.106900>}
cylinder{<0,0,0><0,0.036000,0>0.075000 translate<42.812700,0.000000,1.587200>}
box{<0,0,-0.075000><0.562532,0.036000,0.075000> rotate<0,67.492420,0> translate<42.597400,0.000000,2.106900> }
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.362000,0.000000,17.908000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.662000,0.000000,17.908000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.662000,0.000000,17.908000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.362000,0.000000,33.908000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.662000,0.000000,33.908000>}
box{<0,0,-0.063500><19.700000,0.036000,0.063500> rotate<0,0.000000,0> translate<22.662000,0.000000,33.908000> }
difference{
cylinder{<39.497000,0,18.923000><39.497000,0.036000,18.923000>0.444500 translate<0,0.000000,0>}
cylinder{<39.497000,-0.1,18.923000><39.497000,0.135000,18.923000>0.317500 translate<0,0.000000,0>}}
//U3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.476000,0.000000,7.502000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.376000,0.000000,7.402000>}
box{<0,0,-0.101600><0.141421,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.376000,0.000000,7.402000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.126000,0.000000,7.152000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.326000,0.000000,7.152000>}
box{<0,0,-0.063500><3.800000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.326000,0.000000,7.152000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.076000,0.000000,7.402000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.976000,0.000000,7.502000>}
box{<0,0,-0.101600><0.141421,0.036000,0.101600> rotate<0,44.997030,0> translate<27.976000,0.000000,7.502000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.326000,0.000000,7.152000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.726000,0.000000,7.752000>}
box{<0,0,-0.063500><0.848528,0.036000,0.063500> rotate<0,44.997030,0> translate<27.726000,0.000000,7.752000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.726000,0.000000,7.752000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.726000,0.000000,11.552000>}
box{<0,0,-0.063500><3.800000,0.036000,0.063500> rotate<0,90.000000,0> translate<27.726000,0.000000,11.552000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.976000,0.000000,11.802000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.076000,0.000000,11.902000>}
box{<0,0,-0.101600><0.141421,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.976000,0.000000,11.802000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.726000,0.000000,11.552000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.326000,0.000000,12.152000>}
box{<0,0,-0.063500><0.848528,0.036000,0.063500> rotate<0,-44.997030,0> translate<27.726000,0.000000,11.552000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.326000,0.000000,12.152000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.126000,0.000000,12.152000>}
box{<0,0,-0.063500><3.800000,0.036000,0.063500> rotate<0,0.000000,0> translate<28.326000,0.000000,12.152000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.126000,0.000000,12.152000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.726000,0.000000,11.552000>}
box{<0,0,-0.063500><0.848528,0.036000,0.063500> rotate<0,44.997030,0> translate<32.126000,0.000000,12.152000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.376000,0.000000,11.902000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.476000,0.000000,11.802000>}
box{<0,0,-0.101600><0.141421,0.036000,0.101600> rotate<0,44.997030,0> translate<32.376000,0.000000,11.902000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.726000,0.000000,11.552000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.726000,0.000000,7.752000>}
box{<0,0,-0.063500><3.800000,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.726000,0.000000,7.752000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.726000,0.000000,7.752000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.126000,0.000000,7.152000>}
box{<0,0,-0.063500><0.848528,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.126000,0.000000,7.152000> }
difference{
cylinder{<32.876000,0,7.302000><32.876000,0.036000,7.302000>0.251600 translate<0,0.000000,0>}
cylinder{<32.876000,-0.1,7.302000><32.876000,0.135000,7.302000>0.048400 translate<0,0.000000,0>}}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.501000,0.000000,7.902000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.501000,0.000000,8.402000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.501000,0.000000,8.902000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.501000,0.000000,9.402000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.501000,0.000000,9.902000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.501000,0.000000,10.402000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.501000,0.000000,10.902000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.501000,0.000000,11.402000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<31.976000,0.000000,11.927000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<31.476000,0.000000,11.927000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<30.976000,0.000000,11.927000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<30.476000,0.000000,11.927000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<29.976000,0.000000,11.927000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<29.476000,0.000000,11.927000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<28.976000,0.000000,11.927000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<28.476000,0.000000,11.927000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<27.951000,0.000000,11.402000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<27.951000,0.000000,10.902000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<27.951000,0.000000,10.402000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<27.951000,0.000000,9.902000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<27.951000,0.000000,9.402000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<27.951000,0.000000,8.902000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<27.951000,0.000000,8.402000>}
box{<-0.225000,0,-0.150000><0.225000,0.036000,0.150000> rotate<0,-180.000000,0> translate<27.951000,0.000000,7.902000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<28.476000,0.000000,7.377000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<28.976000,0.000000,7.377000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<29.476000,0.000000,7.377000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<29.976000,0.000000,7.377000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<30.476000,0.000000,7.377000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<30.976000,0.000000,7.377000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<31.476000,0.000000,7.377000>}
box{<-0.150000,0,-0.225000><0.150000,0.036000,0.225000> rotate<0,-180.000000,0> translate<31.976000,0.000000,7.377000>}
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.794000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.794000,0.000000,14.240000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.794000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.644000,0.000000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.794000,0.000000,14.240000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.644000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.644000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.794000,0.000000,16.240000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.644000,0.000000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.294000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.294000,0.000000,14.240000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<32.294000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.294000,0.000000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.444000,0.000000,14.240000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.294000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.294000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.444000,0.000000,16.240000>}
box{<0,0,-0.101600><0.150000,0.036000,0.101600> rotate<0,0.000000,0> translate<32.294000,0.000000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.794000,0.000000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.294000,0.000000,14.240000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<32.294000,0.000000,14.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.294000,0.000000,14.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.294000,0.000000,16.240000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<32.294000,0.000000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.294000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.794000,0.000000,16.240000>}
box{<0,0,-0.063500><4.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<32.294000,0.000000,16.240000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.794000,0.000000,16.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.794000,0.000000,14.240000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<36.794000,0.000000,14.240000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  M328P_RFM69_NODE(-29.083000,0,-18.542000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//BAT3	1.5V - AA	BATTERY-AA-KIT
//BAT4	1.5V - AA	BATTERY-AA-KIT
//CT1	MUTUAL	MUTUAL
//JP3	AVR_SPI_PRG_6NS	2X3-NS
//L1	10uH	DLJ-4018
//U$2		OSHW-LOGO-S
//U2	RFM69W	RFM69W
//Y1	8MHz	RESONATOR-SMD_MED
