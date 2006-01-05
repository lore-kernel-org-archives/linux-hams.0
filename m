From: "Adam Vazquez Kb2jpd " <adamvaz@earthlink.net>
Subject: Re: Most "HAM" friendly distro ?
Date: Wed, 4 Jan 2006 21:26:00 -0500
Message-ID: <E1EuKq6-0001Tk-Ip@elasmtp-kukur.atl.sa.earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Nielsen <nielsen@oz.net>, linux-hams@vger.kernel.org

Hi from Adam Kb2jpd.

I started giving out both Knoppix and started something here in NYC.

Thats for the mention of both Knoppix.

73 Adam kb2jpd


-----Original Message-----

From:  Bob Nielsen <nielsen@oz.net>
Subj:  Re: Most "HAM" friendly distro ?
Date:  Wed Jan 4, 2006 8:31 pm
Size:  2K
To:  linux-hams@vger.kernel.org


On Jan 4, 2006, at 3:09 PM, Nate Bargmann wrote:

> * Douglas Cole <doug.n7bfs@gmail.com> [2006 Jan 04 15:21 -0600]:
>
>> So my question is, which distro' would one reccomend to someone  
>> who is
>> used to using a distro' that does not require recompiling the kernel
>> every time I turn around?
>
> Debian seems to have a very modular kernel with most, if not all, of
> the ham radio support enabled.  A number of hams are active in Debian
> which helps the ham radio support, IMO.
>
>> I was thinking maybe Kubuntu, or one of the Debian based distro's  
>> just
>> for the sake of the ease with which APT makes updating/upgrading, but
>> since I have not spent enough time with Debian based distro's I am  
>> not
>> sure that is going to fit my needs.
>
> Unless the Kubuntu team builds a radically different kernel, it's ham
> radio support should be about equal.
>

The Ubuntu kernels work fine and I think Kubuntu only differs in  
using KDE instead of Gnome for X apps.  Debian (Ubuntu, Kubuntu) have  
most ham applications already packaged (Ubuntu will even supply CDs  
for free, including shipping).

>> But what 2.6 kernel-based distro' really shines for use Amateur radio
>> opp's at the moment ?
>
> Check out Harv's Ham Shack.  It seems to be a ham radio oriented
> distribution.

Likewise AFU-Knoppix, another live-cd based on Knoppix, which is  
based on Debian.

For AX.25, you will probably want a 2.6.14 or later kernel.  I  
couldn't find any kernels later than 2.6.8 on the Debian site and  
don't know if that one is prior to AX.25 breaking.  Ubuntu 6.04 will  
be released in April with a 2.6.15 kernel (which can be used now if  
one upgrades to the preview "dapper" distribution).  I tried  
installing that kernel on Ubuntu 5.10, but ran into dependency  
problems and it was easier to compile my own than to deal with these  
(I'm running a DX spider cluster and several servers on that box and  
it has been extremely stable).  Debian's kernel-package tool makes  
kernel compilation quite a simple task.

Ubuntu and Kubuntu are basically Debian with a more aggressive (every  
six months) release schedule.  Many of the Ubuntu developers are also  
Debian developers.

73,
Bob, N7XY

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


