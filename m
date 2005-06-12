From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: ax25ipd issue
Date: Sun, 12 Jun 2005 21:05:53 +0200
Message-ID: <42AC8791.6080401@ccr.jussieu.fr>
References: <620c90570506110638c4a2659@mail.gmail.com> <68826e6e97da1023788e9ddc026b6e0d@utac.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <68826e6e97da1023788e9ddc026b6e0d@utac.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Hurst <jhurst@utac.net>
Cc: Chuck Hast <wchast@gmail.com>, Linux-Hams <linux-hams@vger.kernel.org>

Hi all,

Some hams using ROSE / FPAC packet switch through AXIP connexions faced 
this problem with non permanent IP stations.

We solved it by running a script every hour that calls host to resolve 
the ip address and append the route at the end of an original 
ax25ipd.conf without the no-ip route. Then this file is copied onto 
ax25ipd.conf.
Finally ax25ipd is killed and started again.
This solution works fine.

For those who are interested I put here an example of the script for one 
specific station.
Note : the two calls to ax25ipd at the end are intentional.

-----------beginning of the script ------------

#!/bin/bash
# Syntax: "majip.f5mtz.sh"
# by F4BVC, F1TE and F6BVP
#
/usr/bin/host f5mtz.no-ip.org > ip-f5mtz
export IP=`more ip-f5mtz | grep -w address | cut -b 29-`
cp /etc/ax25/ax25ipd_sav.conf /etc/ax25/ax25ipd.conf
if test "$IP" ; then
  echo "route F5MTZ-0 $IP udp 10093" >> /etc/ax25/ax25ipd.conf
fi
/usr/bin/killall -KILL ax25ipd
sleep 1
/usr/local/sbin/ax25ipd -l4
sleep 1
/usr/local/sbin/ax25ipd -l4
#

-----------------end of the script---------

73 de Bernard, f6bvp

> On Jun 11, 2005, at 6:38 AM, Chuck Hast wrote:
> 
>> Folks,
>> I am using ax25ipd to route some connections over the wire to other sites
>> while we get the RF paths back up and running. The issue I am having is
>> that some of these sites do not have fixed addresses, and the lease exp-
>> ires every 12 hours or so. If I use the domain name address it will 
>> pick up
>> the numerical address when ax25ipd is first started but once started it
>> appears to cash the address it got and continue to use it rather than try
>> to resolve the domain name each time it needs to make a connection.
>>
>> In my particular case I am trying to make connetions to people using
>> the no-ip.com domain, but I tried it with another and the same thing
>> happens. It resolves the first time and continues to use that address
>> even after the dhcp assignment has changed which indicates to me
>> that it is only doing address resolution when ax25ipd is starting.
>>
>> -- 
>> Chuck Hast
