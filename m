From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Compiling last node version.
Date: Thu, 04 Mar 2004 11:34:57 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1078392897.1273.11.camel@oh2bns.ampr.org>
References: <200403040004.24334@www.cabodesantapola.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200403040004.24334@www.cabodesantapola.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Thu, 2004-03-04 at 01:04, Ruben Navarro Huedo wrote:

> Checking for the existence of the Zlib headers... not found.
>             Without Zlib Node will lack compression support
>             See INSTALL for more information.

This is important. Zlib is not required and this *should* not be
fatal as such. However see below. 

> gcc  -o nodeusers user.o util.o nodeusers.o -lax25 -lax25io
> /usr/lib/libax25io.so: referencia a `deflate' sin definir
> /usr/lib/libax25io.so: referencia a `inflate' sin definir
> /usr/lib/libax25io.so: referencia a `inflateInit_' sin definir
> /usr/lib/libax25io.so: referencia a `deflateInit_' sin definir
> /usr/lib/libax25io.so: referencia a `inflateEnd' sin definir
> /usr/lib/libax25io.so: referencia a `deflateEnd' sin definir

Libax25 seems to be compiled with zlib support. That would suggest
that you have zlib installed (because of package dependencies).
But apparently zlib-dev is not installed?

The lack of zlib headers (from zlib-dev) makes node's configure
script drop the necessary linking option for zlib ('-lz' missing
at the end of the gcc command). And libax25io doesn't like that...

Conclusion: install zlib-dev.

> ii  libax25        0.0.10-1       ax25 libraries for hamradio applications
> ii  libax25-dev    0.0.10-1       ax25 library development files

This is not directly related but you really should upgrade to
libax25-0.0.11. Version 0.0.10 is buggy and can cause strange effects
with node-0.3.2.

-- 
Tomi Manninen / OH2BNS / KP20ME04

