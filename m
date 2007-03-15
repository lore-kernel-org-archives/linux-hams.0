From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 15:39:40 -0400
Message-ID: <620c90570703151239j2e4e29f4s59414b05dfca37c9@mail.gmail.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
	 <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
	 <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
	 <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
	 <24338.141.129.1.98.1173970674.squirrel@mckeehan.homeip.net>
	 <Pine.SUN.4.58.0703150758470.13415@eskimo.com>
	 <29463.141.129.1.98.1173971279.squirrel@mckeehan.homeip.net>
	 <Pine.SUN.4.58.0703150808390.13415@eskimo.com>
	 <50841.141.129.1.98.1173974081.squirrel@mckeehan.homeip.net>
	 <Pine.SUN.4.58.0703150909530.13415@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=SA5xRssbZu/46f46tYuDyVUXpPszHlsnIkH+887eemscVWLBRmv+F+SmOIoP+NDq0+A1VYCPK91nF08Owq6GVBQwERp2bTJJZMU7H/M8UJwwvwARJc/Tybjt6js+Y3Ihcp/TR7PMyriIE9RQp+0/glCiXDyNSCxBxX4+EmXbWtc=
In-Reply-To: <Pine.SUN.4.58.0703150909530.13415@eskimo.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: William McKeehan <mckeehan@mckeehan.homeip.net>, Stephen Brown Jr <stephen.brown75@gmail.com>, linux-hams@vger.kernel.org

On 3/15/07, Curt, WE7U <archer@eskimo.com> wrote:
> On Thu, 15 Mar 2007, William McKeehan wrote:
>
> > I did not realize that aprsd could connect to the AX.25 stack as opposed to
> > directly to the TNC.
> >
> > I'll fetch it and have another look, thanks for the suggestion.
>
> There are several versions of aprsd floating around out there,
> modified by various people.  At least one of them can.  Probably the
> SourceForge.org latest version?
>
APRSD is what I have got to get working on our switches, we are going to
add a 144.99 port on the switches for WX and other remote metering equip-
ment so we can move them off of 144.39... Most of that stuff is quite low
power so a nice quiet channel would be a good thing... There is some
packet but not nearly enough to cause any pain and agony, and indeed in
some places the original users welcome the remote sensor activity as it
puts something on their dead channel... (hint, hint, need some activity on
your LAN channel bring some remote sensors on it, most are just a few
watts and do not cause that much of a problem)

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
