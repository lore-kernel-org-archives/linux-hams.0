From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Packet Radio Crawlers for Linux?
Date: Mon, 20 Jun 2011 10:35:38 -0700
Message-ID: <4DFF84EA.5060207@trinnet.net>
References: <4DFE9DC2.60809@trinnet.net> <1308552302.15520.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1308552302.15520.18.camel@localhost.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>


I'd like to see this thread not get hijacked over Xastir.  If you have 
issues with Xastir, let's create a new thread but it is under active 
development and works well enough.  See the Xastir mailing list for full 
details, etc.


Back to my question if I may,

> What does a packet radio crawler do?  Just map where stations are?

A crawler would take a seed station [starting point] which can be a 
(packet BBS, TNC mailbox, or node), log into it and get a list of it's 
HEARD stations.  It would then try to connect to each of those second 
level remote stations, and repeat the process.

Ideally, this system would do and record the following in either a 
database, a structured CSV, whatever:

- record the remote Callsign and the path to it

- record quality of the link from where you were connecting from.
I'm not sure if Linux's AX.25 stack can track retries, etc.  At minimum, 
I think the recording of TX vs RX time would help

- link speed of that system (probably will most likely be using 
assumptions which could be misleading)

- There are some systems that also support HF, VHF, UHF, and AMPR ports. 
  These links would also be ideally crawled with specific control

- do duplicate checks for remote stations that can be reached by 
multiple different machines

- maybe record a list of available mailbox messages (to let the crawler 
operator later look and see if there is possibly some location 
information available on the remote machine)

- the crawler would need to support various types of remote packet 
interfaces (AEA, Kantronics, MFJ, TheNode, Linpac, JNOS, FBB, FPAC, etc. 
  Ideally, this would be an extensible system so that people can easily 
add new types of TNCs and their respective prompts.

- Supporting graphical mapping of the nodes would be nice but it's not 
really mandatory as not all of these machines want to be physically found.

- The tool would need to support graceful shutdown but remember where it 
was so the crawl could be resumed later.

- The tool would also need controls on how deep it would crawl (hops per 
node, forbid AMPR crawling, etc).  A quick read on say the "wget" man 
page would give some good ideas.


--David
