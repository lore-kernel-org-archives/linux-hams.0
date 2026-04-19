Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018A76DCE1
	for <linux-hams@vger.kernel.org>; Sun, 19 Apr 2026 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776615512; cv=pass; b=mQaxu3Rl3E3PmjGTm6zgmogqI4Vrv8tEBrejOZejuk6fXD/0y7I959S5EqGuri1WGd2k5pDSilsn6FmJqfydIDp2xa+8k3MtcTdt8W9orj6fQzoLcnMkpOiXc+FPyGWbZilTvpfF7/6cb6H3vejEkGmnNKtRye+pGId2qJ1xUQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776615512; c=relaxed/simple;
	bh=2kmzNqaSFe+yJNJvVOdlvjM9xBDY8uDfG4F1yhPGfiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXGHbPXdxIzLgNhRSbdk3aBD00lJVvEb+EO3H+k1Hn5nsRjmJHNtuk0ODLD6F3xqMmAYrZ3/7OAE4v/1cdvVlO3sinrUfKzzRRtpraZj1/e0Cjo68FzcOKEcWL2BR4wrL+7V+ntCr8/mrO/+hXPV+gJd+F4uU65PNhQnqtE2Q/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=conklinhouse.com; spf=none smtp.mailfrom=conklinhouse.com; dkim=pass (2048-bit key) header.d=conklinhouse-com.20251104.gappssmtp.com header.i=@conklinhouse-com.20251104.gappssmtp.com header.b=rA4fq4I8; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=conklinhouse.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=conklinhouse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conklinhouse-com.20251104.gappssmtp.com header.i=@conklinhouse-com.20251104.gappssmtp.com header.b="rA4fq4I8"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-506a7bbe9d0so19582101cf.0
        for <linux-hams@vger.kernel.org>; Sun, 19 Apr 2026 09:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776615510; cv=none;
        d=google.com; s=arc-20240605;
        b=cDzrKmTVgEwqlZNAzE6paHL3vnHgx+rT2lNy0uMWi0iXL81ncZBYY3cNrt3eWcakJx
         DpGRt5+i8VDt22lhO6TrXGd3eRlKchif7nWbiiKc18VOIL/Qvq4yNQh8U37KjYXriXCT
         B1Y5PhhuTBiXW6en8zANrh73lf4KDkAzzD3YqOHe7Eohp+q08I56t3kTVHcKUgvlqiCW
         IUhv6CYBEBAbDi7SS2JcaQ4raRn5Di1TquGYWilu/WfORyzja1f77MpOBJrDhByDNKPG
         i+1gN90wqIaCsGR4cwIK4D2TnpMaCk5MxXUnr39PXj6zF9NLwGd9JgrHIQ/gJBHP8tuD
         lTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZA0MU3CqQCtyPIjGeEpPap+Mj/hPzxk/1LUCB2TLOV4=;
        fh=60KZ5x9vITf2BdGRBUkfi69mF9ANlijFb3lDORTQVVQ=;
        b=ANqyaW5ZH18xmfteHOkMq9KitxWFJbLCvwhBwL6GrHKLd/hjh/EEJyWWIPny1+qGSt
         vek5H/QdRwGux6F4wuuEE6PP/S4Z2L5agruqIXpZz76JGYEhkAHV1Tvpuu6m1xzKxiRg
         5Vv1+Oeu0ki4Wc2GxJC2SqmsD4eKO10auMMVgFi6LE8DueSS3WGe16UY5JqtI35gc+Ao
         O7zpBi6LuCaKP4Weu6LEB8an89SJEdeMJO4AqAb8VuoTEs85w2DkPDUAiZh3JSElUomi
         rYqVFhl0eln+mBjPi8kD2D74m3m26LiRXB7fyIsMOFWom59DM6Rk/CkCgMuc/0CnxQSa
         1o5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conklinhouse-com.20251104.gappssmtp.com; s=20251104; t=1776615510; x=1777220310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZA0MU3CqQCtyPIjGeEpPap+Mj/hPzxk/1LUCB2TLOV4=;
        b=rA4fq4I8r8qUzSYpGx+jBrk2A/L2u6Y8B/8UxN3y5Nj9BHnBFNlQLudOzdoIvjWYHg
         H3M4D5PEekr6Xbh/56ANTkEjHXeT3wMf/G5PSvr0VKFUBd389+F3AorwZ3IZP8mjHO4J
         PiSgRfVor2ZuoPeTXV05NkENR2o7oDmd2dmFCeHsWOsMgACr8JrNDBVCftP9qFobRLi5
         j7b2GoW6yUHOM25rS6/NSp+JdmnfPpdFFqGPUB5eU3Twzs3Vws5Gr4Lncul2F0fwC3AK
         +S7kp3rz5okIG7rwmsV2cBR5pK7ZENa8SmOEzDO60xAlaSvyVUEfZMcV981bfn2IZM0J
         aLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776615510; x=1777220310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZA0MU3CqQCtyPIjGeEpPap+Mj/hPzxk/1LUCB2TLOV4=;
        b=TrgSOVjmQhtjwpVaVGTgVcISQ5VL4kVe7u58bij04Edlluz2beVk6aE7HWOxB5k03U
         3fkfFjWYbt23octaDGgNw49hYtHpEw5t+AfJ83K7MZpbNI9+OWlJVBwyokL2MdP2r6g/
         9P5sK/PdTntIRay5ze/QRsqctptmglQPSwB7UBbSZ1l+0louJSvx9OB/JCaWIUN7KazP
         oUzD1cLXBs8jHlopY1QFy744NOShKzwIkLcBrfGtif7HQwIrPF/Vt6/TAviq1LL1e602
         wmIytNZil7efraORiqkbi5E8C+0aVXmap4EPxapL1VENXuHbdSc8BfBZ+svpUrHvArRV
         sFdw==
