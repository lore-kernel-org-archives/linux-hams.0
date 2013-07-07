From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: Netrom on kernel version 3.9.6-200
Date: Sat, 06 Jul 2013 22:49:48 -0700
Message-ID: <51D9017C.3040309@junglevision.com>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com> <51D7AC41.6060606@junglevision.com> <51D7AE2B.3070408@junglevision.com> <51D852B6.3060401@trinnet.net> <20130706202807.GB18314@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20130706202807.GB18314@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams <linux-hams@vger.kernel.org>

On 7/6/2013 1:28 PM, Thomas Osterried wrote:
> the bug you mentioned was fixed in 2009-11-02
>    http://www.linux-ax25.org/cvsweb/ax25-tools/netrom/nrattach.c
>
> Needless to say, that we recommend to use the official tree and deeply
> appreciate, that we get bug reports and patches.

Okay, I filed a bug with Fedora to see if they can update what they ship.

> if you're in a netrom (I am not): I might need help.
> A few weeks ago we got a bug report for netromd. nodes are learned,
> even if they're under the configured minimum threshold.
> The netrom code is very old and didn't change. Perhaps it's an issue with
> newer kernels. Or it never had worked as expected.
> A test setup is quite time consuming (3 test-computers/VMs) and I did not have
> the time to set them up.

Well, I do have a bit list of nodes on my system right now.  It looks 
like what he says happens does happen.  I have worst_qual set to 100 and 
I do see a handful of nodes with quality just below 100, some as low as 
94, but none too far below 100.   I'll uninstall the Fedora libax25 and 
put in the latest, see if it's any different.




> The OM reported:
>
> 	# /etc/ax25/nrbroadcast
> 	#
> 	# The format of this file is:
> 	#
> 	# ax25_name min_obs def_qual worst_qual verbose
> 	#
> 	1	5	120	120	0
>
> 	--
>
> 	So I would assume that any new neighbor gets a quality of 120 and minimum quality to show up in my table is also 120. I would expect to have nothing but direct neighbors in my routing table.
>
> 	However I have this:
> 	
> 	# cat /proc/net/nr_nodes
> 	callsign  mnemonic w n qual obs neigh qual obs neigh qual obs neigh
> 	ND6C-4    LPRC3    1 1   56   6 00001
> 	KF6FPU-5  LIVER    1 1   56   6 00001
> 	WA6TOW-1  PAC      1 1   56   6 00001
> 	KI6UDZ-7  FCITY    1 1   56   6 00001
> 	W6TUK-7   FOSN3    1 1  120   6 00001
>
> 	--
>
> 	Why do I have all of those < 120 routes showing up as nodes? I am missing something? I just upgraded ax25-tools to the latest and greatest and this is still happening.
>
>
> vy 73,
> 	- Thomas  dl9sau
>
> On 2013-07-06 10:24:06 -0700, David Ranch <linux-hams@trinnet.net>
> wrote in <51D852B6.3060401@trinnet.net>:
>> Hello Cathryn,
>>
>> Which AX.25 libs/apps/tools are you using?  If you're using the
>> "official AX.25" ones, you're going to find this and other bugs.  I
>> recommend you use VE7FET / F6BVP's version at
>> http://code.google.com/p/linuxax25/ as it has all of the required
>> fixes that I've come across.   You can find .spec files for this
>> code here:
>> http://www.trinityos.com/HAM/CentosDigitalModes/usr/src/redhat/SPECS/
>> (don't use the ones that have "f6bvp" in the name as they reflect an
>> older version of the libs).
>>
>> --David
>> KI6ZHD
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

