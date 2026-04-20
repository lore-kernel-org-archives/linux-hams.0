Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437D338422D
	for <linux-hams@vger.kernel.org>; Mon, 20 Apr 2026 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776712313; cv=none; b=SQwQCGU/Qb3UswUoHvjhqvKJYrm9SpwmgY3cjyX6P6tTs9sRaHOtP7XyFHxenmp1BDBCnWJwIGdGiT76ZZnk2TqmFXJBIakTaobCLqh6B48EQMqhcAyQ0xhGcsM9HhdC+wqbogbcHP3T7vXeLTfhwz43+jcbdApY0iG8k41lraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776712313; c=relaxed/simple;
	bh=sxZ00doArFEGSbugWyjUCS2Weg3XpDc7Tf55R5uMTOE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hqnRYeadFm4xsEmA6IHfW0ubkRiEq520XlfEfOdBcVELlm+kEFKiPm7kjdUxHzySFcg8+f3oLotY7GWpS3DxV+k6REV+k9hA8jdRz50n0e1VA/O2Kv1BL2O7Uv48SVnnYiwvaf8Xf4f4gNB+9S3CUM6sg08Hk151QbzZdHQutf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy2gEmPx; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy2gEmPx"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so3186751eec.1
        for <linux-hams@vger.kernel.org>; Mon, 20 Apr 2026 12:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776712311; x=1777317111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2BLM5ame3A0aMHerconHeaLCipS0GCxKfF5pU6TgVE=;
        b=iy2gEmPxl+1OSXicRpAxYTeMiBmIItu0qVgzd251mlaO8inUdXHhSxDpcXfC1GMG+P
         y9XWAffmkTLi7i8WjjLiM9Hb/iw98pVQVIWamLALxHkjtsTov9EjalYqFRehmRIKgrxe
         d2+DFZP0QmiAZcq5N0u/U2baVGcabcWnL345whdjXkOkZi88FL4mL7VUCYUQxZI48n2b
         LImZESBrPIPEIkggjKm85DYTi1MkEuaCJEH/kBjyi9saATQsXcK41HfBvolO6mkNJjwu
         NAxGO7oeHi1pSOyiXXAZKSLSHYXLWNSiwOwF592m3h/5XAvKwh8C9urp4XF43enL1i+0
         6zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776712311; x=1777317111;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j2BLM5ame3A0aMHerconHeaLCipS0GCxKfF5pU6TgVE=;
        b=XD+vCFhhUksSQ6KOOQvNay/8bxeGTseYhEKXDmtEtab8m47B9cAat14K3j2KbXXY9M
         sgQThcWRaOnEhjpsmQh8T9RR3Pnbmf9P9r7P2bv3L90UGs5BoPsrr8RhgRS4PoTJmiZK
         0mFYxnaWw+Mi4XqSxnRCF7S4UtJ3TMDB2J77SGqIxgA9jBP4SnKm6IIJctSitcyN3Tf6
         R2revPKmEVys2H7VpywNLCz2QvrgEv1Pknp4U3daxATVCofLH7v88GykktwWAhbKKxyB
         cg9FuR68iCL0+A54NG+Cm6hk1obgnFaTU6Sj2s1LHiRhDxdsDreOnN1BG+8EAi+CRMic
         2+Xg==
X-Forwarded-Encrypted: i=1; AFNElJ+hCCHoJiFp8p/mYn90qxiksVwMErLaRKjZFrjnXRzzVjs/kAVL1bMv+QzXSerQdGtVPCXDDocuLbxV@vger.kernel.org
X-Gm-Message-State: AOJu0YzZlmdyBPKcQqTu2too4bhBC+siflXTZDBzfIT0lu0J1AF80p0i
	gmUsfx4XzJ4uOugzZqlcY9eHuky0F7T7g0EtO4RM9F3m2Jf5M89GFDeS
