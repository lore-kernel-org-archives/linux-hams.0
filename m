From: Rodolfo Brasnarof <rbrasnarof@gmail.com>
Subject: Re: question soundmodem again...
Date: Tue, 1 Mar 2005 12:56:33 -0300
Message-ID: <20050301125633.4e01a624.rbrasnarof@gmail.com>
References: <20050218133810.89878.qmail@web51002.mail.yahoo.com>
	<20050218124436.5377e39d.rodob@datafull.com>
	<200502192033.25488.g_chavasse@onetel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200502192033.25488.g_chavasse@onetel.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: g_chavasse@onetel.com

On Sat, 19 Feb 2005 20:33:25 +0000
Gervase Chavasse wrote:

> On Friday 18 February 2005 15:44, Rodolfo Brasnarof  wrote:
> 
> > It is possible to have two soundcards working on
> > the same computer, and even more than two. I have two on my system,
> > one for audio applications, system sound, etc, and the other for
> > packet operation.
> I should be interested to know how?  I have a basic sound card built
> in to the motherboard, which I should like to use for normal operating
> system and other sounds, and a separate soundcard which I use for
> radio data modes.  When I installed the separate sound card it muted
> the motherboard.  I see nothing in the BIOS to reactivate the latter. 
> Any advice would be much appreciated.

Perhaps your motherboard automatically disables the onboard sound chip.
Try to find a setting in the setup utility, or a jumper. Perhaps a
setting of 'auto' means that, and you can set it always enabled too.

Or you can add another card. I have no onboard sound, and 1 isa no-pnp
and 1 pci card. But I've seen onboard cards working together with
isa-pnp or pci cards.

Good luck.
