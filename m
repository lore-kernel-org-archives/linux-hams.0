From: =?iso-8859-15?q?G=FCnther=20Montag=20?= <Safari.Doktor@addcom.de>
Subject: sorry for crash in hf-0.6.4, fixed in hf0.6.5
Date: Mon, 15 Nov 2004 10:40:29 +0100
Message-ID: <200411151040.29930.Safari.Doktor@addcom.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linlink@wetnet.net
Cc: linux hams <linux-hams@vger.kernel.org>, ralf-axel-krause@gmx.de, suse-ham-e@suse.com, -HFTERMHACKERS- <hfterm-hackers@lists.sourceforge.net>

Hello friends
Due to not storing the rx window, after some minutes of rx
(depending on amount of data) hf-0.6.4 died of buffer=20
overflow.
I fixed that in 0.6.5.=20
The calibration programs have now bettwe output and write=20
the configuration automagically,=20
the mailbox feature has been improved, tested successfully=20
also with repeated connects in Pactor and Amtor ARQ and=20
=46EC.=20
Welcome to download at http://hfterm.sf.net, please all bugs=20
and flames to the hfterm hackers list. 73 !!
--=20
G=FCnther Montag
Safari.Doktor@addcom.de

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
