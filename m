Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219F23C8C7
	for <linux-hams@vger.kernel.org>; Sat, 11 Apr 2026 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775939606; cv=pass; b=ZaYbiol9H9m5IT/JNe3yXoKgfDddZzuVhTio22SplJdJv6MtvnaveX1rCCYUabb+2znnUZSUiPhg2jyp4H7aqktvYet4KDD8Gk/0vqy5nf0KwNOtIiiVZ4SxG5G0y/lSfA4i2WHa1Vbk0YqiNx5jTffYM3NCrT6Y1za0Q+JGsIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775939606; c=relaxed/simple;
	bh=stUxAk/UMqLZRW7gIM/oYk4oFTQ1kRZpwHgj++FtDZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FncPdPasxnL9uCGZc06N22dar+z0sXVZYyKu0pamDoXCW/04tpaD9dKW89B0Nh/UY1NZtV0Viwj87o62+bFmG9Msn5AFGg3kcyYUGRKu4RLx5dsRS6c1vrafsSESCAFkWpKmbfIeZ3kPXFRD7WHi7p3LQkKxMrVH9pQUpJO4P4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jISlVvnS; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jISlVvnS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50d876329bbso34599681cf.2
        for <linux-hams@vger.kernel.org>; Sat, 11 Apr 2026 13:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775939604; cv=none;
        d=google.com; s=arc-20240605;
        b=MA8VaXc526RqbPGJMtFKauFCGAs0YHf6hHqNQod7E1mm6p+uXyNp0/FiFDo5nrqQtx
         8Tn7j+4fvLoo0bWfh8rqMFQ3nHW67pD9QPiD/o0iq+fbWbhafkQyDulrX+162l3GiWF7
         SK7wxUM8dtKBVquo3YJPKSnMz5z8SHdNU4VZ6Ku0AA30NLILiRm0vLoyfntox/XmAg+j
         Zl33OIhbdduL8nS3lWZ4jpn9Juxc0Z8CqbP4v/iXoFoyyp9hyCtABto8Adqvb57Qprq0
         MH6ucjC6Pp69zj0G9dEwera0GyMxKjWWg/NECKRfmqgnnkOydsXo62Yq5U2GVmPcbAyW
         Nihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbYPJS5lZrojp3il9+9KagoVrK8OHrWbLRyBn3DiYtM=;
        fh=/w9kWcu3u+jn4uf8m9N9/Z4dAwebbMcjFt05PREvkoE=;
        b=jdXeVIFd7baaennwgY5OScGgX9cd7BnWIxwBtoeb3AsEReCx65FU1uT9Lc70zeVZoI
         K/ZUZPk7YYYfW0U0bItN9I5otmoP6zW2J0elenCYg6h4z3d64SpetteAUArGXN1brXYH
         iUC4W+PRUJ2OkBlkm3qpnunuZ85c6Kb+UkFIziaZu3jsPcITe3h6ctLYd6fOKyAg/7Ro
         wubZsdPkYerOuMwQ7g7R9U6DduX3Y5WGqYbS5v+Ld13PFrI0pS62x3273/ZMrOHCulAE
         Gd0PACxvafbN1yokx0VfcmB0Vf/T/4w2RwgHlqi0PIZtBfzJLmz8DmuLcfzvgs4iFtFE
         7Mwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775939604; x=1776544404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbYPJS5lZrojp3il9+9KagoVrK8OHrWbLRyBn3DiYtM=;
        b=jISlVvnSPXrMQqrc5tSZ0yM9hpu49ziY8xATLgMmlIcYJCmYkVaOyweAdmCMk0FIxt
         +QL/fYLI6jTw+XPxx3TcJ+2SGR32SLkD6Ajs0qG+SLodNUbhq9o169+U70FaKksyxKR+
         n5Mt/Ae4GU/lZoTYHHXCkDnturoUgplf8vX9kPAyFwZzzz+Jt6WDN7seB6L37uibRQA+
         xBGyojRL0uxp4/y+hb/KaUo2EmQw27y3ZXlQLrOsj4B1JK6z6oPO8QGMOUDl4PgFZv5o
         cNmpgC662Jj98mxGooDYR5bOvpMrSDICFhiNu5xYjgZfqSjhmyEh3cRNBuAiaXAjPvpX
         Doyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775939604; x=1776544404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbYPJS5lZrojp3il9+9KagoVrK8OHrWbLRyBn3DiYtM=;
        b=ZvMVojsJJXXA89vGTOYoWijW1i9HaPPwWwRU94FdBgEKcornscHX7EkK7Ee+Wip2qG
         vjDL5pgYtsrnpVSAiq3BJMX8HCfKY8LPkQfoHTvBcBVe8Z+suKusptVwR39/QKnHNxe3
         TaxaEKqehARjlcwRl3PjxDTFHn5vCPHPJHqwQcy8qIcZTYlthZxY63UaLQmE85yYEfRp
         Bqkb6aFct7MOAcT/DKgxOj47ZAXWTYtY//Qgv85wpgM6+KJ6VYYD1gZX2vhNwwVttoBW
         ksTNUbdjwHEDgrkdvLoWiT0Ub2aHLQ8GtePpRnTuBF4qmtBalTRLGEuvzwAA5h0rNZ8U
         W4+g==
