Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392C344DA2
	for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 22:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775861504; cv=none; b=MYJ4iC3ig5F2ceM0J1pgaOKhRFASDb7zdfCl8+dRnBH1IihX7hLCSscHPM+vtBInSZ1bD29x9pwx4FDhAO5glZp9kmo1wxAyZKmLprMxQfKlancBF58GQoDTDeIZ7WazOBNgBhvoMRW0fqNKr69dcTFZTiw0GTm+xT/J8o7l4/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775861504; c=relaxed/simple;
	bh=Di4tu/kMFuGh2vl/5dJ4nd1Q5pkVKTyy3dHQxra9kns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nHJVcliMqur+cJIs1tURqZdYdgvMUAMqlb/pon+DXW+CKppC7lTdwDzjzO9BJIOkyNjVoCMCcnrKyXnZcU4AJp3xywI5ybT9vRdoxnzDgah6zVaoHouJ0GprZ2oLNZyb1yW9gbfS3vLYK/ul/QEGcnLR6L5HMcQbMdk3vyyEXh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IM5ZA21M; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IM5ZA21M"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b4520f6b32so2796905eec.0
        for <linux-hams@vger.kernel.org>; Fri, 10 Apr 2026 15:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775861502; x=1776466302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrC7kkvkuprqe14U4AY2VBeTVieL7bWJ3KB9Z6fo1Gs=;
        b=IM5ZA21MH6EFRXx9nO5hXyCzT8rSFEQQB65TbwpAftrKNQOhgBNyqRAKaFHFPqd/5k
         plDQSs+0AlEyWub1MsAbQetS/kox6OeZikmDcrfDfEZW0ng4MCqn73hFt5BiTq5bozJD
         V1bEuwC8Htpa3d19shB6usck99ShmiYZ+z/CQxwWOaYC4BnksZoVaMY3Nk/RO9HOQsX6
         gJ078zF0xG9FZv/z4NQ4NQYqzQxu6wZJCUC6eAf9LN10gYCpRwz7+ENt91ovO1G+RUI5
         0ijc8FN4HMGGyhsgVVxxu+/tpNSGzAMyPsMSiKS9mg6tHBB3PABCwvLbneG+88A5hFZR
         GhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775861502; x=1776466302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrC7kkvkuprqe14U4AY2VBeTVieL7bWJ3KB9Z6fo1Gs=;
        b=HMNCUjs196z3jo5Du3dEIhGl4jn7JLUMq3HljecnAN1hRoVNxqB/OBFvJW6TmmZNyK
         u38kwoeE4ZVgwq6DNBANXbaDLjq0mtom5stoFmgymyuZU0u/55OmeUOs8pXJKI7s5mQ1
         9ByALjsMvxEibLg+ncjup7U7h8xTbHKlAfqT8d710hzhBaIqJRSmcphdO1nHjy5W5lge
         NOSSZOmTrjk/YJwMW6SaLG4oWlqmfdysa5S2S5QmhTB0/W0oh1Cirn1nzXnXsl7JvgJm
         z+mNfM1ak0qc9F/KRLJ5xhan4pJFTJVRERLgAPtcE6GPn2mXkPgUyPQEjJfzMCxj5Vak
         wAAw==
X-Forwarded-Encrypted: i=1; AJvYcCUEzuj5a7t+tH7QJiG/E4YtmvvCsyETjlk/WQVLsLrCmO0wPh7P5JsQgdwtQlJvCKvUI4ZVsEEdZSS/@vger.kernel.org
X-Gm-Message-State: AOJu0YxFX7E4sE7eY3n4ZjXsWOK3bwKlq2NsDXSjCA2e1W5puP/8+kWb
	HExCAAfV0flm6jEdlNbOTTG5S9QkDLA3RPH+Ds22Pr08CIo0XB1gkx91
