From: "Marco Di Martino" <iw7eas@iw7eas.homeip.net>
Subject: Re: Speed on TCP/IP
Date: Tue, 29 Apr 2003 00:29:41 +0200
Sender: linux-hams-owner@localhost
Message-ID: <000301c30dd5$add9e7c0$03c8a8c0@ozzy>
References: <200304271530.47582.vk3bvp@qsl.net> <000801c30dd0$fa749990$03c8a8c0@ozzy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Oooops.....
But times for this T1 - T2 - T3 are expressed in sec. or msec ?
I think in msec because by default T1 is 1000....
....
Thanks again

----- Original Message -----
From: "Marco Di Martino" <iw7eas@iw7eas.homeip.net>
To: <linux-hams@vger.kernel.org>
Sent: Monday, April 28, 2003 11:56 PM
Subject: Speed on TCP/IP


> Hi!
> I've noticed that my ham-linux server is very slow in TCP/IP over ax.25.
> So I've tried to configure better the ax.25 parameter following the
HOW-TO.
> Now the speed is quite better....but itsn't the optimum....
> These below are my parameters. So can you say me if they are correct and
> right ?
>
>         echo "1" > /proc/sys/net/ax25/ax0/backoff_type
>         echo "0" > /proc/sys/net/ax25/ax0/ip_default_mode
>         echo "6" > /proc/sys/net/ax25/ax0/standard_window_size
>         echo "20" > /proc/sys/net/ax25/ax0/maximum_retry_count
>         echo "330" > /proc/sys/net/ax25/ax0/maximum_packet_length
>         echo -n 1 > /proc/sys/net/ax25/ax0/t1_timeout
>         echo -n 2 > /proc/sys/net/ax25/ax0/t2_timeout
>         echo -n 7 > /proc/sys/net/ax25/ax0/t3_timeout
>         echo -n 0 > /proc/sys/net/ax25/ax0/idle_timeout
>         echo "1" > /proc/sys/net/ax25/ax0/connect_mode
>         echo "1" > /proc/sys/net/ipv4/conf/ax0/accept_redirects
>         echo "1" > /proc/sys/net/ipv4/conf/ax0/accept_source_route
>         echo "0" > /proc/sys/net/ipv4/conf/ax0/log_martians
>
> Work conditions: 9600 baud with a good link...
>
> Thanks,
> Marco
> iw7eas
>
> ----
> E-mail:
> iw7eas@virgilio.it
> iw7eas@iw7eas.homeip.net
> AX.25: IW7EAS@IW7CHV.IPUG.ITA.EU
> http://iw7eas.homeip.net/
> ----
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

