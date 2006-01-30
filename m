From: =?iso-8859-1?Q?G=E9rard?= / F6FGZ <f6fgz@free.fr>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 19:17:53 +0100
Message-ID: <43DE5851.33E01B71@free.fr>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>
		<d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>
		<Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org> <1138629532.7628.2.camel@CO>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

"Wilson G. Hein" wrote :

> Easiest way is to use minicom (terminal program) to make the changes =
in
> the tnc. There maybe ways to do this using echo to send data to the
> serial line (/dev/ttyS0), I find it just as easy to use minicom.

(1) To exit:

echo "Exiting KISS mode on port COM1"
echo -e "\300\377\300\r" >/dev/ttyS0

(2) To enter again, the same kind of script might work with KPC-9612 (n=
ot tested):

echo "Entering KISS mode on port COM1"
echo -e "INTFACE KISS\r" >/dev/ttyS0

Then do a reset.

--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
