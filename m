From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Baycom modem and simple text ui
Date: Tue, 9 Aug 2005 09:51:20 -0700
Message-ID: <20050809165120.GA20715@oz.net>
References: <4076450105080900355ec82283@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4076450105080900355ec82283@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Aug 09, 2005 at 12:35:05AM -0700, Jonathan Lassoff wrote:
> I just put together a simple modem that functions the same as the
> classic "dumb" baycom modem. It just turns RS-232 data into tones and
> vice-versa. I got the Baycom software to run off a DOS bootdisk, and
> the modem works just great. But what I would really like to do is do
> the same stuff under linux so I can do it over SSH. :)
> 
> The only software package I could find that provides similar
> functionality to the original baycom software is tfkiss, but I have
> been unsuccessful in getting it to compile. The tarball looks
> antiquated, and it fails compilation on my modern linux system (I'm
> not much of a software guy; I'm learning). Does anyone know of an
> application that pretends to be a TNC and makes all the nicely
> formatted packets with just the simple text interface? Perhaps someone
> knows how I can compile tfkiss properly? Any and all comments
> appreciated.


Baycom modems are supported in Linux.  Try either the baycom_ser_fdx or 
baycom_ser_hdx drivers (you may need to configure/compile your kernel, 
although they in some packaged kernels, e.g., Debian and some others).  
See Documentation/networking/baycom.txt in the Linux source tarball for 
more details.

Bob, N7XY

