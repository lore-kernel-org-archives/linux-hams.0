From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: libax25 axio_flush bug hangs node and fix
Date: Wed, 16 Oct 2002 15:56:14 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10210161541030.585-100000@saturn.trs.ntc.nokia.com>
References: <20021016032141.GC7618@enc.com.au>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021016032141.GC7618@enc.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Craig Small <csmall@enc.com.au>
Cc: linux-hams@vger.kernel.org

On Wed, 16 Oct 2002, Craig Small wrote:

> On Tue, Oct 15, 2002 at 11:52:11AM +0200, Tihomir Heidelberg wrote:
> > I noticed that my awznode (a variant of linux node) hangs and 
> > use maximum CPU when user starts any external command and 
> > incoming AX.25 connection get broken.
> 
> Damn, i thought this been fixed in 10. Tomi and somoene else were
> discussing it, I'll need their help again.

No, actually the bug was introduced in .10 ...

Anyway, I spent last evening thinking back what was discussed with Jeroen
last spring and then cleaning up his last patch a bit. I will send that to
you in a few days.

Now, the problem is that this patch will revert the "fix" that was tried
in 10. Jeroen tried to fix a problem in the applications with a fix in the
lib. After the discussion we finally agreed that the .9 behaviour is
correct, only a few relatively minor bugs needed to be squashed. The "big"
bug is in the applications using libax25io and _they_ need to be fixed.

So finally yesterday I also started to really think how to fix node. The
fix won't be trivial but I'll try and produce a working fix soon. Gosh...
That would be the first new node release since -99 ...

(If you want a quick fix, then Tihomir's patch seems ok to me. But I
really wouldn't like to see that in an official release.)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

