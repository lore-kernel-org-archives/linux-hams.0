From: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Subject: Re: Conflicting node name for services
Date: Sun, 22 Dec 2002 09:09:05 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E057320.EDFC92A7@free.fr>
References: <Pine.LNX.4.44.0212220138420.3171-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

Tomi Manninen wrote :

> > In /etc/services use the following line:
> > netrom          3694/tcp                        # OH2BNS's node sof=
tware
>
> Ok, good to know. But just out of curiosity, what service did conflic=
t
> with "node" ? My /etc/services from RH8 doesn't show any conflicts...

Hi Tomi,

I use a Mandrake 8.1 distribution and the /etc/services file belonging =
to
setup-2.2.0-12mdk package includes the following line :
hp-managed-node 382/tcp    hp performance data managed node

So when I telneted localhost on port node (telnet localhost node) it wo=
rked but it
was 382 instead of 3694. BTW, telnet on numeric 3694 port didn't worked=
=2E

--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
