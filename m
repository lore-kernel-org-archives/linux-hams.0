From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: fbbsrc.704r4-5   stack smashing
Date: Sat, 19 Sep 2009 06:47:32 +1000
Message-ID: <4AB3F1E4.1030802@exemail.com.au>
References: <19EFA90488264123AF73C3EB1EA74B62@ngj> <4AB2E34E.7070907@exemail.com.au> <4AB38D4B.3010808@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AB38D4B.3010808@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernard Pidoux F6BVP <f6bvp@free.fr>
Cc: Jose Ng Lee <jng@psi.net.pa>, linux-hams@vger.kernel.org

Hi Bernard,

No, I didn't. It was some months ago now, before you made that discovery.

I'm a bit tight for time right now with radio station administration but 
when that finishes I'll try your test fbb.

Ray vk2tv

Bernard Pidoux F6BVP wrote:
> Hi Ray,
>
> Did you check if there were some held message files ( 
> /var/ax25/fbb/mail/*.hld )
> on your systems that were unable to start FBB BBS ?
>
> When I removed those files from w4akh-8 BBS, there was no more
> stack-smashing when xfbbd daemon was started.
>
> If there are some .hld files, this would confirm that initialization 
> phase
> was buggy and were the cause of stack-smashing you had.
>
> However, don't remove the above files. Just rename them temporarily for
> the completion of your tests.
>
> I will release soon a new version that hopefully will correct this 
> annoying bug.
>
> 73 de Bernard, f6bvp
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

