From: Bernard Pidoux F6BVP <pidoux@ccr.jussieu.fr>
Subject: Re: Linux Newbie with Compiling Problems...
Date: Mon, 24 Feb 2003 19:10:55 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E5A602F.4090601@ccr.jussieu.fr>
References: <01C2DB53.7D9B6660.wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <01C2DB53.7D9B6660.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "wb9mjn@wb9mjn-11.ampr.org" <wb9mjn@wb9mjn-11.ampr.org>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

wb9mjn wrote:

>    Hi All,
>
>         I am new to linux, and am having dificulty compiling AX.25 support 
>into the kernel.
>
>         I am using Mandrake 7.2, kernel 2.2.17mdk . The compile errors out 
>when it is trying to make the drivers for the hard disk.
>
>         Has anybody had this experience with this release? I have heard of 
>people having trouble with Mandrake of this vintage with real time linux 
>extensions for use with the NIST EMC program.
>

I have been using Mandrake Linux for AX25 since earlier distributions.
As far as we are speaking of Mandrake this release is the perfect one to 
use for AX25.
In my own experience newer distro with 2.4.x kernels do not support 
correctly AX25.
There are very often kernel disfunctions or panics...
However you can update 7.2 distro using 7.2 updates from Mandrake FTP 
site or FTP mirrors.

>          I did try a newer linux. Redhat 8.0. This would not install. 
>There is some kinda incompatibility between the Redhat CD reading programs 
>and the computer (100 MHz P1). So, I put the Mandrake 7.2 back on, and it 
>loaded like it did the first time, no problems.
>  
>
I had the same experience. However this is not a problem since in my 
opinion you should keep 7.2 with 2.2.17 or 2.2.23
the last 2.2 stable kernel (see http://www.kernel.org).
In order to compile it you need to install the developpment option (i.e. 
devel libraries).

>
>       73, Don, WB9MJN ...
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>
73 de Bernard, F6BVP


