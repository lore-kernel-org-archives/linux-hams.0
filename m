From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: redhat 6.2 dies 3/31/2003 + AX25 2.4 kernel issues
Date: Thu, 26 Dec 2002 13:24:23 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200212261324.23684.vk3bvp@qsl.net>
References: <3E099099.7070306@junglevision.com>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E099099.7070306@junglevision.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Wed, 25 Dec 2002 22:03, Cathryn Mataga wrote:
> According to the Redhat website, Redhat 6.2 and 7.0
> both die on 3/31/2003.  These are the only supported versions
> that run with the 2.2 kernel.  But, I've also read messages
> here that the 2.4 kernel has race conditions and is prone
> to crash.  So, the question is, what do I do with my ax25
> Linux system with RF modems on 3/31/2003?

I'm using 2.2.17-21mdk kernel with RH7.2 on my packet box.
It was compiled on a newer box running Mandrake 7.1 and copied to the redhad 
box. It's a long story....

>
> 1.  Somehow get the 2.4 kernel fixed by 3/31/2003?  Is this
> possible?  What exactly is the issue, and how bad is this?
> Is this likely to happen?

I found early 2.4 (before 2.4.18) kernels very unstable for ax25 stuff.
After 2.4.18 less unstable running on RH 7.2 and 7.3.
This computer (I'm typing on) has Mandrake 9.0 on it and the standard kernel 
2.4.19 seems to work OK out of the box (using modules) for ax25 stuff. But 
I've only ran the packet stuff for short periods with a single TNC. I don't 
know how it would stand up to more, busier ports running long term.

-- 
Shane Deering   vk3bvp@qsl.net 	vk3bvp@vk3bvp.#sev.vic.aus.oc
http://www.qsl.net/vk3bvp/		Up 1 hour and 56 minutes 
Sent with KMail v1.4.1 on Thu Dec 26 13:07:03 EST 2002

