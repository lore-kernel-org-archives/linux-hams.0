From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: FlexNet connect
Date: Mon, 01 Mar 2004 22:30:26 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1078173025.1255.94.camel@oh2bns.ampr.org>
References: <20040229224718.GA15835@strauss.udel.edu>
	 <20040301201626.GA9714@strauss.udel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040301201626.GA9714@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Mon, 2004-03-01 at 22:16, Mike Markowski wrote:

> With thanks to Dave Platt, this is now fixed!  It turns out
> that I needed to choose the half-duplex option in soundmodemconfig.
> And of course I had tried just about everything under the sun
> *except* that.  Hopefully this will save a future newcomer to packet
> the effort of tracking it down.

Do you mean setting the Audio IO "half duplex" option on
or setting the Channel Access "full duplex" option off?

The former should not be used unless the sound driver does not
work reliably with it off. Setting it on can cause additional
latency in T/R switching and thus make life miserable for 
everyone on the channel.

The latter should be obvious (and also default to off).

-- 
Tomi Manninen / OH2BNS / KP20ME04

