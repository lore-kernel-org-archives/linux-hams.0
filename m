From: "Dave Hibberd" <d@vehibberd.com>
Subject: Re: Replacement for linux-ax25.org git?
Date: Tue, 08 Nov 2022 23:28:34 +0000
Message-ID: <1b7d056a-6ae1-415e-bc9f-f98631c35222@app.fastmail.com>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
 <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
 <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
 <29F7FF8E-64E6-4927-9DE6-23E98C763832@gmail.com>
 <Y2qbfrHkKAf44cdK@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vehibberd.com;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1667950135; x=
        1668036535; bh=pALwMJKOuYK/w3NEkB3NAlNThXTplf3NNrk0aSLWUIU=; b=i
        KswhpnATSMLzCsqAmEczdlLh3Zgbw5DAVvtgYvNWaIT68rtkb5cjqdAi1Fta/F+8
        gZypZb9eDadU5yQrmWbmOqj3HxMhiir/Acsme0aJv4M5rwW/d6P3//L9F6wKaIrj
        ibIZGg8TgBdLvShYWKJ7GT0uozDF6f1QYC0kMyKWXRFTvOARjkl6uzZttqc56c/e
        tzk5VC0fkgVl2AnLTQuOvI65pCuTNJPJA5Wrj6oPe39fe9zPnRCpB10Fz9KIEynX
        mf0V2Bexf94U7cP6mfYGN0yMCJxfFdUWQf0ssLfjDL55jzihP3Vj708pY6mpC7Wq
        imGehIW0j57Cl2bqPCplQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667950135; x=
        1668036535; bh=pALwMJKOuYK/w3NEkB3NAlNThXTplf3NNrk0aSLWUIU=; b=b
        nhd/WGhE/QWM+nS/aClLzFg/XjYyTHx39TTjNhrkQFYFnFepEj6mtGNTlIUUzAKF
        sa+2SaRGFBYiys3Z9KDXE0I3cIGaKnATLGayaWj23Bokq1U5ROvRQbNQ1pWQay+f
        E3Vfusg6+0DptPBwG9+XbNGu4tfAH5DABmsNTVHnOTusM/hcrdNhIOFvV5g7L0um
        66zF+tqN0FP45N95WrdfXmlXs6cBjyXMJrk8JYtHElMVphquMmbUoCYn4WGg+TKX
        0uapOP+DJ4b7dcGYh4WKSWn+DTBsMQJS6mKQjdEt8HiNaqGgG6AZf6pDUOfpipYb
        lLeH8+of5YMHhcq9etlyg==
In-Reply-To: <Y2qbfrHkKAf44cdK@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Osterried <thomas@osterried.de>, "Steven R. Loomis" <srl295@gmail.com>
Cc: "Mike McCarthy, W1NR" <lists@w1nr.net>, linux-hams@vger.kernel.org

Tagging a release on git makes it easy for us downstream to know when to=
 pull and lets our tooling know there's been a change to give us a nudge=
 to refresh it, even if there isn't the release of a tarball based on th=
at tag. it also helps keep our revision numbering cleaner than the curre=
nt package we're shipping, so that end users get the most recent version=
 also.


--=20
  Hibby
  MM0RFN

On Tue, 8 Nov 2022, at 6:10 PM, Thomas Osterried wrote:
> Hello Steven,
>
> On Tue, Nov 08, 2022 at 11:50:42AM -0600, Steven R. Loomis wrote:
>> Thanks for bringing this back.
>>=20
>> =E2=80=9CLatest Versions=E2=80=9D on the main page right hand sidebar=
 <http://linux-ax25.in-berlin.de/wiki/Main_Page> still link to the linux=
-ax25.org <http://linux-ax25.org/> URL and are thus broken.
>
> Thank you.
>
> It's recommended to use the git head anyway.
>
>
> I'll fix the links in the wiki.
> But personaly, I really dislike the "releases"-idea in the days of git.
> It's much easier to initiate "git pull" to update a previously checked=
-out
> version.
> Furthermore, if we really like to to have something like "release", we=
 need a
> mechanism that (semi-)automatically makes a new release some time after
> a commit (that has been proven bug-free).
> Else there's no benefit of using such a "release" in production, becau=
se it
> remained old and buggy.
>
> vy 73,
> 	- Thomas  dl9sau
