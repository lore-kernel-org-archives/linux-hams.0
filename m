From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: RedHat 7.3 and AX25
Date: Sat, 7 Sep 2002 19:45:28 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200209071945.28315.vk3bvp@qsl.net>
References: <5.1.0.14.0.20020907072816.00aaaec0@pop.freeserve.net>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5.1.0.14.0.20020907072816.00aaaec0@pop.freeserve.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Saturday 07 September 2002 16:35, Roger Harris wrote:
> Hi Stewart
>
> I had exactly the same problem. It seemed to ignore the request to compile
> MKISS into the kernel.
>
> When I made it a module and loaded it manually, this solved the problem.
>
> Perhaps someone knows a bit more and can say whether this is a known bug,
> whether there is a fix, or whether we are both doing something wrong.

I've noticed with Redhat 2.4.18 kernel source that the config file has-
CONFIG_HAMRADIO=m
I would have thought that it should be either y or n and is just there to say 
whether to skip over the ax25 stuff or not. It looks odd with "make xconfig" 
and I'm sure I had similar problems until I noticed it and changed it to y.


-- 
Shane Deering   vk3bvp@qsl.net 	vk3bvp@vk3bvp.#sev.vic.aus.oc
http://www.qsl.net/vk3bvp/
Sent with KMail v1.4.1 on Sat Sep  7 19:33:42 EST 2002

