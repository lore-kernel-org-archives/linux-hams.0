From: "Joop Stakenborg" <pg4i@xs4all.nl>
Subject: Re: gMFSK and my wonky PTT driver
Date: Fri, 22 Jul 2005 09:29:18 +0200 (CEST)
Message-ID: <7048.192.42.124.90.1122017358.squirrel@192.42.124.90>
References: <40764501050719150178c80167@mail.gmail.com> 
    <40923.194.154.200.89.1121837810.squirrel@mail.lx2gt.lu> 
    <40764501050719234740f6498c@mail.gmail.com> 
    <64381.194.154.200.89.1121842506.squirrel@mail.lx2gt.lu> 
    <4076450105072122516b4ec0f9@mail.gmail.com>
    <40764501050721235677f8257a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40764501050721235677f8257a@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Lassoff <jlassoff@gmail.com>
Cc: linux-hams@vger.kernel.org

>
> Thanks Luc. That definetly got /dev/parport0 to show up. But, when I
> started gMFSK, I found that I had to be root for permissions. So, I
> started as root and then when I tested the PTT, I get a popup that
> says: "set_ptt: ioctl: Invalid argument" So, I then took a look in the
> kernel messages and got: "ppdev0: claim the port first" Does anyone
> have an idea as to what is going on?
>

Just an idea. Is the lp module loaded?
You must unload it with 'rmmod lp'.

> Jonathan Lassoff (KG6THI)
>

Joop PG4I

