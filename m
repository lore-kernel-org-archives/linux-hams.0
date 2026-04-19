Received: from gapmx.vk4msl.com (eth2015.qld.adsl.internode.on.net [150.101.176.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14730371D01
	for <linux-hams@vger.kernel.org>; Sun, 19 Apr 2026 04:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.101.176.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776571828; cv=none; b=d4I75t6+ESB8xKQBlPfYjS/NuAgN6fmswyBaw3XWnP6qt2lCVcV8N4C9aMD7oSNGOEOPH9te+bU5rD8QJnOx49iPbX/VibQ5i1Od7AbTD7/ewR+cqJn++GycPfnmpP8jrQId4osILsokQWS4UuSpZbM8eSaLO6u/2dN7pn7+4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776571828; c=relaxed/simple;
	bh=VN0Y20C1fpA6SwdTftwbsHPFCscKbYM4k2nRSoVwQRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcbVMgsw5j0BzFMjedxZSOKI8qytiG7r+Lp+Bod+bBY5NCGJg43OpacYdZ6PNQ0Fk22AxTdBPn/U5foW+CJzZwxndqcHnT8uSvnFzdo1pUA3nenxHDkPwN3K5o0EyeZZ3VTpVB2LEYrwG8fjL9aBldeLO9Q36neoHLK54MdzMug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vk4msl.com; spf=pass smtp.mailfrom=vk4msl.com; dkim=pass (4096-bit key) header.d=vk4msl.com header.i=@vk4msl.com header.b=jR561cwA; arc=none smtp.client-ip=150.101.176.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vk4msl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vk4msl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=vk4msl.com header.i=@vk4msl.com header.b="jR561cwA"
Received: from gapmx.vk4msl.com (gapmx.vk4msl.com [127.0.0.1])
	by gapmx.vk4msl.com (Postfix) with ESMTP id DEBA852AFE;
	Sun, 19 Apr 2026 13:59:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=vk4msl.com; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=gapmx; bh=VN0Y20C1fpA
	6SwdTftwbsHPFCscKbYM4k2nRSoVwQRQ=; b=jR561cwAbowR+Wh0fXMcjan8DEC
	tF7jH9aHr9XtTgcvO4vpCXd8emCN0wXZ4ecJKnj6h8UQXAOY+aWsbfKIBvGox7yI
	Bdqnxt4c1V+VZ436uoW7MjWyQaZfl13R1rhkN+VsVVBK+DeQdB+d9Hio/pGrF/ko
	dmfoQaJ1iQHZpcva+K7F1255lz/oTSKwW0LuWEUiFASRtpJe1kOg2QdsMQJaJk12
	ue0+ggJ4pnUJKqso50loutGIp+BeEeHxJtzqlxwiOKYAayt+c49tP1fWyEU/fll2
	jp7K+14/IlsIlAYHF0qz0jxkKGrrlpKXbAdLmv7Q6b1SJZFYqi6xpHHlL4OSgfsx
	NrMpNEHL0sIgC43dZK0xjK9O9sbyvT14RMcJqpCFoGGCafnHb030QZg3M6HtG4eW
	SYDgxXUV0HI6NufwqJjfhR6wBo472k/GZ+dV52Noxsy+A9Knd6ndf91peeAPiwlj
	VmqJ33OEM9V9Wsk3xDb6oD/dqx9+M/qycZq2VcMaaYl9kj0AMW3+cOtYQLrVp3Hf
	UvBs18AwieEC2tYAJBeMZNQ0rc+tTILtK9GEq3zDXGo1DGZHcSk/Tyg9tpPJZGCl
	fVqxWwGD02J4maU2r1a4teS0C7gUbEmVsKM19abWAw+wx3j4eF3xOly7kk3SpQfF
	DEs1zrrxrVB0gez4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=vk4msl.com; h=message-id
	:date:mime-version:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gapmx; b=exczW
	J43+sVU7LeiiTPVFXy6RlGpggGr8G4NjBe8/2lKeygK0CK2TUXujf+VeIK/mbr+0
	8XCmQkaPF9PqidHLMVKBjY4BmA4RnnMgQht90xgkAbx4OETQGu7YPnE5u4K16osN
	ziI70+z8Yi8rJbQ2Ih1eWEw/NVKjjMx1HS6F6ABOTd6yLei1FvZ9zIgiEkufEvjL
	lC93RKlr5EtQJz+MKNYXdaRLmU6IZ8vG2FaffMrfPrQytI/r4x7ZQqbBLPLW3ove
	fCfyMP3bF7wd0ohkoGGIf8J+0NIHMbS8BlDVyPxWv4ofQFNnxdS/r14FsIcVBWyU
	f+QUHIrcJwTZReJGdQ8fkqtVwIriT3+WeWl/DFWPky9agwqhmm1rCMK37pS0wlr6
	JOqA0GpL8I0rdoaf3orKcm7HbnYZWoPxVUIrehXZit+xq1yGhhA0SX0/Tb5SbOY3
	5o30OTAt+GQW1Gq95rzTmUmfVtn/At0+N6+jp2C6ZLO7Vti02zYrDG0dDIVN+crS
	66xAWeAXO9bnPOEDdf06cV2HygHe53CRxiHV4CVsnjyKvkDNf0YvbokADpvj8knc
	h/oU4QuK9XhuDA/ERBpKNFo/QGhcuTfNU7mQOfqFfpnZg7XACM+n18qc8XYDEULE
	JHLQh0g/vM3lOg27BGZFQI5cd3MaBvtXWvyG5E=
Received: from [IPV6:2001:44b8:21ac:7053:42a3:8dd8:71b7:9032] (unknown [IPv6:2001:44b8:21ac:7053:42a3:8dd8:71b7:9032])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by gapmx.vk4msl.com (Postfix) with ESMTPSA id 5953852AFD;
	Sun, 19 Apr 2026 13:59:33 +1000 (AEST)
Message-ID: <7a9547e1-9958-4bce-8547-71a93153a0d6@vk4msl.com>
Date: Sun, 19 Apr 2026 14:01:49 +1000
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: Dan Cross <crossd@gmail.com>, hugh@blemings.id.au
Cc: linux-hams@vger.kernel.org
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
 <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
From: Stuart Longland VK4MSL <me@vk4msl.com>
Content-Language: en-AU
In-Reply-To: <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/4/26 05:28, Dan Cross wrote:
> [Top-posting to make meta-commendary]
> 
> I wonder if other folks have thoughts, here? It doesn't bode well that
> the discussion hasn't progressed. 🙁

I haven't had a chance to fully review what you've posted… there was a 
lot of historical information in there including detail on the protocols 
in question.  I've earmarked it to go through closely however. (e.g. I 
had heard of "ROSE" but never seen a spec for it.)

My situation was wanting a library that I could use to do AX.25 
networking from userspace without having applications having to elevate 
to `root` to achieve it.  There was also a maintenance concern.  Rather 
than try and work out the AX.25 kernel stack, I opted to instead build 
my own.

Instructive, but difficult as the documentation is sketchy in places.

My implementation was written in Python 3.5+ for ease of development. 
Probably not the best option, but it got the job done.  `aioax25` 
allowed me to deliver a project for an emergency comms group and 
provides a reasonable foundation for simple tasks.  The stack is also 
portable to other platforms.  (I mostly only care about Linux and *BSD, 
but well written software should work elsewhere too.  Apparently it 
works fine on Apple MacOS X.)

A userspace AX.25 daemon which implements the stack would seem to be the 
best course of action, but the elephant in the room is what the API 
would look like.

The only thing I've seen close to achieving something like that would be 
the AGWPE protocol, however the author of that AX.25 stack has 
categorically stated that he "owns" that protocol.  I don't feel like 
going to court to argue copyright of interfaces for the sake of a hobby.

The AGWPE protocol is also very limiting: a lot of fields in the AX.25 
frame are not accessible via this protocol, either for reading or 
setting.  Want to use the two reserved bits to signal something in a 
custom protocol?  Too bad.

I was therefore pondering a "stream"-like protocol using KISS-style 
framing (to re-use existing code).  The frames would serve as an RPC 
mechanism for implementing something like the `libax25` API, exposing 
the same functionality and allowing an application to interact with the 
AX.25 stack without having to implement the whole protocol (as they'd 
have to do with KISS).

Client applications could connect either via Unix domain sockets or TCP.

You mention the performance hit of crossing the kernel/user-space 
boundary… I think Direwolf experimentally can work as high as 38400bps. 
A turn-of-the-century desktop PC was easily able to keep up with that 
for PPP links (with `pppd` running in userspace).  ARMv7 single board 
computers made 15 years later can deliver similar performance.  I don't 
think this will be much of a bottleneck in practice.

I think userspace is the right way forward given the niche use case here.
-- 
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
   ...it's backed up on a tape somewhere.
