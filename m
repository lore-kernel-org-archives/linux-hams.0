From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Mon, 29 Jul 2002 15:16:32 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10207291502190.25868-100000@saturn.trs.ntc.nokia.com>
References: <20020728224348.GG10796@eye-net.com.au>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020728224348.GG10796@eye-net.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, 29 Jul 2002, Craig Small wrote:

> If you're looking for something later, you may want to solve the
> ancient "why does an AX.25 interface need an IP address" question.  
> The answer used to be "because it does", I'm not sure if that is still
> the case, I've got ports sitting on a Linux computer over *there*
> (points to rowlf) that don't have IP addresses or have 0.0.0.0

I think it's still the case. If an interface doesn't have an IP address,
it won't show up in the "list of known interfaces" from the kernel
(SIOCGIFCONF I think). So the utils/apps will never find it...

I did some digging a couple of years ago and also did a patch (with code
mostly stolen from Matt's/Jens' new-ax.25). See:

 http://hes.iki.fi/archive/dev-hams/2000/0055.html

I never got an answer.

Oh, by the way. Has anyone done anything with the NEW-AX.25 patch lately?
I think it has some potential but unfortunately seems it's now completely
unmaintained.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

