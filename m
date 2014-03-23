From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Packet BBSes on ax25d
Date: Sun, 23 Mar 2014 11:00:59 -0700
Message-ID: <532F215B.3040600@trinnet.net>
References: <i2h20b-t7c.ln1@atomos.longlandclan.yi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <i2h20b-t7c.ln1@atomos.longlandclan.yi.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stuart Longland VK4MSL <me@vk4msl.yi.org>, linux-hams@vger.kernel.org


Hello Stuart,

FBB does get some attention now and then but I wouldn't call it active 
development.  I would make sure you're running the newer version to void 
known issues:

     "xd705f" is the newest as of 6/2013 is the newest  - 
http://f6bvp.free.fr/logiciels/BBS-f6fbb/xd705f-src.tar.bz2


There is also Jnos which is probably under more development than FBB:

http://www.langelaar.net/projects/jnos2/about.html


Speaking of BBSes and Outpost, the local ARES/RACES team here in Silicon 
Valley (Santa Clara) have done a bang up job at building a multi-node 
packet system using JNOS supporting multi-port RF and Internet backups 
for full local messaging, BBS forwarding, and SMTP forwarding.  This 
system was co-developed by Jim Oberhofer KN6PE (Outpost developer) and 
many other local HAMs.  You can learn more about this system and maybe 
save yourself a LOT of time and headaches by contacting that group:

http://www.scc-ares-races.org/packet.html

That team has developed some installer scripts that take a lot of the 
pain out of configuring the JNOS, various forwarding rules, etc. to 
support tactical callsigns, backup relays, etc.

--David



