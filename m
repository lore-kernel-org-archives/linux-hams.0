From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] node and libax25io nonblocking
Date: Fri, 21 Feb 2003 16:53:37 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030221165337.A3524@jeroen.pe1rxq.ampr.org>
References: <20030218233527.K507@jeroen.pe1rxq.ampr.org> <Pine.LNX.4.44.0302190033590.14956-200000@oh2bns.ampr.org> <20030221103751.GA16223@enc.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030221103751.GA16223@enc.com.au>; from csmall@enc.com.au on Fri, Feb 21, 2003 at 11:37:51 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Craig Small <csmall@enc.com.au>
Cc: Linux Hams <linux-hams@vger.kernel.org>, Tomi Manninen <tpm@prkele.tky.hut.fi>

On 2003.02.21 11:37:51 +0100 Craig Small wrote:

> Great,  I've added both patches to the CVS.  You mention some programs
> will break, what programs are they?
> 
> I'd like to release this library just with this patch but those programs
> need fixing first, or at least the maintainers to be ready.

As far as I know only a few node programs use it.
Fore node a patch is in the making so that won't be a show stopper.
I believe there are a few node forks (flexnode, awznode) that will probably
need fixing, but I think they can use the patch for node once its out.

	Jeroen

