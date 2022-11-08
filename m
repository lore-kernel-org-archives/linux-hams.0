From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: Replacement for linux-ax25.org git?
Date: Tue, 8 Nov 2022 08:41:22 -0500
Message-ID: <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 shemp.w1nr.net 974DF100188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=w1nr.net; s=default;
        t=1667914883; bh=EWD0eOlXHZxRQWBS01ZAMGCwhjY4oKD5SNjhUii81m8=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=V7hgMgNqNqitAkeloBtZQchY4JJF3c3r1TnUGPKPd22nX/Ahl0awK6y9gNwpqnPgx
         vDJpFFIDheMZmDtQxILMB2TAuyZOVKtl7ZBhYNBfpfpW4Qa0kq2RQMFKHjnWNLI/re
         U2rP5dzfZbiwJVeTTOh5x7rgIfN0oPjIMgHjH8qU=
Content-Language: en-US
In-Reply-To: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Does anyone know if the repos at linux-ax25.org were archived anywhere 
before it went offline?

Mike, W1NR

On 11/8/2022 7:41 AM, Dave Hibberd wrote:
> Hi all,
> 
> I'm one of the folks in the Debian Hamradio team with an active interest in keeping our packet tooling going.
> 
> With the demise of linux-ax25.org and discussions here about change of maintenance, is there a new canonical repo for ax25-tools and similar where these components are held?
> 
> Our last upstram mirror was about 3 years ago, we've got it tagged as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed down into Ubuntu, Raspberry Pi OS etc.
> 
> If there's currently active work going on with these userland components, where is it happening so we can rebase our packages?
> If not, I guess this is something we need to make a decision on how to proceed as a community!
> 
> 
> [1]: https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream
> 
