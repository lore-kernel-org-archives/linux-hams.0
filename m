From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Linux Newbie with Compiling Problems...
Date: Sun, 2 Mar 2003 22:06:11 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <03030222061105.00595@unix.pa3gcu>
References: <01C2E0CD.FDFF9C20.wb9mjn@wb9mjn-11.ampr.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <01C2E0CD.FDFF9C20.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wb9mjn <wb9mjn@wb9mjn-11.ampr.org>
Cc: linux-hams@vger.kernel.org

On Sunday 02 March 2003 21:11, wb9mjn wrote:
>     Hi All,
>
>           I think I may have found a workaround. 

I doubt that very much, 'as' is not 'as86'
as =  the portable GNU assembler
as86 = Assembler for 8086..80386 processors

But having said that it would not suprise me to see that Mandarke have 
converted both into one and simply called it 'as'.

> With allot of looking, I
> found that as86 is a part of a package that does the same thing as dev86
>  (real mode assembly). So, I started looking around in the directories that
> dev86 deposits its files. No, 'as86' (or 'as') was not part of dev86
> itself. But, the system had installed a program called 'as' in /usr/bin/
> directory. I did a 'as --help' command and the result made it clear that
> this was indeed an assembler program. So, made a copy of 'as' renamed to
> 'as86' and did
>
> make clean
> make bzImage
>
>        It seems to be taking allot longer than previously. Hopefully this
> will work. Any comments?

Tell us if it did work and you can actually boot you kernel assembled with as 
called as86.

>       73, Don...

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

