From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: soundmodem and fedora c3
Date: Mon, 7 Mar 2005 09:03:19 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0503070850260.12783@eskimo.com>
References: <BAY104-F88BBA5C4050324B8618548B5F0@phx.gbl>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
In-Reply-To: <BAY104-F88BBA5C4050324B8618548B5F0@phx.gbl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ronald schultz <ve3dtt@hotmail.com>
Cc: linux-hams@vger.kernel.org

On Mon, 7 Mar 2005, ronald schultz wrote:

> I can't make 'soundmodem' work with my FC3 package and although it makes a
> nice oscilloscope and sets up a conf file in /etc/ax25, I can't get it to
> function with "ax25", 'xastir' or 'linpac'.
>
> Addressing is a problem, I have no 'sm' or 'soundmodem modules'. I tried to
> insmod 'bsd_comp.o', 'hdlcdrv.o' and 'soundmodem.o' as instructed, at Thomas
> Sailer's site, but received an invalid file type error with each of them.
>
> Part of the problem or maybe all of the problem is in configuring the
> 'ax25d.conf' and 'axports' files. The instructions are pretty clear except
> for the 'exec' part of 'ax25d.conf', I don't know which program I'm
> addressing here "soundmodem", 'xastir', 'linpac', 'ax25d'? All of them seem
> to be required. However until I can get 'soundmodem' to associate my
> callsign with something valid other than 'sm0' then the info in 'axports' is
> meaningless.

linpac and Xastir are applications.  ax25d is a daemon that looks
for incoming AX.25 connections, so you can probably skip that one
for now too while you're trying to get your port working.  Focus on
the /etc/ax25/axports file.

I've found that example files from someone's working AX.25 setup
work wonders.  All I have set up here is a dummy interface for
injecting binary OpenTrac packets, so I can't help you with my files
from here much, except to show the general format.  Hopefully
someone will give you a working example shortly.  Here's what I have
though:


> cat axports
# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
#1      OH2BNS-1        1200    255     2       144.675 MHz (1200 bps)
#2      OH2BNS-9        38400   255     7       TNOS/Linux  (38400 bps)
#
#
opentrac we7u-3         4800    255     7       OpenTrac Testing Port
#
#



> I've spent seven days and have printed out over 80 pages of documents trying
> to get a handle on this and I'm sure that I'm missing something
> embarrassingly obvious.

The AX.25 HOWTO document is probably the best start, but it often is
not quite up-to-date with the current software.  Therefore working
configs are best to start from.

As I recall there are two ways of configuring soundmodem:


    *) Using Kernel AX.25
    *) As a serial KISS device


Configuring the former is sometimes a trick.  Your linux kernel has
to have been compiled with AX.25 support.  If it hasn't, you won't
be able to get it working unless you compile a new kernel that does,
or replace your kernel with one which does.

If you use the first method, try the "listen" program to see if your
port is working.  I think I had to run listen as root in order to
have it open the port.  The listen program would be the minimum test
setup you need in order to verify functionality.

Configuring the latter is easier, not requiring kernel AX.25
support, but then you won't be able to share the port among multiple
applications at once.  Since it is easier, you might want to attempt
that first though.  I know of people running soundmodem on Solaris
boxes, which don't have AX.25 kernel support, by using this method.

Once you're sure your port is working I can help you get Xastir
going (or subscribe to the Xastir mailing list and get more people
helping you).

There are also two variations of soundmodem:  kernel mode and
usermode.  Don't get them confused.  I think the supported one these
days is the usermode soundmodem.  Correct?

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
