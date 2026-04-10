Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBA3E3C4A
	for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775845456; cv=pass; b=iRt8Y0jYUGe9J3SEObliknIGKFiVZW4IAhYjVz+CgNEXJL6gehcgp/ZCmWsoNneLyYX3i5YbdwMrJf7CiA00UTjXQG3H2OmmmnaHpWZro+4F/Etn04Z6hQWOg5uqsdakT8rngt1MYospvFEhE18GOzjBKN/eAiYu09Y4guv0skU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775845456; c=relaxed/simple;
	bh=EPE5zIbtuB9mtkemOydEeLuD7X/WZ572Yk/Mfjs+cuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZaJ9CEvcC08P8QS9AF9jY2fwXq4wqx7sZSGHCC96YqQu3vKnYbZ3kcGQ6jF7kmWgLAYolubi6x1JbEC6FryQlZixToAWHjETJLdZMUcLIRbOWcT9XHNNqIhye3rI2hi1b1bVPsQNSzG2ay/X6O0njSiHttBOlS1LeTppFNonEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIcbLRko; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIcbLRko"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6501e465a8eso2604469d50.1
        for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 11:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775845454; cv=none;
        d=google.com; s=arc-20240605;
        b=JSHH0+zCTE4bWL6+iNCm4Nx5icj3ribHxYQuzCU9la/z0LrfKl+34tAChRrxDdFDpN
         o078kEUiIkOSG1N5oJlFy8sGqhGvMc2wvYn2FyZ8coCnefxSinb4TFszDD2aNEeaHM9s
         3OksUY9hqLowMa53ctQn44hY802GpxD32CLLZrcpBqRx8q/6Pu0ddVbDVe2l7thVxkE/
         XOyjrb85UfcKNIV5nH3RCa4sdCYid2+oKSpl9o/HNGG9SgN4FvwwK4eiVyMYVPJfXLPR
         3rhQA4K/Y0HNgwduLOvulKASduF7kvDMWGQZRUtX9lvAn6l7SpLsa3Jh/5Wye+QHAc4V
         Ebgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJal6zY8DzVlZERvT/baHzRbKlhu4zXHBYN1HlP+LdY=;
        fh=0UKhUVOH4lhCAkeWve96esTSig2Hvuc9UzR/k9WFQD8=;
        b=HhGsRmoVl/cd5xZnf28mcsZj4V1pvDJlrccdkba379fVS/cDxCtT9CouaEFCtD+JjV
         /ZZsiucy7kWCPlR3m2Twad9OdHoJQD7LacKbSVixlnQzkKM7VI9EX0kSCWsQZ41ptRaM
         yXBJAQRdJutWM1zvSh1KwDs/9rJIhCkfQW/mLFiQqPHJ7nFWPpyAhf609kjo4emQ0rLa
         K+A6WckVKXJd/bDiufeAQVI/yAuF8rGA9ZCfI4Vhy6mQsmRr3h+ITBFqUv326OS/qbrc
         D1k4tvs8pLeC6Sr5+0sR6njnCV+dnBnWjTeE9wg6DDvWKvKb+uI2WjtztoprqeNYwKLM
         ip2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775845454; x=1776450254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJal6zY8DzVlZERvT/baHzRbKlhu4zXHBYN1HlP+LdY=;
        b=iIcbLRkol0GjO2Vqg4DjEfXCRn5IDJj2/Yx7mI+yyOyET1qhmx0rsx9JHhPayC0YoH
         jbhegpPGr6enzOM6JDxizowcArjzxCD1zdh0k0ykSUOdPcjhhfJOD5H3tI8c94DHUi5u
         XVQmnE1wq+RucEqzJecrBrjAvrrjKScBh/NY/XhlgAatnwD5UnQfEDAef2EuMjR5Uip/
         m3Iur6YKmcouXwih3JSeUYin1ciFcQ4J2rDyTUfTArJ+FM1ht7MlQurmc+Gd0ZmcnXsM
         9GpgaHVIcByC78OOjZEC9cmcXQVP4HQZRJQ2TqY9/hETX6emysvJfBSCm60VnOLXNKMC
         FhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775845454; x=1776450254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJal6zY8DzVlZERvT/baHzRbKlhu4zXHBYN1HlP+LdY=;
        b=D2mkODG3sRShq/ZHJYvwc/mrJu1AApKOSnfimFUrjR9EZAuynukyodR1anNyu1NwrD
         1zyDfDaqPzi/ezprt0Q7T95dyOeOSehulpXwHeCDi1s+FxkRf8MAqc0nyWVaj4L0xLRy
         Wccn66btHx25+tNpCyGRUGF9Cvsdbp/SyatPrmdVeyao3MRtQPhRaFXOmgfhpBjBqjRP
         eVKuD4iMhdWfBpcHlCcf0/l6NnwXyk3WD6+4BoJB19lg/n2cBh9t/Ux4B4roQ+dw0E+E
         ZThuQIfD0dAM5hrETlBteez8YpWWsajivTmYcaoHiorjcPcbF6SOL2w2TV4ySpib4XF/
         qkmg==
