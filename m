From: Bill Vodall - WA7NWP <wa7nwp@jnos.org>
Subject: ax25 in Suse 9.0 disconnects itself
Date: Sun, 28 Mar 2004 21:10:02 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0403282108080.20359-100000@mlark.vodall.isomedia.com>
References: <200403281742.i2SHg9Bf030932@yagi.h-net.msu.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200403281742.i2SHg9Bf030932@yagi.h-net.msu.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Is there any known gotchas with AX25 in Suse 9.0.  We're doing
just what I do with 8.2 and it's not working in 9.0.

For some reason, I'm disconnecting myself when the node I
connect to responds.

---

..connect request from wa7nwp-3 to ELYSSA...

vhf: fm ELYSSA to WA7NWP-3 ctl UA- 15:42:20
vhf: fm WA7NWP-3 to ELYSSA ctl DISC+ 15:42:21
vhf: fm WA7NWP-3 to ELYSSA ctl DISC+ 15:42:21

vhf: fm ELYSSA to WA7NWP-3 ctl I00^ pid=F0(Text) len 113 15:42:21
0000  ###CONNECTED TO NODE ELYSSA(K7IDX) CHANNEL AMMT. JUPITER 3250 fe
0040  et SOLAR POWERMENTER COMMAND: B,C,J,N, or Help ?M
vhf: fm ELYSSA to WA7NWP-3 ctl UA- 15:42:26
vhf: fm ELYSSA to WA7NWP-3 ctl DM- 15:42:26

---

Any suggestions?

Thanks,
Bill - WA7NWP



