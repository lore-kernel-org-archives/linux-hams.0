From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: LinWSJT 0.1 Alpha available
Date: Thu, 19 Sep 2002 12:54:08 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0209191254080G.00986@g4klx>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amsat BB <amsat-bb@amsat.org>, Linux Hams <linux-hams@vger.kernel.org>, Moon Net <moon-net@nlsa.com>

Hi Folks

I am happy to announce the availability of LinWSJT (sorry about the 
name) 0.1 Alpha. This is my attempt to implement JT44 and FSK441 for 
Linux (and other platforms) in C++ and under the GPL. At present the 
FSK441 side is languishing, but the JT44 side has been quite heavily 
developed and transmits and receives JT44 effectively. My latest work 
has been adding a suitable GUI to it.

It is now available in source code form. Please drop me a line if you 
would like a copy, either to look at, or to work on, or even to use. 
There are still many things to do with the GUI and I am particularly 
interested in finding people who can help out with that side. There is 
reasonable documentation in the package in the TODO and README files. 
For an overview of the JT44 mode itself I would advise you look at the 
original WSJT program and its documentation.

I suppose I should give a brief overview of what the program does:

JT44 Transmit
JT44 Receive (from the sound card, and from wave files)
PTT Control via the Serial and Parallel ports
Recording of incoming audio in wave files
Saving of incoming messages into a text file

I intend to update my web site with this new information in due course, 
but for the moment send me an e-mail to get a copy of the source code.

73

Jonathan  HB9DRD/G4KLX
