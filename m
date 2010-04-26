From: Bernard Pidoux <bpidoux@free.fr>
Subject: Re: node software for Linux
Date: Mon, 26 Apr 2010 11:40:31 +0200
Message-ID: <4BD55F8F.3050608@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi Jim,

I suggest you consider FPAC node application. Look at the following page:
http://rose.fpac.free.fr/MINI-HOWTO/
I think it could perform exactly what you are looking for.
We have set up a large network interfacing local AX25 radio (AX.25, Netrom, ROSE) and
world wide Internet via axip links.
Here is a list of actual FPAC nodes :

Callsign  DNIC addr    Callsign  DNIC addr    Callsign  DNIC addr
   F1MVP-4 2080,886801    F3KT-10 2080,444501    F4BWT-0 2080,428405
  F4BWT-10 2080,428501    F5KBW-8 2080,833501   F5KCK-10 2080,178504
  F6BVP-10 2080,175502    F6BVP-4 2080,175522    F6BVP-6 2080,175521
   F6BVP-8 2080,175520    F6GGY-8 2080,847501    F6KAV-8 2080,833505
  F8COJ-10 2080,854509    F8COJ-6 2080,854509    F8COJ-7 2080,854505
  FF6BVP-1 2080,175522   HT0PAQ-8 7100,505522   K4GBB-11 3100,352727
  K4GBB-12 3100,352727    K4GBB-8 3100,352726   KD4YAL-8 3100,727489
  KG4NXO-8 3100,352237   KI4UWC-8 3100,352473   KI4VAM-8 3100,813224
  KI4VAM-9 3100,813224   KP4DJT-8 3100,813626    N3PPC-8 3100,386335
   N4GFO-8 3100,904282    N4PLZ-8 3100,407277    N4WKQ-3 3100,386225
   N4WKQ-8 3100,386677     N5SN-9 3100,321254     P43L-3 3630,297585
    PJ2A-8 3620,905859   TI2HAS-8 7120,282700   TM6BVP-4 2080,175522
   VE3KR-8 3020,905859   VE5VRA-8 3020,306789   VE7HNY-8 3020,604463
  VE7LAN-2 3020,604985   VE7TEL-2 3020,604432  VE7TPS-12 3020,250749
  VK2CIM-1 5050,604000    VK2TV-1 5050,656200   VK2TV-11 5050,656300
  VK2WET-1 5050,656300    VK2XB-1 5050,699300   VK5HSX-2 5050,883850
  VK7HDM-4 5050,626300    W4ACS-8 3100,727464    W4AKH-8 3100,772461
   W4BGH-8 3100,813684    W4MIN-8 3100,863494    W4MLB-8 3100,321254
   W4SLC-8 3100,772461    W4VLG-8 3100,352259   WA4EBZ-0 3100,321254
WD4SEN-11 3100,904282  WD4SEN-12 3100,904271   WD4SEN-8 3100,904272
   WE4LC-8 3100,804435   YN1BBS-8 7100,505522


Users - AX.25 Level 2 sessions :
Port   Callsign     Callsign  AX.25 state
axudp  F6BVP-11  -> F5KBW-9   Connected
axudp  F6BVP-11  -> VK7HDM-5  Connected
axudp  F6BVP-11  -> P43L-4    Connected
axudp  F6BVP-11  -> K4GBB-9   Connected
axudp  F6BVP-11  -> F6GGY-9   Connected
axudp  F6BVP-11  -> YN1BBS-9  Connected
axudp  F6BVP-12  -> VA2BBS-4  Connected
axudp  F6BVP-11  -> F6BVP-9   Connected
axudp  F6BVP-11  -> VK2TV-2   Connected
axudp  F6BVP-12  -> K4GBB-14  Connected

Users - AX.25 Level 3 sessions :
Callsign  DNIC addr   <-> Callsign  DNIC addr   LCI Adjacent    AX.25 state
F6BVP-0   2080,175502 <-> F4BWT-10  2080,428501 000 (F5KBW-9)   Disconnected
F6BVP-12  2080,175502 <-> F6BVP-1   2080,175520 000 (F5KBW-9)   Disconnected

Users - AX.25 Level 3 transits :
Callsign  DNIC addr   LCI Adjacent   <-> Callsign  DNIC addr   LCI Adjacent
WP-0      5050,626300 001 (VK7HDM-5) <-> WP-0      2080,444501 032 (F6GGY-9)

Each node can be connected to a large number of adjacent nodes.
Three alternate routes can be automatically checked for a specific destination.

ROSE routes :
DNIC Address Primary   Route  | 1st Alt   Route  | 2nd Alt   Route  |
7100,......  YN1BBS-9  Opened | TI2HAS-9  Closed | P43L-4    Opened |
7120,......  TI2HAS-9  Closed | YN1BBS-9  Opened | P43L-4    Opened |
5050,......  VK7HDM-5  Opened | VK2XB-2   Closed | VK2TV-2   Opened |
3630,......  P43L-4    Opened | YN1BBS-9  Opened | TI2HAS-9  Closed |
3620,......  P43L-4    Opened | YN1BBS-9  Opened | TI2HAS-9  Closed |
3100,......  K4GBB-9   Opened | KD4YAL-9  Closed | KP4DJT-9  Closed |
3020,......  K4GBB-9   Opened |
2080,......  F5KBW-9   Opened | F3KT-11   Closed | F4BWT-11  Closed |
2080,9.....  F5KBW-9   Opened |
2080,8.....  F8COJ-11  Closed | F5KBW-9   Opened |
2080,7.....  F5KBW-9   Opened |
2080,1.....  F6BVP-9   Opened | F6BVP-7   Closed |
2080,428...  F4BWT-11  Closed |
2080,847...  F6GGY-9   Opened | F4BWT-11  Closed |
2080,444...  F3KT-11   Closed | F6GGY-9   Opened | F1MVP-5   Closed |
2080,8335..  F5KBW-9   Opened |
7120,282700  TI2HAS-9  Closed |
7100,505522  YN1BBS-9  Opened |
5050,626300  VK7HDM-5  Opened |
5050,656200  VK2TV-2   Opened |
5050,699300  VK2XB-2   Closed |
3630,297585  P43L-4    Opened |
3100,813626  KP4DJT-9  Closed |
3100,727489  KD4YAL-9  Closed |
3100,352726  K4GBB-9   Opened |
2080,886801  F1MVP-5   Closed |
2080,428501  F4BWT-11  Closed |
2080,847501  F6GGY-9   Opened |
2080,833501  F5KBW-9   Opened |
2080,444501  F3KT-11   Closed |
2080,854509  F8COJ-11  Closed |
2080,175520  F6BVP-9   Opened |
2080,175521  F6BVP-7   Closed |
2080,175522  F6BVP-5   Closed |

