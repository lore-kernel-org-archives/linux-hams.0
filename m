From: "bob krasko" <rkrasko1@nycap.rr.com>
Subject: config troubleshooting
Date: Tue, 28 Dec 2004 15:06:25 -0500
Message-ID: <LFENLEGCDLCOKEJAECGNOEODCDAA.rkrasko1@nycap.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


my axports file is as follows:
radio	kb2tgd-13	9600	255	2	(1200 baud port)

ax25d.conf file is as follows:
[kb2tgd-13 via radio]
nocall	* * * * * * *
default	* * * * * * * -ax25	/usr/sbin/node	node

everything else is ##

i am trying to configure debian 2.4.18


when i do a kissattach i use the command:
kissattach /dev/ttyS0 radio
i get an error message that starts with usage: -l  etc.
i have tried it with many other possibilities and have come to the
conclusion that:

my configuration is not correct.

according to the ax25 how to, i try /usr/sbin/kissattach and get the error
that kissattach is not
a directory.

i have also gotten errors saying mkiss may not be loaded as a module, but
when i do a mkiss command i get a usage:  xxxxxxx   so mkiss must be loaded,
but i am using it wrong.

i am using a dual port tnc, a pk 9612 kantronics, and in my gut i think the
problem is in configuring this tnc, even though i do not have a use for the
9600 baud side of the tnc.

the 9600 in axports, is the speed of the comport and not the speed of the
node system i am on, right?

i have also input my ampr.org address of 44.69.12.254 as the address for the
kissattach ports but am so confused at this time i am not sure if it needs
that address or some kind or other network address.

i have gone back to 2003 in back posts, read the how to so many times i feel
stupid because the answer must be right there but i am missing it.

i know there is a call and a listen program in the kernel somewhere also,
that will eventually use some other file that has to be set up.

thanks for your patience.
bk

