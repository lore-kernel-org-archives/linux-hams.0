From: Stephane Fillod <f8cfe@free.fr>
Subject: memory programming, was Re: D-STAR Rig Control
Date: Fri, 11 Apr 2008 14:50:41 +0200
Message-ID: <20080411125041.GG6021@charybde.local>
References: <1203091364.47b5b7a4ddb56@mgtmail.com> <20080215162556.GA26354@reid1.localdomain> <1203096083.47b5ca13b9626@mgtmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1203096083.47b5ca13b9626@mgtmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Cc: don <don_reid@comcast.net>, Linux HAMs <Linux-hams@vger.kernel.org>

Fri, Feb 15, 2008, IT2 Stuart Blake Tener, USNR skribis:
> Quoting don <don_reid@comcast.net>:
> 
> > On Fri, Feb 15, 2008 at 04:02:44PM +0000, IT2 Stuart Blake Tener, USNR wrote:
> > > ALCON:
> > >
> > > I am curious what (if any) integration is existent with controlling rigs
> > such as
> > > the ICOM IC-2820H, IC-91AD, etc..., that are D-STAR radios.
> > >
> > > Being able to read and write memories, etc.., would be quite useful to say
> > the
> > > least.
> >
> > I have an IC-2820 and have looked into what it can do over the computer
> > interface.  It appears that it can only upload or download the entire memory
> > as one large chunk.  The data is in hex format and is a bit over 100k bytes.
> 
> Excellent! My goal (initially) would be to design a software for programming the
> 2820H, and IC-91AD that would be usable on a MacOS/Linux environment.

Do you have the documentation of the protocol/format of the memory data?

> May I respectfully request if you could publish the information regarding how
> one would accomplish this, and if the HamLib supports provisionment of an API
> to do same?

Hamlib already has the API to program memory of rigs[1]. However, we're
badly missing memory programming GUI. Is there's anyone into GUI around
here? It should be done easily cross-platform with FLTK[2] or wxPython[3],
or with any other framework. You will find help on programming with Hamlib
by joining the mailing list here[4].

[1] http://hamlib.sourceforge.net/manuals/1.2.7/html/mem_8c.html
[2] http://www.fltk.org/
[3] http://wxPython.org/
[4] https://lists.sourceforge.net/lists/listinfo/hamlib-developer

73
-- 
Stephane - F8CFE
