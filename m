From: mvw@mvw.net
Subject: Cannot get serial card working: It worked ONCE.
Date: Tue, 10 Dec 2002 10:54:55 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212101053500.29729-100000@jeeves.mvw.net>
References: <Pine.LNX.4.44.0212101039080.29662-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212101039080.29662-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

Hello all,
 
New to this list but not to packet.
 
I am getting a box ready for ham packet radio use. Part of that is 
recompiling with ax.25 (done, see previous email), and part is attaching a 
TNC.
 
I did this and it worked once (I used minicom and was able to talk 
successfully to the TNC). I then did kissattach (which should be 
irrelevant, this should not survive a reboot and believe me, I've rebooted 
plenty). IN any case, it never worked again: now, when I try, I see 
nothing (no errors either). A breakout box shows no activity on pin 2 and 
RTS (pin 4) inactive (should be active). So the port may think it is not 
on. Why, when it did work once??

It is ttyS0. Oddly, when I now check using setserial, I see:
 
 	[root@dev root]# setserial /dev/ttyS0
 	/dev/ttyS0, UART: unknown, Port: 0x03f8, IRQ: 4
 	[root@dev root]# setserial /dev/ttyS1
 	/dev/ttyS1, UART: 16550A, Port: 0x02f8, IRQ: 3
 
DMESG says:
	ttyS01 at 0x02f8 (irq = 3) is a 16550A

If I do the kissattach I see:

	[root@dev ax25]# /usr/sbin/kissattach /dev/ttyS0 r1 44.135.90.46
	tty_speed: tcgetattr: Input/output error
	

Any ideas? What else can I try? I must surely be overlooking something 
totally obvious.

Michael VA3MVW

