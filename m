From: "John A. Magliacane" <kd2bd@yahoo.com>
Subject: Is S-L-O-W /sbin/route response normal?
Date: Mon, 17 Mar 2003 11:51:16 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030317195116.69800.qmail@web12207.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi Folks.

When viewing routing tables, is S-L-O-W response (several minutes on
a PII, 225 MHz, 2.4.19 kernel) to the /sbin/route command normal, or
is it an indication of a misconfiguration?  I have two Linux-based
routers with two Ethernet interfaces, static routing, iptable filtering
and NATing, etc., and both respond VERY SLOWLY when viewing the routing
table.  /sbin/route responds VERY quickly, however, if a default route
is either not specified or removed from the routing table.  The iptable
filter doesn't seem to matter (however one machine takes a VERY long
time (several minutes) to initialize my iptable rules at boot-up).

Despite this, both machines seem to route and filter packets quite
nicely.  I'm just curious whether the slow response I'm observing
is normal, or an indication of a problem.

Thanks in advance...


73, de John, KD2BD


=====
-=-=-=-=-=-=-=-=- John A. Magliacane, KD2BD -=-=-=-=-=-=-=-=-=-=-=-=-=-
   Internet  : kd2bd@amsat.org  |  Video : 426.250 MHz/439.250 MHz
   Satellite : UoSAT-OSCAR-22   |  Morse : -.-  -..  ..---  -...  -..
   Voice     : +1.732.224.2948  |  WWW   : http://www.qsl.net/kd2bd/
-=-=-=-=-=-=-=-= Linux Doesn't Cost.  It Pays. =-=-=-=-=-=-=-=-=-=-=-=-

__________________________________________________
Do you Yahoo!?
Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
http://platinum.yahoo.com
