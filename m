From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] scc fix for 2.6.0
Date: Tue, 30 Dec 2003 19:41:21 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031230194121.E160@jeroen.pe1rxq.ampr.org>
References: <20031225195233.C3614@jeroen.pe1rxq.ampr.org> <20031227040522.GA7123@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20031227040522.GA7123@linux-mips.org>; from ralf@linux-mips.org on Sat, Dec 27, 2003 at 05:05:23 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, linux-hams@vger.kernel.org, jgarzik@pobox.com

On 2003.12.27 05:05:23 +0100 Ralf Baechle DO1GRB wrote:
> On Thu, Dec 25, 2003 at 07:52:33PM +0100, Jeroen Vreeken wrote:
> 
> > This is a fix for the scc driver in 2.6.0
> > It was calling register_netdev from within a ioctl and thus holding
> > rtnl_lock()
> > It now uses register_netdevice and calls rtnl_lock() itself if outside
> the
> > ioctl.
> 
> Somehow the whole device registration in that driver looks suspect.
> Registering from the driver's module_init() method is fine - but doing so
> from ioctl looks more it's some kind of ancient workaround or so?

At module init it only registers scc0.
sccinit later uses ioctls on this device to tell the driver how many chips
there really are, what kind of boards they are on, what crystal they have
and what addresses they use for the various registers.
At that time the ioctl will generate additional scc network devices if
necessary.
To my knowledge the only way to do this otherwise is to generate some kind
of scc specific /proc device... Which would be even more ugly.

The way scc works now has been like that since altleast the 2.0 kernels and
I never heard anybody come up with a better way.

Jeroen