X-Forwarded-Encrypted: i=1; AJvYcCXofDda6/5FH0T81MrIQCjHEbjQoY0sFF47nSXszjdmGaAjBna58DmB+Z/9wO9L8rn4+MF5FVJKqweg@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxACAPcrqV/xUqWbfzv3GogzhQoyDMcOVpSz/+KePYnbEKSxp
	kL+4UyczJxRiozO/uzNNbB5FSTZK9MdMXd6U6m1QHemPpLyRvV5Xx8sSNb2on06KvhtSDZVo5em
	2P7Dwo/2QZpZ7pjWdrp3TDjmjM2Ej3CE=
X-Gm-Gg: AeBDieu12r/qIYYgl9V+eOanZNCGMyNowBWV0TUqPVtYFuW+bBW1ZBOg2ceuKbrFuTR
	IFfuCsVaB+O0raKqMbdjgQqsx2+ZXEilJelRPNeP/yVkoBDhtlT2htgeqFKHxcx4cH3tkpN8Nl2
	/vz9Z+bBv8oJC5zdAfr7O3FGkjP7yC410PntCHuZmYRoyI/cQa8j0qXa+HRkYMy4HFrXJODCJCg
	WApU4CR2KM6m+3e6p3o86ooEmjlS61tZl/zZBrRzKK97xzx5SSt+JLS7sjpWWnDpJZz6NGJvNzM
	C3LYBk8=
X-Received: by 2002:a05:622a:1493:b0:50d:89f0:9a00 with SMTP id
 d75a77b69052e-50dd5ba35f9mr127453991cf.42.1775939604226; Sat, 11 Apr 2026
 13:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410145448.38253e3c@kernel.org> <20260410221220.1708137-1-kuniyu@google.com>
 <4f5810a7-c792-4d6b-9f7c-6c6b289def19@blemings.org> <761f83cc-58eb-4b4a-ba91-d11412e7b2a6@gmail.com>
 <91d50a72-a121-4b24-a559-892f8a3b3c3a@blemings.org> <CANnsUMEniMzLnp5h=Gz83=Wcegc-jGz9vqyWyEpWx-OH=Dij1w@mail.gmail.com>
In-Reply-To: <CANnsUMEniMzLnp5h=Gz83=Wcegc-jGz9vqyWyEpWx-OH=Dij1w@mail.gmail.com>
From: Chris Maness <christopher.maness@gmail.com>
Date: Sat, 11 Apr 2026 13:33:11 -0700
X-Gm-Features: AQROBzCuNQvfNSHedoiJ49QhORLxTNM3Za7NywU29Q6uUwGEHGkvN9Vg7THWeek
Message-ID: <CANnsUMGrgXei5BUKV-FqBCdTwf4LqwKns4vJz7Dx5UgSq0R4aQ@mail.gmail.com>
Subject: Re: [PATCH net] netrom: do some basic forms of validation on incoming frames
To: hugh@blemings.id.au
Cc: Craig <edfardos@gmail.com>, Kuniyuki Iwashima <kuniyu@google.com>, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, gregkh@linuxfoundation.org, 
	horms@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, stable@kernel.org, 
	workflows@vger.kernel.org, yizhe@darknavy.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

forms of validation on incoming frames

I for one run two BBS=E2=80=99s that use LinFBB.  LinFBB uses the kernel co=
de
for its AX.25 stack.  This is still excellent software that is
maintained.  I also use Linux as a netrom node for said BBS with real
radio ports and internet connectivity to out of town nodes using the
ax25ipd/netromd that both use kernel stacks.


73 de Chris KQ6UP


Thanks,

Chris Maness


Thanks,
Chris Maness
-Sent from my iPhone


