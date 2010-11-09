From: Cathryn Mataga <cathryn@junglevision.com>
Subject: xfbbd oddness.
Date: Tue, 09 Nov 2010 11:09:23 -0800
Message-ID: <4CD99C63.4030406@junglevision.com>
References: <Pine.LNX.4.64.1005271432450.5422@ask.diku.dk> <20100527.162919.115912825.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100527.162919.115912825.davem@davemloft.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: Gary Mitchell <wb6yru@aenet.net>, bernard.pidoux@upmic.fr


well, I'm running xfbbd, and it's forwarding via internet
no problem.  But I have an actual RF connection over AX25 that
I'm trying to make work and I'm getting a fault here.


I haven't really spent any time on this, but I'm just posting
my backtrace here in case anyone else has been this way before.


This is the version R11 off the website with no changes by me.
The older version did the same thing, so this isn't a new issue.

uname -v shows

2.6.32.21-i68.fc12.i686.PAE

This is an SMP kernel, maybe this is still a problem?


It's dying in sig_fct, which doesn't actually do anything with
SIGPIPE.   "SIGPIPE is the signal sent to a process when
it attempts to write to a pipe without a process connected
to the other end."

Could this be an attempt by FBB to write a packet, after
the connection has been closed?   (This is just me thinking
out loud here.)


Time out 200 mn
Timeout voie 73 depasse
Program received signal SIGPIPE, Broken pipe.
0x0016c416 in __kernel_vsyscall ()



(gdb) down
#0  0x0804da80 in sig_fct ()
(gdb) backtrace
#0  0x0804da80 in sig_fct ()
#1  <signal handler called>
#2  0x0016c416 in __kernel_vsyscall ()
#3  0x00a85f73 in __write_nocancel () from /lib/libc.so.6
#4  0x0806cec4 in snd_sck ()
#5  0x0805c18c in snd_drv ()
#6  0x080bc909 in send_buf ()
#7  0x0808eff8 in traite_voie ()
#8  0x080908e8 in user_time_out ()
#9  0x08091899 in kernel ()
#10 0x0804dcf2 in process ()
#11 0x080507d2 in fbb_orb ()
#12 0x0804e05e in main ()
(gdb)
