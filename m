From: Chuck Hast <wchast@gmail.com>
Subject: Re: ax25ipd issue
Date: Sun, 12 Jun 2005 15:37:03 -0600
Message-ID: <620c9057050612143763a373a5@mail.gmail.com>
References: <620c90570506110638c4a2659@mail.gmail.com>
	 <68826e6e97da1023788e9ddc026b6e0d@utac.net>
	 <42AC8791.6080401@ccr.jussieu.fr>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42AC8791.6080401@ccr.jussieu.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: John Hurst <jhurst@utac.net>, Linux-Hams <linux-hams@vger.kernel.org>, fpac@home.f6fbb.org

On 6/12/05, Bernard Pidoux <pidoux@ccr.jussieu.fr> wrote:
> Hi all,
> 
> Some hams using ROSE / FPAC packet switch through AXIP connexions faced
> this problem with non permanent IP stations.
> 
> We solved it by running a script every hour that calls host to resolve
> the ip address and append the route at the end of an original
> ax25ipd.conf without the no-ip route. Then this file is copied onto
> ax25ipd.conf.
> Finally ax25ipd is killed and started again.
> This solution works fine.
> 
> For those who are interested I put here an example of the script for one
> specific station.
> Note : the two calls to ax25ipd at the end are intentional.
> 
> -----------beginning of the script ------------
> 
> #!/bin/bash
> # Syntax: "majip.f5mtz.sh"
> # by F4BVC, F1TE and F6BVP
> #
> /usr/bin/host f5mtz.no-ip.org > ip-f5mtz
> export IP=`more ip-f5mtz | grep -w address | cut -b 29-`
> cp /etc/ax25/ax25ipd_sav.conf /etc/ax25/ax25ipd.conf
> if test "$IP" ; then
>   echo "route F5MTZ-0 $IP udp 10093" >> /etc/ax25/ax25ipd.conf
> fi
> /usr/bin/killall -KILL ax25ipd
> sleep 1
> /usr/local/sbin/ax25ipd -l4
> sleep 1
> /usr/local/sbin/ax25ipd -l4
> #
> 

Bernard,
Does double ax25ipd command at the bottom start up two instances of
ax25ipd? Also I believe that the -l4 is log level 4 correct? 

Sure would be nice not to have to kill the thing and restart it but I guess if
you do it fast enough your links may not even notice it...

Need to get someone to look at coming up with perhaps a new version or
something that will keep things running without dropping the whole thing.

I guess the only things I need to change are the call signs, IP domaine
names and the paths which may be different.



-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
