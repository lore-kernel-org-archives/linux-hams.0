From: Kjell Jarl <K-Jarl@algonet.se>
Subject: 2.4.19 panic, netrom
Date: Tue, 29 Apr 2003 08:12:47 +0200
Sender: linux-hams-owner@localhost
Message-ID: <3EAE17DF.6060904@algonet.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi,
I now think I can repeat the netrom disconnect causing kernel panics.

Netrom over ax.25.

It seems that outstanding netrom frames when the disconnect arrives is 
dangerous:

- I issue a netrom connect to a distand node.
- When connected, I send sveral "b" commands.
- When (unsure of the number) one or two "b" has been sent, there comes 
a netrom disconnect from the remote station.
- In my vnc window, the last thing I saw was another b being sent to my 
neighboring node after the disconnect arrived.


Red Hat Linux release 7.1 (Seawolf)
Kernel 2.4.19 on an i586
uscc card 1200 bit


73
Kjell, sm7gvf