The IP network interface is via encapsulated AXIP:
  
Ports:
Port   Address    Bauds  Paclen Window Description
aprs   F6BVP-12   38400  256    2      144,800 (APRS)
uhf-1  F6BVP-13   38400  256    2      RX:430,325/TX:439,725 9600 Bauds
axudp  F6BVP-10  115200  256    2      Linux  (AX25<->UDP)

FPAC can be internally interfaced with a BBS, APRS or DxCluster as shown here :

F6BVP-10 (Commands = ?) : bbs
Trying FE6BVP-1 @ 2080,175502... Type <RETURN> to abort
*** Connected to FE6BVP-1 @ 2080,175502 (Escape: ~. )
[FBB-7.04r-AFHMRX$]
OK BBS-F6BVP - 59 Msg(s) - 752 KB

1:FE6BVP>
b
*** 0000 - Remote Station cleared connection
*** Reconnected to F6BVP-10

F6BVP-10 (Commands = ?) : aprs
11:38:41  aprs: AX25: F6BVP->APRS v F6KGT-4* F5KMB-4* WIDE2 <UI C> pid=Text (97)
=4853.08 /00218.80 #rose/fpac node bbs jn18dv paris 145,275 1200b 433,775 9600b http://f6bvp.org
11:38:43  aprs: AX25: F6BVP->APRS v F6KRK-3* F1NVW-2* WIDE2* <UI C> pid=Text (97)
=4853.08 /00218.80 #rose/fpac node bbs jn18dv paris 145,275 1200b 433,775 9600b http://f6bvp.org
11:38:44  aprs: AX25: F4FSD->APAGW v F6KGT-4* F6KRK-3* WIDE3-1 <UI> pid=Text (30)
=4915.39N/00225.61E-AGWtracker


F6BVP-10 (Commands = ?) : clu
Trying 192.168.0.64...
Connected to f6bvp-9 (192.168.0.64).
Escape character is '^]'.
login: f6bvp
f6bvp
Hello Bernard, this is F6BVP-2 in Paris, France
running DXSpider V1.55 build 0.38
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  18135.0  V73RS       26-Apr-2010 0938Z  Tnx Rob for the New 1        <G0HOF>
  14196.9  PB5X        26-Apr-2010 0934Z  OP.ROBERTO QTH BREDA         <I0YKN>
  18140.0  EA8AAW      26-Apr-2010 0936Z  Gracias Andres, escoge la QS<EC1CLG>
  14202.1  MM0KLR      26-Apr-2010 0936Z  EU-008, Isle of Eigg         <DC4RU>
  18079.6  AL5A/WH0    26-Apr-2010 0933Z                               <UY5AB>
-------------------------------------------------------------------------------
Date        Hour   SFI   A   K Forecast                               Logger
26-Apr-2010   09    75   1   1 No Storms -> No Storms                <N5IN>
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Cluster: 376 nodes, 1 local / 902 total users  Max users 902  Uptime 0 00:54
F6BVP de F6BVP-2 26-Apr-2010 0938Z dxspider >
q
Connection closed by foreign host.


I hope this is what you are looking for.

73 de Bernard, f6bvp




Subject:    node software for Linux
From:       Jim Kusznir <jkusznir () gmail ! com>
Date:       2010-04-26 0:36:41
Message-ID: y2xdf8c8a6d1004251736sb8446a3bka7d66895ae0d71fb () mail ! gmail ! com
[Download message RAW]

Hi all:

I have my linux system successfully operating the ax25 stack, with
netrom, etc.  I've gotten to the point where I'm looking at
"replacing" a stack of TNC's running TheNet X1J-4 with a linux box
controlling radios (still deciding on dropping a KISS rom in the
TNC's, or replacing them with something else that linux is
controlling, such as sound cards or baycom modems, etc).  My goal is
to produce a NetRom node-like interface that also has full IP support,
and AXIP capability.  Ultimately, I plan on establishing a "high
speed" (at least 10mbps) IP network, and would like to use this as a
"backbone" for the existing AX.25 / NetRom network.

In any case, I'm trying to find a suitable node software.  I've been
having trouble locating a version of "node" that still builds (I'm
running Gentoo Linux, but would be fine running other linux variants,
as long as they'll run on ARM (sheeva plug), MIPS (Ubnt hardware), and
the like.).  A local operator pointed me toward uronode, but it seems
that uronode.net disappeared, and so far I haven't been able to find a
source distribution of that either.

In an ideal world, I'd be able to run something like BPQ on linux, but
it appears that also doesn't exist...

So, suggestions?

Thanks!
--Jim
