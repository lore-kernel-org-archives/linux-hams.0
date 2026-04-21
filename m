Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEBC38F250
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760922; cv=none; b=j/TAL1RNURJmcs3keRJr2DbE/QiJyZSX+SyxBwpH2f8ALZFHvb5DviC6lLEFqGdqVKz2/9TDUlwnJPIDAlaZ+QQ7IB4/PtUg7SVH3hteems5d8QGSoUQfSNsLnzTKePR5Cx+3Su7MujXKGglt9WCaAfymDVX6/zpujcCdPxwv24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760922; c=relaxed/simple;
	bh=jZ5lz8/uZRKsTXv/mUPmQRlRmDWApz84x/Zjh1FsXio=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qx0jFkyoqZdIooeYoxldSmG8T/eEuW9b5ZHGFUvmHruUgHNIJMK4sSXpXt4W7Hje5pOkXiDzhq1CS3cxJsQT3QNpC9jniYaExq8BQvZeqAxydsczOdtlchdlAOfuMxSDRgMqReTWkQH0QDLKQCiLIrKT56q0KswoJmUPThSM8Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUAmSEIM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUAmSEIM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso39498245e9.1
        for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 01:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776760920; x=1777365720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBMY1466HCKMAYG0Hg/+wwmeaNUqKqMxSIOQdf9oTsE=;
        b=WUAmSEIMnHHf+XiS90mxtYEvSVn7Tuo28VFojt2yugqIZrnwi7Sl2Rxx+sAFSq9IoP
         PyhfrCvmwP+M9Yn4u0AR6UYsxXvx4aHWQAHDV4crqz/K1ELei7L0UjGQYRS5wRBArDhn
         Wsm+W6U+5Eo3h3PXVaNp1YUA1A05LPYZO4frTEfD1Mdi6ZZMeiPdTzeQCYS+HjvuY4UL
         pgXcFUx/bkLimscyq4bMJLC0yWfsnmlMQgbknHWbpD2NjbaRmjdScZOTACBbZc00yari
         r9SPXYB24zSypGbJlqhvcIEpp+lW841w0MtxFQCIz/1IKoqzuKDLMxBe+BlpZMVpWBM+
         NX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760920; x=1777365720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UBMY1466HCKMAYG0Hg/+wwmeaNUqKqMxSIOQdf9oTsE=;
        b=DelawhtPdjZddWZo3BqLl2lRn6GvPRtphUMLhcozt8ClFLZpWY461yIy81ajqniYBB
         9m/NWIMDqX0kA3dGXNGd5qdE6Sxc2aVlQ4Dm6YY4i8wj0COjJzZWP+0uVV1govln09NF
         fIAPJj36dGfx2wsLzIZao/iOUFaFhRnK0OnGPrM+CfdegeZrk4WvL6KHAEDp/pkWjSFl
         guplu5F/fGBZg127hfx/T0sZDCXrxvaW8ts9hrD6KWjFidRYG1W8xO3sZQ7haEqhbPzy
         X+LKAwBn3Davd9yJY7CvrTw3d/suIJt5ykcFdIkfv/8vZbhYKralb0rhwoj59EPFaFXu
         /OiA==
X-Forwarded-Encrypted: i=1; AFNElJ+NNsOr2ywmsGA023MxnUbTOQt3Wvm6ASinBHhcwraAT8Zh0eGjotiwa21J/HYmxtXILyAs7JQhD6Db@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4cZ0MXY04z7raplVJBqmZ/DLLy7J3LZ82Hs0KCNwC91gq6hGF
	xCbU8SWkK+4ZELohKqH+Ayx23195Cmk466Ll1EzSL+OQAjuH/ZzW1/pi
X-Gm-Gg: AeBDieuXl3+b1G28XciIvbEyfzlSZUwRdunjOs3Lh76zHIoH1fexUhneu/ey31TCshf
	FiVdOxfrFB/pLMw2PX4+BjkLEKHoog5V8mBRQtUqqPqRVg5GBYk9ii9BTjqt8fnI3VQoAbv4Od+
	pGzAfwE94+JPvkH94XU1IZbBQKVw9y3qbMnnjYondenHMllaOJdsUrGx10gDsMUs6B4DR7t7Q+N
	SQqaOPwp0i8RIIRlQN7tp5TnNgYJv1WIzPYudxa6jv0QOgHXKLT6kvgEKlsuXefatK5thMN4WsS
	VmKoAVutL0bptr5peMcsd7jy2mSyogsIFMg3p0IaDo5tPHCJOmrwM40l6Q4kzJYmZM0k7090NT3
	0ILG94lWxLkFde8Puaf1gZu8srWU0uqYS0zKlspFYWzvEg5gSvpIGZCaGVQRphUPY5udRCUWKQo
	5hNQ9P2z6Kn2btDe1xQnYH8YEHZU45QxRXK+v2vtoxteOhjZkVKcmsdl/7IQ1sL24QGyKWnb2wR
	eg=
