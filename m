From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: txdelay
Date: Sat, 29 Nov 2008 07:32:30 +1100
Message-ID: <4930555E.10109@exemail.com.au>
References: <49302729.2080109@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <49302729.2080109@comcast.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Willie Hein WJ3G <wj3g@comcast.net>
Cc: Linux Hams Mailing list <linux-hams@vger.kernel.org>

Willie Hein WJ3G wrote:
> Greetings all,
>
> Since i don't see it as an option in axctl or axparms, how do I set the
> txdelay using linux ax25?
>
> tia
>
> Willie, WJ3G
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
Have you tried kissparms? From my rc.ax25 .....

echo -n "Setting KISS parameters for aprs"
    /usr/local/sbin/kissparms -p aprs -r 32 -t 200 -s 20 -f n -l 20

-p port name from axports
-r  persistance
-t  txd
-s  slottime
-f  duplex/not duplex (y/n)
-l  tx tail (deprecated but useful(essential) on 0k3 HF)

To fix other port parameters (maxframe, paclen, etc) change the entries 
in /proc/sys/net/ax25/<port> and have that entry restored on boot from 
rc.ax25. This may not be important for you but it is here where I run 
max 1 and paclen 64 on 0k3 HF.

Ray vk2tv
