From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: 6pack trying to resynch TNC message
Date: Wed, 17 Nov 2004 05:29:56 +0100
Message-ID: <20041117042956.GA1434@linux-mips.org>
References: <620c9057041116143746a5aa47@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620c9057041116143746a5aa47@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Hast <wchast@gmail.com>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Tue, Nov 16, 2004 at 02:37:46PM -0800, Chuck Hast wrote:

> I see this message if the TNC gets turned off or the RS-232 cable gets
> pulled. Even though all has been restored it is to no avail, it still sets
> there and sends the trying to resynch message. Is there a workaround
> or just keep the power on the TNC and make sure the Rs-232 does not
> get interrupted?
> 
> Seriously, 6pack is indeed a much better solution than KISS. I just ran
> into this problem when the TNC got powered down and back up,
> 
> I guess that the computer is trying to do what the message says but it
> is not working.
> 
> Any idea of what I can do to make sure that the tnc does get re-synched?

I've fixed the driver's excessive verbosity about resyncing in the latest
version of the 6pack driver which currently is waiting in -mm to be merged.
So unless catastrophes happen it's going to be in 2.6.10 or 2.6.11.

The patch shouldn't make a difference for your case but I'm going to take
a look at it once the latest patch is finally merged.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
