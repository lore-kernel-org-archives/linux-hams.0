From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: AX25 patches and new FPAC 327.14-pre23 release
Date: Sat, 10 Apr 2010 19:24:27 +0200
Message-ID: <4BC0B44B.1060707@upmc.fr>
References: <4B858D99.6080906@embarqmail.com>  <4B8A72F1.8090203@upmc.fr> <1267413070.28677.364.camel@localhost.localdomain> <4B8B31CF.4030007@embarqmail.com> <4B93F367.1000803@free.fr> <4B955E3C.2010303@free.fr> <4B95B589.5080000@embarqmail.com> <4B961217.1080002@free.fr> <4B998055.8040006@gmail.com> <4B9AAE22.9090307@upmc.fr> <4B9AE3F0.8050504@gmail.com> <4B9B68E8.70805@upmc.fr> <4B9C3A18.60605@xtra.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B9C3A18.60605@xtra.co.nz>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: C Schuman <k4gbb1@embarqmail.com>, bobtenty@gmail.com, Jerry DeLong <KD4YAL@tampabay.rr.com>, Ray Wells <vk2tv@exemail.com.au>, List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

Hi All,

Ax25 libraries, ax25-apps and ax25-tools available under -rc2 label
have a number of bugs that prevent ROSE network application FPAC to work properly.

List of main bugs in libax25 :
- in /usr/local/include/netax25/procutils.h, use entry is missing  
  in struct proc_rs_neigh
- in procutils.c, ax25_aton_entry(const char *name, char *buf) 
  first while loop is < 6 and should be < 7 to allow checking minus character before SSID
  in six letters callsigns.

In ax25apps, application ax25ipd has been added a dynamic DNS option and more. 
 Read ax25ipd History.  

In ax25tools, a bug in nrattach, prevented initializing NetRom devices.

Patched rc2 source packages are available from here :

http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.12-rc2.patched_f6bvp.tar.bz2
http://f6bvp.free.fr/logiciels/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp.tar.bz2
http://f6bvp.free.fr/logiciels/ax25/ax25-tools-0.0.10-rc2.patched_f6bvp.tar.bz2

A new release of FPAC is also available.
Here are the last version changes :

3.27.14-pre23 (F6BVP)
- Added the following three letters symbolic DNIC list in /etc/ax25/fpac.dnic 
FRA 2080
ESP 2120
USA 3100
CUR 3620
ARU 3630
AUS 5050
NIC 7100
COS 7120
CAN 3020

- When issuing fpacnode command " n * ", the FPAC node list displays an extended node description.
- argument -pthread added in rules.make - Utility ?
- fpacnode was crashing when a connection was attempted to an ax25 callsign identical to a local ax25 port. Corrected
- fpacnode Ports command "p" now displays a more complete list of ax25 ports parameters.
- fpacnode Links command "l" now displays the status of a link : Yes if connected.

FPAC can be bownloaded from here :

http://f6bvp.free.fr/logiciels/rose-fpac/fpac327-14-pre23.tar.bz2

73 de Bernard, f6bvp
