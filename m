From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Problems loading xd704j drivers
Date: Thu, 23 Mar 2006 10:34:37 +0100
Message-ID: <44226BAD.5080100@ccr.jussieu.fr>
References: <6.1.2.0.2.20060322190026.031dc2f0@mail.sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <6.1.2.0.2.20060322190026.031dc2f0@mail.sasktel.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Doug <appld@sasktel.net>
Cc: linux-hams@vger.kernel.org



Doug wrote :
> I am attempting to get up and working xd704j with a front end node.
> I am using Karl Larsen's 'NETROM-NODE mini HOW-TO'. Every thing seemed
> to go well until I tried to start the bbs using the command fbb -a. I
> got the following results and error:
> It apparently saw an error when attempting to load the
> port.sys file. That file is as follows:
> 
 >..............
> 
> # FBB7.03
> #
> #Ports TNCs
>  3     4
> #
> #Com Interface Adress (Hex) Baud
>  1   9         0            9600
>  2   9         0            9600
>  3   9         189C          0
> #
> #TNC NbCh Com MultCh Pacln Maxfr NbFwd MxBloc M/P-Fwd Mode  Freq
>  0   0    0   0      0     0     0     0     00/01   ----  File-fwd.
>  1   4    1   ax0   235   4     1     10     00/15   XUWY  447.050
>  2   4    2   ax1   235   4     1     10     00/15   XUWY  144.910
>  3   6    1   netbbs 235  4     4     10     00/60   XUW
>  4   4    3   0     235   5     4     10     15/30  TUWY  TELNET
> #
> # End of file.
> #
> 
> The error seems to happen when it tries to execute the line with
> 'netbbs' in it. If I comment out that line, and then start the
> bbs, it loads, and I am able to copy packets with xfbbC and
> with the Listen command. I can't for the life of me see what
> is wrong with that line of code.
> 
> This is new territory for me and I need a little help. If anyone
> can offer some assistance, I would greatly appreciate it.
> 
> Thanks
> Doug VE5DA

Could you provide /etc/ax25/axports and /etc/ax25/nrports files ?
The error may lie in nrports file.

Give also an extract of ax25 fields from netstats screen dump.

-- 

73 de Bernard, f6bvp

http://f6bvp.free.fr
http://f6bvp.org (mirror)
http://rose.fpac.free.fr/


