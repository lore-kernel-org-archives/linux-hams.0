From: Jeremy Utley <jerutley@gmail.com>
Subject: Fwd: F6FBB startup problems
Date: Tue, 29 Jul 2014 00:24:10 -0500
Message-ID: <CAOMfyjb0PZL+1+0djKV7UY3_96cJGhdixSpWKNdp4eMmpBBu7A@mail.gmail.com>
References: <CAOMfyjb0dMsiBAebgF3+SF_vy7n1nFTX40KsvCPekOe6c3z_wA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=0UcV5MS8wnCYsHIU6y3H5MG42TruLVOc5v/r7ryT+rw=;
        b=dMuVOYZv2ZnoXhsAdTUpZuUkKWUbdEkmh028IDGD9GAAp3SEcvpedoRwTYFwmIqpto
         mawz4mK0rPwkBVqU26JGQVeFOEdVaG9W+IjYJ36EqbOb+S4dJTQhxJs499TEwjnmD7YO
         dxtO78jLqqcLkBFg+RnwSah9mOpPYeERm2p8UPexzZ+GghT3Q5p0DVv7cv5ZI8Mr0vE+
         yOarZJa9yff+n7eUbgWMhT8Pn3I4bm9NGHxVzvn6Ffph5jBW8sbveeqtcxi7s8AdltDN
         bWp40HsfkQukYVLtbu2+a05PYYp52X9n7wI7jXyZsTbMKL7XyA3Tvx4Eu574E34cZcGR
         PZHQ==
In-Reply-To: <CAOMfyjb0dMsiBAebgF3+SF_vy7n1nFTX40KsvCPekOe6c3z_wA@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello list!

I'm trying to get a packet node/bbs system set up here at home, and
while I've got a lot of
functions already working properly, FBB is giving me fits.  I'm
running on a Raspberry Pi, with a
fully up-to-date but stripped down Raspbian image.  I have the basic
AX.25 tools working at this
point - I'm currently testing with axip links between the PI and a
debian VM image on my
desktop, and I can make connections between the two machines over the
axip link just fine.  I've
also successfully setup NetROM connectivity over the axip links as
well, and making successful
connections there too.

However, FBB refuses to start up if I have my AX.25 interface listed
in it's port.sys file.  Here is
the message I am getting in ERROR.SYS:

> EXCEPTION : Station , Ch:0 (0-0-0)  28/07/14 23:29
  Version 7.05f (Jul 18 2014)
  /usr/local/etc/ax25/fbb/port.sys 11, errno 2=No such file or
directory  Syntax error

As I read that, it indicates that the problem is on line 11 of
port.sys.  Here is my entire port.sys
file:

# FBB7.05
#
#Ports TNCs
1     1
#
#Com Interface Adress (Hex) Baud
1   9         0            9600
#
#TNC NbCh Com MultCh Pacln Maxfr NbFwd MxBloc M/P-Fwd Mode  Freq
0   0    0   0      0     0     0     0      00/01   ----  File-fwd.
1   8    1   axip    255   2     1     10     00/15   XUWY  AXIP Link
#1   8    1   netbbs 235   2     1     10     00/15   XUWY  NetROM
#
# End of file.
#

Line 11 is of course the axip line.  I've looked repeatedly at the
documentation, and it all appears
normal.  axip is my current axip interface, as listed in axports:

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
axip    NQ0M-10         -       255     4       axip interface

The interesting thing is, if I comment the axip line in axports, and
uncomment the netbbs line (to
use NETROM for fbb instead of normal ax25), FBB will successfully
start, but I'm unable to
connect to it over NETROM by it's alias or callsign-ssid.

I'm honestly at my wits end with this one.  Anyone have some ideas?

Thanks for any help you can give!

Jeremy, NQ0M
