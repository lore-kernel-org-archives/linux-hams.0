From: Christof Bodner <oe8bck@gmx.net>
Subject: Re: Ubuntu 8.10 and AX25
Date: Mon, 06 Oct 2008 19:53:32 +0200
Message-ID: <1223315612.6823.13.camel@rosi>
References: <1223228054.9867.13.camel@rosi>  <20081005180939.GA22423@reid1>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-6CBmiqudacbrUmtV5A4R"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20081005180939.GA22423@reid1>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: don <don_reid@comcast.net>
Cc: linux-hams@vger.kernel.org


--=-6CBmiqudacbrUmtV5A4R
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi!

Thanks for your answer! IIRC, it worked for me in Ubuntu 7.10. But I
would like to see it working again. 

dpkg -l | grep alsa
ii  alsa-base                                 1.0.17.dfsg-2ubuntu1
ALSA driver configuration files
ii  alsa-utils                                1.0.17-0ubuntu2
ALSA utilities
ii  gstreamer0.10-alsa                        0.10.20-1
GStreamer plugin for ALSA
ii  libesd-alsa0                              0.2.40-0ubuntu1
Enlightened Sound Daemon (ALSA) - Shared libr
ii  libpt-1.10.10-plugins-alsa                1.10.10-2ubuntu2
Portable Windows Library Audio Plugin for the
ii  libsdl1.2debian-alsa                      1.2.13-2ubuntu1
Simple DirectMedia Layer (with X11 and ALSA o

I also attached my /etc/ax25/soundmodem.conf. There you can see that I
use mkiss at /dev/dsp2, as I do not exactly know te difference to kiss
(besides I have to use kissattach in the latter). I also tried to use
soundmodem -R -M. It worls a little bit longer, but not very much.

73 de oe8bck

Am Sonntag, den 05.10.2008, 11:09 -0700 schrieb don:
> On Sun, Oct 05, 2008 at 07:34:14PM +0200, Christof Bodner wrote:
> > Hi!
> > 
> > I have a SignaLink USB device and it's working fine, except AX25 in
> > Linux (mhm, so it's not really working fine, isn't it?)
> 
> I too have been having problems with Ubuntu 8.04, while 7.10 worked.
> 
> > ...
> > Tx: fm OE8BCK-1 to QST-0 UI  pid=CC
> > ...
> > ---
> > 
> > Then a lot of Tx frames are sent (would be sent if I would switch in
> > TX) 
> > 
> > Does anybody know hoe to turn it off at Ubuntu 8.10? 
> 
> Some of these can be turned off in /etc/avahi/avahi-daemon.conf
> I will attach my file.
> 
> With that, I stll get some messages about gpgkeys which I have
> not figured out yet.
> 
> 
> > And then, exactly ONE RX frame is captured, e.g.
> > 
> > Rx: fm OE1UHA-9 to TX0R18-0 via OE1XQR-0,WIDE2-0 UIv pid=F0
> > `,.Xmz3>/ON THE ROAD
> 
> My other problem is not getting any Rx (under 8.04).
> 
> Can you tell me what alsa packages you have?
> I ran "dpkg -l | grep alsa".  
> 
-- 
             (0-0)
---------oOO--(_)--OOo-----------------------------------------------
 Christof Bodner <oe8bck@gmx.net>
   Linux - Life is too short for reboots
         - First they ignore you. Then they laugh at you. Then they
           fight you(*). Then you win. -- Ghandi
---------------------------------------------------------------------
email: mailto:oe8bck@gmx.net
---------------------------------------------------------------------
GnuPG public key: 0xB15DA60F (http://wwwkeys.eu.pgp.net)
Fingerprint 5222 4DEA 773A 60B3 22F9  D244 15EF 6645 B15D A60F
---------------------------------------------------------------------


--=-6CBmiqudacbrUmtV5A4R
Content-Disposition: attachment; filename="soundmodem.conf"
Content-Type: application/xml; name="soundmodem.conf"
Content-Transfer-Encoding: 7bit

<?xml version="1.0"?>
<modem><configuration name="radio"><chaccess txdelay="150" slottime="100" ppersist="40" fulldup="0" txtail="10"/><audio type="soundcard" device="/dev/dsp2" halfdup="0" capturechannelmode="Mono"/><ptt file="none"/><channel name="Channel 0"><mod mode="afsk" bps="1200" f0="1200" f1="2200" diffenc="1"/><demod mode="afsk" bps="1200" f0="1200" f1="2200" diffdec="1"/><pkt mode="KISS" ifname="ax0" hwaddr="OE8BCK-1" ip="10.0.0.1" netmask="255.255.255.0" broadcast="10.0.0.255" file="/dev/soundmodem0" unlink="1"/></channel></configuration></modem>

--=-6CBmiqudacbrUmtV5A4R--

