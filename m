From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 09:46:20 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1006160944480.21590@wapiti.we7u.net>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com> <4C183169.3060206@radagast.org> <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net> <AANLkTikS7GnQ4hyLpIEk62IF43pX_NVvl_E1GhNwH9C9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :in-reply-to:message-id:references:user-agent:mime-version
         :content-type;
        bh=oHYkdKh3JCtaSORrb8aPwfg5iRVrCzjyGzikGcEycqs=;
        b=ZPUrJ7zB5WOUZNyEPuFHPLz9tX0iO0ainjmCwKr1WNcQv/jXsTT/Qz0UK8rj1Zh2Rm
         duMRfs6YUUYHpbYVhfQOGvT1/XEH3iScMTNg0V3qKM8AIkRRSPkXLMj93lp+bN6jmiPw
         FKIOoXFNIZciDoTx86OyH+mz6VuhR5S0XdTXQ=
In-Reply-To: <AANLkTikS7GnQ4hyLpIEk62IF43pX_NVvl_E1GhNwH9C9@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams@vger.kernel.org

On Wed, 16 Jun 2010, Jim Kusznir wrote:

> I've been
> using one at home in KISS mode for a while, and I've been noticing
> what I think now is the T1 timer problem, and its been causing very
> frustrating and massive reduction in throughput on my local 9k6
> channel, even though my radio and the node are the only two on
> frequency!  I often see my system try and send retransmits before the
> first packet ever even makes it out the radio (but on the other hand,
> I also think my TNC is sitting on packets way too long -- PacComm
> Spirit-2).

Tweak your KISS parameters.  If there are only two on frequency then
you can increase your p-persistence quite a bit and perhaps decrease
your slottime.

-- 
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
