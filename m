Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC0528000F
	for <linux-hams@vger.kernel.org>; Sun, 19 Apr 2026 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591415; cv=none; b=VTp5dMs+bttK+VIJlQwi62VzcsR6Z13ODktSmlaOJrozd2OUbsocnwR0z4GJEU9hCZ0YXmT/gN8ykGrZk6OB34u4WZg9z+Px9MgbE/T2DXrykIGNyFCnM+wP/WAhrBPZfacetHxsIgS/MpRhIKJyP4YojN3bqXS/pgcNvGIQw5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591415; c=relaxed/simple;
	bh=L27PXJzv/8PBue9u5Trt3NRU/KbMjAjDenQt7qh/1vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9ucAC72yZIQnQevnUIh8w834c9WtVYjSzmjjZ2okIECPR1DvnlZuUFwmiYnb9Qtn0dJQYvFPYj1agwVVsDjyHIqNYdGUAUdFU6KkHkHQEhljFKG/pXBiB5mOckD4dFGjBGh6wSpxjVgZkaFJ/9PjilbJhFw4xFcdJRaR4ChCl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blemings.org; spf=pass smtp.mailfrom=blemings.org; dkim=pass (2048-bit key) header.d=blemings.org header.i=@blemings.org header.b=XvbwyJ5K; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blemings.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blemings.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blemings.org header.i=@blemings.org header.b="XvbwyJ5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blemings.org;
	s=202501; t=1776591403;
	bh=bK0wct3naknHFS6cwfRu1RjcAtKx3e/S+IdQBq8a3H4=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XvbwyJ5KaijMkt7b6GM2hf//Uk1M0fmIUq2H4RBV3vTk2NaPYnfVjyalUpdqKrK60
	 g6lSrzm0sDdEdmO9WNqgCWxZe1KhXTnxQ4e2PP02dNROiUdej0yd+IfcE7N9o+w/bz
	 hVY2+/CxTrBiYDLqDyf9/32ykKPs4xQ0hTD51yquiRtB23Syq2PChxlNKZEltyS0lB
	 uJJYKDth8sYSoXMRgBHMYDddYQjtnN8hUV7ryGhNf102O1s7DH99z3z3zdULbstTE0
	 MN0v/i9JsLPyD89h7FhP5vpsAs2l8SA4gvvEmSB8HHLf9UqB8btfI5KIxFdHOW7a6H
	 T0cxqIUgRIl8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4fz3RH4t4rz4w1d;
	Sun, 19 Apr 2026 19:36:43 +1000 (AEST)
Message-ID: <c412bf83-e8cf-4a3d-8619-63f68e108399@blemings.org>
Date: Sun, 19 Apr 2026 19:36:42 +1000
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: hugh@blemings.id.au
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: Stuart Longland VK4MSL <me@vk4msl.com>, Dan Cross <crossd@gmail.com>
Cc: linux-hams@vger.kernel.org
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
 <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
 <7a9547e1-9958-4bce-8547-71a93153a0d6@vk4msl.com>
Content-Language: en-US
From: Hugh Blemings <hugh@blemings.org>
In-Reply-To: <7a9547e1-9958-4bce-8547-71a93153a0d6@vk4msl.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

HI All,

On 19/4/2026 14:01, Stuart Longland VK4MSL wrote:
> On 19/4/26 05:28, Dan Cross wrote:
>> [Top-posting to make meta-commendary]
>>
>> I wonder if other folks have thoughts, here? It doesn't bode well that
>> the discussion hasn't progressed. 🙁
>
> I haven't had a chance to fully review what you've posted… there was a 
> lot of historical information in there including detail on the 
> protocols in question.  I've earmarked it to go through closely 
> however. (e.g. I had heard of "ROSE" but never seen a spec for it.)
>
> My situation was wanting a library that I could use to do AX.25 
> networking from userspace without having applications having to 
> elevate to `root` to achieve it.  There was also a maintenance 
> concern.  Rather than try and work out the AX.25 kernel stack, I opted 
> to instead build my own.
>
> Instructive, but difficult as the documentation is sketchy in places.
>
> My implementation was written in Python 3.5+ for ease of development. 
> Probably not the best option, but it got the job done.  `aioax25` 
> allowed me to deliver a project for an emergency comms group and 
> provides a reasonable foundation for simple tasks.  The stack is also 
> portable to other platforms.  (I mostly only care about Linux and 
> *BSD, but well written software should work elsewhere too.  Apparently 
> it works fine on Apple MacOS X.)
>
> A userspace AX.25 daemon which implements the stack would seem to be 
> the best course of action, but the elephant in the room is what the 
> API would look like.
>
> The only thing I've seen close to achieving something like that would 
> be the AGWPE protocol, however the author of that AX.25 stack has 
> categorically stated that he "owns" that protocol.  I don't feel like 
> going to court to argue copyright of interfaces for the sake of a hobby.
>
> The AGWPE protocol is also very limiting: a lot of fields in the AX.25 
> frame are not accessible via this protocol, either for reading or 
> setting.  Want to use the two reserved bits to signal something in a 
> custom protocol?  Too bad.
>
> I was therefore pondering a "stream"-like protocol using KISS-style 
> framing (to re-use existing code).  The frames would serve as an RPC 
> mechanism for implementing something like the `libax25` API, exposing 
> the same functionality and allowing an application to interact with 
> the AX.25 stack without having to implement the whole protocol (as 
> they'd have to do with KISS).
>
> Client applications could connect either via Unix domain sockets or TCP.
>
> You mention the performance hit of crossing the kernel/user-space 
> boundary… I think Direwolf experimentally can work as high as 
> 38400bps. A turn-of-the-century desktop PC was easily able to keep up 
> with that for PPP links (with `pppd` running in userspace). ARMv7 
> single board computers made 15 years later can deliver similar 
> performance.  I don't think this will be much of a bottleneck in 
> practice.
>
> I think userspace is the right way forward given the niche use case here.

Apologies, I kicked off this thread and life intervened a bit and have 
only now had a chance to get back to read through the excellent 
discourse since.

I did have one off list conversation about this which was similarly 
leaning towards a well managed/discussed shift to a userspace approach. 
The individual in question has had quite a lot of both ham radio and 
FOSS experience - I'll give them a nudge and see if they would be 
willing to weigh in here too as I think they'd add a lot to the thread.

I wonder if anyone on list feels they have the right skills to put 
together the shim/compatibility library that would be needed to allow 
the kernel code to be removed?  Seems like that might be the next thing 
to explore ?

Hoping things settle down a bit and will be able to contribute more to 
ongoing discussion

vy 73
Hugh
VK1YYZ/AD5RV



-- 
I am slowly moving to hugh@blemings.id.au as my main email address.
If you're using hugh@blemings.org please update your address book accordingly.
Thank you :)

