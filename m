From: "ronnie" <acfnews@xs4all.nl>
Subject: Re: AX25 to Telnet to CONV
Date: Mon, 12 Dec 2005 08:55:26 +0100 (CET)
Message-ID: <10490.80.126.37.112.1134374126.squirrel@webmail.xs4all.nl>
References: <4398A8E5.70500@jnos.org>  <0006$01c12a35$017630fc@arti>
    <200512082202.jB8M21Rh020813@yagi.h-net.msu.edu>
    <439CA029.5030904@jnos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <439CA029.5030904@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill WA7NWP <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

Hi Bill,

This is what we have in the ax25d.conf for incoming requests.
We have the spider dx cluster however.

#
<nr8>
NOCALL  * * * * * *  L
default         4 100  * *  *   * - sysop /spider/src/client client %s ax25
#



>
>>  > I'd like a Connect Request to WA7NWP-17 to run the command 'telnet
>>  > wetnet.net 3600' to hook up to the CONVER server.
>>
>> You can use ax25d to invoke a command and hook its std{in,out} up
>> to the AX25 socket.  You could use telnet, but I use a shim called
>> axconv to create the socket connection to the convers server; it does
>> line ending fixup, will auto-sign the caller into convers, etc.
>>
>> 	http://he.fi/pub/ham/unix/linux/ax25/axconv.c.gz
>
>
> This is working great and I'm currently putting it in place at the 2nd
> and 3rd system.   The problem is, like with all great little tools, one
> improvement on the system like this and an obsessive individual, like me
> , want's more more more...
>
> Time now to take the next step and hook our "community packet servers"
> up to the local DXCluster box using the same AX25 connect and launch
> scheme.
>
> Is anybody already doing this?  I think the axconv.c program might work
> directly or with a little tweaking.   Also I saw once, but can't find
> now, instructions on how to launch a telnet connection from ax25d.conf.
>   It would be much appreciated if somebody could point me at that info.
>   Any other hints and suggestions would also be appreciated.
>
> 73,
> Bill - WA7NWP (making lots of packets...)
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


