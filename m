From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: gMFSK
Date: Wed, 21 Jan 2004 13:06:38 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0401211237060.23296-100000@zl2bsj.ampr.org>
References: <1074634512.1291.31.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1074634512.1291.31.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>


> > I use SuSE 8.2. Is there any of you, that has gMFSK to run with 8.2 ?.
> >
> > If so, I would be very interested in getting info's on the different
> > packages, that are necessary for it. I think I have had all packages

On SuSE 8.1 Pro, I have successfully built gMFSK from sources.

Download and install fftw-2.1.5 first.
You'll need to ./configure and make it twice.
The second time with './configure --enable-float' in order to get the
single-precision libraries. If you don't do this, gMFSK won't compile.

Secondly, install hamlib, if you have a rig capable of being
computer-controlled.

Next, edit /etc/ld.so.conf and add the line:
/usr/local/lib
...if not already there. Then, refresh the linker cache with;
ldconfig so the linker knows about the newly installed fftw
and hamlib libraries.

Lastly, install gMFSK. I use version 0.5, but I have installed
0.6beta1 on a Mandrake 9.0 box.

> More specifically, the libgnomecanvas-devel package seems to be
> missing the file libgnomecanvas-2.a which in my opinion should
> be there.

I don't have it, and gMFSK works fine.
I guess it uses:
/opt/gnome2/lib/libgnomecanvas-2.so
...which is in the libgnomecanvas RPM that came with the SuSE 8.1 CDs.

As an aside, for user software, I avoid RPMs like the plague.

They are great for installing stuff off the CDs, but, for 3rd party
software, they are not worth the hassle unless it is an RPM that was
built for your particular distribution and version.

> Anyone care to help Erik?

Hope this helps.

Wilbert, ZL2BSJ

