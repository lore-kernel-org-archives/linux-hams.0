From: "Steve Fraser" <sfraser@sierra.apana.org.au>
Subject: Re: Packet Problem
Date: Tue, 16 Sep 2003 11:11:34 +0930
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <005a01c37bf3$aa325300$03590cca@apana.org.au>
References: <20030916012317.GA9420@leo.tneu.visi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, Tim Neu <tim@tneu.visi.com>

Hi Tim, etc

> I have a VERY bizzare problem on Linux with AX.25.  ......
(details omitted)
> I'm stumped.  It _should_ be working!  Any ideas?   It's driving me
> crazy.
>
Well we cant allow crazy people on the list, so I'll have a go.

I'd check the baud rate to the TNC (axports or command line setting) - make
sure it matches what mincom says.

I'd also check /proc/interrupts and proc/ioports to make sure that the IRQ's
arent being grabbed by something else.

Are you using modules - what does lsmod say?

Any error messages from kissattach (or elsewhere)?

The "listen" command doesnt necessarily tell you what the kernel drivers are
seeing, so take it with a grain of salt.

What does ifconfig show for the AX25 ports?

HTH

Steve