X-Gm-Gg: AeBDieto6TijpD2lPhM4dc/kFnjkaPwts21dP4WuRdEx0BUJkVMGqk5Cy+SfxLUwNLq
	foc88Hj3zntnjTFQdZ/brPv7QrFygo4GYjYtPUSIpzbphZ3xbs08u5WB68vlPzzbGk8nBUTRNW7
	MmWawOEAHXuqW8Ik6WgJk34vV1I/w6BG2hFdkM9lUveEs7uSjJGggmp5yvvSidpuK4tjV74/zIw
	MzzdWZaj0F+fBGCZcTTcfcsvhsbmwVDscQZtfCFaWlF0GBbJgmrE8453JgzarHHpDjJU7qjoKde
	Dl8DB4zcYMhMZBqiVZ98fNi5PRGdfDgB4sHfFsD6EUcFb9uSPz9wXcQNVt4fqpFQUwLG3Um0O+v
	vW1yku4sZF81UNlJkh+1V+Ie2vdk5IyiDV/jl0/QupvPBLsFFI+7m+Hsa63916BQ9CzR4B8P9Qb
	9lvdcq1fa/dDHRyPIm0p78p9iS+DnY68bGzmoH3B0lWrjO+NCN7jcb1Kpt/U1IXnlpFP+F2jVLP
	oo5RJw=
X-Received: by 2002:a05:693c:2c85:b0:2d2:cf9b:ee6e with SMTP id 5a478bee46e88-2d5895690b4mr2925275eec.22.1775861502242;
        Fri, 10 Apr 2026 15:51:42 -0700 (PDT)
Received: from [192.168.1.113] (c-73-151-174-35.hsd1.ca.comcast.net. [73.151.174.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c6b10sm6249959eec.5.2026.04.10.15.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 15:51:41 -0700 (PDT)
Message-ID: <761f83cc-58eb-4b4a-ba91-d11412e7b2a6@gmail.com>
Date: Fri, 10 Apr 2026 15:51:39 -0700
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] netrom: do some basic forms of validation on incoming
 frames
To: hugh@blemings.id.au, Kuniyuki Iwashima <kuniyu@google.com>,
 kuba@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, gregkh@linuxfoundation.org,
 horms@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, stable@kernel.org,
 workflows@vger.kernel.org, yizhe@darknavy.com
References: <20260410145448.38253e3c@kernel.org>
 <20260410221220.1708137-1-kuniyu@google.com>
 <4f5810a7-c792-4d6b-9f7c-6c6b289def19@blemings.org>
Content-Language: en-US
From: Craig <edfardos@gmail.com>
In-Reply-To: <4f5810a7-c792-4d6b-9f7c-6c6b289def19@blemings.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> If the main concern here is ongoing maintenance of these Ham Radio 
> related protocols/drivers, can we pause for a moment on anything as 
> dramatic as removing from the tree entirely ?
>
> There is a good cohort of capable kernel folks that either are or were 
> ham radio operators who I believe, upon realising that things have got 
> to this point, will be happy to redouble efforts to ensure this code 
> maintained and tested to a satisfactory standard.
>
> Or, alternatively, as a technical community it may be that the Ham 
> Radio interested folks conclude that out of tree or user space 
> solutions are a better way forward as others have proposed.
>
> Give us a few days, please, for the word to be put around that we need 
> to pull ourselves together a bit as a technical group :)
>

I, for one, really can't imagine pulling an entire network subsytem out 
of the kernel without any
knowledge of how/if/when it's used.  Like intercontinental radio 
networks, global email, ax.25
keyboard-to-keyboard, BBS and other emergency-communication systems 
throughout the
world.  If you're sure the Internet will never fail, I guess it makes 
sense removing all of this
since it's inconvenient to maintain.

Global AX.25 keyboard-to-keyboard on 14.105Mhz

    https://qsl.net/kb9pvh/105.html

AX.25/netrom VHF routed networks spanning from Oregon to Los Angeles.

    https://www.easymapmaker.com/map/80666c4898ec6e8fa0c35add5d03282d

Global radio email using AX.25

   https://winlink.org/RMSChannels (1,336 AX.25 email packet nodes on 
the Earth and Space)

This is all in operation by Amateur Radio ARES emergency 
protocols/technologies.  This
will not pass the headline test when it comes to Linux detractors.

Most of this is running on Raspberry Pi / Linux 24/7.

If we want to kill all these apps and somehow force them into user space,
it's akin to just switching to Windows - and flounder with the Microsoft 
folks
trying to do the same thing.


-craig
https://digipi.org/

