From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: fbbsrc.704r5 compile error
Date: Fri, 18 Sep 2009 11:33:02 +1000
Message-ID: <4AB2E34E.7070907@exemail.com.au>
References: <19EFA90488264123AF73C3EB1EA74B62@ngj>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <19EFA90488264123AF73C3EB1EA74B62@ngj>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jose Ng Lee <jng@psi.net.pa>
Cc: linux-hams@vger.kernel.org

Jose,

Stack protection was added after 2.6.16. I first encountered it 
somewhere after 2.6.18, possibly in 2.6.22 but my memory is dim.

There are advantages in moving to a newer kernel and that will fix your 
current problem, but you'll possibly run into stack smashing with xfbb, 
and it won't run.

Bernard F6BVP is working on the xfbb code to eliminate some problems. 
Some users are having success with Bernard's later releases but on my 
Debian 4.0 system (2.6.28) I still have to compile fbb with 
-fno-stack-protection. I have the same issue on another system running 
Debian 4.0 with kernel 2.6.29-6. Both systems run fbb 7.04s-test.

If you really need to stick with that old kernel you might get away with 
commenting out the -DPROTOTYPES line. That's what I would try, but be 
warned, I'm not a programmer.

Bernard is across this list and may make comment.

Ray vk2tv

Jose Ng Lee wrote:
> Hi,
>
> I am using an old Linux Fedora 4 with kernel 2.6.16.14.  On this old 
> machine, a few years ago I compiled OK fbb 7.04l and tried again today 
> and compiles OK for that version.
>
> I downloaded the source for fbbsrc.704r5 and tried to compile but got 
> this error:
>
> [root@hp2at src]# make
> gcc -Wall -Wstrict-prototypes -O2 -ggdb2 -funsigned-char  -D__LINUX__ 
> -Wformat-security -D_FORTIFY_SOURCE=3D2 -DPROTOTYPES -I../include 
> -fstack-check -fstack-protector-all -DUSE_NCURSES   -c -o arbre.o arbre.c
> cc1: error: unrecognized command line option "-fstack-protector-all"
> make: *** [arbre.o] Error 1
> [root@hp2at src]#
>
> Please, anyone can help me or what I have to change in the Makefile to 
> make it compile OK.
>
> Thanks,
> 73s Jose / HP2AT
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

