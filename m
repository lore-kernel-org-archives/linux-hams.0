From: "Phil" <phillor@telstra.com>
Subject: Re: Xlog 1.5 compiler error question
Date: Fri, 2 Feb 2007 14:34:58 +0900
Message-ID: <002701c7468e$4ade9530$c70fe80a@MOTORHOME>
References: <000801c745a6$c9de5f70$5d30e80a@MOTORHOME> <24796.192.42.124.90.1170311096.squirrel@webmail.xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org


----- Original Message ----- 
From: "Joop Stakenborg" <pg4i@xs4all.nl>
To: "Phil" <phillor@telstra.com>
Cc: <linux-hams@vger.kernel.org>
Sent: Thursday, February 01, 2007 3:24 PM
Subject: Re: Xlog 1.5 compiler error question

>
> You could try removing the line with
>        -DG_DISABLE_DEPRECATED \
> from src/Makefile.am
>
> Next, run autoconf and compilation may have been fixed...
>

Thanks for the reply Joop.

I tried your suggestion but the compiler still reports the same error.

It's not a major problem, I'm quite happy to keep using Xlog 1.3, which 
works well. I thought I'd try the later version just to see what the 
differences looked like.

Regards,
Phil.

