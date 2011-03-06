From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Sun, 6 Mar 2011 12:28:04 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103061227330.31123@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=eIxJrQWVbnbj4y6v8LHinrSzVZMEm9z9Io+3GO84mtM=;
        b=NFv62GXEj5hEN244ybPHS44KnxheG9CugcRtFQRMdianYYXplOqymxYYthe90QCB19
         +/PDP1q54UoMdOT2bb3JuEWY2AAApIpKoN0SxZjWMOCWXfOTroSV9ALgcy/8LPoyj3tt
         ditj4vE2Rtz9TSphLJoQD8Q3E5Il4tazHXCWQ=
In-Reply-To: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <Curt.WE7U@gmail.com>
Cc: linux-hams@vger.kernel.org

On Sun, 6 Mar 2011, Curt, WE7U wrote:

> Desktop config, doesn't work:
>
>    modprobe -a yam
>    setserial /dev/ttyS7 uart none
>    yamcfg yam0 io 0xd880 irq 17 pers 128 txd 150 bitrate 9600 baudrate 9600
>    /sbin/ifconfig yam0 44.24.102.128 netmask 255.255.255.0 hw

Finally got the kernel sources and I see this:

         if (!dev->base_addr || dev->base_addr > 0x1000 - YAM_EXTENT ||
                 dev->irq < 2 || dev->irq > 15) {
                 return -ENXIO;
         }

Which means any IRQ above 15 is going to be rejected by the YAM driver.  I'm recompiling the YAM module now with a "> 99" tweak to
see if I can get one or two YAM's working with the 4-port Startech card.  I'll post my results.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS Wiki:  http://info.aprs.net/
