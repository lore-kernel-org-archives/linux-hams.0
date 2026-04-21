Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA87386552
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 07:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776756559; cv=none; b=b4uzmi41uagGwbmEruUrdPw0DMQ0vn3I9zfOCDjk8nuw/LKaF64US8cho5LaZYZ8DAjtAIjbf4hLNQe3USv7N7LbDeL3vzy1I1ajbH1e1MuIGmkgcNBid9GXBaB8/0qO3bpD132PXRN6XMvKTVlrEGF+aNLFX/EGc1HKlKKFLSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776756559; c=relaxed/simple;
	bh=EFB5UkHyueGfQTFQHUNylRK3bf8BxDDdh3vlHZTjHpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFOi78Y+XghI2b5b4S3xU2R5Sbd9xbNQlt2JN5Fm9fPG1aGBKhnWkFUkfL8+8nRkg9ZvsA9WB2KKDLR0GaorRrYvdI6pKf22wNn23GGNLceTt4nyXSq+JPPXsoH6U6eAFQ2vDLWPh4Z1ZByU8zCM03TATRWbNdy7vJ2z2wohxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i6gi4OEG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aLpnRslt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i6gi4OEG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aLpnRslt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776756557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iRLdvmbBl0X69xNsqP6IUVqffOA4KBnsa7u+Y5umkmA=;
	b=i6gi4OEGqyxYkgWWydK0S4EJ/Yoa2JBawn9ooJ9AlUEP6QZp5ymikTpjSsB/cGhWnpijgB
	N2XI/wS/i+fg5zxQJbivA2U9ck6P6id3t345fJtNBMwFZc/RjjzNX1x8b19Z/fmYud+1+S
	cp3rUzb/q6F1wHrnL/8CdmQItNOqRfM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-iq1wBntXOnGW_vJVvv4XLA-1; Tue, 21 Apr 2026 03:29:15 -0400
X-MC-Unique: iq1wBntXOnGW_vJVvv4XLA-1
X-Mimecast-MFC-AGG-ID: iq1wBntXOnGW_vJVvv4XLA_1776756554
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d744128b9so3199641f8f.0
        for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 00:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776756554; x=1777361354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRLdvmbBl0X69xNsqP6IUVqffOA4KBnsa7u+Y5umkmA=;
        b=aLpnRsltrztVRlCtjci8FSoUzVYgW+yjAcPGJkH7+yvK+Ef3fnpQW1z2IjmWvj2tQd
         T6CGexBxk1fNVZkaX+88hhB0Oufjd0XOp9IuYpXeFXhPk9hfhXUbzRB1TVwsmPO1IQ+Q
         42HydizFHIcWf7BGQMwOAp8U8dDbsOdBULmqX20RMduOYUbXdOkX2LFS14MNxWwML1DC
         by3YVTzgQY7mt88cz96zf3c8uqsDCdOuobJqrBrWXsTovoG37Fz7qxwIboBNhs0rTWbx
         V9fzzLm4GcPlJsZN0aCl4x0hu+IZHhqvCNJJuvRlyFSOO71YPqT6SLltT7/K8EPx8cQd
         hwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756554; x=1777361354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRLdvmbBl0X69xNsqP6IUVqffOA4KBnsa7u+Y5umkmA=;
        b=RL98jdstSW/31iRhkQhoxQ/8G0fnKsGgoykcloQ6DLZR8D9y1ja/h4y7/v093+6gOc
         nPNqlnSaSOUwnvVJt+fiyhqtSkeEMESTYenP8hAyUoz55SKfWTXh7zxrVusJy7Dz5C9x
         NudoXNu/oXLKi6YKnof3vRHGLUiCPTyM2k7KkLYQyTxAAABj3FbBeuMfIeB0NknOPxMa
         lfNMVuGO5+Tb1cfQxZUJbG+BIuiMLizQoYEAwax/KVL/d6t4dD2mA4RIBZtm26VQciaY
         8g/EkQbzTXSe9LXhPQj9oXal9HsUzbSuD9JpN7UJMdaDg9hy7JOg7gR7PzdAlVh0WjdO
         BHGg==
