Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DC43BE632
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770633; cv=none; b=ko332fwSTkP6e+Bx0KX64P1ip66yHro0OhtLewdZIE4OuYETVbrI8/D8QkbJM4Zes9BZLgBOMen7otXjJcddgR9hyEpkQEpj7FHkjJu/fR2JyOs4OmDRTWKi/oXHXifI89SlmcM8aOnY/svZ4a8nblfR5wL8xjo4oJd2HHhMkRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770633; c=relaxed/simple;
	bh=bvsNNhXjDuCqvJ4f2MCP+3c83kbaeMjS6Knbdq69M94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnF8/6XRcJjkQuk8cs9lRCrzDfIU0+LsTMJxxjwqZLoxiRdfM14NxDUL2YZ7wsQ5KLCDu7mw8XN7lc6NwUViz1jWBDSBodQkOrXx9rez1biJ/+EGEWo/ZyKLRYCLW0DhW74PNUxALimhotHQyn2TVZ/+bNKfYE5fTzhjmjtP+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gSdMAc+8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xa7G/RrY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gSdMAc+8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xa7G/RrY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776770631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xxVa+EsHT5PrcBeK2zG20jzylvTADEVkR1ky4LvMTjE=;
	b=gSdMAc+8tLcg1LcoFGY1beEaLS52G9iABpRlJveCqLD/fVuKexJFjOT150gqh9gumAlHK+
	xljPPlX41niWgtvdaKt3mZxVpnBhxZ6bscrnR286zNuWOJEeLpRve4LH9Y4XMpDVFEbBT8
	7mKXfgSJ94Seebe+qKmYJQUcpeoiDPs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-xDgXxkTUOMCZbts088bN0A-1; Tue, 21 Apr 2026 07:23:48 -0400
X-MC-Unique: xDgXxkTUOMCZbts088bN0A-1
X-Mimecast-MFC-AGG-ID: xDgXxkTUOMCZbts088bN0A_1776770627
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488c2aa6becso39682315e9.2
        for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776770627; x=1777375427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xxVa+EsHT5PrcBeK2zG20jzylvTADEVkR1ky4LvMTjE=;
        b=Xa7G/RrYXOxuXt3XH2HtStzF4g6Fc+WN3RTovNSX19L9TAfC6lupaQjLyEOhnLxh2Q
         xviTHulK4JQ9AuMLR5gFRiKtRjF788rMUtJPMNHeAdlbI4WyWKZ6fZUtl+SxLdwolx7d
         d64GFjC+xDkdbY58fFtm3ejuKqN/GxPFJc0lqbT5AVJPw3DRyS2q4qF4wbW5WrEXHDJ/
         cJ06j3hMiALZal0bh7E6gfog3z2LbCgwmYBS5xvQe/PUYn2huaOxjtg4EYnmWXTa7cX+
         W4eBUU3iyToLVj6D9BJa4ruhkUTmDkdCoi2zeYfqAtpnA6Eb+GtLtz+T3zuKQMdvhX1S
         psOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770627; x=1777375427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxVa+EsHT5PrcBeK2zG20jzylvTADEVkR1ky4LvMTjE=;
        b=lYyrTfjg4FvmOsP3JzK6PIg4PYSI5iv8E+JoNuoj+qN0D8y5qsCNUV7CMn/XW9eE98
         xvyTcLr6i8pszvDD+MN0XMwwlnvIkA7tVsJ2bYVuKrhNaDR+8UXuautuXlWsQ881W7td
         vmWFxZj1feVet8qmQBC1uJ1lISO/YWitVOCSYxt11eYUyi/022FD2vSPcbhV9eACeM58
         B1x6Vb7HEV30LViLWcfzbfaklWNTFOCrgCa8ZGAiR31S92W1ZcbfMR1JD2FzOtk5mBsY
         HWM2ggIQkZ/d6fX0W1zkq6iSWBlo/8HwgZc04GfWHFU8WylOfh9KLNPXnrvhWYBjD0n3
         VKOA==
