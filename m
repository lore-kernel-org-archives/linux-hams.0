From: "Joop Stakenborg" <pg4i@xs4all.nl>
Subject: Re: Hamlib: PTT Broken for Icom IC-746
Date: Fri, 29 Jul 2005 13:33:01 +0200 (CEST)
Message-ID: <20949.192.42.124.90.1122636781.squirrel@192.42.124.90>
References: <4076450105072816315a3f8075@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4076450105072816315a3f8075@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Lassoff <jlassoff@gmail.com>
Cc: linux-hams@vger.kernel.org

> I have an Icom IC-746 connected to my linux box through a level
> converter. I have the latest hamlib (1.2.4) all setup, and most of the
> functions work. The only qualm I have is that it will not trigger the
> PTT on. There is a CI-V command on the serial bus to do it, but I get
> the error: "set_ptt: error = Feature not available"
> I'm not much for C, so I can't really find where this would be
> implemented. Does anyone have any ideas?
>

A bit more information would be nice:

start using rigctl with verbose flags:

rigctl -vvvvv -m 323

Next, type 'T' and '1', which sets PTT.
Send the output to the hamlib-developer mailing list.

> Cheers,
> Jonathan Lassoff (KG6THI)

Joop PG4I

