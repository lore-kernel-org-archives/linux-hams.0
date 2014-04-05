From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: AX25IPD /tmp/unix98 invalid  export Variable AX25:
Date: Sat, 5 Apr 2014 08:44:45 +0100
Message-ID: <exrW6wAtR7PTFwf7@skywaves.demon.co.uk>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <024rua-e6d.ln1@atomos.longlandclan.yi.org>
 <IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
 <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <dZbWwYCt4TPTFw8R@skywaves.demon.co.uk>
 <50a41b-n9s.ln1@atomos.longlandclan.yi.org>
 <000c01cf508f$c30824f0$49186ed0$@ro>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000c01cf508f$c30824f0$49186ed0$@ro>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Marius Petrescu <marius@yo2loj.ro>
Cc: linux-hams@vger.kernel.org

Hello Marius and Stuart

thanks for your feedback.

Marius I like the look of your socat examples
anything that makes static and predictable configuration is good.

And easy to restart the interface automatically with the same parameters 
if the ax25ipd process falls over.. As they do..

I would like to progress this off list as I have 6 single port tncs and 
run one axip and five axudp links

regards
Paul g4apl/gb7cip

In message <000c01cf508f$c30824f0$49186ed0$@ro>, Marius Petrescu 
<marius@yo2loj.ro> writes
>I recommend the use of socat to have predicatable pty pairs.
>Just an example for 4 ax25 ports:
>
># for mkiss dual port setup
>/usr/bin/socat pty,link=/var/ax25/axp1,raw,echo=0
>pty,link=/var/ax25/kp1,raw,echo=0 &
>/usr/bin/socat pty,link=/var/ax25/axp2,raw,echo=0
>pty,link=/var/ax25/kp2,raw,echo=0 &
>
># axip/axudp
>/usr/bin/socat pty,link=/var/ax25/axip,raw,echo=0
>pty,link=/var/ax25/kip,raw,echo=0 &

>/usr/bin/socat pty,link=/var/ax25/axudp,raw,echo=0
>pty,link=/var/ax25/kudp,raw,echo=0 &
>
>sleep 1
>
># dual port
>/usr/sbin/mkiss -s 9600 /dev/ttyS1 /var/ax25/axp1 /var/ax25/axp2
>/usr/sbin/kissattach /var/ax25/kp1 2m 44.182.21.1
>/usr/sbin/kissattach /var/ax25/kp2 70cm 44.182.21.1
>/usr/sbin/kissattach /var/ax25/kip axip 44.182.21.1
>/usr/sbin/kissattach /var/ax25/kudp axudp 44.182.21.1
>
>
>73s de Marius, YO2LOJ
>
>
>On Thu, 03 Apr 2014 11:55:41 +0100, Paul Lewis wrote:
>
>> Hi all..
>>
>> AX25IPD /tmp/unix98 Invalid Variable
>>
>> I run six ax25ipd interfaces using the old legacy Pty pairs for the past
>> 15+ plus years. Spreading the load, in case an interface fails. ( run
>> automated checks to bring the interface up on old system.
>> Not sure how this can be done with unix98 as need the same dev/tty
>> address statically assigned)
>
>
>
>--
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
paul@skywaves.demon.co.uk
