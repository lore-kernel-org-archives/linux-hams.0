Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029213E022C
	for <linux-hams@vger.kernel.org>; Thu,  9 Apr 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775748583; cv=pass; b=RtTo2C+C79H6sK0u16ioGyPkE0hknpEGdGDB2JCEmfPMl+q6nDMn5G/BdlDrhbqAOsq8ZVgYsgHP6Pq4ZFNFU/aY4mGRHobE8tkpVXQzS9copNy/J4okKhSgmijMaYGhSkrNCokw0PSD9bmv/MFm6XFvmrh7WKxJVzhjjEXZ0aY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775748583; c=relaxed/simple;
	bh=x9GSh3Zm4OXtSq0jQU3rRGCdIRW1ZWbDoaw15nWkSWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoIw+K5CGDA+dNCBwmNcM0OBm/FPY2GJV8HJQNv7MIWC9aLsoqdQLzu57fAX92bzUgwTMdpq7H3r3QvUmUde8rbv5M5Nlw+ytXbGGUqCwPB01BbwKO9OhAPQ4WNMBC/nXZ0OKsu7PFjos4yiMX4FmtHE5FkPWQCX+rDTHGJPGeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ILPY4gfn; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ILPY4gfn"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79c20063a32so11516417b3.1
        for <linux-hams@vger.kernel.org>; Thu, 09 Apr 2026 08:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775748581; cv=none;
        d=google.com; s=arc-20240605;
        b=Zi95O7ZPAJ0RQ8dtT2BLAE28RSYyir1GTY76/4CH1dAoCLLU2Ft/pk+ZZfH3heXIgC
         k0DkY3Z0rzcuu1THzb0kdAb8n3mc/wF3cJFiyQ+IW/wfU57F+reNH0GGnV8ThsUdVQBH
         GhEmeiE0EXa1qZ97VTJvkpCSvKQapMm1akLkq1HA+JYUGXh+2VRNGqKYcKWwpOk2PzR0
         al866t4tH8JVVt/9PKxHNA2pj5l7YtjZzwylhZh80ZmDXosyOZUX5CPvRBtYWvNd3mU0
         ZK5xjJ+HHtEFTyeV3u83oQFtJvE3okL3XY6FVkqfjsNphevNCR19aV80awjsmHHMNh59
         JLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x9GSh3Zm4OXtSq0jQU3rRGCdIRW1ZWbDoaw15nWkSWM=;
        fh=PiJl18J/fJ09Q4lTC2LBbC+Mv5ugN/rBqCcUBOkQR1c=;
        b=h53ibvrDpOtPl5d1eIhqet/u/UIzH7yplN5Ra4U7H5E3kOgubRR6F9ZQXYU05Hj4Qy
         +XoI6D71CTJtGuuhnPcqKxrXVRkUtDZ0VI9USzzdtoBCDCcPG3/Rd1REe7Cbk0lck4B7
         2TwAclnLy4BoiXddKYP+NuoEQLWQjSEhA3QRq8BwjX3yyAFre/yi3jOytt8bMEq35oyW
         wUzLu9oTDRmU5MB3Xu2z1Oa7t1+RlwNVzxsYUwVVg4q2wOWz8/eE3uzJ6l3Lt88ETL7x
         g9vzs3nDaWkZOYejpuvOTtuQbWNaapQOYuSV+k9OQn6arr2NUKw2ipa5cT8cLxU2121F
         wQdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775748581; x=1776353381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9GSh3Zm4OXtSq0jQU3rRGCdIRW1ZWbDoaw15nWkSWM=;
        b=ILPY4gfnkD1neKTACXCPfDBy3nb003/b0VboMViRmHDVMI7BDA4VAbXfUZ6k32AzvQ
         60asBlPnjaoP73hbMJgr8eO4bI7VcICPSDDKr2ctqm0T8n7Tz6UtTA4GakAL71jtl1S9
         0sPAzgDFtom2PqZ5o6swsHALxnMOjMC5an1AoGxPKrwNTialFqIRU+LkeMigVbUBrric
         v7GjlhDZIfrUncmk+E71ULb8SHaXKoMKPngvh1j6DWJZrnNc7pG517piXtk79ma23Bvu
         dlz/fv+OeHpVgPdmpQ0N1ysvJcCYL2dBDcTmL0RFIMkDNpL7A5vwtZ0xtX1dac6GDS5c
         T23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775748581; x=1776353381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9GSh3Zm4OXtSq0jQU3rRGCdIRW1ZWbDoaw15nWkSWM=;
        b=id6m6Qo6J83CETJoDF5m2VlI1FNuB8rzY8DsbdVsaA2QIPHpWe4oP2DlpovMQOm31r
         hcOdhPH6HXX0PfGMJA/bdYVB8Qe8Qyv17xkUIrX3UhDWRvL+NWVW0ik+UmzdkvNZ7TwV
         HE2sCcZ2AtdjHakWGMRDNtEc8gqh2XJRdIM2ucrmMmPvWeIYpsgb1tBA6Gq5P0VvSqY5
         8YtgCqPPRqFW9/z8KbWwKvLS3q9EQ3Ypu9SZoGO/kPVgZnbhgN27+WoDDtCan1pXWU6i
         VcMPH4/2NM+J9I9Czl2VRzdLqnt6yVZM6CpBDIwfvuEGXfBqrBuir+zaVN4W/mEFsQuM
         UYYw==
