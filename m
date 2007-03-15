From: "Bill Vodall WA7NWP" <wa7nwp@gmail.com>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 10:03:50 -0700
Message-ID: <5abd436b0703151003j19c9a14eyf88f0c59f9ad26a4@mail.gmail.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
	 <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
	 <1173962835.1770.27.camel@CO>
	 <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
	 <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
	 <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
	 <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
	 <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
	 <24338.141.129.1.98.1173970674.squirrel@mckeehan.homeip.net>
	 <Pine.SUN.4.58.0703150758470.13415@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=t3jbfkRYzcSur9rGn/q38Qikqd50mhnr/3GXZjqYQpiPGuEKI29i05Z6zagD2DHp2U9vsDtwWjglVGiJtkwpCkenDWRuscz/YRINwUXYeUJAhfWpA848IkgjEAaZbEKWb6MiOsr39UHXIA1VBgo0kUo4Hk80cPlMBZoFNp26csI=
In-Reply-To: <Pine.SUN.4.58.0703150758470.13415@eskimo.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: William McKeehan <mckeehan@mckeehan.homeip.net>, Stephen Brown Jr <stephen.brown75@gmail.com>

> > Is there a way to setup Xastir on one linux box and have it talk to the AX.25
> > stack on a second box?

Yes - this is actually taken from some of the Xastir docs..

  http://nwp.ampr2.net/jnos/RemoteSerial

As long as you're on one Linux box, it works best to KISSATTACH the
external device and then multiple applications can all use the AX25
device at the same time.  If you need to access it from an application
that talks KISS but not Linux-AX25, then use the net2kiss command to
bring the AX25 data to a virtual serial port.  That's how JNOS talks
"packet" on a linux system.

73
Bill - WA7NWP

>
> Yes.  You'd turn on "Interface->Enable Server Ports" on the Xastir
> instance running on the system with the AX.25 stack.  This makes a
> TCP/IP port available which the other Xastir can connect to.
>
> You'd also need to enable gating of your packets through that system
> to the RF interfaces via the ~/.xastir/data/nws-stations.txt file.
> Enter the callsign-SSID of the remote Xastir station on a separate
> line in that file.
>
> I don't recall whether you'd have to enable igating on the Xastir
> interface and globally on the File->Configure->Defaults dialog as
> well.  Test it and see.  In any case I'm running a wireless laptop
> at home sometimes with Xastir, gating to RF via another Xastir on
> the desktop which is hooked to the TNC.  Same basic setup as what
> you're asking about.
>
> --
> Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
> "Lotto:    A tax on people who are bad at math." -- unknown
> "Windows:  Microsoft's tax on computer illiterates." -- WE7U
> "The world DOES revolve around me:  I picked the coordinate system!"
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
