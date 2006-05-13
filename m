From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: AX.25, NETROM and ROSE changes in 2.6.17
Date: Sat, 13 May 2006 14:31:11 +0200
Message-ID: <4465D18F.5070405@ccr.jussieu.fr>
References: <20060506223800.GA4419@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060506223800.GA4419@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org


Ralf Baechle DL5RB wrote :
> For those who haven't read my recent patches I'd like to point out that
> in the next kernel release, 2.6.17 the units for the AX.25 timers T1,
> T2 and T3 will change to use ms for all platforms away from the
> previous chaos of version, architecture, platform and configuration
> dependentant chaos.  I've tried to explain things on
> 
>   http://www.linux-ax25.org/wiki/Run_time_configurable_parameters
>   http://de.linux-ax25.org/wiki/Laufzeiteinstellungen
> 
>   (1st page in English, 2nd in German)
> 
> This matters to any sysadmin that is modiyfing the values from their
> defaults.
> 
>   Ralf

By the way, its a long time since I want to ask if there is any reason 
to keep the same name for different ax25.h include files.

-rw-r--r--  1 root root 4877 mar 21 01:26 /usr/include/netax25/ax25.h
[root@bernard tools]# ll /usr/src/linux/include/linux/ax25.h
-rw-rw-rw-  1 root root 2752 mar 20 06:53 
/usr/src/linux/include/linux/ax25.h
[root@bernard tools]# ll /usr/src/linux/include/net/ax25.h
-rw-rw-rw-  1 root root 14842 avr 30 11:27 /usr/src/linux/include/net/ax25.h

Somehow it may be confusing.

73 de Bernard, f6bvp

http://f6bvp.org
http://rose.fpac.free.fr/MINI-HOWTO/
http://rose.fpac.free.fr/MINI-HOWTO-FR/