X-Forwarded-Encrypted: i=1; AFNElJ+rkB0m3Ryg9iOv8sSv9NYAFAjMq/TD9pnAdBut2Mp19whwErvjciGIdwvCu7Q2E8IAzkUaTL2jB18+@vger.kernel.org
X-Gm-Message-State: AOJu0YwrVgCVAsULKkmP6GEWjeYZacQhiR3JTXhs5L+Aw19vZ88smMNq
	vjSJDoX4r7Pz/WYxyEm/bNgp61X24OIVpmpr+d8Xvrl+/gmyloBqb7rdY/uLuZiBrVe98tKoM9n
	93gXffQWV1gahzjhioCFkdY1B7FLt5buBxF7I/Pidcg==
X-Gm-Gg: AeBDievkijTcSJEs664EB88Uiye6L9NIQQ2NUVjMQ9UdftZd4MGeHpTKG4eYnXTGenw
	We0m7VtrZMBhlH237KqIscwEjcCeihtucX4IZIH3EdAqER1qyNUK6SZGcC3kYF8sLhb0kLg6eqq
	x/wJlmostHI5+pkNYfHU5+S6k50unhAaZL+Kv2t2/SKWWKeF/9Hw7Zw+UbV0OTsDuKtVkny0Fm4
	QUYPQ8wk4PpmZrN4paXIFn4N1FVdmmxp+2X0fDBcyHu1XissJNwL8Prwl2Orm4x0jrEBW8uQY1G
	Dwp8255xEkTL/M2m1gtZZlldi8gK
X-Received: by 2002:a05:622a:3d4:b0:50d:9174:cf33 with SMTP id
 d75a77b69052e-50e36bd1596mr165597981cf.16.1776615509651; Sun, 19 Apr 2026
 09:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
 <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
 <7a9547e1-9958-4bce-8547-71a93153a0d6@vk4msl.com> <c412bf83-e8cf-4a3d-8619-63f68e108399@blemings.org>
