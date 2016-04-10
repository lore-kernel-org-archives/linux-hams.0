From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [Linux-ham] netrom
Date: Sun, 10 Apr 2016 14:41:18 -0700
Message-ID: <570AC87E.3030705@trinnet.net>
References: <20160401184009.GB25136@belle.intranet.vanheusden.com>
 <56FECDF1.5090701@trinnet.net>
 <20160401201200.GE25136@belle.intranet.vanheusden.com>
 <56FEE62F.40003@trinnet.net>
 <20160408094400.GS25136@belle.intranet.vanheusden.com>
 <5707C85B.7060806@trinnet.net>
 <20160410193639.GX25136@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160410193639.GX25136@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: folkert <folkert@vanheusden.com>, linux-hams@vger.kernel.org


Hey Folkert,


> My script is as below. If I remove the modprobe/nrattach and then do
> that manually afterwards, then it does not work.

That's strange but to be honest, I would recommend you to do all your 
base infrastructure commands first (kissattach, netrom, ax25d, mheard, 
etc) FIRST.  Then start some of your AX.25 applications (axdigi, 
aprsdigi, etc) next and then your beacons last.


> /usr/sbin/kissattach /dev/ttyAMA0 axportr 192.168.45.8

Btw, after you run this command, check out the output of "ifconfig -a" 
and check the subnet mask.  I bet it's wrong.  You'll need to manually 
correct this with ifconfig after the fact.  This is what my packetrig.sh 
script does.



> /usr/sbin/aprsdigi --verbose \
>                  --kill_dupes \
>                  --kill_loops \
>                  --int ax25:FH1GOU-1:RELAY,WIDE,FOO,TRACE \
>                  --interface udp:172.29.0.40/9978/5 \
>                  --interface udp:cbaprs.de/27235/5 \
>          | tee -a /var/aprsigi.log


Please do not use the legacy RELAY syntax.  Only use WIDE and maybe 
TRACE.  I'm not very familiar with aprsdigi but have you seen Aprx?


> Maybe it has to do with the axlisten running in the bg. If Im right it
> opens the interfaces in promisquous mode, maybe that blocks nrattach.

That's possible but that would be a bug in my book.


> 4.1.12+ raspberry pi, raspbian
> ii  ax25-apps                             0.0.8-rc2+cvs20120204-2 armhf        AX.25 ham radio applications
> ii  ax25-node                             0.3.2-7.4 armhf        Amateur Packet Radio Node program
> ii  ax25-tools                            0.0.10-rc2+cvs20120204-3 armhf        tools for AX.25 interface configuration
> ii  ax25-xtools                           0.0.10-rc2+cvs20120204-3 armhf        tools for AX.25 interface configuration -- X11-based
> ii  libax25                               0.0.12-rc2+cvs20120204-2 armhf        ax25 library for hamradio applications
> ii  libax25-dev                           0.0.12-rc2+cvs20120204-2 armhf        ax25 library development files

Yeah.. that's OLD code (2012).  If you want to run the Official AX.25 
tools (not always the most current btw), I recommend you use the most 
current code in Git - http://www.linux-ax25.org/wiki/GIT

More recommended, try building VE7FET's version of the tools: 
https://github.com/ve7fet/linuxax25


> The one included in debian.

Not recommended (see above) as you are missing some key fixes 
(especially if you're going to be doing AMPR / IPIP net stuff)

--David
