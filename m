From: "Joop Stakenborg" <pg4i@xs4all.nl>
Subject: Re: Xlog 1.5 compiler error question
Date: Fri, 2 Feb 2007 11:05:55 +0100 (CET)
Message-ID: <12500.192.42.124.90.1170410755.squirrel@webmail.xs4all.nl>
References: <000801c745a6$c9de5f70$5d30e80a@MOTORHOME>
    <24796.192.42.124.90.1170311096.squirrel@webmail.xs4all.nl>
    <002701c7468e$4ade9530$c70fe80a@MOTORHOME>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <002701c7468e$4ade9530$c70fe80a@MOTORHOME>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org

> > Thanks for the reply Joop.
>
> I tried your suggestion but the compiler still reports the same error.
>
> It's not a major problem, I'm quite happy to keep using Xlog 1.3, which
> works well. I thought I'd try the later version just to see what the
> differences looked like.
>

Well, it is always worthwile running the latest. See the changelog at
http://pg4i.chronos.org.uk/linux/xlog.changelog

Try removing more lines in the same Makefile.am which start with "-DG".
Especially -DGTK_DISABLE_DEPRECATED could help.

Run autoconf after you changed Makefile.am...

> Regards,
> Phil.
>

Joop

