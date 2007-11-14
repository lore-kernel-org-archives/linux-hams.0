From: "Bill Vodall WA7NWP" <wa7nwp@gmail.com>
Subject: Re: KISS packets and NetCat
Date: Wed, 14 Nov 2007 17:20:29 +0000
Message-ID: <5abd436b0711140920u1cce82c8v201ffa9f83e94bbb@mail.gmail.com>
References: <5abd436b0711131050o1563c9fh468cb1c1c1660c84@mail.gmail.com>
	 <15109.141.129.1.98.1194982763.squirrel@mckeehan.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Di/sdn4WGm97wIvQBwIwAyWBQYka0tyFu5W2cZPONM4=;
        b=ryy7UiapO2tDQD0brN4J0C9gA4ZON2Bs399AY5aCpy/Phhr95CYewaBvwyNpw5W7wP3YEdaYHtA8Mh4GDkwpNh3RprvKEeBM49dt9RLmwMSjhPTS4aqtdpHse3ZPGvBPkZv1yS52HKdMQeWUa0ajkuzFNrUR1C21rRRnIn9/f5A=
In-Reply-To: <15109.141.129.1.98.1194982763.squirrel@mckeehan.homeip.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Thanks for the reference to the Wiki page.  Good info and it led me to
discover the Remote Serial client for Windows.

I've use Remserial and it works well.  The missing piece is that I'd
like to have multiple clients connect to the exported serial port.  I
believe that's possible with Netcat but isn't with remserial.

Hmmm.  I bet we can add remserial to NOS...

73
Bill WA7NWP

> I'm doing something similar, but using remserial.
>
> Details are here:
> http://mckeehan.homeip.net/wiki/wikka.php?wakka=PacketRadioRemoteSerial
>
> --
> William McKeehan
> KI4HDU
> http://mckeehan.homeip.net
>
>
> On Tue, November 13, 2007 1:50 pm, Bill Vodall WA7NWP wrote:
> > Has anybody tried creating a KISS serial stream with NET2KISS and then
> > exporting that to multiple other systems with NETCAT?
> >
> > Maybe even doing something similar without AX25 using KISSNET2 to
> > create multiple serial ports and hooking one of them to NETCAT..
> >
> > Thanks,
> > Bill - WA7NWP
