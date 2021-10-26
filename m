From: Brian <n1uro@n1uro.com>
Subject: NetRom stack bug
Date: Tue, 26 Oct 2021 13:53:16 -0400
Message-ID: <1635270796.2318.2.camel@n1uro.com>
Reply-To: n1uro@n1uro.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Greetings;

Is there any status report on the NetRom status bug getting fixed?
Unfortunately many users feel this is a bug within URONode code and it
is NOT. This is a bug where the kernel protocol stack is NOT closing
unused sockets which could in theory make it vulnerable to compromise.
-- 
I crashed into a dwarf at a traffic light. He said "I'm not
happy." so I asked which one was he.
-----
73 de Brian N1URO
Linux Partner Developer
Decades long Linux SysAdmin, DNS Host, Email Host
IPv6 Certified
URONode, axMail-FAX, HTPPU Ham software developer
Nutmeg VHF NTS Net - Net Manager
