From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: callsign limit
Date: Wed, 31 May 2006 16:02:03 +0300
Message-ID: <20060531130203.GH27502@mea-ext.zmailer.org>
References: <200605310927.56706.vk3heg@iinet.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200605310927.56706.vk3heg@iinet.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stephen <vk3heg@iinet.net.au>
Cc: linux-hams@vger.kernel.org

On Wed, May 31, 2006 at 09:27:56AM +0000, stephen wrote:
> Hello fellow sysop's 
> 
> I have a small problem with my Linux fbb bbs (FBB-7.04j) and four letter 
> callsigns. Ie: vk3fdcs (vk?f??? are the new foundation call holders here in 
> Australia)
> 
> When I enter in vk3fdcs at the bbs prompt I get this error: 
> 
> VK3HEG BBS>eu vk3fdcs 
> *** Error : The callsign is missing. 
> 
> The windows remote linux program will let me add the vk3fdcs callsign, but 
> when listing the users the ending 's' is cut off/missing. 
> 
> Is it posable to set call sign lengths in fbb or is this going to require a 
> re-compile/editing of the source code?

This needs radical rework of AX.25 protocol - it supports only 6 characters
in callsign.

Consider also callsigns:

   DR2006N
   DQ2006B

there are a bunch of similar callsigns in Germany.  I know couple "long"
ones in Finland as well.

 

I have at times considered of what would be decent new way to do things
so that these big callsigns are also supported, and worst (or all) AX.25
shortcomings are fixed at the same time.

Surprisingly(?) I did end up revising link-level protocol entirely and
using IPv6 IP frames for "mac" level on radio link with callsign being
encoded in IPv6 address' lower 64 bits as 6-bit character code...
Something like:

  1 byte of local address type tag
  6 bytes of 6-bit encoded compacted callsign
  1 byte extra (SSID + extra ?)

For the CONS and CLNS services I would use TCPv6 and UDPv6.
(And suddenly you need no new protocol stack in your machine - besides
of IPv6 stack, which is very soon omnipresent.)

Of course it is completely incompatible with existing AX.25 ...
I have also considered throwing away existing 1200 bps AFSK radio system
and replacing it with something smarter - like PI/4-DQPSK modulated FECed
(Reed-Solomon/Turbocode/LDPC/something) and interleaved thingamajing.

Unfortunately we have _huge_ deployed base of inferior technology...
(That PI/4-DQPSK does not work with your average 'completely in compression'
FM radio transmitter/limittered receiver, but with slight 2 dB backoff
things do improve a lot..)

> Running redhat9 with updates, 2.4.31 kernel, ax25-apps 0.0.6, ax25-tools 
> 0.0.8, libax25-0.0.11.
> -- 
> Stephen - vk3heg

  /Matti Aarnio - OH2MQK
