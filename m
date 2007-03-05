From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Problems ax25 with 1270b (TF27 chip)
Date: Mon, 05 Mar 2007 13:13:59 +0100
Message-ID: <45EC0987.7020009@ccr.jussieu.fr>
References: <1173072551.3328.52.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1173072551.3328.52.camel@localhost.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vk5hsx@wia.org.au
Cc: Linux-Hams Mailing List <linux-hams@vger.kernel.org>


Stef Daniels VK5HSX wrote:
> Greetings,
> 
> 	A fellow sysop and myself have been working trying to get MFJ 1270b TNC
> (using TF27 Hostmode chip) with Debian GNU\Linux (Stable).  The problem
> is the fact that when we try to use 'call' command on that port the
> TNC's 'STA' led comes on and hangs.  We have tried it with different O\S
> (ie. Slackware, Debian), different kernels (2.4.33 & 2.6.14, 2.6.19)
> without any luck. The TNC does work, as we have tested it on another
> machine with packet.  The only change from the last system that worked
> was now we are using modems as apposed to DRSI cards.
> 
> 	Has anyone else come across this problem?
> 
> We are wondering if it has something to do with crc-mkiss or ax25. We
> have compiled the ax25 libs, tools & apps from source and installed
> binaries.
> 
> Any ideas, comments would be welcome..  ( I haven't given any scripts,
> as the scripts were fine from last installation. However, it was more of
> a question if someone else has come across this problem.
> 
> Thanks in advance..

Did you put your TNC into kiss mode and are you using mkiss driver ?

73 de Bernard, f6bvp
