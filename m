From: David Quental <ct1drb@iol.pt>
Subject: Problems in my ax25 interface.
Date: Sat, 11 Jun 2005 21:58:32 +0100
Message-ID: <200506112158.32378.ct1drb@iol.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hello to all.

Here at my setup I have an uscc-card configured like this:
(I used ax25-config utility to configure it properly)

modprobe ax25; scc
sccinit
ifconfig scc0 44.158.28.12 hw ax25 ct1drb-10 up  --> a 9k6 device
ifconfig scc1 44.158.28.12 hw ax25 ct1drb-11 up  --> a 1k2 device

All runs fine, but, lately I added the samba service. Now in my listen (where 
I can see traffic) I saw a lot of ip frames sending to the 1k2 device (I 
changed order in /etc/ax/ax25-up and now 1k2 device is in first place) and if 
I do rcax25 stop all system freezes.

How can I avoid this???

I configured config like this: ifconfig scc0 hw ax25 up but when I do call 1 
cs1gdx-1 it says that modens are no up, but have reception.

Best 73s and till next email.

CT1DRB
David Quental

