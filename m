From: "Stephen Brown Jr" <stephen.brown75@gmail.com>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 10:46:15 -0400
Message-ID: <dd22fa9c0703150746t3411b9a9x9a1ad31463d0e2c4@mail.gmail.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
	 <45F8566D.10206@wa7v.com>
	 <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
	 <1173962835.1770.27.camel@CO>
	 <dd22fa9c0703150638t3c99b86o4a7958d394333486@mail.gmail.com>
	 <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
	 <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
	 <48539.141.129.1.98.1173969577.squirrel@mckeehan.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=rIh+bSJvL8ETwuDooqAMGYg3mrjEkDYcTCtBs1OB4ey4GGrgH+mBpcLsqD+2IKFDLTXKPlJeV378CwThnVMM6pVgZyXo5tYv5HE1cu2suNoMaDhiMMsFgtXl3uLX0CVS3y1b/ndc1Kwxy2hFjXMS7qSgvbJMq98R8xAc0WINTG4=
In-Reply-To: <48539.141.129.1.98.1173969577.squirrel@mckeehan.homeip.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Xastir works well with the AX.25 stuff(as it should), I'm able to get
packets between both machines using AXIP, the hard part is trying to
figure out how to get data to/from the TNC to Xastir using AXIP on the
remote machine where the TNC is connected. I've seen AX25d come up
more than once, can AX25d be used for APRS or is it more geared
towards conventional connected mode packet?

Maybe AX25d is what I need to focus my sights on?

On 3/15/07, William McKeehan <mckeehan@mckeehan.homeip.net> wrote:
> I have javaprssrvr setup to talk to ax25:
>   TNCModule=javAPRSDigi
>   digiTNCInterface=ax25Interface
>   ax25TNCPortName=aprs
>
> Then I also have digi_ned talking to ax25
>   digi_ned -p aprs
> (notice the same port name was used).
>
> Then I have the aprs port setup in my axports file:
>   aprs    KI4HDU  9600    255     2       SOUNDMODEM
>   #kiss   KI4HDU-0        9600    255     2       KISS
>
> The kiss line was used when I had a kiss mode TNC attached. I would change hte
> port in the javaprssrvr ini and the digi_ned startup to use the kiss port as
> opposed to the aprsw port.
>
> Before I startup javaprssrvr and digi_ned, I start ax25d (/usr/sbin/ax25d);
> before I startup ax25d, I start my low level interfaces.
> For the aprs port defined above:  /usr/sbin/sounmodem -M -s
> For the kiss port defined above: /usr/sbin/kissattach /dev/ttyS0 kiss
> 192.168.10.1
>
> Note that the port name on the kissattach command, "kiss", matches the port
> defined in the axports file.
>
> So I can have multiple things accessing the same TNC on the same box (via the
> ax25d), but I have not yet figured out how to do that remotely.
>
> Hope this helps!
>
> --
> William McKeehan
>
> On Thu, March 15, 2007 10:16 am, Stephen Brown Jr wrote:
> > Ok, that will work good for regular connected mode packet, how would I
> > set it up for APRS? I have two apps, both of which will run in the
> > background and a third app(xastir) connected via an AXIP link from
> > another box.
> >
> > I'm getting closer........
>
