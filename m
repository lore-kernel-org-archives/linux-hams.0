From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Problem...
Date: Tue, 18 Mar 2003 15:50:13 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <03031815501301.03692@unix.pa3gcu>
References: <2705.213.65.101.235.1047935260.squirrel@www.ax25.org> <03031721434901.01189@unix.pa3gcu> <2758.213.65.101.235.1047938993.squirrel@www.ax25.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2758.213.65.101.235.1047938993.squirrel@www.ax25.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pontus Falk <pfalk@ax25.org>
Cc: linux-hams@vger.kernel.org

On Monday 17 March 2003 22:09, Pontus Falk wrote:

> > cat /usr/src/linux/.config | grep MKISS
> > You should get CONFIG_MKISS=m or CONFIG_MKISS=y if you get
> > # CONFIG_MKISS is not set
> > that means you dont have mkiss at all.
>
> Yes, I have CONFIG_MKISS=y in /usr/src/linux/.config. But, I have
> CONFIG_HAMRADIO=m if that is any problem. I don't know where to set this
> to y in menuconfig... When I try to set it manually and recompile the
> kernel I get an error message...

Why not do it the other way round, compile tham all as modules.

> Pontus
>

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

