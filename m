From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: ax25 kernel problem sometimes accur
Date: Sat, 7 Dec 2002 02:10:16 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021207021016.A15120@linux-mips.org>
References: <19399@9A0TCP> <Pine.LNX.4.44.0212041929490.7216-100000@gb7lgs.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212041929490.7216-100000@gb7lgs.co.uk>; from g0lgs@gb7lgs.co.uk on Wed, Dec 04, 2002 at 07:42:22PM +0000
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Cc: linux-hams@vger.kernel.org

On Wed, Dec 04, 2002 at 07:42:22PM +0000, Stewart Wilkinson wrote:

> I am aware of several UK stations that are having lockup problems with
> systems running 2.4.19 kernels (using at least 3 different Linux
> Distributions). At the moment I know of just one system running 2.4.19
> kernel that has been up for over 35 days.
> 
> The systems in question seem to run Ok for anything up to 12-14 days,
> until they stop. Sometimes they stop with a Kernel Panic (Flashing
> keyboard lamps), other times (at least in my case today) the system is
> just non-responsive either to external traffic (pings over LAN etc) or to
> Keyboard Input.
> 
> As far as we have determined to date the crashes all follow a pattern
> where AX25 / NETROM connections start to be refused and sometime
> there-after the system totally stops functioning.

As is the 2.4 AX.25 code is totally racy.  Basically it only has a chance
to survive if the user is nice ...

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
