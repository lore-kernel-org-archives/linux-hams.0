From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Sun Sparc questions....
Date: Sun, 25 Jan 2004 22:37:25 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040125223725.I713@jeroen.pe1rxq.ampr.org>
References: <5A0E3EAA-4F77-11D8-AFA8-000A95DB9E94@pocketdvm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5A0E3EAA-4F77-11D8-AFA8-000A95DB9E94@pocketdvm.com>; from acierno@pocketdvm.com on Sun, Jan 25, 2004 at 21:45:03 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Acierno <acierno@pocketdvm.com>
Cc: linux-hams@vger.kernel.org

On 2004.01.25 21:45:03 +0100 Mark Acierno wrote:
> I have two Suns that I have recently "acquired" one is a Sparc 20 the 
> other an ultrasparc 2 creator. I have gotten Debian linux up and 
> running on both but I have questions about using one (either) for 
> packet work.... after lurking here  for the past few weeks it seems as 
> though most users here have PCs running linux. Is anyone here familiar 
> with the Sparcstation??

I once made a quick hack to the scc driver to use it on the scc chip in a
sparc xterminal... I don't know about the sparc 20 but if it is a sun4m
architecture you probably could do the same.

As for the ultra 2 I don't know, my ultra 10 doesn't have an scc chip for
the serial port (atleast not that I know of) but it does have onboard
sound.
You might be able to use soundmodem on it.

Ofcourse both will probably just work fine if you use a tnc in kiss mode or
any of the tunneling protocols. (axip, bpq)

Jeroen

