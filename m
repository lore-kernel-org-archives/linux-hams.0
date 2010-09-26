From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: [PATCH] Make mkiss link its ptys in a predictable manner
Date: Mon, 27 Sep 2010 00:24:56 +0200
Message-ID: <20100926222456.GA31242@x-berg.in-berlin.de>
References: <4C9D43E0.2040908@danplanet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C9D43E0.2040908@danplanet.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Smith <dsmith@danplanet.com>
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org

Hello Dan, hello list,

On 2010-09-24 17:35:44 -0700, Dan Smith <dsmith@danplanet.com>
wrote in <4C9D43E0.2040908@danplanet.com>:
> This patch makes mkiss create symlinks for easier scripting.  If the -L
> flag is specified, it uses the base device path as a template for the link:
> 
>   # mkiss -L -x 2 /dev/ttyS0
>   Awaiting client connects on:
>   /dev/ttyS0.0 /dev/ttyS0.1
> 
> This makes it easy to subsequently call, for example, kissattach on
> /dev/ttyS0.0 to access the first TNC port without having to parse the
> output of mkiss.  Without the -L flag, it behaves as it used it.  Upon
> exit, the links are removed.

thank you for your clean patch.

Personaly, I don't believe it's good to hardcode every eventuality in C. We're working on unix systems and value our powerful scripting languages.

Imho, your approach has some foibles.
1. mkiss is a kiss multiplexer in userspace. It does not even need to be run under root rights.
   By symlinking to /dev/, users of your new feature need mkiss to run as root.
2. mkiss could not only be used on true tty's but also on pseudo pty's. Modern linuxes prefer unix98 ptys.
   Unix98-pty's are allocated automaticaly via /dev/ptmx.
   Imagine you'd try to use two mkiss instances, both called with /dev/ptmx as argument and -L as option. Here the concept completely fails.
   Apart from this, it's not permitted to create files in /dev/pts/. Since linux changes so fast, it might be only a matter of time it could be decided that direct operation to /dev/ may not be permitted anymore.

Your feature could be easily implemented as one-liner in a startup script (s/echo// - it's an example):

# cd /dev; M=/dev/ptyr9; PTYS=$(mkiss $M /dev/ptmx /dev/ptmx |tail -1); n=0; for p in $PTYS; do echo ln -fs $p /dev/ptyr9.$n; n=$(($n+1)); done
ln -fs /dev/pts/21 /dev/ptyr9.0
ln -fs /dev/pts/22 /dev/ptyr9.1
# 

Only the cleanup must be done by hand.
On the other hand, if your system crashes or mkiss is killed hard, your patch does also is not able to unlink the symlinks. 

vy 73,
- Thomas  dl9sau

