From: Bob Nielsen <nielsen@oz.net>
Subject: Re: config troubleshooting
Date: Tue, 28 Dec 2004 12:48:57 -0800
Message-ID: <20041228204857.GA16184@office.n7xy.net>
References: <LFENLEGCDLCOKEJAECGNOEODCDAA.rkrasko1@nycap.rr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <LFENLEGCDLCOKEJAECGNOEODCDAA.rkrasko1@nycap.rr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Dec 28, 2004 at 03:06:25PM -0500, bob krasko wrote:
> 
> my axports file is as follows:
> radio	kb2tgd-13	9600	255	2	(1200 baud port)
> 
> ax25d.conf file is as follows:
> [kb2tgd-13 via radio]
> nocall	* * * * * * *
> default	* * * * * * * -ax25	/usr/sbin/node	node
> 
> everything else is ##
> 
> i am trying to configure debian 2.4.18
> 
> 
> when i do a kissattach i use the command:
> kissattach /dev/ttyS0 radio
> i get an error message that starts with usage: -l  etc.
> i have tried it with many other possibilities and have come to the
> conclusion that:
> 
> my configuration is not correct.
> 

You are missing one of the parameters for kissattach.

From 'man(8) kissattach:

kissattach [-6] [-l] [-m mtu] [-v] tty port inetaddr

So you should use:

kissattach /dev/ttyS0 radio 44.69.12.254

(the IP address is a required parameter for kissattach, but not used
unless you are using tcp/ip, so a non-routeable address can be used if
one does not have a 44-net address).

> according to the ax25 how to, i try /usr/sbin/kissattach and get the error
> that kissattach is not
> a directory.

Does the file exist (ls /usr/sbin/kissattach)?  It is included in the 
ax25-tools package, which should be installed, along with libax25 and 
probably ax25-apps.  These are all available as Debian packages, so you 
don't need to deal with compiling, etc.

> 
> i have also gotten errors saying mkiss may not be loaded as a module, but
> when i do a mkiss command i get a usage:  xxxxxxx   so mkiss must be loaded,
> but i am using it wrong.

That would indicate that you do have ax25-tools, which includes the
mkiss command (which should not be confused with the mkiss kernel
module).  You can check if the module is loaded by doing 'lsmod | grep
mkiss'.  If you have both mkiss and ax25 listed in /etc/modules, they 
should be loaded when booting.

> 
> i am using a dual port tnc, a pk 9612 kantronics, and in my gut i think the
> problem is in configuring this tnc, even though i do not have a use for the
> 9600 baud side of the tnc.

With a dual port TNC, you need to configure things a bit differently;  
see Section 6.1.1.1 of the AX25-HOWTO.  The syntax shown there is:

# /usr/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 /dev/ptyq1                 

# /usr/sbin/kissattach /dev/ttyq0 port1 44.135.96.242                      

# /usr/sbin/kissattach /dev/ttyq1 port2 44.135.96.242                      

In this case, it refers to the mkiss utility (part of ax25-tools), not 
the kernel module (which must also be loaded).

> 
> the 9600 in axports, is the speed of the comport and not the speed of the
> node system i am on, right?

Correct.

> 
> i have also input my ampr.org address of 44.69.12.254 as the address for the
> kissattach ports but am so confused at this time i am not sure if it needs
> that address or some kind or other network address.
> 
> i have gone back to 2003 in back posts, read the how to so many times i feel
> stupid because the answer must be right there but i am missing it.

Don't get discouraged.  It is a bit confusing and there have been 
several changes over the years.

> 
> i know there is a call and a listen program in the kernel somewhere also,
> that will eventually use some other file that has to be set up.

Both call and listen are included in ax25-apps, not the kernel.  

73,
Bob, N7XY

----
Bob Nielsen, N7XY                          n7xy (at) n7xy.net
Bainbridge Island, WA                      http://www.n7xy.net
 
 
