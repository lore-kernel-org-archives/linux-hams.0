From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Sun, 28 Jul 2002 22:10:26 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0207282149180.3619-100000@oh2bns.ampr.org>
References: <20020727030700.A32364@dea.linux-mips.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020727030700.A32364@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Cc: linux-hams@vger.kernel.org

On Sat, 27 Jul 2002, Ralf Baechle DO1GRB wrote:

> At the moment I just intend to dust off the code.  Anything else we can
> talk about later.  Unless there is already a list of bugs or wishes?

Not a list but I'd sure be glad if someone finally found the reason why
the AX.25 stack sometimes breaks and starts repeating some packet over and
over or gets stuck ack'ing some packet endlessly. It's been a while since
myself saw this but I think this is what happened to Arnau Sanchez a while
ago. See:

 http://hes.iki.fi/archive/linux-hams/200207/0046.html

At least earlier I could trigger this sort of behaviour almost at will by 
switching IP VC mode on.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

