From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: binding ax devices to TCP ports?
Date: Tue, 3 Dec 2002 11:55:49 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10212031134590.18806-100000@saturn.trs.ntc.nokia.com>
References: <BAY1-F1180e5cX65b6b0000705f@hotmail.com>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BAY1-F1180e5cX65b6b0000705f@hotmail.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, 3 Dec 2002, ozgun erdogan wrote:

> I read the kissattach code as I need to write some code which binds a TCP 
> port to an ax network device. That is, TCP packets coming from a specific 
> port will be read from ax1. (with listen for example.)

I think you have to be a bit more specific about what you are trying to
do. TCP is a transport layer protocol and TCP ports are a concept related
to TCP, of course. A network device is quite a few steps below that in the
OSI model (assuming for a minute that OSI model can be used to describe
the Linux networking stack). Binding a TCP port to an ax or whatever
network device doesn't really make much sense, to me anyway.

You mention the "listen" program. Could whatever you are doing be done
simply by modifying "listen" ?

> So, could you make any comments on how struct ifreq is used, or the way the 
> KISS device is created? (also a link to some documentation would be very 
> useful)

The essential thing in kissattach is the ioctl(..., TIOCSETD, ...) call.
That tells the kernel to switch the serial port to a special networking
mode (it sets a "line discipline" to it). The kernel then magically
creates the network device for you. The rest of kissattach is mostly
setting up some parameters like HW address, IP address etc. While these
are of course important, the real work is done in that ioctl() call.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

