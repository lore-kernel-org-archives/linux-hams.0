From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: netrom
Date: Sun, 14 Apr 2002 23:06:44 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020414230644.A1802@pull.privacy.nb.ca>
References: <200204140557.g3E5vZX11801@msv02-kent-syd.comindico.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200204140557.g3E5vZX11801@msv02-kent-syd.comindico.com.au>; from vk3bvp@qsl.net on Sun, Apr 14, 2002 at 03:58:02PM +1000
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shane Deering <vk3bvp@qsl.net>
Cc: linux-hams@vger.kernel.org

On Sun, Apr 14, 2002 at 03:58:02PM +1000, Shane Deering wrote:
> 
> The kissatach commands and responses have scrolled off my xterm but from 
> history I used these to create ax0 and ax1 -
> [root@vk3bvp-6 root]# /usr/sbin/kissattach /dev/ttyS0 vhf 44.135.96.242
> [root@vk3bvp-6 root]# /usr/sbin/kissattach /dev/ttyS1 win 44.135.96.241
> 
> Don't worry about the IP addresses , they are just for testing.

Please do not randomly used a 44. address without allocation.
44.135.96/24  is Ottawa, Ontario, Canada (ve3), so I
suspect that you do not have it allocated to you (having a vk
callsign I assume you are not operating in Canada).

Use a non-routable Private IP (RFC 1918) such as 10.0.0.1.

Thank you.
