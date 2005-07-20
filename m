From: "Luc Langehegermann" <luc2@lx2gt.lu>
Subject: Re: gMFSK and my wonky PTT driver
Date: Wed, 20 Jul 2005 08:55:06 +0200 (CEST)
Message-ID: <64381.194.154.200.89.1121842506.squirrel@mail.lx2gt.lu>
References: <40764501050719150178c80167@mail.gmail.com> 
    <40923.194.154.200.89.1121837810.squirrel@mail.lx2gt.lu>
    <40764501050719234740f6498c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40764501050719234740f6498c@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Lassoff <jlassoff@gmail.com>
Cc: linux-hams@vger.kernel.org

Hello Jonathan,

>
> Why doesn't it exist? I tried to use "MAKEDEV parport" to create the
> special devices, but it didn't actually make them. I'm still a little
> confused why devices show up /dev. Do kernel modules (built-in or
> otherwise) make them?

That depends on your system. On mine, loading modules does create devices.
the proper module you need to load is probably ppdev.

>
> Jonathan Lassoff (KG6THI)
>

Luc


