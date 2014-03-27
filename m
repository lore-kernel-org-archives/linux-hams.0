From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: netromr.c path quality calc bug  ax25tools-1.0.2/netrom
Date: Thu, 27 Mar 2014 13:01:04 +0000
Message-ID: <IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <024rua-e6d.ln1@atomos.longlandclan.yi.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <024rua-e6d.ln1@atomos.longlandclan.yi.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello All

netromr.c path quality calc bug

Refers to ax25tools-1.0.2/netrom/netromr.c and Maintainer of the above.

ax25-tools-0.0.8 fix worst qualities I applied the changes to this
on my system manually in January 2002.

I noticed that the distribution that I recently downloaded  (2013) via
Charles excellent script ax25tools-1.0.2/netrom/netromr.c.

Does not include this correction on my new system build (2014) which
I am currently working on.

Testing each service as they are installed and configured.

As a result the Min Quality calculations are incorrect using the code in
ax25tools-1.0.2/netrom/netromr.c.


If the Min Qual = 100.
I would not expect to see any nodes with path quality values
between 0 and 99

if the Min Qual = 10.
I would not expect to see any node with path quality values between 0
and 10

So for testing, route to adjacent node set to 10.
System received 800 unwanted node entries with path values between 0 and
9.

Which should have been filtered out.

Before:
Issued the route command on the node, not the Qualities, decreasing
from max of 6 following each 30 minute node broadcast following the
amended code.

ro
G4APL-10:CRNOD2 Routes:
Link Port   Callsign  Quality Destinations Lock
     axu3   GB7CIP-5  10      803

803 nodes listed with the N command
XnetDo:PI8RWD-10  Y-HAMS:VE3MCH-7   YCARES:KG6SJT-5   YEWDXC:GM3YEW-6
YKS:GB7YKS-1      YKSMBX:GB7YKS     YRGTN:W7DED-4     YVRASS:VE7ASS-7
ZEVCHT:KD7ZEV-2   ZWINET:DB0ZWI     ZdeDxn:IK6ZDE-6   bbsGRZ:OE6XPE-8
dwc:SR6DWC-11     dxcGRZ:OE6XPE-5   dxclus:PI8DXC     igDBL:OE6XPD
pi1hgl:PI1HGL     syltli:DH4LAR-1   xnGRZ:OE6XPE      xn_dxc:PI1DXC-15
xn_mvx:PE1MVX-15  xnetPB:PE1PBA-9   zwinet:DB0ZWI-3   zwinet:DB0ZWI-4

n winode
G4APL-10:CRNOD2 Routes to: WINODE:N9PMO-8
Which Quality Obsolescence Port   Neighbour
>     3       4            axu3   GB7CIP-5

n vk3atm-5
G4APL-10:CRNOD2 Routes to: X-ATM:VK3ATM-5
Which Quality Obsolescence Port   Neighbour
>     3       4            axu3   GB7CIP-5

n f4fur-7
G4APL-10:CRNOD2 No such node

n pi1hgl-0
G4APL-10:CRNOD2 Routes to: pi1hgl:PI1HGL
Which Quality Obsolescence Port   Neighbour
>     3       4            axu3   GB7CIP-5

n gb7yks
G4APL-10:CRNOD2 Routes to: YKSMBX:GB7YKS
Which Quality Obsolescence Port   Neighbour
>     4       4            axu3   GB7CIP-5

n oe6xpd
G4APL-10:CRNOD2 Routes to: igDBL:OE6XPD
Which Quality Obsolescence Port   Neighbour
>     3       4            axu3   GB7CIP-5

Following making the required two changes to the code.
The netromr.c works as is should do.
Now produces the correct and expected results
Just like yea olde TheNet and Netrom Eprom code we used in the late
1980's early 90's
for our Netrom/IP routers.
i.e. this is what I would expect to see with the following
route quality to my adjacent node.


After three hours 6 node broadcasts (30 minutes) back to normality.
G4APL-10:CRNOD2 Routes:
Link Port   Callsign  Quality Destinations Lock
     axu3   GB7CIP-5  10      3

n
G4APL-10:CRNOD2 Nodes:
CIPBBS:GB7CIP     CRCHAT:GB7CIP-5   CRNOD2:G4APL-10   CRNODE:GB7CR


I was sent this patch back in January 2002

2.1.2002 applied following patch forwarded to g4apl
13.1.2002 and manually applied, compiled and netromd copied to
/usr/sbin/netromd

(note current locations these days /usr/loca/sbin/netromd)

--- netromr.c.old       Sat Jan 13 17:20:06 2001
+++ netromr.c   Sat Jan 13 17:21:40 2001
@@ -88,7 +88,7 @@
        memcpy(nr_node->mnemonic,  buffer + 7,  MNEMONIC_LEN);
        memcpy(&best_neighbour,    buffer + 13, CALLSIGN_LEN);

-       best_quality = buffer[20];
+       best_quality = ((buffer[20] * quality) + 128) / 256;

        nr_node->mnemonic[MNEMONIC_LEN] = '\0';
        if ((p = strchr(nr_node->mnemonic, ' ')) != NULL)
@@ -124,7 +124,7 @@
                return FALSE;
        }

-       nr_node->quality = ((quality * best_quality) + 128) / 256;
+       nr_node->quality = best_quality;

        /* log this only when logging verbosely */
        if (debug > 1 && logging) {

################################################

Hope the above makes sense to you coders out there.

73 de Paul G4APL SysOP GB7CIP


-- 
paul@skywaves.demon.co.uk
