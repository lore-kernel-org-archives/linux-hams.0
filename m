From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: soundmodem and fedora c3
Date: Tue, 8 Mar 2005 12:35:28 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0503081230000.6489@eskimo.com>
References: <BAY104-F33C8680A7BC732DF8330068B500@phx.gbl> <422DECD3.3050901@cox.net>
 <200503082107.02361.pa3gcu@zeelandnet.nl> <200503082113.38755.luc2@lx2gt.lu>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
In-Reply-To: <200503082113.38755.luc2@lx2gt.lu>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luc Langehegermann <luc2@lx2gt.lu>
Cc: pa3gcu@zeelandnet.nl, Jeff Camp <jcamp2@cox.net>, linux-hams@vger.kernel.org

On Tue, 8 Mar 2005, Luc Langehegermann wrote:

> Well, for soundmodem to work, you do not really need k-ax25. It is all in user
> space. You can see the soundmodem as an KISS-TNC, but with all in Software.
> Using an pipe, (pty/tty pair) you should be able to use it without the kernel
> ax25 support!
>
> So, Xastir <--> soundmodem should NOT need an running k-ax25

Correct, and I set it up that way last night.  I do however have
AX.25 capability in the kernel on that system, and have used it
before, but in this instance I did it all without any kernel AX.25
support.  All user-space stuff, and Xastir connects directly to
/dev/soundmodem0 with a Serial KISS Interface (Xastir's name for
it).

The downside of doing it this way is that you have one TNC dedicated
to one application.  Sure, you can chain other APRS applications off
of Xastir, but if you want to run other types of software, you'd
have to stop the Xastir interface and then connect a different app
up to /dev/soundmodem0.

If you set up AX.25 networking, lots of apps can share the same TNC
at one time, plus you can route TCP/IP packets just like you do with
ethernet.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
