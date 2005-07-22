From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: gMFSK and my wonky PTT driver
Date: Thu, 21 Jul 2005 23:56:37 -0700
Message-ID: <40764501050721235677f8257a@mail.gmail.com>
References: <40764501050719150178c80167@mail.gmail.com>
	 <40923.194.154.200.89.1121837810.squirrel@mail.lx2gt.lu>
	 <40764501050719234740f6498c@mail.gmail.com>
	 <64381.194.154.200.89.1121842506.squirrel@mail.lx2gt.lu>
	 <4076450105072122516b4ec0f9@mail.gmail.com>
Reply-To: Jonathan Lassoff <jlassoff@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4076450105072122516b4ec0f9@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 19/07/05, Luc Langehegermann <luc2@lx2gt.lu> wrote:
> Hello Jonathan,
> That depends on your system. On mine, loading modules does create devices.
> the proper module you need to load is probably ppdev.
>
> Luc

Thanks Luc. That definetly got /dev/parport0 to show up. But, when I
started gMFSK, I found that I had to be root for permissions. So, I
started as root and then when I tested the PTT, I get a popup that
says: "set_ptt: ioctl: Invalid argument" So, I then took a look in the
kernel messages and got: "ppdev0: claim the port first" Does anyone
have an idea as to what is going on?

Jonathan Lassoff (KG6THI)
