From: folkert <folkert@vanheusden.com>
Subject: Re: [Linux-ham] netrom
Date: Sun, 10 Apr 2016 21:36:39 +0200
Message-ID: <20160410193639.GX25136@belle.intranet.vanheusden.com>
References: <20160401184009.GB25136@belle.intranet.vanheusden.com>
 <56FECDF1.5090701@trinnet.net>
 <20160401201200.GE25136@belle.intranet.vanheusden.com>
 <56FEE62F.40003@trinnet.net>
 <20160408094400.GS25136@belle.intranet.vanheusden.com>
 <5707C85B.7060806@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5707C85B.7060806@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org

> >Something odd happened: now it suddenly works!
> >What I did different is axportl instead of axport0.
> >But on the other system axport0 runs fine? Puzzling.
> 
> There are only two things I can think of that might cause this... an issue
> with the kernel or an issue with the ax25 apps/tools you installed.

My script is as below. If I remove the modprobe/nrattach and then do
that manually afterwards, then it does not work.

/usr/sbin/kissattach /dev/ttyAMA0 axportr 192.168.45.8
sleep 30
/usr/sbin/ax25d -l
/usr/sbin/ax25rtd -c /etc/ax25/ax25rtd.conf
/root/bin/start-ax25-tunnel.sh
/usr/sbin/beacon -l -t 15 axportu 'some text'
/usr/sbin/beacon -l -t 15 axportr 'some text'
#
/sbin/modprobe netrom
/usr/sbin/nrattach -i 192.168.32.1 -m 236 netrom
/usr/sbin/netromd -i -l -t 20
#
/usr/bin/screen -d -m -S 'axdigi (AX.25 digipeater)' /usr/local/sbin/axdigi
/usr/bin/screen -d -m -S 'aprsdigi' /root/bin/aprsdigi.sh
/usr/bin/nohup /usr/bin/axlisten -8 -t >> /home/folkert/ax25.log &
/usr/sbin/mheardd -l -n 1000
(sleep 60 ; /root/bin/axlisten_to_mqtt.sh) &
/usr/sbin/kissattach /dev/ttyUSB0 axportl 192.168.45.8
/usr/sbin/beacon -l -t 15 axportl 'some text'


/root/bin/aprsdigi.sh:
---------------------
/usr/sbin/aprsdigi --verbose \
                --kill_dupes \
                --kill_loops \
                --int ax25:FH1GOU-1:RELAY,WIDE,FOO,TRACE \
                --interface udp:172.29.0.40/9978/5 \
                --interface udp:cbaprs.de/27235/5 \
        | tee -a /var/aprsigi.log


Maybe it has to do with the axlisten running in the bg. If Im right it
opens the interfaces in promisquous mode, maybe that blocks nrattach.

I'll test that some other day.

> What distro version and kernel version are you running?

4.1.12+ raspberry pi, raspbian
ii  ax25-apps                             0.0.8-rc2+cvs20120204-2 armhf        AX.25 ham radio applications
ii  ax25-node                             0.3.2-7.4 armhf        Amateur Packet Radio Node program
ii  ax25-tools                            0.0.10-rc2+cvs20120204-3 armhf        tools for AX.25 interface configuration
ii  ax25-xtools                           0.0.10-rc2+cvs20120204-3 armhf        tools for AX.25 interface configuration -- X11-based
ii  libax25                               0.0.12-rc2+cvs20120204-2 armhf        ax25 library for hamradio applications
ii  libax25-dev                           0.0.12-rc2+cvs20120204-2 armhf        ax25 library development files

4.1.17+ dito
i  ax25-apps                   0.0.8-rc2+cvs20130510-4    armhf AX.25 ham radio applications
ii  ax25-node                   0.3.2-7.4                  armhf Amateur Packet Radio Node program
ii  ax25-tools                  0.0.10-rc2+cvs20120204-4   armhf tools for AX.25 interface configuration
ii  libax25                     0.0.12-rc2+cvs20120204-3   armhf ax25 library for hamradio applications
ii  libax25-dev                 0.0.12-rc2+cvs20120204-3   armhf ax25 library development files

4.1.6+ dito
ii  ax25-apps                             0.0.8-rc2+cvs20120204-2 armhf        AX.25 ham radio applications
ii  ax25-node                             0.3.2-7.4 armhf        Amateur Packet Radio Node program
ii  ax25-tools                            0.0.10-rc2+cvs20120204-3 armhf        tools for AX.25 interface configuration
ii  libax25                               0.0.12-rc2+cvs20120204-2 armhf        ax25 library for hamradio applications


> Are you using the Official AX.25 tools or VE7FET's version?

The one included in debian.

> Btw, I've been thinking about your LoRa project and that seems really pretty
> cool to me.  I think I'll have to give it a try!  Thanks for posting all
> that Arudino KISS code, etc.  I wonder how hard it would
> be to add some additional RF power to those units.

Thanks!



Folkert van Heusden

-- 
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
