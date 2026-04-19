Received: from mta01.eastlink.ca (mta01.eastlink.ca [24.224.136.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360AE13B7AE
	for <linux-hams@vger.kernel.org>; Sun, 19 Apr 2026 02:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.224.136.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776565941; cv=none; b=ejIIn8pNmjWvK4MDShvp/6qtuJICrsy3h/6lAkoQN1+pXKqXyPxTWdEo3k8kEHgSLKjMo6zhSm5zF23GhkwsUnZqTO1jWHfWDeoHoONw+Yqlk2jL6gVqmiA6GHu6L7HsT0gUcMW1w2wVeFlmZsu1JB6ZjUM4+LhZiKaZ5Ej/E28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776565941; c=relaxed/simple;
	bh=ISW2xIp19WD7RB3+nJAT0EtMfET/MkbkdPEFZpsMpo4=;
	h=Message-id:Date:MIME-version:Subject:To:Cc:References:From:
	 In-reply-to:Content-type; b=M2hyO136FM08KtYSmJen0m0XiXmeAilij9Xr490QOBkLQh+gte5TeAamFoRBWaPJkasCStdnceVUQwhWrMpmzmQ+fKCkIwpCeh8TKtI72IQAjIXHzZzeMZPPSPAs005No3npNn7GwawlfOXnYHt+F7+NI5EG/bCqF7Heb68CCmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eastlink.ca; spf=pass smtp.mailfrom=eastlink.ca; dkim=pass (2048-bit key) header.d=eastlink.ca header.i=@eastlink.ca header.b=OaktPZOv; arc=none smtp.client-ip=24.224.136.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eastlink.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eastlink.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=eastlink.ca header.i=@eastlink.ca header.b="OaktPZOv"
Received: from mail-cms02.eastlink.ca ([71.7.199.166])
 by mta01.eastlink.ca ([24.224.136.30])
 with ESMTPS id <0TDP298CYXNINL90@mta01.eastlink.ca> for
 linux-hams@vger.kernel.org; Sat, 18 Apr 2026 23:02:12 -0300 (ADT)
Received: from [192.168.1.239] ([24.222.238.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
 (Client did not present a certificate) by mail-cms02.eastlink.ca
 ([71.7.199.166]) with ESMTPSA id EHUCw6HUahzRNEHUCwG4Qg; Sat,
 18 Apr 2026 23:02:12 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eastlink.ca;
	s=elelff16; t=1776564132;	bh=z38nk9G5ffN2YfiNSXaCcNPe1DF3Ka8IYB/Cu5Ug/6o=;
	h=Date:Subject:To:From:From:To:Subject:Date:Sender:Reply-to;
	b=OaktPZOveGoZy9zUAgOqSTgzLwjSBG2anwZxznVJv2EJyPFA0A0B4HBueRiHVM99X
 Hi+yUVtsSSnWKwGWr1qpG+7uwkBOTL4Z6EXuKQkNhs0sgQIzPnxJFqTumP3YD5WrPJ
 JGeidYijoXvKEY+/9RAxmPYm+HCJ1seXp6Y+voVKzb43Sfj122pw0hX2H1U5uRW9AU
 wzflWqhHmvnq0PAESZnZd2oOoYfpLdWtExBefl5lZ9pqvhzMSyn5C0Jdz2jA7te2ml
 SfKyiuFEMQ+sLBLtixDjAqzuMl/nAPf5GIfMQ1+drnRy3YbkFW7DpTEAGlitxdurb3
 /v3aLIssrRzrA==
X-Authority-Analysis: v=2.4 cv=OpkdyD/t c=1 sm=1 tr=0 ts=69e437a4 cx=c_est
 a=ien09DawV0SQ461Yvz+7bQ==:117 a=ien09DawV0SQ461Yvz+7bQ==:17 a=IkcTkHD0fZMA:10
 a=F7yP4JWsAAAA:20 a=U3akB4HM0BrbhMu7g9QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Vade-Cause:
 gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehgeeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfgtefuvffnkffpmfenuceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepjhhjuceovhgvudhjohhtsegvrghsthhlihhnkhdrtggrqeenucggtffrrghtthgvrhhnpeejueelheevueevvdejheekvdehtddttddtiedvffektdeuveevkeefkedukeeigeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvgedrvddvvddrvdefkedrgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdegrddvvddvrddvfeekrdegkedphhgvlhhopegludelvddrudeikedruddrvdeflegnpdhmrghilhhfrhhomhepvhgvudhjohhtsegvrghsthhlihhnkhdrtggrpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepreerpdhrtghpthhtohepshhrlhdvleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhdtnhgssehntdhnsgdruhhspdhrtghpthhtoheplhhinhhugidqhhgrmhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhgvghtqdgkihhprfgrshhsfigupehtrhhuvg
X-Vade-Score: 0
X-Vade-State: 0
X-EL-AUTH: ve1jot@eastlink.ca
Message-id: <f45ee927-dda3-4292-b82b-e77b8310de2a@eastlink.ca>
Date: Sat, 18 Apr 2026 23:02:12 -0300
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: "Steven R. Loomis" <srl295@gmail.com>, Nate Bargmann <n0nb@n0nb.us>
Cc: linux-hams@vger.kernel.org
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
 <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
 <hsdnwdq2o2g26gbvm3wvychl5rp3eri7ggj7kkmple7yzm3kgz@u2pbkjyacqyw>
 <BBE715A7-E261-4A6D-A9CD-6B0D3CF72F1F@gmail.com>
Content-language: en-US
From: jj <ve1jot@eastlink.ca>
In-reply-to: <BBE715A7-E261-4A6D-A9CD-6B0D3CF72F1F@gmail.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 8bit

I have actual RF ports with ax25/netrom/tcpip connectivity to our MARCAN 
packet system on vhf 1200b and I'm willing to do any real-world testing 
if needed..

On 2026-04-18 22:31, Steven R. Loomis wrote:
> I have a dormant project [1] to add Node.js bindings for AX25 to be able to write Node.js apps directly on AX25.
> My AX25 use is also dormant, but I would love to bring it back up someday.
>
> User space makes a lot of sense for the reasons given.
> Since maintenance is a question though, perhaps it’s a question of who would volunteer for making any change (beyond no change)?
>
>> what could the AX25 stack in user space do that Direwolf cannot?
> The AX25 stack would still attach to Direwolf so that connected AX25 apps could run.
>
> [1]: https://github.com/srl295/node-ax25-seqpacket/blob/add-actual-stuff/lib/ax25-seqpacket.js
>
> --
> Steven R. Loomis
> K6SPI
>
>
