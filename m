From: Erik Jakobsen <eja@urbakken.dk>
Subject: Re: gMFSK
Date: Wed, 21 Jan 2004 07:07:11 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <400E170F.5090807@urbakken.dk>
References: <Pine.LNX.4.44.0401211237060.23296-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0401211237060.23296-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>



Wilbert Knol wrote:
>>>I use SuSE 8.2. Is there any of you, that has gMFSK to run with 8.2 ?.
>>>
>>>If so, I would be very interested in getting info's on the different
>>>packages, that are necessary for it. I think I have had all packages
> 
> 
> On SuSE 8.1 Pro, I have successfully built gMFSK from sources.

You made a rebuild to fit th gMFSK to the 8.1 ?.

> Download and install fftw-2.1.5 first.
> You'll need to ./configure and make it twice.
> The second time with './configure --enable-float' in order to get the
> single-precision libraries. If you don't do this, gMFSK won't compile.

Ok Wilbert. Is good to know, not to get a stop :-)

> Secondly, install hamlib, if you have a rig capable of being
> computer-controlled.

Needed here, as I have the Kenwood TS-570D.

> Next, edit /etc/ld.so.conf and add the line:
> /usr/local/lib
> ...if not already there. Then, refresh the linker cache with;
> ldconfig so the linker knows about the newly installed fftw
> and hamlib libraries.

Ok.

> Lastly, install gMFSK. I use version 0.5, but I have installed
> 0.6beta1 on a Mandrake 9.0 box.

I don't now, that you made the rebuild from what you have written above ?.

> 
>>More specifically, the libgnomecanvas-devel package seems to be
>>missing the file libgnomecanvas-2.a which in my opinion should
>>be there.
> 
> 
> I don't have it, and gMFSK works fine.
> I guess it uses:
> /opt/gnome2/lib/libgnomecanvas-2.so
> ...which is in the libgnomecanvas RPM that came with the SuSE 8.1 CDs.

Ok. The reason I needed it was, because I used the rebuild, and this 
always claimed about the libgnomecanvas-2.a.

> As an aside, for user software, I avoid RPMs like the plague.

Oh Wilbert. You now indirectly have told me, that you didn't used the 
rebuild :-)

> They are great for installing stuff off the CDs, but, for 3rd party
> software, they are not worth the hassle unless it is an RPM that was
> built for your particular distribution and version.
> 

I agree with you, cause I have worked hard to get the rebuild of the rpm 
for gMFSK to be build.


>>Anyone care to help Erik?
> 

Thanks again Tomi.

> Hope this helps.

And a thanks to you Wilbert. Now I'll start from schratch again.


> Wilbert, ZL2BSJ

Maybe I call you one day using gMFSK.

> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 
Med venlig hilsen - Best regards.
Erik Jakobsen - eja@urbakken.dk.
Licensed radioamateur with the callsign OZ4KK.
SuSE Linux 8.2 Proff.
Registered as user #319488 with the Linux Counter, http://counter.li.org.

