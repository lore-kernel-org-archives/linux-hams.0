From: Jim Bayer <kc9aop@gmail.com>
Subject: Re: How do I correct this?
Date: Sat, 27 Nov 2004 21:08:11 -0600
Message-ID: <e524c53204112719084d0b998@mail.gmail.com>
References: <620c9057041127134410eff0ee@mail.gmail.com>
Reply-To: Jim Bayer <kc9aop@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057041127134410eff0ee@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Hast <wchast@gmail.com>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

You could try directing messages to /dev/null.  For instance:

<program-name> 2>&1 >/dev/null

This directs stderr to stdout and the whole thing to /dev/null, which
is bascially a black hole.  No messages should appear unless there is
a call to do direct IO to the screen (which I wold imagine is not done
in this case).

You will need to edit the rc file (/etc/rc.d or /etc/init.d depending
on your linux flavor) and add the redirect there.

Good luck.


On Sat, 27 Nov 2004 13:44:26 -0800, Chuck Hast <wchast@gmail.com> wrote:
> When my machine boots up, I get this message
> kissparms uses obsolete (PF_INET,SOCK_PACKET)
> I understand that it is not really a problem, but it looks ugly, do I
> need to change
> the format in which the data is sent to kissparms?
> 
> --
> Chuck Hast
> To paraphrase my flight instructor;
> "the only dumb question is the one you DID NOT ask resulting in my going
> out and having to identify your bits and pieces in the midst of torn
> and twisted metal."
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
'73'

Jim - KC9AOP
