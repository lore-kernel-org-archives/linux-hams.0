From: Bob Nielsen <nielsen@oz.net>
Subject: Re: frame buffer cards....
Date: Mon, 23 Aug 2004 16:14:52 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040823231452.GA9450@office.n7xy.net>
References: <620A0B98-F54E-11D8-B460-000A95DB9E94@pocketdvm.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <620A0B98-F54E-11D8-B460-000A95DB9E94@pocketdvm.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux HAMs <linux-hams@vger.kernel.org>

On Mon, Aug 23, 2004 at 05:50:00PM -0400, Mark Acierno wrote:
> could someone point me to  a good resource for frame-buffer cards. 
> specifically I am an trying to determine the capacities of my 
> Ultrasparc creator (stock video card).

The Framebuffer-HOWTO <http://www.tldp.org/Framebuffer-HOWTO.html>

> 
> Also, once installed is there an easy way to change the video card 
> information when I installed Debian? I believe I have it set 
> incorrectly

dpkg-reconfigure xserver-xfree86 (or whatever package is appropriate 
for Sparc).

73, Bob N7XY
