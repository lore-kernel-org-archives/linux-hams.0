From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: Linux AX.25 Socket programming
Date: Fri, 3 Jan 2003 19:17:56 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10301031914210.15434-100000@saturn.trs.ntc.nokia.com>
References: <Pine.LNX.4.44.0301031919090.9645-100000@zl2bsj.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301031919090.9645-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Cc: linux-hams@vger.kernel.org

On Fri, 3 Jan 2003, Wilbert Knol wrote:

> On Thu, 2 Jan 2003, Tomi Manninen wrote:
> 
> > the same in eg. Perl. There was a thread about Perl and ax25d recently on 
> > this list but I have already forgotten what the correct procedure was...
> 
> The trick was, to 'unbuffer' the Perl interpreter with:

Ok, but how about input? Didn't it need something special too?

> How does ax25d present end-of-line?

The standard end-of-line in AX.25 related world is CR (yes, a really
bright idea indeed...). Ax25d doesn't touch that at all so any program
lauched from ax25s needs to do the conversions itself.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

