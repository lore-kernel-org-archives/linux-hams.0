From: kd1zd@rtcubed.org
Subject: Removing unwanted NET/ROM nodes
Date: Wed, 26 Dec 2012 23:50:23 -0500 (EST)
Message-ID: <12f24a67.1a9da.13bdab2690f.Webtop.51@rtcubed.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="no"
To: linux-hams@vger.kernel.org

I am on a packet frequency that has 2 nodes that I can both hear and 
transmit successfully.  The connections with them are solid.  There is a 
third node that I can hear, but cannot transmit and make a connection. 
When I go to make a NET/ROM connect, Linux for some reason decides that 
it wants to use the third node, and as a result, I can't connect to 
other nodes in the list
because of the failed connection.

Is there a command I can run with cron to make Linux "forget" about 
routing through the third node?  All three nodes are part of the same 
system, and linked via microwave to each other, so all I need is a route 
to one of the good nodes, and I will be able to get to the third if 
needed routing through them.

73
Bob
KD1ZD