X-Gm-Message-State: AOJu0YzNMqtYVsuuxqIn8Pg44/3zZvBNwcZHBhb3B5H/cJF0CQ1fIx5u
	1o1KvDbldTJ1LY2ZT8M4VaTNZFKIJy06Qs96ReVHqH7SUSgHoL72BRd+PMXMygRrbvxh7oUX+9o
	9TpEM1/eLfx5vNmO/zFFejeKnncUHsrTnrtiv0xtVku0pGxqGQsNJdPTV1ivuVMQ=
X-Gm-Gg: AeBDieuKBASntU+mBLst327uxK3BZc7053MEvkgCen75s1wm1RQcJtXtGhp1UC/YBPV
	58zqN4ys1b2nMPrMQY08xlhFbTX51yzO4zgafrwizqPqsVipuQgY0arqG79ZukIVUCy7eV9qMLe
	C6DyKuGDw8v3ug30/JcOCS/X8mUwlfodaO7QgMtL0HbJzqlarpRIOrviYErUVuh8fneQmk3zUHI
	gXfOyB5a0lQw7uIsg6oVJhr8m026qCGjRaNNkIXx0oSbwJP1iWZYaO79hzn7TdR09cx2S/HcAEb
	6WK37VZL7IacP/wAWrooOxfoshb1GFHShyElR+fBiMUBku6LOVboRPGv0ZkJzc0eyHlcIRg/Py2
	2lMUYLAfciyfSqTSMaJi6h/QjdBXNZ3++H9yL5bL64mogtasY4N/88R5WLcUdrusZIPA=
X-Received: by 2002:a05:6000:2289:b0:43c:f793:f1c5 with SMTP id ffacd0b85a97d-43fe3e0c63cmr25969217f8f.34.1776756554230;
        Tue, 21 Apr 2026 00:29:14 -0700 (PDT)
X-Received: by 2002:a05:6000:2289:b0:43c:f793:f1c5 with SMTP id ffacd0b85a97d-43fe3e0c63cmr25969163f8f.34.1776756553771;
        Tue, 21 Apr 2026 00:29:13 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm39362379f8f.6.2026.04.21.00.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:29:13 -0700 (PDT)
Message-ID: <805a8583-6a84-4dfb-a4d4-53f80f50effc@redhat.com>
Date: Tue, 21 Apr 2026 09:29:11 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net] net: ax25: fix integer overflow in
 ax25_rx_fragment()
To: Mashiro Chen <mashiro.chen@mailbox.org>, netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org, kuba@kernel.org, horms@kernel.org,
 davem@davemloft.net, edumazet@google.com
References: <20260409025026.24575-1-mashiro.chen@mailbox.org>
 <20260413204921.70463-1-mashiro.chen@mailbox.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260413204921.70463-1-mashiro.chen@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/13/26 10:49 PM, Mashiro Chen wrote:
> ax25_rx_fragment() accumulates fragment lengths into ax25_cb->fraglen,
> which is an unsigned short. When the total exceeds 65535, fraglen wraps
> around to a small value. The subsequent alloc_skb(fraglen) allocates a
> too-small buffer, and skb_put() in the copy loop triggers skb_over_panic().
> 
> Add pskb_may_pull(skb, 1) at function entry to ensure the segmentation
> header byte is in the linear data area before dereferencing skb->data.
> This also rejects zero-length skbs, which the original code did not
> check for.
> 
> Two issues in the overflow error path are also fixed:
> First, the current skb, after skb_pull(skb, 1), is neither enqueued
> nor freed before returning 1, leaking it. Add kfree_skb(skb) before
> the return.
> Second, ax25->fraglen is not reset after skb_queue_purge(). Add
> ax25->fraglen = 0 to restore a consistent state.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Mashiro Chen <mashiro.chen@mailbox.org>

we are moving ax25 out of tree:

https://lore.kernel.org/netdev/20260421021824.1293976-1-kuba@kernel.org/

please hold off until Thursday (after that our net PR will land into
mainline), and eventually resend if the code still exists in Linus's
tree at that point.

Thanks,

Paolo

