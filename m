From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: ax25ipd
Date: Wed, 28 Aug 2002 05:48:33 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0208280548330G.02211@unix.pa3gcu>
References: <Pine.LNX.4.33.0208252223370.730-100000@n1uan.ampr.org> <20020827223629.GC10758@silly.cloud.net.au> <200208271822.51734.w9ya@amsat.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200208271822.51734.w9ya@amsat.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: w9ya <w9ya@amsat.org>, Hamish Moffatt <hamish@cloud.net.au>, linux-hams@vger.kernel.org

On Tuesday 27 August 2002 18:22, w9ya wrote:
> On Tuesday 27 August 2002 10:36 pm, Hamish Moffatt wrote:
> > On Tue, Aug 27, 2002 at 09:50:31AM +0000, w9ya wrote:
> > > On Tuesday 27 August 2002 12:05 pm, Hamish Moffatt wrote:
> > > > The distributions (Red Hat, Debian, SuSE, Mandrake etc) shouldn't put
> > > > anything in /usr/local, but if you are installing something outside
> > > > of the packaging system then /usr/local is the recommended place.
> > >
> > > Yes, and no. If your packaging system installs source, then it
> > > shouldn't go into ./usr/local. The quote above was followed by another
> > > paragraph in the original message that specifically indicated this.
> >
> > That's right - I don't think what I said conflicts with this. Anything
> > you install yourself should go into /usr/local. The vendor (Sun, Red
> > Hat, Debian etc) can overwrite anything except /usr/local. Debian also
> > leaves all of /opt for the local administrator.
> >
> > Hamish
>
> Well , if "install youself" means from a tarball AND un-tracked by the
> package manager, then EITHER /opt OR /usr/local is advised. I would almost
> NEVER pick /usr/local though as there are NO rules for that heirarchy and
> there ARE rules in the FHS for programs installing in /opt. The rules for
> /opt allow for un-problematic removals and upgrades for what is installed
> there. The same cannot be said for the /usr/local, which is why almost
> everyone regards it as "depreciated".

Looks like i started this thread, what i mean was, why do the ax25lib/apps/ 
and tools default to /usr/local and place binarys in /usr/local when some 
programs will "still" look in /etc/ax25 for thier config files instead of 
/usr/local/etc thats what i mean, seems like a funny way of doing things to 
me.
Yes the program concernd has the -C option, yes there is the 
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
But folks dont read documentation do they and we constanly see this question 
poping up here on this list simply because one did not read the docs 
beforehand.

>
> Bob
> w9ya

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

