From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Route from the Internet to the Ham-Net 44.x.x.x.
Date: Sat, 24 Jan 2004 18:26:24 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040124182624.A261@jeroen.pe1rxq.ampr.org>
References: <00a701c3e26f$1348ef20$c586e195@dj8qz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <00a701c3e26f$1348ef20$c586e195@dj8qz>; from dj8qz@call2surf.net on Sat, Jan 24, 2004 at 12:40:59 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Landherr <dj8qz@call2surf.net>
Cc: linux-hams@vger.kernel.org

On 2004.01.24 12:40:59 +0100 Heinz Landherr wrote:
> Hi...
> 
> I want to route from the Internet to the Ham-Net 44.x.x.x.
> But here is no router to realize this.
> 
> I'm using Linux-Redhat 7.1 with the ax25 utils.
> 
> My IP is 44.130.56.117 <dj8qz.ampr.org>
> 
> What must I do ?

What exactly do you want to do?
Do you want your system (44.130.56.117) to be accessable from the internet
while it is connected to some local radio network?

I just did a traceroute on it and it stops at 141.75.24.78.
Which resolves to db0fhn.efi.fh-neurnberg.de
I am asuming that this is somewhere near you.

There are several things you have to take care of:
- All systems between db0fhn and you must have routes set in such way that
they route to both you and the internet.
- Check if it is legal to do so in your country. HAM radio connections to
non HAMS (i.e. the internet) are not allowed everywhere.

Jeroen