X-Forwarded-Encrypted: i=1; AJvYcCUh3cUBKrf/wXKDMx7COtdUSfppyd4IWdDsaHVFhfWWvMCDohqHRwAudmRGM/EzXuhHpUn2rzOQfxGV@vger.kernel.org
X-Gm-Message-State: AOJu0YzHiPdXxbIEz3l7zRH4GutjBQp9KrA+OjQaAY5tGmzzRwrwpndm
	Q63Ng5F7BmmM0Nd4YLVErlmzlUJBoGoPnHZAtxbx4GO5goP3giy9pAvnO39KmosSv/OPvu5Go58
	fT7X56LWWFGdLbyCu7CxAiPtRkNLWN94=
X-Gm-Gg: AeBDietzzkiXoN2rqqeI8/ot6bLEvm8UW1mTit/OloPNBuW3h9dL3eZbaQV1/r1fmiW
	GrFFGQJgZ4fv61MyuIwA94Xu51kHxVFUaRKzxiONl8xbdn2HVjIVRAfNUMtsqXjmgTrVI0XA7vk
	5b7qrMTSh8gE+Yi7slfTejg0ma9Y7dYxSrHOp5jnHHH7iuXYw2Juq4iZkrZLGckbaY5cFOy5zFw
	GErSxMI1IKTqVc7H4BB9ZQAqgvY/071jlWrvBrmT+kwzvrrTY2O6lg12rrom3DNjYS1tLnqwCFf
	/O4Q7jIx5FKN2Qxa8SWXEpNdOCS8CHRLqjglSKdeHjiaEj3zzKOR8o654MSDlSD60GS2sPWm985
	1xtCcLlUf+7jhzAaoKnzb3vdXbYZ/JIZ32ZQZ
X-Received: by 2002:a05:690e:151b:b0:650:3124:b8c9 with SMTP id
 956f58d0204a3-6519905ad2emr2529277d50.20.1775845453876; Fri, 10 Apr 2026
 11:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026040730-untagged-groin-bbb7@gregkh> <20260409190328.GS469338@kernel.org>
 <20260409203235.6b9329f0@kernel.org> <2026041026-excuse-slashing-c4ee@gregkh>
 <20260410102827.GT469338@kernel.org> <18e3df62-34f9-4de0-903b-19919d7ae2ca@eastlink.ca>
