From: "Robin Gilks" <g8ecj@gilks.org>
Subject: Re: BBS Software
Date: Fri, 4 Jun 2004 09:44:34 +1200 (NZST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <58396.202.37.96.11.1086299074.squirrel@202.37.96.11>
References: <200405271330.25402.dl4mge@darc.de>
    <1085680600.31191.151.camel@kronenbourg.scs.ch>
    <20040527201755.GX1749@mea-ext.zmailer.org>
    <200405311230.37550.dl4mge@darc.de> <40BB6A68.3050700@utoronto.ca>
    <001001c448ee$d90de7c0$6a7ea8c0@geo> <40BF6052.30407@utoronto.ca>
    <000601c4499a$74cb7aa0$6a7ea8c0@wa7nwp.ampr.org>
    <40BF7A24.9000101@utoronto.ca>
Reply-To: g8ecj@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40BF7A24.9000101@utoronto.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Stubbs <dave.stubbs@utoronto.ca>
Cc: linux-hams@vger.kernel.org

> Bill Vodall wrote:
>
>> Hi Dave,
>>
>>
>>>I was looking at the Linux version of JNOS recently, I compiled and ran
>>>it on a Linux system that already had 3 ethernet interfaces with full
>>>TCP/IP, AX.25, and NET/ROM running in the Linux kernel.  JNOS didn't see
>>>any of these interfaces, so I'm assuming it has it's own network stack
>>>that is different from the OS one?
>>
>>
>> Yes.  Think of JNOS as a virtual machine.   It's almost totally separate
>> for the Linux
>> box.   You connect the JNOS system to the Linux box with a slip link
>> over
>> a pseudo tty using net2kiss and slattach.   A google on those terms
>> should give you
>> the necessary incancation -- if not I can forward the relevant parts
>> from my setup.
>>
>>
>
> Ah!
>
> Well, at least that makes sense then, and my conclusions were pretty
> accurate.
>
> My take on the whole situation is that the JNOS on Linux is great for a
> person who used JNOS for many years back in the DOS days and learned it
> well.  I have a suspicion that, for someone like myself who is a new ham
> but who has used Linux daily ever since 1993, I might just be better off
> sticking with the Linux Kernel AX.25 stuff.  It probably offers
> comparable functionality to JNOS, but is much more familiar because it
> is from "my world".

If you are looking for a Kernel solution but want a BBS style interface,
take a look at the Morelia BBS on the Thames Valley IP User Group website
(check the projects link at http://www.tvipug.org). This is written in
python and interfaces to your local news and mail servers and provides via
the kernel AX25 an interface that would be familiar to a *NOS user all the
BBS and node facilities.


-- 
Robin Gilks zl3rob/g8ecj
Internet: g8ecj@gilks.org    http://www.gilks.org



