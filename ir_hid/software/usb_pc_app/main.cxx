/**
 * Project: AVR ATtiny USB Tutorial at http://codeandlife.com/
 * Author: Joonas Pihlajamaa, joonas.pihlajamaa@iki.fi
 * Based on V-USB example code by Christian Starkjohann
 * Copyright: (C) 2012 by Joonas Pihlajamaa
 * License: GNU GPL v3 (see License.txt)
 */
#include "usb_irhid_gui.h"

int main(int argc, char **argv) {
	
	//0x4242, "eltech.org", 0xE131, "IR HID Keyboard"
	
	Fl_Double_Window* main_window = make_window();
	Fl::visual(FL_DOUBLE|FL_INDEX);
	main_window->show();
	return Fl::run();
}
