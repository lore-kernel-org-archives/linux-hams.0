From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: Kissattach and pseudoterminals
Date: Thu, 20 Feb 2003 21:03:24 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0302202046210.1186-100000@localhost.localdomain>
References: <Pine.LNX.4.44.0302131901220.4132-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0302131901220.4132-100000@localhost.localdomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Cutler <jwc@stanford.edu>
Cc: linux-hams@vger.kernel.org


On Thu, 13 Feb 2003, James Cutler wrote:

> I'd like to write and test AX25 code on my laptop using KISS devices.  On 
> my desktop, which has two physical serial ports

Sorry, I can't offer any assistance with the PTTY's.

However, an (easier) alternative for testing AX25 code, is AXIP.
It carries AX25 traffic over IP.

AXIP becomes available as a network interface ax[0-9], and you can access
it through an AX25 port, mapped to the interface through the usual axports
file.

It is really handy for testing your own set-up, if you route it over your
loopback network. See the AX25-Howto for details.

HTH...


Wilbert, ZL2BSJ



