Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F4137D103
	for <linux-hams@vger.kernel.org>; Sun, 12 Apr 2026 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027955; cv=none; b=XMpAn3oKuyWnuqQM/WID3jXzWEHKL2yIQSW9rnYsDgHnHA8wnD1flFeyovBZlJC69n7jX1Jh7HP3YBQW3MAmhACparGhQHYqnN5NEoFBPEqq4z1e1aQcqQJul6egQTt0ThJ0SSdd0onG3lGuXqVnjRKa6ABlsMUDdarqEoIoZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027955; c=relaxed/simple;
	bh=k5ZKS5bxKy4MgmVAc+GCJ3Tk+4qPTOxySr1pCRVb4IA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbE4Haesi8HaFzk2xv3MchWL9h+SfFnDrydjkor1qDKHoWExN0hcXye137nBgfbpW/EcX9BpqB2kxI/XYdgl5PAs6WZB4PV9UCZ8W/XrczSkLHu/C+NAM9y8WRoygOwZVGm2ORnDPPFDUS/HmXzKVE91odiAGCFVHpYazhicrco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zcki0jIW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zcki0jIW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4888375f735so35398315e9.3
        for <linux-hams@vger.kernel.org>; Sun, 12 Apr 2026 14:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027952; x=1776632752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2bXvfxILkSU7t31zekepUZRWIgQtvcFV4bhds98FtQ=;
        b=Zcki0jIWnM3Oldv+0xSuR5YAW6sqEYNvJ2X1JQf9GlbGTgE92x623+1Nt9qpNjxzVC
         XsHXmZQTuKB/hw2IkdMl++vBXAbQKoyh3n/3zG2nOFPgfySO0ehtVLfEIi3AIVEiXw7l
         Oquo2DFRegVWy4our8UXdp9EWLjjJwxxL2lqt6xLdvJ9FPO0srKfAKH7Leacp6p86SK5
         7T/TfeED55laDtg6eQkkVBjW51lTE/9A6gQESk7NsPP1uraMXLoBT7kIoJNGarS45qtc
         +oyMmu6IeB3nvGqa7Kek7n4FbFIZUq5bnEzITrHYt2wo6QynKrCklK4ZdYHJe/ljRoOq
         i19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027952; x=1776632752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2bXvfxILkSU7t31zekepUZRWIgQtvcFV4bhds98FtQ=;
        b=qlczwPEJZMcCKjE+HnunGC6mtJKv3eFogf23a5XN5xvAbrRPSEzJiZwpzh03MsxcC7
         9UYUbrEXzfzAzHorx1U6zJPSOsn1vQswjlvUX+hNVDbjpU5KRoIb+FZG5088xu6hrXqC
         m1uZ093zAIq+Q0fiSFHkZsa/NKe54XcRDZqdce3bM5QDk0klBivTN1WnqKRD2ETmdmCB
         aOElgaeeFP5dIoqRj4STdzPlALTksRQ6jkmr8KNwA/7bLEcKyJrumwd57suHSyxo6X3U
         sSbWoDu0blpdVtY07wnWFpY2NT+YmiaTIQgVt/o5ROdD3J+/gvkR1H9g08l7SaPQ0L/1
         C8eA==
X-Forwarded-Encrypted: i=1; AFNElJ9YbqTGyxG+clQrusXORpQ5I2BOWiYH8T0xJ/o/ivEDIVtdicyo78cZas3erfZajkRsngvZ/L0x1Hql@vger.kernel.org
X-Gm-Message-State: AOJu0Yzey3JW/JtLcvbWKCiulmBlDkbXyfGBHWXMwJrS0sAgn7cYfdRs
	XgTJjnyvjXCCjTcOL08D+CjvfDB+VHwiLX16K+EMxHZCcEY6ikCx+qdD
X-Gm-Gg: AeBDietvUdDoRiyvFv9owY+HbGnSnP6BAHybmSfLdL7/saOeduKG0FMdAZjYywyTig/
	qcRTwXmCk67zNsPhLSJ0bp5/n+zIToBF7fq3kZMP/B5s0MvkKj2fwnfOYBolCm5QYK+FphD7+/A
	AkxYhaqaHCSjQpMI6Y3b6LwCQlK9r/vGNr54rBHJ53F/HAOpxf0bKYOen2ZDCQVRhrXXe4W6q4S
	/L4qB65nKufPEJGTZGixQg966iloBxVkAuUrDxVJXfaaMGl46lC8qa7j1ze+xm5Dm4JRzbNI0Rt
	StdX4wKdI0gR71z8izE+eT0eB7UWGNLqpuoMdJ0eX4XaFIYDX6+DQy2H2TDawCShEIjUwbLlBFo
	frs6qCaKEx/lkNQ50imntOcKT74VNS5MaJ2Lg6iLqqfxauprp6lNNNLSgX/y/RJmy/9w8QSFpFW
	H9TT7nIp01b+l3O4JSJLg4KhkWoia8znXLUTwQKbCTCn2yXRxd50cJI3Z28Fp4P2GhOGKiPw99C
	Dw=
X-Received: by 2002:a05:6000:184b:b0:43b:62fa:e3f0 with SMTP id ffacd0b85a97d-43d642c9415mr16793813f8f.48.1776027952273;
        Sun, 12 Apr 2026 14:05:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec27fsm26564853f8f.11.2026.04.12.14.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:05:51 -0700 (PDT)
Date: Sun, 12 Apr 2026 22:05:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mashiro Chen <mashiro.chen@mailbox.org>, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, jreuter@yaina.de, linux-hams@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 net] net: ax25: fix integer overflow in
 ax25_rx_fragment()
Message-ID: <20260412220550.0f35f5ef@pumpkin>
In-Reply-To: <20260412131751.0e90a053@kernel.org>
References: <20260409025026.24575-1-mashiro.chen@mailbox.org>
	<20260412131751.0e90a053@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 12 Apr 2026 13:17:51 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu,  9 Apr 2026 10:50:26 +0800 Mashiro Chen wrote:
> > Fix mirrors the identical bug fixed in NET/ROM (nr_in.c): check for
> > overflow before adding skb->len to fraglen, and abort fragment
> > reassembly cleanly if the limit would be exceeded.  
> 
> Same problem as reported by Simon on the netrom patch applies here.
> 
> nit: I don't think you need to cast ax25->fraglen to unsigned int
> in the comparison. since it's added with skb->len it should get
> auto-prompted to unsigned int.

It wouldn't matter if that comparison were signed.

Or change the type of ax25->fraglen to be 32bits and do the
sanity check for overlong packets later in the code.
I had a quick look at the header and the structure hasn't
been size-optimised...

	David
