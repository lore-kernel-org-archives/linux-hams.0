From: "Luc Langehegermann" <luc2@lx2gt.lu>
Subject: Re: gMFSK and my wonky PTT driver
Date: Wed, 20 Jul 2005 07:36:50 +0200 (CEST)
Message-ID: <40923.194.154.200.89.1121837810.squirrel@mail.lx2gt.lu>
References: <40764501050719150178c80167@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40764501050719150178c80167@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Lassoff <jlassoff@gmail.com>
Cc: linux-hams@vger.kernel.org

> I started to use gMFSK and I wanted it to get working with the
> parallel port PTT driver I made for soundmodem. The problem that I am
> having is that when I modprobe in parport, parport_pc, and lp and go
> to gMFSK and ask it to use /dev/lp0 it says that it isn't either a
> serial or parallel port. I'm not really sure what the means in this
> context, or how it checks past just seeing that it is a device. I can
> see lp0 in /dev and see that it is a character special device. I'm
> also concerned that it will just set the DCD or RTS high instead of
> the first data port based on the tick boxes in the config. Soundmodem
> has it setup to use the data pin. I have that driving a transistor
> that closes a pin to ground to put the TX on. Any ideas on this setup?
>
> Jonathan Lassoff (KG6THI)

Hello Jonathan,

lp stands for Line Printer, not what you want. The right device is
probably /dev/parport0

73, Luc, LX2GT


