From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: Problem...
Date: Tue, 18 Mar 2003 10:12:06 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303181012.06423.vk3bvp@qsl.net>
References: <2705.213.65.101.235.1047935260.squirrel@www.ax25.org> <03031721434901.01189@unix.pa3gcu> <2758.213.65.101.235.1047938993.squirrel@www.ax25.org>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2758.213.65.101.235.1047938993.squirrel@www.ax25.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Tue, 18 Mar 2003 09:09, Pontus Falk wrote:

> >
> > 'modprobe mkiss'   ?????
> >
> > If that fails then you possably do not have the required kernel
> > configuration. Check /usr/src/linux/.config for MKISS you could try;
> >
> > cat /usr/src/linux/.config | grep MKISS
> > You should get CONFIG_MKISS=m or CONFIG_MKISS=y if you get
> > # CONFIG_MKISS is not set
> > that means you dont have mkiss at all.
>
> Yes, I have CONFIG_MKISS=y in /usr/src/linux/.config. But, I have
> CONFIG_HAMRADIO=m if that is any problem. I don't know where to set this
> to y in menuconfig... When I try to set it manually and recompile the
> kernel I get an error message...
>
> Pontus

That looks like the redhat bug that stops default kernels from using ax25.
You can change it to "y" if you use "make xconfig" or edit by hand.

I've found the 2.4.18 kernel has unstable (buggy) ax25 and it would rarely run 
for more than a day without crashing. This is on Redhat 7.2. I haven't had 
that problem since compiling and installing 2.2.17-21mdk kernel over two 
weeks ago (and before trying 2.4 kernels).

-- 
Shane Deering                   Sent using Kmail v1.4.3
vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 43 minutes 
http://www.qsl.net/vk3bvp/      RH7.2 Up 16 days, 12 hours and 57 minutes 

