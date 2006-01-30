From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 10:23:01 -0800
Message-ID: <d5d4185b0601301023h5f920023n17a8612d7515698c@mail.gmail.com>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>
	 <d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>
	 <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org>
	 <1138629532.7628.2.camel@CO> <43DE5851.33E01B71@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43DE5851.33E01B71@free.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On 1/30/06, G=E9rard / F6FGZ <f6fgz@free.fr> wrote:
> "Wilson G. Hein" wrote :
>
> > Easiest way is to use minicom (terminal program) to make the change=
s in
> > the tnc. There maybe ways to do this using echo to send data to the
> > serial line (/dev/ttyS0), I find it just as easy to use minicom.
>
> (1) To exit:
>
> echo "Exiting KISS mode on port COM1"
> echo -e "\300\377\300\r" >/dev/ttyS0
>
> (2) To enter again, the same kind of script might work with KPC-9612 =
(not tested):
>
> echo "Entering KISS mode on port COM1"
> echo -e "INTFACE KISS\r" >/dev/ttyS0
>
> Then do a reset.
>
> --
> 73 G=E9rard F6FGZ

One thing you might want to do is also send a CTRL-C character (ASC
03) before sending the INTFACE KISS command - that way, if you, for
some reason, aren't in the command mode on the TNC, it will put you
there.

Just a thought.

Jeremy, NW7JU
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
