From: Bob Nielsen <nielsen@oz.net>
Subject: Re: making apps
Date: Fri, 28 Mar 2003 08:28:40 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030328162840.GA4075@n7xy.net>
References: <20030328051453.GB2763@n7xy.net> <000001c2f4f2$d94bc640$8c01a8c0@HP713A>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000001c2f4f2$d94bc640$8c01a8c0@HP713A>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Dex,

Although my experience over the past several years has been with
Debian, I expect that SuSe and probably Red Hat still support ax25,
since they also have hams who are active in the organizations.  On the
other hand, compiling from source isn't necessarily a bad thing--I have
a few ham programs which I update frequently from CVS because the
packages tend to lag behind the latest code (which is also why I run
the "testing" version of Debian instead of the stable version).

The package names vary a bit between distributions, but
libncurses-devel contains the libs and includes required for
compilation of apps using ncurses.  The others are required when you
run the apps.  Thus you probably need all of the packages you listed
with the possible exception of ncurses-extraterms.

Bob

On Fri, Mar 28, 2003 at 06:25:33PM +1200, Dexter N Muir wrote:
> I did wonder about Debian - thanks for the confirmation Bob!  Mandrake
> take note! :-)  I found libncurses and libncurses-devel, ncurses and
> ncurses-extraterms, but not ncurses-devel.  Where do I go?
> 
> Cheers
> Dex
> 
> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Bob Nielsen
> Sent: Friday, 28 March 2003 5:15 p.m.
> To: linux-hams@vger.kernel.org
> Subject: Re: making apps
> 
> On Fri, Mar 28, 2003 at 03:59:19PM +1200, Dexter N Muir wrote:
> >    Seems all the latest distros have dropped this package out - maybe
> > HOWTOs should reflect this?
> 
> Not Debian:
> 
> Here's a (probably not complete) list of ham radio packages currently
> included in "sarge" (which will be the next release):
> 
> aprsd - Internet Gateway for the Automatic Position Reporting System
> ax25-apps - Applications for AX25
> ax25-tools - AX-25 Tools
> ax25-xtools - AX-25 Tools (X versions)
> dgipip - AMPRNet dynamic IPIP encapsulation routing daemon.
> fbb - Packet radio mailbox and utilities
> hamfax - Receive/send radio facsimile transmissions with
> Soundcard/PTC-II
> hamlib-dev - Development library to control radio transceivers and
> receivers.
> hamlib-doc - Documentation for the hamlib radio control library.
> hamlib-utils - Utilities to support the hamlib radio control library.
> hamlib1 - Run-time library to control radio transceivers and receivers.
> hamsoft - Reader for new hamradio linux software at radio.linux.org.au
> hdlant - calculates dimensions for microwave ham radio antennas
> ipip - IP over IP Encapsulation Daemon
> libax25 - ax25 libraries for hamradio applications
> libax25-dev - ax25 library development files
> linpsk - Program for operating PSK31/RTTY modes with X GUI
> node - Amateur Packet Radio Node program
> p10cfgd - Remote configuration daemon for Gracilis Packeten.
> phaseshift - PSK31 terminal for X11
> pileup - Morse code pileup trainer for SB compatible soundcards.
> predict - Satellite Tracking Program with Optional Voice Output
> rspfd - Radio Shortest Path Daemon
> sattrack - satellite tracker and prediction
> sattrack-x11 - satellite tracker and prediction
> soundmodem - Sound Card Amateur Packet Radio Modems
> tlf - Console mode purpose CW keyer, logging- and contest program
> tlfmanual - Documentation for tlf, a hamradio logging and contest
> program
> twclock - Clock program for hamradio operators
> twlog - Logging program for hamradio operators
> xastir - X Amateur Station Tracking and Information Reporting
> xconvers - Hamradio convers client for X/GTK
> xdx - DX-cluster tcp/ip client for amateur radio
> xlog - GTK+ Logging program for Hamradio Operators
> 
> 73,
> Bob, N7XY
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Bob Nielsen, N7XY                          n7xy@n7xy.net
Bainbridge Island, WA                      http://www.n7xy.net
IOTA NA-065, USI WA-028S 
