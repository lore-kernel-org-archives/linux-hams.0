From: Florian Zagler <FlorianZagler@web.de>
Subject: Problems with bpq-interface
Date: Wed, 28 May 2003 12:45:09 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3ED49335.6050903@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all,

I have problems getting the bpq0 interface work.
My computers are running Debian Woody (kiss and bpq) and Mandrake 9.1 
(bpq) and the problem is on both.

I use the following command to bring it up:

ifconfig bpq0 hw ax25 DG1CAD-12 up

In the /etc/axports file I have the following entries:

kiss    DG1CAD-10       19200   255     7       KISS TNC
ether   DG1CAD-12       100000  255     7       BPQ/ethernet

But I get the following message everytime I try to access this interface:

----    snip    ----
gateway:~# axparms -route add ether dg1cad-12
axconfig: port ether not active
axparms: invalid port name - ether
gateway:~#
----    snip    ----

I didn't find a solution in the AX25-HOWTO and the manpages.

Is there a bug or do I use the wrong commands?

Regards,
Florian

