From: <w9ya@arrl.net>
Subject: RE: more hamlib and gMFSK problems
Date: Mon, 3 May 2004 10:54:13 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <33777.192.168.1.116.1083599653.squirrel@gateway>
References: <1083593589.1273.39.camel@oh2bns.ampr.org>
        <S263735AbUECPMZ/20040503151225Z+590@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <S263735AbUECPMZ/20040503151225Z+590@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I had thought I covered this once already in this thread, but perhaps it
did not get through o.k.

for hamlib do this :

  ./configure --prefix=/usr

for gmfsk do this (or soemthing similar) :

 ./configure --prefix=/usr --sysconfdir=/etc  --localstatedir=/var\
 --enable-hamlib

Between the two make sure you or you package management updates the
library confs. by issuing this (generally as root);

ldconfig

Have fun with this;


Vy 73;

Bob
w9ya




> Where is the standard installation location, and how do I get hamlib to
> install there?  I think I'd rather try that than to direct each of the
> apps that use it to the non-standard location.
>
> Thanks,
> de N5NW / NNN0RBB (Marty)
> Bellbrook, Ohio
>
>
> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org
> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Tomi Manninen
> Sent: Monday, May 03, 2004 10:13 AM
> To: Linux-hams List
> Subject: Re: more hamlib and gMFSK problems
>
> On Mon, 2004-05-03 at 05:57, N5NW Marty wrote:
>
>> configure: error: Library requirements (libgnomeui-2.0 hamlib) not
>> met; consider adjusting the PKG_CONFIG_PATH environment variable if
>> your libraries are in a nonstandard prefix so pkg-config can find
>> them.
> ...
>> Apparently my hamlib is not installed correctly.  It is in the
>> directory /usr/local/lib with a bunch of rig-specific hamlib files,
>> and a subdirectory called pkgconfig with the files fftw3.pc and
>> hamlib.pc in it.
>
> It is installed correctly but in a non-standard place (/usr/local). You
> have already configured the dynamic linker to look under /usr/local but
> you have to give pkg-config a hint too. To do that see what "man
> pkg-config" says about PKG_CONFIG_PATH.
>
> --
> Tomi Manninen / OH2BNS / KP20ME04
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org More majordomo info
> at http://vger.kernel.org/majordomo-info.html
>
>
>
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