In-Reply-To: <c412bf83-e8cf-4a3d-8619-63f68e108399@blemings.org>
From: Steve Conklin <steve@conklinhouse.com>
Date: Sun, 19 Apr 2026 11:18:11 -0500
X-Gm-Features: AQROBzA8TSQxrJVOT851Y0mVLis24eizp98w4OMaH07WOFtS6ow4kyVwBP70uEo
Message-ID: <CALJxBtX_T8sv11ank-arLfoVqJqXegi3D_ZT9ZFbMHkuf-2RAg@mail.gmail.com>
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: hugh@blemings.id.au
Cc: Stuart Longland VK4MSL <me@vk4msl.com>, Dan Cross <crossd@gmail.com>, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 4:36=E2=80=AFAM Hugh Blemings <hugh@blemings.org> w=
rote:
>
> HI All,
>
> On 19/4/2026 14:01, Stuart Longland VK4MSL wrote:
> > On 19/4/26 05:28, Dan Cross wrote:
> >> [Top-posting to make meta-commendary]
> >>
> >> I wonder if other folks have thoughts, here? It doesn't bode well that
> >> the discussion hasn't progressed. =F0=9F=99=81
> >
> > I haven't had a chance to fully review what you've posted=E2=80=A6 ther=
e was a
> > lot of historical information in there including detail on the
> > protocols in question.  I've earmarked it to go through closely
> > however. (e.g. I had heard of "ROSE" but never seen a spec for it.)
> >
> > My situation was wanting a library that I could use to do AX.25
> > networking from userspace without having applications having to
> > elevate to `root` to achieve it.  There was also a maintenance
> > concern.  Rather than try and work out the AX.25 kernel stack, I opted
> > to instead build my own.
> >
> > Instructive, but difficult as the documentation is sketchy in places.
> >
> > My implementation was written in Python 3.5+ for ease of development.
> > Probably not the best option, but it got the job done.  `aioax25`
> > allowed me to deliver a project for an emergency comms group and
> > provides a reasonable foundation for simple tasks.  The stack is also
> > portable to other platforms.  (I mostly only care about Linux and
> > *BSD, but well written software should work elsewhere too.  Apparently
> > it works fine on Apple MacOS X.)
> >
> > A userspace AX.25 daemon which implements the stack would seem to be
> > the best course of action, but the elephant in the room is what the
> > API would look like.
> >
> > The only thing I've seen close to achieving something like that would
> > be the AGWPE protocol, however the author of that AX.25 stack has
> > categorically stated that he "owns" that protocol.  I don't feel like
> > going to court to argue copyright of interfaces for the sake of a hobby=
.
> >
> > The AGWPE protocol is also very limiting: a lot of fields in the AX.25
> > frame are not accessible via this protocol, either for reading or
> > setting.  Want to use the two reserved bits to signal something in a
> > custom protocol?  Too bad.
> >
> > I was therefore pondering a "stream"-like protocol using KISS-style
> > framing (to re-use existing code).  The frames would serve as an RPC
> > mechanism for implementing something like the `libax25` API, exposing
> > the same functionality and allowing an application to interact with
> > the AX.25 stack without having to implement the whole protocol (as
> > they'd have to do with KISS).
> >
> > Client applications could connect either via Unix domain sockets or TCP=
.
> >
> > You mention the performance hit of crossing the kernel/user-space
> > boundary=E2=80=A6 I think Direwolf experimentally can work as high as
> > 38400bps. A turn-of-the-century desktop PC was easily able to keep up
> > with that for PPP links (with `pppd` running in userspace). ARMv7
> > single board computers made 15 years later can deliver similar
> > performance.  I don't think this will be much of a bottleneck in
> > practice.
> >
> > I think userspace is the right way forward given the niche use case her=
e.
>
> Apologies, I kicked off this thread and life intervened a bit and have
> only now had a chance to get back to read through the excellent
> discourse since.
>
> I did have one off list conversation about this which was similarly
> leaning towards a well managed/discussed shift to a userspace approach.
> The individual in question has had quite a lot of both ham radio and
> FOSS experience - I'll give them a nudge and see if they would be
> willing to weigh in here too as I think they'd add a lot to the thread.
>
> I wonder if anyone on list feels they have the right skills to put
> together the shim/compatibility library that would be needed to allow
> the kernel code to be removed?  Seems like that might be the next thing
> to explore ?
>
> Hoping things settle down a bit and will be able to contribute more to
> ongoing discussion
>
> vy 73
> Hugh
> VK1YYZ/AD5RV
>
>
>
> --
> I am slowly moving to hugh@blemings.id.au as my main email address.
> If you're using hugh@blemings.org please update your address book accordi=
ngly.
> Thank you :)
>
>
Hi all,

I'm another former maintainer who has been less active in the FOSS
hamm community for a while. Thanks for all the history, and it's been
great to see familiar names and callsigns again.
/wave

My personal take is that moving to userspace is the right long-term
goal. As for deciding the exact form that takes, this thread is a good
start.

I'd like to make an offer for a long-term home for these components.

I'm a director at ORI (Open Research Institute), and  ORI could be a
home for these. We're a project-based, completely open and volunteer
nonprofit focused on ham radio and communications. We have volunteers
with FOSS and ham radio experience, and we're already set up with a
GitHub org, slack chat, and the infrastructure to manage projects.

https://www.openresearch.institute/
https://www.openresearch.institute/your-project-is-welcome/

Anyone who currently maintains or has an interest in this is welcome
to participate there.
I personally volunteer to help move development infrastructure to ORI,
if that's the wish of the community.

Steve Conklin AI4QR
