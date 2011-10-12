From: Ardor <ardorlan@gmail.com>
Subject: Re: packet radio gateway
Date: Wed, 12 Oct 2011 08:37:49 -0600
Message-ID: <CAGSdYcmMkksu+ivxBd=QOr8a0p7p3HJ6pmd0XDj2N=vvnj2mMw@mail.gmail.com>
References: <4E932538.5000805@kinfolk.org> <CAPSBm51Ps5mo0xSb9Fo3ZGgkwyno8LvQw0GsTFZNtjJgu1r-=w@mail.gmail.com>
 <4E959B9B.9030302@complete.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=G3k8va9aCE95k0X+Nyl1HztNbDeALqEOLHQvCvaMvSg=;
        b=bfdSIMR+v4X9rDQ9HfLYHXDZM5N6fnOyea9UVlJpMz0PB2ZiOhtR/BafFit29RfB9h
         HeUYGiiFqnnahz2HMdd4Onexi/i4ulzUlTN2tIvnr5pGBhCmV738SPeXG+lBrm+k0tHV
         tKU4YS/sBqCE55UsVLR8UMGWFHLCq/xHkdbiU=
In-Reply-To: <4E959B9B.9030302@complete.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Goerzen <jgoerzen@complete.org>
Cc: Bill Vodall <wa7nwp@gmail.com>, linux-hams@vger.kernel.org

I am trying to build a HSMM-MESH network, but I want to host an email
server, lots of IPS block outbond email ports, and inbound http ports,
I would like to setup a mesh network in Cheyenne Wyoming that goes 54
megs/sec with a few internet drains that are GRE tunnels for net 44.
that way, We can have public and static IP address on the Ham Radio
Servers. I would like to run Iniquity or renegade BBS software for
example, I do not want to be locked into a given platform for server
software, I should be able to setup an Ethernet connection and have a
default gateway and then use routers to tunnel it. Placing the 44
address directly on server and anything outside its subnet would be
set to the gateway address which would then enter the tunnel.

I think there is allot of really cool things that can be done, and I
would like to get younger hams into it. I can see us not only
supporting the red cross but also having Metro Area Wide Ham Radio
computer gaming parties.

We should not limit choices on what software can be used, We should
use a widely available tunneling protocol. I like GRE because its
widely supported, well documented, Easy to setup, and support Dynamic
Routing protocols.

To get a 44 address contact your local coordinators
http://www.ampr.org/amprnets.txt

If you are unable to get ahold of them for address assignment contact B=
rian
brian@ucsd.edu.

On Wed, Oct 12, 2011 at 7:52 AM, John Goerzen <jgoerzen@complete.org> w=
rote:
> On 10/10/2011 04:04 PM, Bill Vodall wrote:
>>
>> There's a lot more cool stuff that can be done with TCP on packet -
>> but that's a whole different ballgame.
>>
>
> I've done it a bit here locally, using some nonroutable IP ranges. =A0=
It was
> fun but at 1200bps a bit painful, though very occasionally useful to =
fix
> something on a remote box. =A0What sorts of things do you have in min=
d?
>
> How does one get a 44 address anymore? =A0I've tried but kept running=
 into
> brick walls due to people that were supposed to be doing things in th=
at
> system being AWOL.
>
>
> - John
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
