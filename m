From: Dennis Boone <drb@msu.edu>
Subject: Re: Canot get serial card working: It worked ONCE.
Date: Tue, 10 Dec 2002 14:02:07 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18Lpdw-0002aB-00@yagi.h-net.msu.edu>
References: <Pine.LNX.4.33.0212100922580.1291-100000@wapiti.tc.fluke.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Tue, 10 Dec 2002 09:27:26 PST.)
             <Pine.LNX.4.33.0212100922580.1291-100000@wapiti.tc.fluke.com> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

 > I did this and it worked once (I used minicom and was able to talk
 > successfully to the TNC). I then did kissattach (which should be
 > irrelevant, this should not survive a reboot and believe me, I;ve
 > rebooted plenty). IN any case, it never worked again: now, when I
 > try, I see nothing (no errors either). A breakout box shows no
 > activity on pin 2 and RTS (pin 4) inactive (should be active). So
 > the port may think it is not on.

Any chance you had a kernel module loaded that first time that isn't
loaded now?  Presumably, the culprit would be the serial port driver.
It'd mean the automatic loading stuff isn't working, but that's not
unheard of.

Dennis Boone
KB8ZQZ
