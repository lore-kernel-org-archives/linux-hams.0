From: Chris Kantarjiev <cak@dimebank.com>
Subject: debugging KISS basics
Date: Thu, 27 Nov 2008 06:10:24 -0800 (PST)
Message-ID: <200811271410.mAREAO6t019051@moose.dimebank.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Sorry for the n00b questions, but: how do I go about debugging
the basic KISS functionality? As I said, I can talk to my
FTDI-based TNC with minicom and it works to control the radio
and pass packets in CONV mode. But any attempt to use, say,
the call program in KISS mode fails. 

Since it's a USB modem, I really don't have any good way to tap 
into the signal lines going to the TNC (and wouldn't know
how to interpret them). Are there options that I can use
to debug the communications?

And while I'm asking ... what's the typical way of putting
a TNC into KISS mode at boot time, and what do people use
to get things started from /etc/rc? I had sort of expected
to find a prototype /etc/init.d script for ax25d, but didn't...

73 de chris K6DBG
