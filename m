From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: HELP PMS
Date: Sat, 01 May 2004 15:42:37 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4093B75D.4030003@rns-stearn.demon.co.uk>
References: <NCBBKBAJDJIPKFIAFBKLKEOKEOAC.wilson.hein@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Wilson

If you are missing Makefile.include from the top level directory run:

lib/configure

and answer the questions. This creates Makefile, Makefile.include and
config.h

You still have to run the make from the ax25-utils-2.1.42a directory at
least once to ensure that the library is created. Then you may rebuild
the individual applications from their own directories.

Hope this helps.

-- 
73 de g1sog
	Richard
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Amateur radio callsign: G1SOG         Home BBS: G1SOG@GB7GLO.#46.GBR.EU
                 Amprnet co-ordinator for Wiltshire
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

