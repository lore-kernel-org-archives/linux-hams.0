From: Roland Schwarz <roland.schwarz@blackspace.at>
Subject: Re: AX25 disconnect patch and ROSE socket failure
Date: Mon, 20 Sep 2021 12:53:03 +0200
Message-ID: <3345fdf3-26e7-5f2c-cbf0-53026a76399a@blackspace.at>
References: <8b7a1545-3631-b62d-6430-4a51652023ba@free.fr>
 <CAH4uzPPVfYnRzGH5OTL6JX7JC64sY5XSsurHBLt=EOV+EPbJ2A@mail.gmail.com>
 <45792400-294f-b496-9c7e-679d19614884@free.fr>
 <CAH4uzPPtsgz8tnQXwukDVL7=_pgfnK8OS+J8tdHBnsnJE1m5kw@mail.gmail.com>
 <ca4f0c90-53e6-24e8-9a51-f079d6da574c@trinnet.net>
 <a5d51093-fb07-0683-e094-9da57d9f25fa@blackspace.at>
 <CAH4uzPOO2zDHnP9V0_iYPMb85qM6FcaSEYz3iqiPuMr7rx90+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAH4uzPOO2zDHnP9V0_iYPMb85qM6FcaSEYz3iqiPuMr7rx90+Q@mail.gmail.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave van der Locht <d.vanderlocht@gmail.com>
Cc: linux-hams@vger.kernel.org, David Ranch <linux-hams@trinnet.net>

Hallo Dave,

On 19.09.21 at 20:07 wrote Dave van der Locht:

> Well... That problem is there for quite some years now and there still
> isn't a solution. 

Have you seen Ralfs comment?
> I wasn't even aware of these patches and an internet search didn't turn
> up anything.

So it looks to me as if no one had tried to contact the maintainer via 
this list before. I don't believe it is the duty of a maintainer to 
track all possible places on the net for issues, do you?

> Although that proposed solution might not be the root cause I'm
> wondering what the real root cause is and why it's still not
> researched and fixed after years with everyone complaining about it.

Again it's two months at best and this is not much time.

> In the mean time it still seems better to have a good work-around than
> a pretty useless AX.25 stack.

The work around already is there. One just need to compile with the 
patch in place.

73 de Roland oe1rsa

-- 
__________________________________________
   _  _  | Roland Schwarz
  |_)(_  |
  | \__) | mailto:roland.schwarz@blackspace.at
________| http://www.blackspace.at
