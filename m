From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Mon, 7 Mar 2011 13:06:15 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103071251150.30587@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D75430C.10508@exemail.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=vTfAYLHK8d//lLKj5CQj2VKA0DS/jnncOX9KWqQp43U=;
        b=nPH48FtiFeFyjmWUqQLwQa2zBfs7JAOXRayLWIdqaa4y7nx3ly2OVJ101TChIOt2F/
         P63ruIBsvfUIHlVeK9me2Xzau2NJsQxTc+8PrleNJRlgfnSKxAfiAVbkJPsQ+eGmh8mE
         eKkx2f3C2WbYUoZTi/ceNp3hnhNcnGdamRwco=
In-Reply-To: <4D75430C.10508@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Ray Wells <vk2tv@exemail.com.au>
Cc: "Curt, WE7U" <curt.we7u@gmail.com>, linux-hams@vger.kernel.org

On Tue, 8 Mar 2011, Ray Wells wrote:

> Have you tried running KISS TNC's off the four port to prove it provides 
> working standard com ports?

Yes.  I'm running a TNC-X using the ax25 and mkiss modules, creating the AX.25 port called "aprs" that I'm feeding Xastir with.

I killed everything on that port and tried it with a YAM as well.  No change.


> It was a while back now and the memory is dim but I was getting strange 
> errors and performance with a very old Australian made four port ISA card 
> with shared IRQ. In my case I had to guess addresses due to lack of 
> documentation. From memory, acpi was a problem at one stage, wanting to grab 
> the IRQ that was set up as Legacy in BIOS for the four port.
>
> FWIW, here's my four port configd
>
>    /bin/setserial -v /dev/ttyS0 uart 16550A port 0x180 irq 3 fourport
>    /bin/setserial -v /dev/ttyS1 uart 16550A port 0x188 irq 3 fourport
>    /bin/setserial -v /dev/ttyS2 uart 16550A port 0x190 irq 3 fourport
>    /bin/setserial -v /dev/ttyS3 uart 16550A port 0x198 irq 3 fourport

setserial shows these are all 16550's and shows reasonable numbers, but the base addresses and IRQ's are much higher than you can have with an ISA card.  I've made tweaks to "yam.c" to compensate for the higher address and IRQ.  The IRQ change got me further towards getting things configured but I'm not quite there yet.  Perhaps the base address problem needs tweaks in other places besides yam.c to make it functional.

If I don't get them working soon I may build some G4XYW modems instead.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
Babysitting your tracker:  http://info.aprs.net/index.php?title=ControlOperator
