From: "Pontus Falk" <pfalk@ax25.org>
Subject: Re: Problem...
Date: Mon, 17 Mar 2003 23:09:53 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <2758.213.65.101.235.1047938993.squirrel@www.ax25.org>
References: <2705.213.65.101.235.1047935260.squirrel@www.ax25.org>
        <03031721434901.01189@unix.pa3gcu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <03031721434901.01189@unix.pa3gcu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pa3gcu@zeelandnet.nl
Cc: linux-hams@vger.kernel.org

>> The I enter "/usr/sbin/kissattach /dev/ttyq0 ax0 44.140.16.35" but get
>> an error message like:
>>
>> kissattach: Error setting line dicipline: TIOCSETD: invalid argument
>> Are you sure you have enabled MKISS support in the kernel
>> or, if you made it a module, that the module is loaded?
>
> And.?? Do you have "mkiss" support compiled into your kernel or is it a
> module, ?? looks like its a module so you need to load the module
> beforehand.
>
> 'modprobe mkiss'   ?????
>
> If that fails then you possably do not have the required kernel
> configuration. Check /usr/src/linux/.config for MKISS you could try;
>
> cat /usr/src/linux/.config | grep MKISS
> You should get CONFIG_MKISS=m or CONFIG_MKISS=y if you get
> # CONFIG_MKISS is not set
> that means you dont have mkiss at all.

Yes, I have CONFIG_MKISS=y in /usr/src/linux/.config. But, I have
CONFIG_HAMRADIO=m if that is any problem. I don't know where to set this
to y in menuconfig... When I try to set it manually and recompile the
kernel I get an error message...

Pontus


