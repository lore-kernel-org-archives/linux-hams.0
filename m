From: Bob Brose N0QBJ <linuxhams@n0qbj-11.ampr.org>
Subject: Re: Progress on PPC ax25 2.6 kernel problem
Date: 3 Oct 2005 03:27:24 -0000
Message-ID: <20051003032724.21149.qmail@kunk.qbjnet.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Mike Murphree said:
> Bob Brose N0QBJ said:
> > Ater inserting a bunch of printks in the ax25 code I found that there
> > is a problem in ax25_rcv() in ax25_in.c. (kernel 2.6.14-rc1)
> >
> > The reason packets aren't passed to the IP layer is that
> > dp.lastrepeat on x86 is -1 and on PPC it's 255. So the code
> > that checks to see if the packet belongs to this machine fails
> > in more than one spot. Here is a chunk of code from line 217:
> 
> I don't have this code sitting in front of me, but you realize that 255 is
> -1 in 2's complement math?   Maybe it's variable type or typecast error of
> some sort...

Hi Mike, I did realize -1 was 255 but I couldn't see why it should be 
any different on the two different architectures however I just found out
why. I tested this out then asked on the PPC kernel list. The PPC default
for char is UNSIGNED while the x86 default is SIGNED. Since the declaration
of the variable in structure just says char (incorrectly, since it's
counting on being able to use -1) the result is foobar on the PPC. 

I just did a one word patch that I'll post. I'll bet there are other
instances of this in the kernel code elsewhere...

73, Bob
