From: Luc Langehegermann <luc@lx2gt.lu>
Subject: Re: Usermode Soundmodem
Date: Wed, 28 Jul 2004 17:24:12 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200407281724.12201.luc@lx2gt.lu>
References: <E1BpBxl-0007Fp-00@penngrove.fdns.net> <41066EF6.9000200@cs.unibo.it> <1090949358.1278.29.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1090949358.1278.29.camel@oh2bns.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi Folks,

On Tuesday 27 July 2004 19:29, Tomi Manninen wrote:
> On Tue, 2004-07-27 at 18:04, Andrea Borgia wrote:
> > Unfortunately, I am not really a DSP expert, so there might be deeper
> > reasons why the soundmodem is using a specific sample rate rather than
> > the one most convenient to the hardware, especially considering that
> > quite a few recent chipsets only offer a limited selection of rates.
>
> I think most modems (but not all!) in soundmodem should work with
> any sample rate (above some minimum). Soundmodem requests the rate
> that best suits whatever modem is in use and then settles for
> whatever it gets (calculating stuff respectively).
>
> A command line switch to force a specific sample rate could be
> useful addition to soundmodem. (I think someone already did that?)

I have put my very ugly hack, that adds an command line switch to soundmodem 
online: http://www.lx2gt.lu/soundmodem/soundmodem-0.7-lx2gt.patch

It adds the '-r' command line switch to the configuration application, and the 
modem itself.

example:

soundmodemconfig -r 48000

to start the config program and force it to use 48kHz sampling rate.

73, LX2GT, Luc

