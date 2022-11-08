From: "Steven R. Loomis" <srl295@gmail.com>
Subject: Re: Replacement for linux-ax25.org git?
Date: Tue, 8 Nov 2022 11:52:21 -0600
Message-ID: <61461727-F28B-4842-9EC3-F7F600B9AE5A@gmail.com>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
 <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
 <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGXBOuq58WurCylRRsbGEB9nYBgO4mKHxsGKups/IY4=;
        b=Ks1htzIw3zEZrZCi6sEGCpoh9hDN82rfXBbZi+bbOBKvyXr50OQR3NrswtfR9kYCgL
         hSDPO1wIAPn6BpNPbCXDF194zYN6Xs7cpbzGMZxAwGyQ+kaMnNRXBDH1k/h4L7B0BC72
         9mjmtBEML/W1b1qreUfrnJwzNAEb9xMIP/z8LbuAd7lsIFCCxAZx8qPvhhBpGpg3VY4i
         W7AZKRJV5XJ8atzUwlPFNO3QdVJ6lKdknfmtpQ8WK2Csz145jSb4XiBsceD8bTzun85q
         5fXt/PLdP6osDa7bSippS5jwp1Tcq279ReqqDeCeGztOG8tOpVKRvzFVH4+QWWLI31cz
         s1lg==
In-Reply-To: <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Osterried <thomas@osterried.de>
Cc: "Mike McCarthy, W1NR" <lists@w1nr.net>, linux-hams@vger.kernel.org


Thanks for bringing this back.

=E2=80=9CLatest Versions=E2=80=9D on the main page right hand sidebar =
<http://linux-ax25.in-berlin.de/wiki/Main_Page> still links to the =
linux-ax25.org URL and are thus broken.

73, K6SPI


> On Nov 8, 2022, at 9:14 AM, Thomas Osterried <thomas@osterried.de> =
wrote:
>=20
> On Tue, Nov 08, 2022 at 08:41:22AM -0500, Mike McCarthy, W1NR wrote:
>> Does anyone know if the repos at linux-ax25.org
>> were archived anywhere before it went offline?
>=20
> linux-ax25.org domain is dead due to dns fail.
>=20
> The host running the repos is still in service and
> is available under linux-ax25.in-berlin.de.
>=20
> That dns name is not my favourite choice (see my post on this list =
about this topic),
> but it is future proven, does not depend on a single person, and is =
under full control.
>=20
> I hoped linux-ax25.org will come back. Now we have to live with that =
solution.
>=20
> vy 73,
>  - Thomas  dl9sau
>=20
>=20
>>=20
>> Mike, W1NR
>>=20
>> On 11/8/2022 7:41 AM, Dave Hibberd wrote:
>>> Hi all,
>>>=20
>>> I'm one of the folks in the Debian Hamradio team with an active =
interest in keeping our packet tooling going.
>>>=20
>>> With the demise of linux-ax25.org and discussions here about change =
of maintenance, is there a new canonical repo for ax25-tools and similar =
where these components are held?
>>>=20
>>> Our last upstram mirror was about 3 years ago, we've got it tagged =
as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed =
down into Ubuntu, Raspberry Pi OS etc.
>>>=20
>>> If there's currently active work going on with these userland =
components, where is it happening so we can rebase our packages?
>>> If not, I guess this is something we need to make a decision on how =
to proceed as a community!
>>>=20
>>>=20
>>> [1]: =
https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream
>>>=20

