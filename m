From: "Wilson G. Hein" <vze2b869@verizon.net>
Subject: RE: KPC 9612+ and kissattach
Date: Tue, 3 Sep 2002 01:33:22 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCBBKBAJDJIPKFIAFBKLKEFNEGAC.vze2b869@verizon.net>
References: <001201c252f6$b12639a0$fe5d34d1@platinum.net>
Reply-To: <wghein@ptd.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001201c252f6$b12639a0$fe5d34d1@platinum.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Try configuring both ports and see if it makes any difference.

Regards,
Wilson, WJ3G

> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org]On Behalf Of Ian McLaughlin
> Sent: Monday, September 02, 2002 11:05 PM
> To: M Taylor
> Cc: linux-hams@vger.kernel.org
> Subject: Re: KPC 9612+ and kissattach
>
>
> Thanks for the quick response.  I did consult the HOWTO, and my
> commands are
> based on the ones you listed.  I'm only using the 9600 baud port,
> so I only
> have a kissattach line for the second port.  This is not working, however.
> What I wanted to confirm is that I'm correctly putting the 9612+ into kiss
> mode.  I'm using a factory default config, with MYCALL set, and
> then INTFACE
> KISS.  Is this correct?  All of my configs work just fine
> connecting to the
> TNC in a Kenwood D7A handheld, but not the KPC9612.
>
> Thanks.
>
> ----- Original Message -----
> From: "M Taylor" <mctylr@privacy.nb.ca>
> To: "Ian McLaughlin" <ian@platinum.net>
> Cc: <linux-hams@vger.kernel.org>
> Sent: Monday, September 02, 2002 7:29 PM
> Subject: Re: KPC 9612+ and kissattach
>
>
> > On Mon, Sep 02, 2002 at 04:01:58PM -0700, Ian McLaughlin wrote:
> > > Hello All,
> > >   I have searched the archives, but cannot find a solution to my
> problem.
> > >
> > > 2 machines trying to talk to each other.  One seems to work, one
> doesn't.
> > >
> > > Software config the same on each one - RedHat 7.3 with the
> ax25 libs and
> > > utils installed.  Kernel recompiled to support ax25 and kiss devices.
> > >
> > > The machine that works is using a Kenwood D7A radio at 9600
> baud in kiss
> > > mode.  kissattach seems to work, and if I ping the other end of the
> radio
> > > link, I get the radio going in to transmit mode in sync with the ping
> > > packets.
> > >
> > > The other end, however is a different story.  It's a Kantronics KPC
> 9612+,
> > > with no radio on the first port, and a 9600 baud radio on the second
> port.
> > > Minicom works fine, and I can connect to the tnc and send and receive
> data
> > > on the TNC.  My problem appears to be with mkiss.  Am I correct in
> assuming
> > > that I need to run mkiss because the KPC 9612 is a dual-port
> TNC?  I am
> > > running the foillowing commands:
> > >
> > > mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 /dev/ptyq1
> > > kissattach /dev/ttyq1 RADIO 172.16.0.2
> > >
> > > The commands are accepted, and a network device is create, but if I
> ping, I
> > > get no radio traffic at all.
> >
> > Check the AX25-HOWTO section 6.1.1.1 ("Configuring for Dual Port TNC's")
> > <http://www.tldp.org/HOWTO/AX25-HOWTO/x495.html>
> >
> > (the short form:)
> >
> > # /usr/sbin/mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 /dev/ptyq1
> > # /usr/sbin/kissattach /dev/ttyq0 port1 44.135.96.242
> > # /usr/sbin/kissattach /dev/ttyq1 port2 44.135.96.242
> >
> > -ve1mct
> >
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

