From: James Cutler <jwc@stanford.edu>
Subject: Re: Baypac and kernel crashes
Date: Wed, 24 Apr 2002 17:54:52 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.GSO.4.44.0204241748560.7938-100000@rescomp.Stanford.EDU>
References: <20020423080237.A213@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020423080237.A213@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org


Is there anything special that needs to be done to configure for the
2.4.18 kernel?  I'm using the following commands to configure it and it
doesn't seem to be doing the trick (though they work under 2.4.17)

insmod parport
insmod parport_pc io=0x378 irq=7
modprobe baycom_par mode="picpar" iobase=0x378
sethdlc -i bcp0 -p mode "picpar" io 0x378
axparms -setcall bcp0 kf6rfx-1
ifconfig bcp0 192.168.2.2 up



On Tue, 23 Apr 2002, Jeroen Vreeken wrote:

> On 2002.04.23 06:04:32 +0200 James Cutler wrote:
> > We're having some problems using a BayPac 9600 with Linux 2.4.17.
> >
> > On one machine it works just fine until we start X.  As soon as we
> > start X, the machine will crash as soon as we send an AX.25 packet
> > (we were testing with "beacon").  The only way to recover from the
> > crash is to power cycle or press the reset button.  This is
> > repeatable.  We beacon, we work, we start X, we beacon, we crash.
> > It does output the packet before it crashes.
> >
> > On a second machine that doesn't (can't) run X, we've noticed a
> > similar crash.  It's a small embedded 486 (the Prometheus).  After
> > several beacons, from 5-20, it will crash in the same hard manner.
> > Only a power cycle will fix it.
> >
> > Has anyone else seen similar behavior?  Any ideas?
>
> Every 2.4.x kernel up to 2.4.18 has this problem, it should be fixed now...
> It was a problem with ax25 not using sock_orphan()
>
> Jeroen
>
>
>

