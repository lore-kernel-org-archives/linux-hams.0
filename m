From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: [PATCH] Adding netstat 1.70 ROSE protocol support
Date: Thu, 02 Dec 2010 12:05:25 +0100
Message-ID: <4CF77D75.7050403@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>



-------- Message original --------
Sujet: 	Re: [PATCH] Adding netstat 1.70 ROSE protocol support
Date : 	Mon, 29 Nov 2010 09:53:17 +0100
De : 	Bernard Pidoux <bernard.pidoux@upmc.fr>
Pour : 	Bernd Eckenfels <bernd-10@eckenfels.net>
Copie =E0 : 	net-tools@lina.inka.de



Hi Bernd,

Thanks for the reply.

1.70 is the label displayed at
http://cvs.berlios.de/viewvc/net-tools/net-tools/ , not a patch version=
=2E

netstat.c View Revision Graph 1.70 3 months vapier netstat: include
sys/stat.h for S_ISREG macros newer versions of glibc (like 2.=85

About the rose state, at your request I added an UNKNOWN case.
However I also added tests for the number of sscan returned values
and the maximal value of state variable st before printing it.
This should prevent any segment violation.
So UNKNOWN case is "parano=EFd" and probably not necessary.

Regards,

Bernard


Le 28/11/2010 22:35, Bernd Eckenfels a =E9crit :
>  Hallo Bernard,
>
>  this patch "1.70" is not from me and not authorized, I did not even
>  know about it. Where do you find it? I currently only maintain patch=
es
>  against HEAD of CVS and yes, your Rose patch was not yet included. I
>  wanted to check the general handling of unexpected kernel values for
>  state engines first, and that somewhat delayed the patch.
>
>  Thanks for consolidating of the patches, I guess I will apply them
>  before the "review".
>
>  Greetings
>  Bernd
>
>
>  On 28.11.2010 19:48, Bernard Pidoux wrote:
>>  Hi Bernd,
>>
>>  Although I submitted an update for netstat supporting AMPR rose
>>  protocole,
>>  netstat 1.70 has been commited in Berlios.de CVS repository without
>>  including it.
>>
>>  The following patch has been updated against the present net-tools =
CVS
>>  and includes a safer code for reading and displaying rose state.
>>
>>  I hope it will be included in netstat CVS as this is a very usefull=
 tool
>>  to display AMPR proc files such as AX.25, NetRom and Rose.
>>
>>  http://f6bvp.free.fr/logiciels/netstat/netstat-CVS-1.70.patch
>>
>>  Bernard Pidoux
>>  f6bvp
>>  Funding President AMSAT France
>>
>>  Note for hamradio operators :
>>  net-tools can be downloaded from CVS by issuing the following reque=
sts :
>>
>>  *cvs -d:pserver:anonymous@cvs.net-tools.berlios.de:/cvsroot/net-too=
ls
>>  login*
>>
>>  Type<return>  when asked for a password.
>>  *
>>  cvs -z3
>>  -d:pserver:anonymous@cvs.net-tools.berlios.de:/cvsroot/net-tools co
>>  net-tools*
>>
>>  This will create net-tools sub directory with all net-tools modules
>>  including netstat.
>>
>>  Apply the above patch after downloading the file :
>>
>>  patch -p0<  netstat-CVS-1.70.patch
>>
>>  A typical command could be :
>>
>>  netstat --rose
>>  or
>>  netstat --route --rose
>>
>>  Same for ax25 or netrom
>>
>>
>>
>>
>>  Le 16/08/2010 18:00, Bernd Eckenfels a =E9crit :
>>>  On Mon, Aug 16, 2010 at 04:01:49PM +0200, Bernard F6BVP wrote:
>>>>  The present patch corrects this bug by initializing rose_state[]
>>>>  correctly according to linux/include/net/rose.h
>>>  Thanks, can you please also add a "unknown state" option in case t=
he
>>>  kernel
>>>  adds new states? Will integrate that to upstream CVS later this we=
ek.
>>>
>>>  Greetings
>>>  Bernd
>>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
