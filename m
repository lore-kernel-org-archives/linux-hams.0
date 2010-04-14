From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: Problems with nrattach
Date: Wed, 14 Apr 2010 15:47:40 +1000
Message-ID: <4BC556FC.10000@exemail.com.au>
References: <g2n83d6fb251004131859w55f96e8cga36a794e5b3cbc0f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <g2n83d6fb251004131859w55f96e8cga36a794e5b3cbc0f@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert Thoelen <kd1zd@rtcubed.org>
Cc: linux-hams@vger.kernel.org

Robert,

I run nrattach with a 2.6.18 kernel, and have done so for some years.

You said "I'm using ax25-tools-0.0-10-rc2, and libax25-0.0.12-rc2." but 
you don't mention ax25-apps. Do you have it installed?

I'm happy to continue this privately if you wish, and provide various 
config files.

Ray vk2tv

Robert Thoelen wrote:
> I'm having problems with nrattach and kernel 2.6.18.
>
> I have done a modprobe netrom, and an lsmod shows the netrom module
> linked to the ax25 module.
>
> My nrports and nrbroadcast files are set up.
>
> When I run nrattach, it says the nr0 port is assigned, but nothing
> shows up in the ifconfig list.  Also, re-running nrattach shows it
> trying to attach to nr0, indicating that the previous command did not
> work.
>
> I can't find any other error messages which would point me to what is
> going wrong.
>
> I'm using ax25-tools-0.0-10-rc2, and libax25-0.0.12-rc2.
>
> Any suggestions on what could be going wrong?
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

