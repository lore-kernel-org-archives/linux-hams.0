From: =?iso-8859-15?q?G=FCnther=20Montag=20?= <dl4mge@darc.de>
Subject: soundcard pactor program: mailbox mode planned
Date: Fri, 5 Mar 2004 13:59:12 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200403051359.12776.dl4mge@darc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org
Cc: hfterm-hackers@lists.sourceforge.net, suse-ham-e@suse.com

Hello friends
at the moment I maintain Tom Sailer's hf package, it is a linux soundca=
rd FSK=20
program that can transmit and rx pactor level 1, amtor, gtor, rtty.
I had the idea to add a pactor mailbox feature, like winlink or airmail=
 which=20
already exist. It might be interesting for clubs and hams who have a=20
soundcard, but can not afford a ptc.
I do not want to invent the wheel again, and i am still not so deep in =
c.=20
I think I am able to start with implement the command set, like usual i=
n a=20
mailbox. But I am looking for some tips, in what format to store the ma=
ils=20
(mbox? maildir? is there an other special format in packet mailboxes?) =
and=20
with which of the  existing programs I can connect my application (tnt?=
  tnn?=20
dpbox? f6fbb?) to forward mails to packet and / or internet. Where can =
I=20
begin to read?
Thanks for your ideas!
hf, last version 0.5, is at www.hfterm.sf.net
--=20
73 de
G=FCnther
dl4mge@darc.de
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
