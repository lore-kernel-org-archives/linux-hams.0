From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Tue, 8 Mar 2011 08:06:52 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de> <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=p0lHIusUDv7DIZ8zyC662fZZIwo7uKCVE3Jflv+X3vM=;
        b=EMN2s/bPVdjJYPxfwpiFVdzK4w6cfNZSCQECuqml19MV3VEgLsDVduxnF1BYMzZTod
         33uwuyjkvwYZ0/dLzvvFUGYGZoMUvkGrKcKQilo1Jq3GcqscVAoqpv1cETOlgKMQLLAI
         3AABDLs9qmzEYm7FDkdlCCNYJ3oE/q2YZW7CA=
In-Reply-To: <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org


I got farther last night!  It helped that I could configure one on the laptop (with one _standard_ serial port) and see what the LED's were doing on the YAM, then try it on the desktop and notice the differences.

To recap:  I can make one YAM work on the laptop, but that's not the final destination.  I haven't gotten one to work on the desktop yet, but want to get two YAM's working there as well as a couple of other TNC's.

     Laptop                  Desktop
     ------                  -------
     OpenSuSE-11.3 32-bit    OpenSuSE-11.3 64-bit
     Qty 1 - 16550a          Qty 4 - 16550a
     I/O: 0x3f8              I/O: 0xdc00 (and others slightly below)
     irq 4                   irq 17 (shared)

At the point I do an "ifconfig up" on the laptop I see one LED go nuts on the YAM for a few seconds as the Xilinx chip is being loaded.  Last night I was finally able to see that on the desktop, but then the command errored out upon finishing the loading.  This is progress though as I've not seen the Xilinx get loaded via the desktop until last night.

I've been hacking on the "yam.c" code.  I've changed the high-range check for IRQ's to "< 99" (was "< 15") and removed the high-range check for the base address (was 0x1000 - extents).  Last night I rummaged through the code some more and noticed variables in "yam.h" that were defined as "unsigned int" but used in "yam.c" as "int".  By switching the I/O base address to "unsigned int" I finally got the LED blinking that shows the Xilinx is being loaded.

What I've learned so far:

*) The kernel driver hasn't been updated to handle IRQ's and I/O addresses which are commonplace with PCI serial cards.
*) Sign problems exist between the .h and the .c files.
*) There may be 64-bit issues as "int" and "unsigned int" shouldn't be used in portable code:  Should use UINT8, UINT16, UINT32, etc instead.

I believe I've fixed the first two but the third needs to be done yet.  The switch from "int" to "unsigned int" was just a first approximation but is not the correct fix for portability.

Anyone willing to help with portability tweaks to the code please jump in here!  I'll provide a patch if/when I get it working.

NOTE:  It would be worthwhile to look through some of the other "drivers/net/hamradio/" code for similar problems with other AX.25 drivers.  The Baycom driver most likely suffers from similar problems (the YAM driver was derived from it) unless it has had more use recently and therefore has had more recent fixes than the YAM driver.  If other drivers have not been touched since the ISA days, or even the pre-64-bit days, they will need some of the fixes applied as well.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
Babysitting your tracker:  http://info.aprs.net/index.php?title=ControlOperator