In-Reply-To: <18e3df62-34f9-4de0-903b-19919d7ae2ca@eastlink.ca>
From: Dan Cross <crossd@gmail.com>
Date: Fri, 10 Apr 2026 14:23:38 -0400
X-Gm-Features: AQROBzBxfq16lsxWS4FbNmSiSUcjbWC2_Z2j86CJK6UrfqmFioX4ACM672Jt4CI
Message-ID: <CAEoi9W5HOmH3AdCEjQqDo8f7=525k9HbvByiFhiWSmG1LmsAzg@mail.gmail.com>
Subject: Re: [PATCH net] netrom: do some basic forms of validation on incoming frames
To: jj <ve1jot@eastlink.ca>
Cc: Simon Horman <horms@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org, 
	Yizhe Zhuang <yizhe@darknavy.com>, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 11:49=E2=80=AFAM jj <ve1jot@eastlink.ca> wrote:
> This is NOT an obsolete protocol..this is in use by amateur radio
> operators world-wide...we use it for RF comms usually, because what
> happens if the internet goes "down", we can still provide comms over
> slower RF links....(plus it's a fun mode)please PLEASE do not drop...and
> sorry for the noise...

There are at least three separable issues being conflated here.

One is whether amateur radio operators are using AX.25, NET/ROM, and
ROSE.  They are; that's indisputable.

Another is whether those operators are using the implementation in the
Linux kernel.  Some are (myself included), though many fewer than are
using the protocols generally.

The third is whether preserving the implementation of these in the
kernel is the best mechanism for using those protocols on Linux-based
systems.  For that, I would argue that no, it is not.

Taking just AX.25, the current implementation has known deficiencies:
it is buggy, implements an older version of the protocol, and at best
receives nominal maintenance: notably, the newer networking tools
(`ip`, `ss`, etc) meant as replacements for `netstat`, `route`, and
`ifconfig` have not been updated to incorporate information about the
amateur radio protocols, and recent changes have left them broken for
long stretches of time.  More details are available online, such as at
https://blog.habets.se/2021/11/AX25-user-space.html

There is very little to recommend the kernel implementations, and any
unique functionality they once provided, such as IP over AX.25, can be
done via other means in userspace; e.g., one can use TAP/TUN for IP
over AX.25.

Therefore, it would be better to remove these from the kernel, and
implement them in userspace instead, or use an existing userspace
implementation (e.g., LinBPQ or similar).  Backwards compatibility
with existing Linux applications that expect to use the sockets API
with amateur radio could `LD_PRELOAD` a shim compatibility library
that simulates the current programming interface.  There is simply no
reason to preserve these in the kernel, and bluntly, the
implementation is pure drag at this point.

Note that this doesn't preclude anyone from using AX.25 et al on
Linux, or force dependency on the Internet: it just moves the
implementation of those protocols out of the kernel and into a normal
userspace program, which is arguably easier to maintain and iterate on
for the ham community, anyway.

        - Dan C.
          (KZ2X)

> On 2026-04-10 07:28, Simon Horman wrote:
> > On Fri, Apr 10, 2026 at 07:24:36AM +0200, Greg Kroah-Hartman wrote:
> >> On Thu, Apr 09, 2026 at 08:32:35PM -0700, Jakub Kicinski wrote:
> >>> On Thu, 9 Apr 2026 20:03:28 +0100 Simon Horman wrote:
> >>>> I expect that checking skb->len isn't sufficient here
> >>>> and pskb_may_pull needs to be used to ensure that
> >>>> the data is also available in the linear section of the skb.
> >>> Or for simplicity we could also be testing against skb_headlen()
> >>> since we don't expect any legit non-linear frames here? Dunno.
> > Sure, that's find by me if it leads to simpler code than
> > using pskb_may_pull(). Else I'd lean towards pskb_may_pull()
> > as it is a more general approach that feels worth proliferating.
> >
> >> I'll be glad to change this either way, your call.  Given that this is
> >> an obsolete protocol that seems to only be a target for drive-by fuzze=
rs
> >> to attack, whatever the simplest thing to do to quiet them up I'll be
> >> glad to implement.
> >>
> >> Or can we just delete this stuff entirely?  :)
> > Deleting sounds good to me.
> > But we likely need a deprecation process.
> > In which case fixing these bugs still makes sense for the short term.
> >
>
