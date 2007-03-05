From: Stef Daniels VK5HSX <vk5hsx@wia.org.au>
Subject: Problems ax25 with 1270b (TF27 chip)
Date: Mon, 05 Mar 2007 15:59:11 +1030
Message-ID: <1173072551.3328.52.camel@localhost.localdomain>
Reply-To: vk5hsx@wia.org.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams Mailing List <linux-hams@vger.kernel.org>

Greetings,

	A fellow sysop and myself have been working trying to get MFJ 1270b TNC
(using TF27 Hostmode chip) with Debian GNU\Linux (Stable).  The problem
is the fact that when we try to use 'call' command on that port the
TNC's 'STA' led comes on and hangs.  We have tried it with different O\S
(ie. Slackware, Debian), different kernels (2.4.33 & 2.6.14, 2.6.19)
without any luck. The TNC does work, as we have tested it on another
machine with packet.  The only change from the last system that worked
was now we are using modems as apposed to DRSI cards.

	Has anyone else come across this problem?

We are wondering if it has something to do with crc-mkiss or ax25. We
have compiled the ax25 libs, tools & apps from source and installed
binaries.

Any ideas, comments would be welcome..  ( I haven't given any scripts,
as the scripts were fine from last installation. However, it was more of
a question if someone else has come across this problem.

Thanks in advance..
-- 
Regards,

Stef Daniels VK5HSX             (OpenPGP:0x82BE2EB0)
Amateur Radio Station
Adelaide, South Australia
E-mail: vk5hsx@wia.org.au
Member Wireless Inst. of Aust.  (www.wia.org.au)
Proud Debian GNU\Linux User.    (www.au.debian.org)