X-Received: by 2002:a05:600c:c0c8:b0:471:700:f281 with SMTP id 5b1f17b1804b1-488fb78b8c5mr189038665e9.25.1776760919528;
        Tue, 21 Apr 2026 01:41:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm372071945e9.2.2026.04.21.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 01:41:59 -0700 (PDT)
Date: Tue, 21 Apr 2026 09:41:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, jreuter@yaina.de,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 net] ax25: fix OOB read after address header strip in
 ax25_rcv()
Message-ID: <20260421094156.0fb3499a@pumpkin>
In-Reply-To: <20260421054626.732399-1-ashutoshdesai993@gmail.com>
References: <20260417065407.206499-1-ashutoshdesai993@gmail.com>
	<20260421054626.732399-1-ashutoshdesai993@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Apr 2026 05:46:26 +0000
Ashutosh Desai <ashutoshdesai993@gmail.com> wrote:

> A crafted AX.25 frame with a valid address header but no control byte
> causes skb->len to reach zero after skb_pull() strips the header.
> The subsequent reads of skb->data[0] (control) and skb->data[1] (PID)
> are then out of bounds.
> 
> Linearize the skb after confirming the device is an AX.25 interface.
> Guard with skb->len < 1 after the pull - one byte suffices for LAPB
> control frames which have no PID byte. Add a separate skb->len < 2
> check inside the UI branch before accessing the PID byte.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
> ---
> v5:
> - Move skb_linearize() to after ax25_dev_ax25dev() check; avoids
>   unnecessary allocation for frames on non-AX.25 interfaces

Nitpick: 'on interfaces where AX.25 isn't enabled'
They still have to be AX.25 frames and get discarded.
So they won't really be expected and any allocated memory is
immediately freed.
More relevant would be linearizing before the ax25_addr_parse() call.
In any case I suspect this code never sees non-linear packets.
The packets will all be short, I don't know ax25, but X.25 (which I've
implemented most of in the past) originally had an mtu of 128 bytes
(and real links running at 2400 baud).

	David


> - Lower general guard from skb->len < 2 to skb->len < 1; the stricter
>   limit incorrectly dropped valid 1-byte LAPB control frames (SABM,
>   DISC, UA, DM, RR) which carry no PID byte
> - Add explicit skb->len < 2 check inside UI branch before the PID
>   byte (skb->data[1]) access
> v4:
> - Linearize skb at entry to ax25_rcv(); replace pskb_may_pull() with
>   skb->len < 2 check (per David Laight review)
> v3:
> - Remove incorrect Suggested-by; add Fixes:, Cc: stable@
> v2:
> - Replace skb->len check with pskb_may_pull(skb, 2)
> 
> Link to v4: https://lore.kernel.org/netdev/20260417065407.206499-1-ashutoshdesai993@gmail.com/
> Link to v3: https://lore.kernel.org/netdev/20260415063654.3831353-1-ashutoshdesai993@gmail.com/
> Link to v2: https://lore.kernel.org/netdev/20260409152400.2219716-1-ashutoshdesai993@gmail.com/
> Link to v1: https://lore.kernel.org/netdev/20260409012235.2049389-1-ashutoshdesai993@gmail.com/
> 
>  net/ax25/ax25_in.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/net/ax25/ax25_in.c b/net/ax25/ax25_in.c
> index d75b3e9ed93d..c81d6830af48 100644
> --- a/net/ax25/ax25_in.c
> +++ b/net/ax25/ax25_in.c
> @@ -199,6 +199,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
>  	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
>  		goto free;
>  
> +	if (skb_linearize(skb))
> +		goto free;
> +
>  	/*
>  	 *	Parse the address header.
>  	 */
> @@ -217,6 +220,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
>  	 */
>  	skb_pull(skb, ax25_addr_size(&dp));
>  
> +	if (skb->len < 1)
> +		goto free;
> +
>  	/* For our port addresses ? */
>  	if (ax25cmp(&dest, dev_addr) == 0 && dp.lastrepeat + 1 == dp.ndigi)
>  		mine = 1;
> @@ -227,6 +233,9 @@ static int ax25_rcv(struct sk_buff *skb, struct net_device *dev,
>  
>  	/* UI frame - bypass LAPB processing */
>  	if ((*skb->data & ~0x10) == AX25_UI && dp.lastrepeat + 1 == dp.ndigi) {
> +		if (skb->len < 2)
> +			goto free;
> +
>  		skb_set_transport_header(skb, 2); /* skip control and pid */
>  
>  		ax25_send_to_raw(&dest, skb, skb->data[1]);

