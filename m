From: Jim Bayer <kc9aop@gmail.com>
Subject: Re: Running Listen
Date: Thu, 9 Dec 2004 16:58:38 -0600
Message-ID: <e524c532041209145849580078@mail.gmail.com>
References: <620c905704120905527c439dc@mail.gmail.com>
Reply-To: Jim Bayer <kc9aop@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c905704120905527c439dc@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Hast <wchast@gmail.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Did you try setting the sticky bit?

As root type chmod a+s <file>.  This sets the owner and group sticky
bit to root.  Then anyone who runs the program runs it as root.

On Thu, 9 Dec 2004 08:52:57 -0500, Chuck Hast <wchast@gmail.com> wrote:
> Folks,
> I am trying to run listen as a non-root user. I have checked the permissions
> and group stuff, all appears Ok, it I run it as root, it takes off just fine,
> but if I run it as a non-root user I get this error:
> socket: Operation not permitted
> 
> I have done some looking and see something to the effect that tcpdump
> must be run as root or you get the same error, is this true of listen also?
> 
> Indeed I wanted to set up listen so I could have a log in directly to a listen
> session so I could just log in remotely and observe the goings on's on the
> different ports of the switch. (Has high speed internet connection so there
> is not problem there) Again I can ssh into the box as root and start a listen
> session just fine, but as anything else I get the above infamous error.
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
