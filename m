From: Bernard F6BVP <f6bvp@free.fr>
Subject: Re: instant oops with AF_ROSE
Date: Sat, 09 Jul 2011 17:05:09 +0200
Message-ID: <4E186E25.5080200@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: wchast@gmail.com, davem@davemloft.net
Cc: linux-hams@vger.kernel.org

Hi,

What we do with ROSE nodes is to create a network allowing AX25 frames 
routing based on destination address. However, basically, ROSE frames
are still AX.25 standard frames that can be sent over packet radio.
In order to relay rose frames through Internet, applications like 
ax25ipd encapsulates rose inside of IP or UDP frames.

I agree that rose module is still unfriendly and will crash linux kernel 
on some occasions.
For example, after creating rose socket and populating rose routing 
table, removing rose module is not possible.

There is either a kernel crash or a looping message

kernel:unregister_netdevice: waiting for rose0 to become free. Usage 
count = 6

where count can be any number without any relation to actual usage
and remaining the same, preventing Linux to shutdown.

I noticed that there are no refcount entries in rose node or rose neigh
structures. This may be related ?


Bernard, f6bvp



Chuck Hast wrote :

It has been a while, and we were (still are I just am not active)  using 
FPAC
we have run a lot of IP through it, and never seemed to have a issue, but
perhaps this is not quite in that area.

I  am sure Bernard will see this and pitch in with more info. I am
just trying to
figure out if we are taking two different pieces here.

Here in FL I have ran both NetRom and IP over ROSE through FPAC boxes
with no issues that I can remember. FPAC is a wrapper around the rose piece.
We probably have people still doing IP inside ROSE through FPAC boxes around
the state, not sure who or where, but it would not be a surprise to me 
because
some use SMTP between their BBS devices.


Bernard, any comments?
