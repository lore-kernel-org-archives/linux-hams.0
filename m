From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: PMS messaging program: where?
Date: Fri, 10 Jan 2003 00:20:19 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301100011140.3859-100000@oh2bns.ampr.org>
References: <20030109220627.M32751@tneu.visi.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030109220627.M32751@tneu.visi.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Neu <tim@tneu.visi.com>
Cc: linux-hams@vger.kernel.org

On Thu, 9 Jan 2003, Tim Neu wrote:

> On Thu, 9 Jan 2003 22:04:19 +0100 (CET), Jacques Chion wrote
> > 
> > you can find that program in ax25-utils-2.1.42.a-3 package.
> 
> Hmm.  When I try to intstall ax25-utils on debian, it claims that ax25utils is
> replaced by ax25-tools...

A few years ago ax25-utils was split into three packages: libax25, 
ax25-tools and ax25-apps. At the same time a few of the applications were 
left out to be maintained separately. At least node and pms belong to that 
category.

Unfortunately it seems that no one took pms and I believe there isn't any
recent versions out there... Someone correct me if I'm wrong.

You could rip pms from the old ax25-utils but it would need a bit of 
tweaking to compile on a modern system.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

