From: Bill Walton <kj6eo@kj6eo.com>
Subject: Re: nrattach "Cannot find free NET/ROM device" error!
Date: Wed, 02 Oct 2002 14:29:50 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D9B654E.BDF3F023@kj6eo.com>
References: <Pine.LNX.4.44.0210022353020.10853-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tpm@prkele.tky.hut.fi
Cc: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

Hi Tomi -

Thank you for your response regarding the NETROM problems that I was
having.  YES...you were absolutely correct, somehow I did not get the
netrom module loaded.  I thought that I compiled it directly into the kernel
but I must have choosen an <M> during the kernel configuration.

Again, your help is most appreciated!

Regards,

Bill KJ6EO

Tomi Manninen wrote:

> On Wed, 2 Oct 2002, Bill Walton wrote:
>
> > Sounds easy but it doesn't work.  Here is what I get when I enter in the
> > "nrattach netrom" command:
> >
> > nrattach: SIOCGIFFLAGS: no such device
> > nrattach: cannot find free NET/ROM device
>
> Is netrom compiled as a module? Have you loaded the module?
> (modprobe netrom)
>
> --
> Tomi Manninen           Internet:  oh2bns@sral.fi
> OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
> KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

