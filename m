From: Tomi Manninen <tomi.manninen@hut.fi>
Subject: Re: [PATCH] node and libax25io nonblocking
Date: Mon, 17 Feb 2003 23:21:54 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1045516914.3e5152727b071@webmail2.hut.fi>
References: <20030217215608.A801@jeroen.pe1rxq.ampr.org>
Reply-To: oh2bns@sral.fi
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030217215608.A801@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, csmall@small.dropbear.id.au

On Mon, 17 Feb 2003 21:56:08 +0100 Jeroen Vreeken <pe1rxq@amsat.org> wrote:

> I got a bit tired of waiting for a new node release....
> The attached patches are against libax25-0.0.10 and node-0.3.0.
> The libax25 patch is basicly the same I posted a while back with the
> buffer check added and a few changes to axio_puts(), axio_gets() and
> axio_getline().

Well, I'm a bit tired of things too...

Anyway, I did a fix to node a few weeks ago and I was going to send it
to you (jeroen) for testing. I don't have a setup to test it properly
here. I'll look at your fix and tell you what I think. Basically I don't
think libax25 should be touched, other than the bugs introduced in 0.0.10
need to be fixed (ie. go back to 0.0.9 behaviour).

-- 
Tomi Manninen         Internet:  oh2bns@sral.fi
OH2BNS                AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04              Amprnet:   oh2bns@oh2rbi.ampr.org
