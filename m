From: "ravioli@softhome.net" <ravioli@softhome.net>
Subject: Re: soundcard pactor program: mailbox mode planned
Date: Fri, 05 Mar 2004 20:10:45 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4048D0B5.6030808@softhome.net>
References: <200403051359.12776.dl4mge@darc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200403051359.12776.dl4mge@darc.de>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?G=FCnther_Montag?= <dl4mge@darc.de>
Cc: linux-hams@vger.kernel.org, hfterm-hackers@lists.sourceforge.net, suse-ham-e@suse.com

G=FCnther Montag wrote:

>at the moment I maintain Tom Sailer's hf package,
>
Great !

> it is a linux soundcard FSK=20
>program that can transmit and rx pactor level 1, amtor, gtor, rtty.
>I had the idea to add a pactor mailbox feature, like winlink or airmai=
l which=20
>already exist. It might be interesting for clubs and hams who have a=20
>soundcard, but can not afford a ptc.
>I do not want to invent the wheel again, and i am still not so deep in=
 c.=20
>I think I am able to start with implement the command set, like usual =
in a=20
>mailbox. But I am looking for some tips, in what format to store the m=
ails=20
>(mbox? maildir? is there an other special format in packet mailboxes?)=
 and=20
>with which of the  existing programs I can connect my application (tnt=
?  tnn?=20
>dpbox? f6fbb?)=20
>
Can I strongly suggest to interface to F6FBB ?
- It is one of the main BBS programs.
- If you can interface to it, all the stuff of storing mails, etc...=20
will already be done.
- It seems that a lot of people are using it with Pactor TNC.
- There are, builtin, POP3, NEWS (NNTP) and SMTP servers,
which make F6FBB usable with any mail program : Outlook express, any ..=
=2E
One can read Packet nulletins with any News reader : Really great.

Some questions :
- I am more and more interested by Pactor but do not
known which kind of RX buying for HF. What do you suggest, please ?
- And how about the interface to the sound card ? (I'm not that good at=
=20
soldering, resistors, etc...)
- Does hfterm creates an AX25 interface like Soundmodem does ? It would=
=20
be so convenient ...

By the way, the web site you mentionned does not work, but this one doe=
s :
https://sourceforge.net/projects/hfterm

>to forward mails to packet and / or internet. Where can I=20
>begin to read?
>Thanks for your ideas!
>hf, last version 0.5, is at www.hfterm.sf.net
> =20
>

Regards

Remi F4ECW
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
