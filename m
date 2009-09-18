From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: fbbsrc.704r4-5   stack smashing
Date: Fri, 18 Sep 2009 15:38:19 +0200
Message-ID: <4AB38D4B.3010808@free.fr>
References: <19EFA90488264123AF73C3EB1EA74B62@ngj> <4AB2E34E.7070907@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AB2E34E.7070907@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ray Wells <vk2tv@exemail.com.au>
Cc: Jose Ng Lee <jng@psi.net.pa>, linux-hams@vger.kernel.org

Hi Ray,

Did you check if there were some held message files ( /var/ax25/fbb/mail/*.hld )
on your systems that were unable to start FBB BBS ?

When I removed those files from w4akh-8 BBS, there was no more
stack-smashing when xfbbd daemon was started.

If there are some .hld files, this would confirm that initialization phase
was buggy and were the cause of stack-smashing you had.

However, don't remove the above files. Just rename them temporarily for
the completion of your tests.

I will release soon a new version that hopefully will correct this annoying bug.

73 de Bernard, f6bvp
