From: Bernard Pidoux F6BVP <pidoux@ccr.jussieu.fr>
Subject: Re: Linux Newbie with Compiling Problems...
Date: Mon, 03 Mar 2003 19:37:51 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E63A0FF.8040302@ccr.jussieu.fr>
References: <01C2E097.984D9520.wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <01C2E097.984D9520.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "wb9mjn@wb9mjn-11.ampr.org" <wb9mjn@wb9mjn-11.ampr.org>
Cc: Linux Hams mailing list <linux-hams@vger.kernel.org>

wb9mjn wrote:

>   Hi Kelly and Jean,
>
>      Thanks for the response. This is where my latest attempt to compile in AX.25 is stalling. I will look up that package and install it.
>
>      73, Don...
>  
>
I can assure you that you don't need it as86 from elsewhere for making 
bzImage in Mandrake-Linux distro.
Just issue the indicated set of commands :

make mrproper (followed by either make  xconfig or make menuconfig)
make  dep
make bzImage ...etc...

73 de Bernard, F6BVP

> 
>On Sat, 2003-03-01 at 18:58, wb9mjn wrote:
>  
>
>>    Hi All,
>>
>>      Does anybody know what package the command 'as86' is part of ?
>>
>>    73, Don...
>>
>>    
>>
>
>It is in package bin86 under Debian if that helps.
>
>Debian description:
>
>This is the as86 and ld86 distribution written by Bruce Evans. It's a
>complete 8086 assembler and loader which can make 32-bit code for the
>386+ processors (under Linux it's used only to create the 16-bit boot
>sector and setup binaries).
>
>  
>


