Received: from newsmtp.uns.ac.rs (smtp.uns.ac.rs [147.91.173.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C3837719
	for <linux-hams@vger.kernel.org>; Mon, 29 Apr 2024 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.91.173.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386428; cv=none; b=et9Wi8pJoW1uew28VMYb7WVJ7ziY1O13jepnROhSoMyW3KcppBzug9YTjpcfLwvimk1WwetKFG6UZc3nS7YRVYN1D1m2CghwC8Cut7qbBhHJLUAb9GyAiqM1lZddH455EAph37hB8m9SGCuosIQB+RijIClycrCRP2PbQpfoWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386428; c=relaxed/simple;
	bh=BzwD6ObQ8ExOyS68WfaKYttHEju4HYW8IUyW2FjDL9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWiNNNxv3juTfag78+feZWEpYSBdBarYazykZKp8I8VrahV3GcJUgEP3jZ6y+8jCq0voMzbHgHTJ7Fljy1busBzEhYgddM1RoYcbzPuPWdtIwEWlWaGwsnjCXLEpVd3xNgXqbkG+xfZQigFWXkab0LLCCWQqbwU6RDmu7V90my8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uns.ac.rs; spf=pass smtp.mailfrom=uns.ac.rs; arc=none smtp.client-ip=147.91.173.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uns.ac.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uns.ac.rs
Received: from newsmtp.uns.ac.rs (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with ESMTP id 12016259BE1;
	Mon, 29 Apr 2024 12:27:04 +0200 (CEST)
Received: from [147.91.175.29] (unknown [147.91.175.29])
	by smtp.uns.ac.rs (Postfix) with ESMTP id 467AA259BC4;
	Mon, 29 Apr 2024 12:27:03 +0200 (CEST)
Message-ID: <74d90aa4-cb76-b4f8-10c9-0f35d051773d@uns.ac.rs>
Date: Mon, 29 Apr 2024 12:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [...] unregister_netdevice: waiting for ax0 to become free. Usage
 count = -1
Content-Language: en-GB
To: Lars Kellogg-Stedman <lars@oddbit.com>
Cc: linux-hams@vger.kernel.org
References: <dd43a40e-ab22-a751-185f-3931ade2fa8f@uns.ac.rs>
 <tffff2tppdxudqj4pq73zkxakk3qehfwrfeboxit7vqcpnkxxl@xd2jz5ho7all>
From: Miroslav Skoric <skoric@uns.ac.rs>
In-Reply-To: <tffff2tppdxudqj4pq73zkxakk3qehfwrfeboxit7vqcpnkxxl@xd2jz5ho7all>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

Thank you, Lars. I'll check your sites for details. However, my kernel 
is rather old so I am unsure whether your approach would work kere.

Misko YT7MPB


On 4/28/24 9:57 PM, Lars Kellogg-Stedman wrote:
> On Sun, Apr 28, 2024 at 05:57:30PM +0200, Miroslav Skoric wrote:
>> subsystem and on top of it runs FPAC node and FBB mailbox. The issue happens
>> whenever the *other* machine has some netrom activity such as a BPQ node/bbs
>> or like.
>>
>> [...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
>> [...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
>> [...] unregister_netdevice: waiting for ax0 to become free. Usage count = -1
> 
> That sounds remarkably like the problem I was asking about a few weeks
> ago; that threads start with
> https://marc.info/?l=linux-hams&m=171271178900331&w=2. I'm curious if
> you see any of the kernel traces I reported in your kernel log? That
> would help identify the problem.
> 
> I just posted a patch that resolves it for me [1], but that patch was
> against the current development kernel (6.9.0rc5).
> 
> [1]: https://marc.info/?l=linux-hams&m=171417563600765&w=2
> 

