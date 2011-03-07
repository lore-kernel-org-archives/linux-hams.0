From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Sun, 6 Mar 2011 22:22:33 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=15OJnGO/0255J4yiMf6P+RRKIZOTVyhD2MLUbOM7cbE=;
        b=l+IWuqwCka8Gb6oK5J6OUWnd2xYvIdARCoaNwWTSLh7qoGBUu1OoF8eYeSSHdZkg7i
         5BxsmyDP9mO5L4dyvWegfiCfHFjGM2r3c02kr48jHJisKQMhftWSsx2KClBbH3QtPRL8
         xTjJoqRWrvJAiXjZniAoTIrxEJQM0PYGvo/dQ=
In-Reply-To: <4D73F262.6000703@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: "Curt, WE7U" <curt.we7u@gmail.com>

On Mon, 7 Mar 2011, Ray Wells wrote:

> I did find this on an yam old mailing list ...
>
> *"Other problem f3kt cannot use yamser with a irq superior has 4."
>
> *http://sharon.esrac.ele.tue.nl/pub/packet/yam/guestbook.htm
> *
> *Jean-Paul, F6FBB recently appeared on the FBB mailing list; maybe he can 
> shed some light.

Roger.  I sent him similar messages and they didn't bounce (yet), so he may yet answer.  I'm not sure what f3kt is.

I tweaked yam.c in two places to allow IRQ's up to 99, then compiled and used the new driver.  Doing this:
---------------------------------------------------------------------
     /sbin/modprobe -a yam
     /bin/setserial /dev/ttyS5 uart none
     /usr/sbin/yamcfg yam1 io 0xd880 irq 17 pers 128 txd 150 bitrate 9600 baudrate 9600
     /sbin/ifconfig yam1 mtu 256 hw ax25 WE7U-5
     /sbin/ifconfig yam1 44.24.102.128 netmask 255.255.255.0
     #/sbin/ifconfig yam1 up
---------------------------------------------------------------------

I now get this:
---------------------------------------------------------------------
     # ./yam.up

     /usr/sbin/yamcfg: Version 0.1 (C) 1998 by Jean-Paul ROUBELAT - F6FBB

     Device    : yam1
     iobase    :*d880
     bitrate   :*9600 (bps)
     irq       :*17
     baudrate  :*9600 (bps)
     fulldup   : off
     txdelay   :*150 (ms)
     txtail    : 10  (ms)
     slottime  : 100 (ms)
     persist   :*128

     SIOCSIFFLAGS: No such device or address
---------------------------------------------------------------------

So...  I'm one step closer.  It has accepted IRQ 17 but has trouble with setting IP address and netmask.

Again, I'm able to configure _one_ YAM modem on a laptop just fine, but it's this four-port PCI card in the desktop that I need to get going.  Once I get one YAM running I'll want to configure a second.

Ideas?

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS:  Where it's at!        http://www.xastir.org
