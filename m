From: Mike Markowski <mm@UDel.Edu>
Subject: Re: FlexNet connect
Date: Mon, 1 Mar 2004 15:16:26 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040301201626.GA9714@strauss.udel.edu>
References: <20040229224718.GA15835@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040229224718.GA15835@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

With thanks to Dave Platt, this is now fixed!  It turns out
that I needed to choose the half-duplex option in soundmodemconfig.
And of course I had tried just about everything under the sun
*except* that.  Hopefully this will save a future newcomer to packet
the effort of tracking it down.

	Mike  AB3AP

On Sun 29-Feb-04 at 1747 EST, Mike Markowski wrote:
> [...] There are several FlexNet nodes near me and I can't connect
> to any.  I type, for example, "call radio W3EOC-2" and see
> soundmodem send out the SABM+.  Immediately after, I hear a
> long packet returned by the FlexNet node but soundmodem
> prints nothing.  [...]
> 
> 	Thanks,
> 	Mike  AB3AP