X-Forwarded-Encrypted: i=1; AFNElJ9Qqv1zIoekfcbqwpR2yAtHbkt6okjnc0rxORNE812BO1fUg1pMzDHcAGJ7AvTehtnpH301PoPjYy6O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/GUR7RuxkXXhaKBHp2gOtNxBvRHf/rn4CDF+MMGO7qckaeAsM
	E/Kce09xWaS5XkCY5xEd3wcds7Y4bWa/0Ie3qwRXU4VDuye2qJ2WeYCi+kqEj53Y8LXeOMKGb/K
	wRZRcOUrvxAuloT8AcQ+oW9nMEfF7/B0vAVvZw6+4t3rmyIVM3LkazRSh1pzeAZM=
X-Gm-Gg: AeBDietzHlZeCSnwzUCbhwCXFCM4+ZnUfY9EHXDUJ3TxUpQjCplC6LY7tZMqx8I6kr1
	706EA907DzsgeP8Gyqb8DfJ+x89WOlT640TXub60HZknzfBYJYfYWMbP+9DiirM5M4rRx2rX4ao
	H9hRg32oCwys6xAONjvt60Hn7R7Dv69gsoWNugQmALcSrH2lOTnNoOE7adOwwc3VT9zU9qDrBK1
	eS3Twh9sFj3yHG0HCwFvKph6f0VkRJ6cVPngoqiKSzXJW/ItVc3dQfRji8OjjBjdtQvlIo2s95z
	HPO5zv5QgamCioEKBEwqz/ZrKKN+tQbC0SEfzVXDpVNUTAHAsUb2SaZIG24AfqzQqTb+vHEwtmD
	AXAIOM5NcwlaSvniO+jnGTpGonJwv8YicMQ33xaFwso8IA4lSIVy+9pzgDFcJMJb2XvU=
X-Received: by 2002:a05:600c:3150:b0:488:9fb7:376d with SMTP id 5b1f17b1804b1-488fb792ce4mr260922825e9.28.1776770626889;
        Tue, 21 Apr 2026 04:23:46 -0700 (PDT)
X-Received: by 2002:a05:600c:3150:b0:488:9fb7:376d with SMTP id 5b1f17b1804b1-488fb792ce4mr260922425e9.28.1776770626440;
        Tue, 21 Apr 2026 04:23:46 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm334535805e9.15.2026.04.21.04.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 04:23:46 -0700 (PDT)
Message-ID: <807622bd-1001-4202-b612-c8504fc7c67f@redhat.com>
Date: Tue, 21 Apr 2026 13:23:44 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/1] net/rose: hold listener socket during call
 request handling
To: Ren Wei <n05ec@lzu.edu.cn>, linux-hams@vger.kernel.org,
 netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, kees@kernel.org, takamitz@amazon.co.jp, kuniyu@google.com,
 jiayuan.chen@shopee.com, mingo@kernel.org, stanksal@purdue.edu,
 jlayton@kernel.org, yifanwucs@gmail.com, tomapufckgml@gmail.com,
 bird@lzu.edu.cn, yuantan098@gmail.com, tonanli66@gmail.com
References: <cover.1776327338.git.tonanli66@gmail.com>
 <52776256bf0fc38de92fe3edf39434538b672b69.1776327338.git.tonanli66@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <52776256bf0fc38de92fe3edf39434538b672b69.1776327338.git.tonanli66@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/26 1:01 PM, Ren Wei wrote:
> From: Nan Li <tonanli66@gmail.com>
> 
> The call request receive path keeps using the listener socket after the
> lookup lock has been dropped. Keep the listener alive across the
> remaining validation and child socket setup by taking a reference in the
> lookup path and releasing it once request handling is finished.
> 
> This makes listener lifetime handling explicit and avoids races with
> concurrent socket teardown.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@kernel.org
> Reported-by: Yifan Wu <yifanwucs@gmail.com>
> Reported-by: Juefei Pu <tomapufckgml@gmail.com>
> Reported-by: Xin Liu <bird@lzu.edu.cn>
> Co-developed-by: Yuan Tan <yuantan098@gmail.com>
> Signed-off-by: Yuan Tan <yuantan098@gmail.com>
> Signed-off-by: Nan Li <tonanli66@gmail.com>
> Signed-off-by: Ren Wei <n05ec@lzu.edu.cn>

we are moving rose out of tree:

https://lore.kernel.org/netdev/20260421021824.1293976-1-kuba@kernel.org/

please hold off until Thursday (after that our net PR will land into
mainline), and eventually resend if the code still exists in Linus's
tree at that point.

Thanks,

Paolo

