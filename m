From: Dennis Boone <drb@msu.edu>
Subject: Re: Is S-L-O-W /sbin/route response normal?
Date: Mon, 17 Mar 2003 14:59:34 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18v0lj-000190-00@yagi.h-net.msu.edu>
References: <20030317195116.69800.qmail@web12207.mail.yahoo.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Mon, 17 Mar 2003 11:51:16 PST.)
             <20030317195116.69800.qmail@web12207.mail.yahoo.com> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

You've probably thought of this, but are you doing "route -n"?
DNS timeouts would explain slow listing of the route table combined
with normal routing performance.

Dennis Boone
KB8ZQZ

 > When viewing routing tables, is S-L-O-W response (several minutes on a
 > PII, 225 MHz, 2.4.19 kernel) to the /sbin/route command normal, or is
 > it an indication of a misconfiguration?  I have two Linux-based
 > routers with two Ethernet interfaces, static routing, iptable
 > filtering and NATing, etc., and both respond VERY SLOWLY when viewing
 > the routing table.  /sbin/route responds VERY quickly, however, if a
 > default route is either not specified or removed from the routing
 > table.  The iptable filter doesn't seem to matter (however one machine
 > takes a VERY long time (several minutes) to initialize my iptable
 > rules at boot-up).

 > Despite this, both machines seem to route and filter packets quite
 > nicely.  I'm just curious whether the slow response I'm observing is
 > normal, or an indication of a problem.