X-Forwarded-Encrypted: i=1; AJvYcCVelJDUSNfgoTouN4LRdfYD8GkY2n0YTVH21VJx6srp5zBRHWhN1/UyFTKBQwch3DuSYHeaMnipiaT+@vger.kernel.org
X-Gm-Message-State: AOJu0YwlefpKHoOltvPjgBniIty0I3aHlMqRmQqT7bFurQPb96mliqnS
	tQzdCxhb5W8To0LHIKFN/734urabGDAB94ghWeIeryByp0wdzxBcbI8qAPrJ9/cOyNASXmRBLfp
	cSICvixnOJL5YcuemKagXvstWSVyV878HqlV92T2H
X-Gm-Gg: AeBDievfInkmjNAjEq3GLjwcEpA/lj9iAUaz98DrZiB9ewSp8GoKrCx5Bq9+cf6jDN9
	lGFPbpAcjV+jXuWsY0hpo1ENf5nNKeZUsl7PQS1YT2d/GJ2sz8tp99+eNMp8/DgMvLr07aiT2C+
	HrTKmlt+TzDMb59RVm2rtCKLJ6gR5S7pffGdvqLTvFGe4XyVGYFZ6QVEfKpWkv/gc1VIRCDG+Mz
	p5b27v6xlTlayPwcGXbE8dYuyRg0BAjs97eSHM9k02GA6dEN93czFfi8lfje4j9WvlStT9+C1Hr
	jDKzPxlf1vgEOU3PoA==
X-Received: by 2002:a05:690c:f16:b0:79a:c9c1:eb29 with SMTP id
 00721157ae682-7adeda869cemr37882417b3.19.1775748580519; Thu, 09 Apr 2026
 08:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn89iK7bzV0VpPsP5nu0mV3GCsN5MOZJgc_s8a3B2X6Ui6mxg@mail.gmail.com>
 <20260409152400.2219716-1-ashutoshdesai993@gmail.com>
In-Reply-To: <20260409152400.2219716-1-ashutoshdesai993@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 9 Apr 2026 08:29:29 -0700
X-Gm-Features: AQROBzCXDPlzFz1E_DesM4BAdot9Qun_7KfOdrYkd5ipizEicj7MBWk01jC-U3U
Message-ID: <CANn89iJL9VNa=Rj579LZgD_TVuqR-hq77RS5hf0yaDzwgnUR0g@mail.gmail.com>
Subject: Re: [PATCH v2] ax25: fix OOB read after address header strip in ax25_rcv().
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, jreuter@yaina.de, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 8:24=E2=80=AFAM Ashutosh Desai
<ashutoshdesai993@gmail.com> wrote:
>
> ax25_rcv() calls skb_pull(skb, ax25_addr_size(&dp)) to strip the
> address header, then reads skb->data[0] (control byte) and skb->data[1]
> (PID byte) without verifying those bytes are in the linear sk_buff area.
>
> The original fix checked skb->len < 2, but as Eric Dumazet pointed out,
> skb->len counts bytes across the linear head and any non-linear
> fragments. If the two bytes needed sit in a fragment, the check passes
> but the direct skb->data access is still out of bounds.
>
> Use pskb_may_pull(skb, 2) instead, which ensures both bytes are present
> and pulls them into the linear area if needed before we read them.
>
> Suggested-by: Eric Dumazet <edumazet@google.com>

I have not suggested to fix a bug in ax25.
I added a comment on your initial version.
A "Suggested-by" would imply I made the initial discovery.

Please carefully read Documentation/process/maintainer-netdev.rst

We require a 24-hour delay between each version.
