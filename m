From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Baypac and kernel crashes
Date: Tue, 23 Apr 2002 08:02:37 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020423080237.A213@jeroen.pe1rxq.ampr.org>
References: <Pine.GSO.4.44.0204222103400.21272-100000@rescomp.Stanford.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.44.0204222103400.21272-100000@rescomp.Stanford.EDU>; from jwc@stanford.edu on Tue, Apr 23, 2002 at 06:04:32 +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Cutler <jwc@stanford.edu>
Cc: linux-hams@vger.kernel.org

On 2002.04.23 06:04:32 +0200 James Cutler wrote:
> We're having some problems using a BayPac 9600 with Linux 2.4.17.
> 
> On one machine it works just fine until we start X.  As soon as we
> start X, the machine will crash as soon as we send an AX.25 packet
> (we were testing with "beacon").  The only way to recover from the
> crash is to power cycle or press the reset button.  This is
> repeatable.  We beacon, we work, we start X, we beacon, we crash.
> It does output the packet before it crashes.
> 
> On a second machine that doesn't (can't) run X, we've noticed a
> similar crash.  It's a small embedded 486 (the Prometheus).  After
> several beacons, from 5-20, it will crash in the same hard manner.
> Only a power cycle will fix it.
> 
> Has anyone else seen similar behavior?  Any ideas?

Every 2.4.x kernel up to 2.4.18 has this problem, it should be fixed now...
It was a problem with ax25 not using sock_orphan()

Jeroen


