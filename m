From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: mkiss and kernel 2.4.x ?
Date: Thu, 18 Apr 2002 22:19:17 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3CBF2A45.B4F5EF1F@ccr.jussieu.fr>
References: <Pine.LNX.4.33.0204071636180.27548-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tpm@prkele.tky.hut.fi
Cc: xfbb@f6fbb.org, Linux-Ham Kernel <linux-hams@vger.kernel.org>

Hi,

After further tests I found what was wrong with my ax25 setup script.
One must first perform a kissattach, then configure mkiss.

For example :

/usr/sbin/kissattach /dev/ptyp0 0 44.151.92.16
/usr/sbin/kissattach /dev/ptyp1 1 44.151.92.16
/usr/sbin/mkiss -l -s 38400 /dev/ttyS0 /dev/ttyp0 /dev/ttyp1

If I configure mkiss first, like I do without problems on my Linux
2.2.20 machine it is no longer working with 2.4.x kernel or AX25
applications or libs.

As there is no message when mkiss is invoked via a script I did not
notice the error until yesterday.
When mkiss is configured manually on a command line, there is an error
message if kissattach
was not performed first.

Maybe I was wrong to do it that way (i.e. mkiss before kissattach) in my
PC with a 2.2.20 kernel, but it worked.

Now all is working fine, thanks to Tomi for his encouraging answer.


73 de Bernard, F6BVP.


------------------

Tomi Manninen wrote :
> 
> On Sun, 7 Apr 2002, Bernard Pidoux wrote:
> 
> > Can someone confirm that mkiss is not broken in 2.4.x kernel ?
> > If not what should be different in mkiss installation with this new
> > kernel ?
> 
> I use mkiss daily with a single TNC-2 clone with JKISS eprom. The setup
> scripts are identical to what they used to be when I had 2.2.x.
> 
> --
> Tomi Manninen           Internet:  oh2bns@sral.fi
> OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
> KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org
