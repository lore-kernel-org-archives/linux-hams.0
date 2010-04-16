From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: ax25-tools: mkiss (multiport kiss) - new feature
Date: Fri, 16 Apr 2010 21:24:01 +0200
Message-ID: <20100416192401.GS3189@x-berg.in-berlin.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

I'd like to introduce a new operation mode for ax25-tools mkiss
(multiport kiss).

Franko describes in his mail below his hardware and why he needed this
feature.

From the man-page:
       If  the  pty name is the special name "none", no pty is opened. This is
       useful if you have multiport tnc like the KPC-9612 on i.e. /dev/ttyUSB0
       and you only like to handle packets for the second port. The KPC has no
       option to configure the second tnc to listen on  kiss  port  number  0.
       Thus, if you like to send all frames from the pty to the kiss port num-
       ber 1, we need to tell mkiss to tag them for port  number  1.  This  is
       done  by "mkiss /dev/ttyUSB0 none /dev/ptmx". Frames received with port
       number 0 are discarded.

diff:
http://www.linux-ax25.org/cvsweb/ax25-tools/kiss/mkiss.c.diff?r1=1.6;r2=1.7;f=h

73,
	- Thomas  dl9sau

----- Forwarded message from Franco Spinelli <frspin@gmail.com> -----

Delivery-date: Fri, 16 Apr 2010 19:08:41 +0200
X-Envelope-From: frspin@gmail.com
X-Envelope-To: <thomas@osterried.de>
Message-ID: <4BC89991.20906@gmail.com>
Date: Fri, 16 Apr 2010 19:08:33 +0200
From: Franco Spinelli <frspin@gmail.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
To: Thomas Osterried <thomas@osterried.de>
Subject: Re: AX25-tool
X-Spam-Score:  (0.686) BAYES_50,SPF_HELO_PASS,SPF_NEUTRAL

Thomas Osterried ha scritto:
> Hello Franco,
> Would you like to describe the feature and the requirements of your KPC in your own words and like to post this to the linux-hams mailing-list? It could be useful to other KPC owners to know that there is support by the mkiss program now.
>

KPC-9612 have some different operation modes and two ports, one at 1200  
bauds and a second at 9600 bauds.

In TERM mode (Intface TERM) you can switch from one to other port using  
HBaud 1200|9600 command.
In KISS mode there is no equivalent command

So, using KPC-9612 in KISS mode and standard mkiss program you get two  
pseudo-devices and use first for 1200 bauds and second for 9600 bauds.

The new feature permit you to select which interface use with mkiss command.
This is useful with a monoband radio and TCP/IP packet, when the only  
needed port is the second (9600 bauds)

Regards
Franco Spinelli
IW2DHW


----- End forwarded message -----
