From: Robert Wooldridge <kc0dxf@yahoo.com>
Subject: Re: [Ham-Linux] ARRL's LoTW with Debian Sarge
Date: Thu, 18 Sep 2003 06:22:04 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030918132204.98902.qmail@web14008.mail.yahoo.com>
References: <20030918031442.GA708@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030918031442.GA708@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Nate,

Good work on using Alein.  As you can see, Alein does
a great job of converting the RPM to a deb but you are
still faced with the library hell of RPM which is
inherent in that package system.

For anyone interested in getting started with Debian,
the Distrowatch web site ran an excellent introduction
and guide to installing Debian a couple of weeks ago. 
Here's a link:
http://www.distrowatch.com/dwres.php?resource=review-debian


--- Nate Bargmann <n0nb@networksplus.net> wrote:
> Hello everyone.
> 
> For most on this list what I'm about describe is
> probably old hat, but
> there may be some newcomers that would find this
> helpful in the list
> archives.
> 
> As most are probably aware, the American Radio Relay
> League has been
> working for a few years on a way to digitally sign
> log submissions for
> electronic application for their various awards.  In
> the October 2003 
> issue of QST (Amateur Windows?  8-) it has been
> announced that this 
> program was opened to general use as of 15 September
> 2003.  On the 
> Logbook of The World web page:
> 
> http://www.arrl.org/lotw/
> 
> there is a library and programs for signing and
> generating log data for
> Linux.  These programs are provided in binary form
> only for Red Hat 7.2
> and 8.0 releases and are RPMs.  Also provided are
> source RPMs for the
> library and the applications.  These archives are
> not directly
> installable as managed packages on my Linux
> distribution of choice, 
> Debian, so they must be converted using a utility
> called Alien.
> 
> Having never needed Debian's Alien before, I decided
> this was as good of
> a time as any to try it.  I grabbed the RH 8.0 RPMs
> and the source RPMs,
> just in case.
> 
> I installed alien, rpm, libwxbase2.4, and
> libwxgtk2.4 as the web page
> said the programs depended on WXWin 2.4.
> 
> Converting the RPMs to .deb's was straightforward
> with alien and
> installation with dpkg completed without error.  I
> attempted to start
> tqsl, but the startup failed.  A quick ldd
> /usr/bin/tqsl revealed a
> dependency on libcrypto.so.2 that was not found. 
> Using the package
> search page on the Debian site:
> 
> http://www.debian.org/distrib/packages
> 
> I found that it was a part of the libssl0.9.7 and
> libssl0.9.6 packages,
> the latter version being in the oldlibs section.
> 
> Well, I created a symlink to libcrypto.so.0.9.7
> named libcrypto.so.2:
> 
> ln -s libcrypto.so.0.9.7 libcrypto.so.2
> 
> (actually I used Midnight Commander, but this is
> generic--don't forget
> you'll need to be root as these files reside in
> /usr/lib) and tried
> again.  Running tqsl worked fine, but tqslcert
> failed with a relocation
> error.
> 
> Poking around in the README in the tqsllib archive I
> found where the
> library is dependent on OpenSSL 0.9.6.  So I redid
> my symlink to point
> to libcrypto.so.0.9.6 and tqslcert loaded and ran.
> 
> In tqslcert I was able to create my certificate
> request and am now
> waiting for the authentication process.
> 
> One quirk or bug I noticed in tqslcert is that if
> the Help button is
> clicked and then the help window is backgrounded,
> the window that called
> the help window is frozen and will remain so until
> the help window is
> closed.  This may be a problem in WxWin, I don't
> know.
> 
> So there you have it, my micro-HOWTO on LoTW on
> Debian Sarge (Testing).
> 
> 73, de Nate >>
> 
> P.S. I keep this system updated about once per week.
>  An older Testing
> snapshot may or may not work.  The same caveat may
> apply to Sid
> (Unstable).
> 
> -- 
>  Wireless | Amateur Radio Station N0NB          |
> "We have awakened a
>  Internet | n0nb@networksplus.net               |
> sleeping giant and
>  Location | Bremen, Kansas USA EM19ov           |
> have instilled in him
>   Amateur radio exams; ham radio; Linux info @  | a
> terrible resolve".
>              http://www.qsl.net/n0nb/           | -
> Admiral Yamamoto
> _______________________________________________
> Ham-Linux mailing list
> Ham-Linux@mailman.qth.net
> http://mailman.qth.net/mailman/listinfo/ham-linux


=====
Bob Wooldridge KC0DXF
Web Mail: kc0dxf@yahoo.com
Blog: http://kc0dxf.net/cgi-bin/blosxom/
See Also: http://mcsg.org

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
