From: Stephane Fillod <f8cfe@free.fr>
Subject: Re: gMFSK/hamlib/parport
Date: Wed, 18 Feb 2004 20:42:50 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040218194250.GL24918@charybde.local>
References: <20040218152745.GD16991@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040218152745.GD16991@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux HAMs <Linux-hams@vger.kernel.org>

On Wed, Feb 18, 2004, Mike Markowski wrote:
> A couple questions about the excellent gMFSK 0.6beta2:
> 
> 	Feature request:
> 	- Are there any patches that allow gMFSK to use
> 	  a parport for PTT?  If not, I'll be glad to look into
> 	  possibly re-using the parport code from soundmodem-0.7.

	FYI, Hamlib can also control PTT through the parport.

> 	Bug report (but maybe in hamlib):
> 	- I'm using an ICOM 706 MkIIg with hamlib on ttyS0 and
> 	  PTT to "none" in gMFSK just for the sake of seeing how
> 	  gMFSK uses hamlib.  When I rotate the rig's tuning knob,
> 	  gMFSK works for a bit nicely updating the spectrum freqs,
> 	  but then I get a "Protocol error" and hamlib is disabled.

	Traces would be interesting in this case.
	Latest Hamlib version 1.2.0 has retry support for the icom
	backend. This is much useful since the CI-V is a half-duplex bus.


Have fun,

Stephane - F8CFE
