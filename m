From: <paul.hamradio@verizon.net>
Subject: slip interface
Date: Sat, 27 Nov 2004 19:19:10 -0800
Message-ID: <20041128031910.FSQD1390.out001.verizon.net@outgoing.verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Hello All,

I have just installed FC3 and need to setup a slip interface.

I have slip loaded as a module but cannot get the interface up and running.

This is the syntax I used under RH7.2:

/sbin/slattach -p slip -s 38400 /dev/ptypf &

result:  slattach: tty_open(/dev/ptypf, RW): No such device or address

Someone suggested I try this:

/sbin/slattach -q -v -s 38400 -p slip ptypf &

result: [1] 2620

All comments and suggestions are most welcome!

Paul Delaney
AE6JN

