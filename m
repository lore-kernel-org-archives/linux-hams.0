From: Cathryn Mataga <cathrynm@junglevision.com>
Subject: Re: kernel 2.4.21 and AX25 & netrom
Date: Mon, 01 Sep 2003 13:29:40 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F53AC34.7030706@junglevision.com>
References: <12777@9A0TCP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <12777@9A0TCP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Tihomir Heidelberg wrote:
>
> I made a lot of fixes, some of them are implemented in 2.6.0-testX, too.
> Some of fixes in my patch are stolen from boys working on 2.6 kernel.
> When I posted here the info about my patch before more then month ago, there
> were still big problems in kernel... Now I am running patched 2.4.21 more then
> 15 days without crash, think it is ready to be merged in some of next
> 2.4 kernel releases...
> so, those having crashes (even protocol problems), try this patch:
> ftp://ham2.cc.fer.hr/pub/users/9a4gl/9a4gl-ax25-2421-20030831.patch
> the patch is against clean 2.4.21, so do not apply this patch if you
> have patched kernel with any of my previous patches

Well, thanks for working on this.  So, then let me get this straight. The
most stable option is to get 2.4.21 and patch it with your patch, and that's
different from 2.4.22, right?

