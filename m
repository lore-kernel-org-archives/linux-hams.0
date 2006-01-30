From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 12:47:07 -0800
Message-ID: <43DE7B4B.5040509@jnos.org>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>		<d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>		<Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org> <1138629532.7628.2.camel@CO> <43DE5851.33E01B71@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43DE5851.33E01B71@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Once kissattach has grabbed a serial port, it's apparently not possible 
to do the "echo's" or minicom operations to that port without killing 
the kissattach.

No problem for bringing a TNC out of KISS mode:

   kissparms -x -p <port>

What would be very cool is a tweak to kissparms to allow sending text to 
the port.  Something like:

   kissparms -p <port> -t "^C\rINTFACE KISS\rRESET\r"

A quick and dirty dump terminal to talk to the tnc manually would be 
useful at times too..


So many projects...

  > (2) To enter again, the same kind of script might work with KPC-9612 
(not tested):
> 
> echo "Entering KISS mode on port COM1"
> echo -e "INTFACE KISS\r" >/dev/ttyS0


73,
Bill - WA7NWP

