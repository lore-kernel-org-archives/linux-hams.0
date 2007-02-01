From: "Joop Stakenborg" <pg4i@xs4all.nl>
Subject: Re: Xlog 1.5 compiler error question
Date: Thu, 1 Feb 2007 07:24:56 +0100 (CET)
Message-ID: <24796.192.42.124.90.1170311096.squirrel@webmail.xs4all.nl>
References: <000801c745a6$c9de5f70$5d30e80a@MOTORHOME>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000801c745a6$c9de5f70$5d30e80a@MOTORHOME>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org

> Thank you for reading this.
>
> Can anyone offer a cure for this Xlog 1.5 compiler error?
>
> In file included from /usr/include/gtk-2.0/gtk/gtk.h:152,
>
> from main.c:32:
>
> /usr/include/gtk-2.0/gtk/gtkstatusbar.h:68: error: expected
> specifier-qualifier-list before 'GMemChunk'
>

You could try removing the line with
        -DG_DISABLE_DEPRECATED \
from src/Makefile.am

Next, run autoconf and compilation may have been fixed...

> Regards,
> Phil.
>

Regards,
Joop PG4I

