From: Chris Kantarjiev <cak@dimebank.com>
Subject: Re: soundmodem on OpenWRT on ASUS WL-520gU router with USB audio
Date: Sat, 26 Sep 2009 08:08:00 -0700 (PDT)
Message-ID: <200909261508.n8QF806T030693@moose.dimebank.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alan@columbia.edu, frankiansmith@gmail.com
Cc: linux-hams@vger.kernel.org

> 
> It would be nice if existing APRS clients such as UI-View and Xastir
> could use this "packet radio engine" using existing mechanisms, such
> as the AGWPE TCP/IP protocol.  I am fairly new to packet so if anyone
> has any suggestions for other ways that I could accomplish what I want
> to do I would be very interested in hearing them.

The aprs4r digi software package provides, among other things, the
ability to export the packet stream on socket that Xastir & UI-View
will understand. 

It used to run in the 4MB routers (WRT54GL) but the recent Kamikaze
releases have gotten just a bit too big.

73 de chris K6DBG
