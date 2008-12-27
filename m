From: Dave Platt <dplatt@radagast.org>
Subject: Re: soundmodem patch for ALSA compatibility issues
Date: Fri, 26 Dec 2008 16:06:14 -0800
Message-ID: <49557176.6010304@radagast.org>
References: <49544E37.9000506@radagast.org> <1230311229.29241.222.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1230311229.29241.222.camel@localhost.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


> Thanks for the patch! I've applied it to my current tree, and put the
> result here:
> http://www.baycom.org/~tom/ham/soundmodem/soundmodem-0.11.tar.gz
> 
> It did not apply cleanly, though, I manually fixed it up, maybe you can
> check I did it correctly.

It looks correct to me, it builds OK, and it seems to be working fine
with my SignaLinK USB.  I just logged into my city ARES BBS and checked
for mail - the connection stayed up and no errors were seen.  I think
your manual fixup was correct.

One thing I've noticed (with this new version and all versions of
0.10 I tried) - when I first start up the soundmodem, there appears
to be a long latency before it will send the first packet for
a connection - somewhere around 30 seconds.  This occurs even if the
channel is entirely idle.  However, if an inbound packet is received
successfully, the first outbound packet will be sent within a second
or so thereafter.

Feels to me as if the channel-inactivity timer isn't being initialized
successfully, but I haven't yet dug into the code to figure out why.


