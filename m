From: Jim Kusznir <jkusznir@gmail.com>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 16:25:44 -0700
Message-ID: <AANLkTim0JXl8-LeoeOtLhwCgy2_YoQ--mTWGGg6hWYgF@mail.gmail.com>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com>
	<4C183169.3060206@radagast.org>
	<alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net>
	<AANLkTikS7GnQ4hyLpIEk62IF43pX_NVvl_E1GhNwH9C9@mail.gmail.com>
	<alpine.LNX.2.00.1006160944480.21590@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=DqGLTr+s5FutnGY9DllXMqzekIAjX7hFRzCL1YDLeCk=;
        b=Impma4aC4morhrDgGumCYcfGKK0s9/htkxt03oNAq6fQSmItItvXwwgWpUXKSLy8Qv
         MBsMSTdW3nKu0quYc/ARdbqk1aX+Np6YIo4bThzr93HcyeOGclIxjZIDJzIFlSnDdFj9
         ScDG4vtyZCKndFuUZo2uKWewNsJUexoVTicl4=
In-Reply-To: <alpine.LNX.2.00.1006160944480.21590@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

It appears that the PacComm firmware (both the very old version I got
it with and the new one I paid $30 for last year) seem to have a bug
such that:

1) its not possible to leave KISS mode without doing a RAM reset (pull
battery or use the jumper)
2) When switching to KISS mode, all the parameters specified in the
non-kiss mode are ignored.  So I'm running with "default" tx delay,
etc.

This is partially why I thought I'd need to replace the ROM with a
KISS-specific ROM in order to configure some of these settings.

--Jim

On Wed, Jun 16, 2010 at 9:46 AM, Curt, WE7U <curt.we7u@gmail.com> wrote=
:
> On Wed, 16 Jun 2010, Jim Kusznir wrote:
>
>> I've been
>> using one at home in KISS mode for a while, and I've been noticing
>> what I think now is the T1 timer problem, and its been causing very
>> frustrating and massive reduction in throughput on my local 9k6
>> channel, even though my radio and the node are the only two on
>> frequency! =A0I often see my system try and send retransmits before =
the
>> first packet ever even makes it out the radio (but on the other hand=
,
>> I also think my TNC is sitting on packets way too long -- PacComm
>> Spirit-2).
>
> Tweak your KISS parameters. =A0If there are only two on frequency the=
n
> you can increase your p-persistence quite a bit and perhaps decrease
> your slottime.
>
> --
> Curt, WE7U. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <http://w=
ww.eskimo.com/~archer>
> =A0 APRS: =A0Where it's at! =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<h=
ttp://www.xastir.org>
> =A0Lotto: =A0A tax on people who are bad at math. - unknown
> Windows: =A0Microsoft's tax on computer illiterates. - WE7U.
> The world DOES revolve around me: =A0I picked the coordinate system!"
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
