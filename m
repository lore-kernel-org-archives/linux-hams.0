From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: Linux Newbie with Compiling Problems...
Date: Mon, 24 Feb 2003 09:50:06 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200302240950.06266.vk3bvp@qsl.net>
References: <01C2DB53.7D9B6660.wb9mjn@wb9mjn-11.ampr.org>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <01C2DB53.7D9B6660.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Mon, 24 Feb 2003 08:51, wb9mjn wrote:
>     Hi All,
>
>          I am new to linux, and am having dificulty compiling AX.25 support
> into the kernel.

You wouldn't be alone on that one.

>
>          I am using Mandrake 7.2, kernel 2.2.17mdk . The compile errors out
> when it is trying to make the drivers for the hard disk.

That used to be my favourite kernel for packet. I even used it on my Redhat 
box for some time.
I seem to remember cheating when I compiled that kernel. Using the default 
.config, I only added the ax25 stuff (built into the kernel) and skipped the 
rest of the stuff for the modules (used the old modules, make sure the 
version name/numbers are the same in the makefile). Basically I used a new 
kernel with the old modules. That worked very well and I was able to copy 
that kernel (and modules) from box to box while I waited for  more stable 2.4 
kernel ax25 code.

>           I did try a newer linux. Redhat 8.0. This would not install.
> There is some kinda incompatibility between the Redhat CD reading programs
> and the computer (100 MHz P1). So, I put the Mandrake 7.2 back on, and it
> loaded like it did the first time, no problems.

Personal opinion only here. I don't like Redhat 8.0 . Love Redhat 7.2 and 7.3 
and am using 7.2 for packet now. Mandrake 9.0 is my all time favourite. Even 
better than MDK 7.2. MDK 9.0 is ax25 ready out of the box. Redhat stuffed up 
ax25 support in the kernel and you have to compile your own.
I have tried a number of other distros over the years (some ax25 ready), but 
there comes a time when you want to use Linux for real and not spend all your 
time installing and setting up new distros.
I still have a soft spot for MDK7.2. It was the one that convinced me that 
Windows is no longer a viable OS option for anything but playing (some) games 
on.


-- 
Shane Deering                   Sent using Kmail v1.4.3
vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 41 minutes 
http://www.qsl.net/vk3bvp/      RH7.2 Up 3 days, 6 minutes 

