#ifndef NTP_H
#define NTP_H

#include <NtpClientLib.h>

namespace Ntp {
  void init(){
    NTP.onNTPSyncEvent ([](NTPSyncEvent_t error) {
        if (error) {
            DEBUG_OUTPUT.print ("Time Sync error: ");
            if (error == noResponse)
                DEBUG_OUTPUT.println ("NTP server not reachable");
            else if (error == invalidAddress)
                DEBUG_OUTPUT.println ("Invalid NTP server address");
        } else {
            DEBUG_OUTPUT.print ("Got NTP time: ");
            DEBUG_OUTPUT.println (NTP.getTimeDateString (NTP.getLastNTPSync ()));
        }
    });
    NTP.begin ("ro.pool.ntp.org", 2, true);
  }

  void loop() {
  }

}

#endif
