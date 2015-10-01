From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: Force mkiss to reset the line discipline when serial device is removed
Date: Thu, 01 Oct 2015 18:56:39 +0200
Message-ID: <560D65C7.30707@eclis.ch>
References: <20151001073117.GA31401@linux-mips.org> <1443691088-30478-1-git-send-email-jc@eclis.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1443691088-30478-1-git-send-email-jc@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: Thomas Osterried <thomas@osterried.de>, David Ranch <dranch@trinnet.net>, Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Greg and Jiri,

I try to fix a kernel panic bug related to the AX25 (and probably SLIP) 
line discipline when the corresponding serial device is removed [1]. I 
proposed some patches [2] [3] on the linux-hams mailing list but I think 
there raise more questions about how tty_ldisc_hangup() should work when 
a serial device is removed [4].

I actually see the following options:

a) Let the specific line discipline set the TTY_DRIVER_RESET_TERMIOS 
flag in tty->driver as in [2] but this is suspected bad practice [5].

b) Let the specific line discipline set the TTY_OTHER_CLOSED flag in tty 
and check it in tty_ldisc_hangup() as in [3].

c) Let the specific line discipline set the TTY_LDISC_HALTED flag in tty 
and check it in tty_ldisc_hangup().

d) Let the specific line discipline set a new flag for that purpose, for 
example TTY_LDISC_RESET, and check it in tty_ldisc_hangup().

e) Close the tty earlier so that tty_ldisc_reinit() is not even called. 
Need some advise on how this should be done.

f) That's all wrong, something other need to be changed.

I would appreciate some comments from tty subsystem experts about this 
issue.

[1] http://www.spinics.net/lists/linux-hams/msg03500.html
[2] http://www.spinics.net/lists/linux-hams/msg03511.html
[3] http://www.spinics.net/lists/linux-hams/msg03513.html
[4] http://www.spinics.net/lists/linux-hams/msg03509.html
[5] http://www.spinics.net/lists/linux-hams/msg03512.html

Best Regards,
Jean-Christian de Rivaz