On Fri, Apr 10, 2026 at 4:53=E2=80=AFPM Chris Maness
<christopher.maness@gmail.com> wrote:
>
> I for one run two BBS=E2=80=99s that use LinFBB.  LinFBB uses the kernel =
code for its AX.25 stack.  This is still excellent software that is maintai=
ned.  I also use Linux as a netrom node for said BBS with real radio ports =
and internet connectivity to out of town nodes using the ax25ipd/netromd th=
at both use kernel stacks.
>
> 73 de Chris KQ6UP
>
> Thanks,
> Chris Maness
> -Sent from my iPhone
>
>
> On Fri, Apr 10, 2026 at 4:38=E2=80=AFPM Hugh Blemings <hugh@blemings.org>=
 wrote:
>>
>>
>> On 11/4/2026 08:51, Craig wrote:
>> >> If the main concern here is ongoing maintenance of these Ham Radio
>> >> related protocols/drivers, can we pause for a moment on anything as
>> >> dramatic as removing from the tree entirely ?
>> >>
>> >> There is a good cohort of capable kernel folks that either are or
>> >> were ham radio operators who I believe, upon realising that things
>> >> have got to this point, will be happy to redouble efforts to ensure
>> >> this code maintained and tested to a satisfactory standard.
>> >>
>> >> Or, alternatively, as a technical community it may be that the Ham
>> >> Radio interested folks conclude that out of tree or user space
>> >> solutions are a better way forward as others have proposed.
>> >>
>> >> Give us a few days, please, for the word to be put around that we
>> >> need to pull ourselves together a bit as a technical group :)
>> >>
>> >
>> > I, for one, really can't imagine pulling an entire network subsytem
>> > out of the kernel without any
>> > knowledge of how/if/when it's used.  Like intercontinental radio
>> > networks, global email, ax.25
>> > keyboard-to-keyboard, BBS and other emergency-communication systems
>> > throughout the
>> > world.  If you're sure the Internet will never fail, I guess it makes
>> > sense removing all of this
>> > since it's inconvenient to maintain.
>> >
>> > Global AX.25 keyboard-to-keyboard on 14.105Mhz
>> >
>> >    https://qsl.net/kb9pvh/105.html
>> >
>> > AX.25/netrom VHF routed networks spanning from Oregon to Los Angeles.
>> >
>> >  https://www.easymapmaker.com/map/80666c4898ec6e8fa0c35add5d03282d
>> >
>> > Global radio email using AX.25
>> >
>> >   https://winlink.org/RMSChannels (1,336 AX.25 email packet nodes on
>> > the Earth and Space)
>> >
>> > This is all in operation by Amateur Radio ARES emergency
>> > protocols/technologies.  This
>> > will not pass the headline test when it comes to Linux detractors.
>> >
>> > Most of this is running on Raspberry Pi / Linux 24/7.
>> >
>> > If we want to kill all these apps and somehow force them into user spa=
ce,
>> > it's akin to just switching to Windows - and flounder with the
>> > Microsoft folks
>> > trying to do the same thing.
>>
>> Your email Craig neatly encapsulates just some of the practical and
>> ongoing applications of the kernel code in question - I don't think this
>> is in dispute.
>>
>> What's pertinent is if we as the ham/amatuer radio community can agree
>> on whether in tree, out of tree modules, or a userspace device driver
>> approach make the most sense.  If we are to keep code in the kernel in
>> any form, we as a community need to find someone(s) that have the skills
>> and bandwidth to keep the in tree code up to date.
>>
>> I don't think this would be onerous and I have a couple of people in
>> mind to nudge who may be happy to do so if that proves the right way
>> forward.  At a pinch I could do it, but that'll mean a lot of catching
>> up. But I think it reasonable that the responsibility here falls to
>> folks that are closer to the code in question than the wider and
>> overworked kernel maintainer community.
>>
>> That said, I think Dan Cross (KZ2X) earlier email makes a pretty strong
>> case for moving out of the kernel while still providing a way to have
>> backward compatibility, perhaps this might be the way forward?
>>
>> In any case, done well, this approach would not kill the apps or force
>> anything like switching to Windows! :) Great projects like digipi would
>> be able to continue with minimal changes.
>>
>> I wonder if a separate thread in linux-hams makes sense to discuss the
>> various longer term approaches to maintaining these capabilities - I'll
>> try make time later today to kick one off - such deliberations will be
>> of less interest to the broader LKML and other lists.
>>
>> Cheers/73
>> Hugh
>>
>>
>>
>> >
>> >
>> > -craig
>> > https://digipi.org/
>> >
>> >
>> --
>> I am slowly moving to hugh@blemings.id.au as my main email address.
>> If you're using hugh@blemings.org please update your address book accord=
ingly.
>> Thank you :)
>>
>>


--=20
Thanks,
Chris Maness
