From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
Date: Thu, 20 Apr 2006 15:15:20 -0400
Message-ID: <002401c664ae$c436a340$650ea8c0@LoJackOne.LoJack.com>
References: <000701c66340$8cacf600$3849a8c0@lan.w1nr.net> <200604190504.26842.jjgpg@cet.com> <002701c663ac$b82dc590$650ea8c0@LoJackOne.LoJack.com> <9923fd660604190625l2aae0562k6581637d9bd12ffc@mail.gmail.com> <005601c663ca$9dfd3ac0$650ea8c0@LoJackOne.LoJack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: "Mike McCarthy, W1NR" <lists@w1nr.net>, Douglas Cole <doug.n7bfs@gmail.com>
Cc: Jeremiah <jjgpg@cet.com>, linux-hams@vger.kernel.org

There is another gotcha...

SuSE 10.1 RC1 does not include libax25 any longer.  However, the kernel is 
still built with the mkiss and ax25 modules so no kernel recompile is 
needed.  This causes the current 10.0 packages to fail dependencies when you 
try and install them through YaST.

There is hope.  I am attempting to build a libax25 rpm file.  I am also 
looking at creating an "add-on" for all of the packages using the new 10.1 
features of YaST.

More later.

Mike, W1NR

----- Original Message ----- 
From: "Mike McCarthy, W1NR" <lists@w1nr.net>
To: "Douglas Cole" <doug.n7bfs@gmail.com>
Cc: "Jeremiah" <jjgpg@cet.com>; <linux-hams@vger.kernel.org>
Sent: Wednesday, April 19, 2006 12:02 PM
Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel


> Yes.
>
> ----- Original Message ----- 
> From: "Douglas Cole" <doug.n7bfs@gmail.com>
> To: "Mike McCarthy, W1NR" <lists@w1nr.net>
> Cc: "Jeremiah" <jjgpg@cet.com>; <linux-hams@vger.kernel.org>
> Sent: Wednesday, April 19, 2006 9:25 AM
> Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse 
> Kernel
>
>
> After downloading the ISO images of 10.1rc1 and searching disc one, it
> uses 2.6.16.20 as the "default" kernel, so would that have a fair
> chance of working with ax25 and mkiss ?
>
> tnx for any input/help
>
> Doug
> N7BFS
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