X-Gm-Gg: AeBDieuErh2q3MIRZqDXhGrL8V8Zx4XcbvAdbyWgT2dpiZjxYC8rdg/vgkfauxaDiNx
	3ibygoHhsDZAexWV6vpomfcOIzPKRo1BLSTw/IBh3v9z27eUIyPhL38jGFAxD7SoR4//n6DdbzX
	CYzEIMmTivDb4Z3hufWuMf8l9mdp+kmi1eAXAdyytTO8UrozXukhckRe19z+Kpr4sWa3b5ReZbX
	iE0R4+WEXkDx2bfvfCq2lXV+m36COQBy3iqMfT24Zet2YyV/yEHHD+QGdFFZMnlhnlgT0+RybOK
	dqvNW+XfsCAAAP9pbuerRQLqsukdDpD9mb1i39Q8FdLp4SEF0yF6d0VB2wYnWpTorfdjoZ+iMiA
	woGyutvN8r+WT4QUl65t8bD3OudaOIgV0t5tkA/+mgZct6OmL7Ru2w8pu1gS2ogzLt2HawGlD+3
	TbMEbilNwT91y17Fmk0ZQTUmihcJgcm7GcJmzGYgWk+O+Yy/Nm4UjX7yS59A==
X-Received: by 2002:a05:7300:ca4:b0:2e1:e5c0:7992 with SMTP id 5a478bee46e88-2e477c9aa7fmr6734109eec.8.1776712311175;
        Mon, 20 Apr 2026 12:11:51 -0700 (PDT)
Received: from [10.0.0.2] ([169.235.25.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c38sm15348215eec.5.2026.04.20.12.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 12:11:50 -0700 (PDT)
Message-ID: <828acc6d-9ee2-4ac0-96a8-4414be68b36b@gmail.com>
Date: Mon, 20 Apr 2026 12:11:33 -0700
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yuantan098@gmail.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, kees@kernel.org, takamitz@amazon.co.jp,
 kuniyu@google.com, jiayuan.chen@shopee.com, mingo@kernel.org,
 stanksal@purdue.edu, jlayton@kernel.org, yifanwucs@gmail.com,
 tomapufckgml@gmail.com, bird@lzu.edu.cn, tonanli66@gmail.com
Subject: Re: [PATCH net 1/1] net/rose: hold listener socket during call
 request handling
To: Simon Horman <horms@kernel.org>, Ren Wei <n05ec@lzu.edu.cn>
References: <cover.1776327338.git.tonanli66@gmail.com>
 <52776256bf0fc38de92fe3edf39434538b672b69.1776327338.git.tonanli66@gmail.com>
 <20260420162605.GV280379@horms.kernel.org>
From: Yuan Tan <yuantan098@gmail.com>
In-Reply-To: <20260420162605.GV280379@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/20/2026 9:26 AM, Simon Horman wrote:
> On Fri, Apr 17, 2026 at 07:01:51PM +0800, Ren Wei wrote:
>> From: Nan Li <tonanli66@gmail.com>
>>
>> The call request receive path keeps using the listener socket after the
>> lookup lock has been dropped. Keep the listener alive across the
>> remaining validation and child socket setup by taking a reference in the
>> lookup path and releasing it once request handling is finished.
>>
>> This makes listener lifetime handling explicit and avoids races with
>> concurrent socket teardown.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Cc: stable@kernel.org
>> Reported-by: Yifan Wu <yifanwucs@gmail.com>
>> Reported-by: Juefei Pu <tomapufckgml@gmail.com>
>> Reported-by: Xin Liu <bird@lzu.edu.cn>
>> Co-developed-by: Yuan Tan <yuantan098@gmail.com>
>> Signed-off-by: Yuan Tan <yuantan098@gmail.com>
>> Signed-off-by: Nan Li <tonanli66@gmail.com>
>> Signed-off-by: Ren Wei <n05ec@lzu.edu.cn>
>> ---
>>  net/rose/af_rose.c | 24 +++++++++++++++++++-----
>>  1 file changed, 19 insertions(+), 5 deletions(-)
> Reviewed-by: Simon Horman <horms@kernel.org>
>
> Sachiko has provided some feedback on this patch.
> I do not believe they relate to shortcomings in this patch,
> and I do not believe they should block progress of this patch.
> You may want to look over them for areas to investigate as follow-up
> (maybe you already did :)
>
> ...


Thanks for your review! Yes this module still has other issues that
haven't been fixed. We'll finish what we're currently working on and
then take a look :)

