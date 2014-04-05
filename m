From: "Marius Petrescu" <marius@yo2loj.ro>
Subject: RE: AX25IPD /tmp/unix98 invalid  export Variable AX25:
Date: Sat, 5 Apr 2014 08:27:39 +0300
Message-ID: <000c01cf508f$c30824f0$49186ed0$@ro>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>	<024rua-e6d.ln1@atomos.longlandclan.yi.org>	<IYGDg$AQECNTFw+e@skywaves.demon.co.uk>	<14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>	<14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>	<dZbWwYCt4TPTFw8R@skywaves.demon.co.uk> <50a41b-n9s.ln1@atomos.longlandclan.yi.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <50a41b-n9s.ln1@atomos.longlandclan.yi.org>
Content-Language: en-us
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I recommend the use of socat to have predicatable pty pairs.
Just an example for 4 ax25 ports:

# for mkiss dual port setup
/usr/bin/socat pty,link=/var/ax25/axp1,raw,echo=0 
pty,link=/var/ax25/kp1,raw,echo=0 &
/usr/bin/socat pty,link=/var/ax25/axp2,raw,echo=0 
pty,link=/var/ax25/kp2,raw,echo=0 &

# axip/axudp
/usr/bin/socat pty,link=/var/ax25/axip,raw,echo=0 
pty,link=/var/ax25/kip,raw,echo=0 &
/usr/bin/socat pty,link=/var/ax25/axudp,raw,echo=0 
pty,link=/var/ax25/kudp,raw,echo=0 &

sleep 1

# dual port
/usr/sbin/mkiss -s 9600 /dev/ttyS1 /var/ax25/axp1 /var/ax25/axp2
/usr/sbin/kissattach /var/ax25/kp1 2m 44.182.21.1
/usr/sbin/kissattach /var/ax25/kp2 70cm 44.182.21.1
/usr/sbin/kissattach /var/ax25/kip axip 44.182.21.1
/usr/sbin/kissattach /var/ax25/kudp axudp 44.182.21.1


73s de Marius, YO2LOJ


On Thu, 03 Apr 2014 11:55:41 +0100, Paul Lewis wrote:

> Hi all..
>
> AX25IPD /tmp/unix98 Invalid Variable
>
> I run six ax25ipd interfaces using the old legacy Pty pairs for the past
> 15+ plus years. Spreading the load, in case an interface fails. ( run
> automated checks to bring the interface up on old system.
> Not sure how this can be done with unix98 as need the same dev/tty
> address statically assigned)



