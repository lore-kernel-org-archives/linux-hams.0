From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: [HELP] Sound card as TNC, Kernel 2.4.22, Intel board
Date: Wed, 29 Oct 2003 09:50:28 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0310290948530.12192-100000@wapiti.tc.fluke.com>
References: <Pine.LNX.4.58.0310290510560.20216@debian.ehrlichtronics.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0310290510560.20216@debian.ehrlichtronics.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Ehrlich <scott@ehrlichtronics.com>
Cc: linux-hams@vger.kernel.org

On Wed, 29 Oct 2003, Scott Ehrlich wrote:

> I have an Intel Pentium 3 board with Debian Woody, Kernel 2.4.22, and am
> trying to get the motherboard sound to act as my TNC.   I want to
> experiment with packet and APRS using the sound card.
>
> I've compiled a static kernel with AX.25 support, /sbin/ifconfig -a shows
> AX.25 ports exist.   I run Xastir, Configure > Interfaces > Add > AX25 TNC
> > OK and get an error window popping up:
>
> "Interface error! Error opening interface 0 Hard Fail"
>
> and the xterm from which I typed xastir offers:
>
> axconfig: port 1 not active
> axconfig: port 2 not active
> ERROR: problem with axports file

Did you do the "chmod 4555 /usr/local/bin/xastir" command?  Xastir
has to have "root" priviledges in order to talk to the kernel AX.25
interfaces.  We drop priviledges for all activities where we don't
need them, so Xastir is still relatively safe to run SUID root like
that.

--Curt, one of the Xastir guys.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

