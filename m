From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: more hamlib and gMFSK problems
Date: Mon, 03 May 2004 17:13:10 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1083593589.1273.39.camel@oh2bns.ampr.org>
References: <1083553053.5208.6.camel@dhcppc3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1083553053.5208.6.camel@dhcppc3>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Mon, 2004-05-03 at 05:57, N5NW Marty wrote:

> configure: error: Library requirements (libgnomeui-2.0 hamlib) not met;
> consider adjusting the PKG_CONFIG_PATH environment variable if your
> libraries are in a nonstandard prefix so pkg-config can find them.
...
> Apparently my hamlib is not installed correctly.  It is in the directory
> /usr/local/lib with a bunch of rig-specific hamlib files, and a
> subdirectory called pkgconfig with the files fftw3.pc and hamlib.pc in
> it.

It is installed correctly but in a non-standard place (/usr/local).
You have already configured the dynamic linker to look under /usr/local
but you have to give pkg-config a hint too. To do that see what
"man pkg-config" says about PKG_CONFIG_PATH.

-- 
Tomi Manninen / OH2BNS / KP20ME04

