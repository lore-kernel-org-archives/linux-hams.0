From: "Gunnar Widell (ESE)" <Gunnar.Widell@ese.ericsson.se>
Subject: RE: ax25/baycom/kernel(?) problem.
Date: Tue, 25 Mar 2003 08:34:59 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1F55F6582266314A85A55F6241509B670395F455@Esealnt863.al.sw.ericsson.se>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> Something like this-
> <0>Kernel panic: Aiee, killing interupt handler!
> In interrupt handler - not syncing

Yes, this is what I get.
At the last stop last nigth it happened when I did:

ifconfig bcsf0 down

So, why are some 2.4.19 or 2.4.20 kernels working fine?
Maybe I have too much junk compiled into it...

73 de Gus, SM3SGP
