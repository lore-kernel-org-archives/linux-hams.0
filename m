From: csmall@eye-net.com.au (Craig Small)
Subject: Re: ax25ipd
Date: Thu, 29 Aug 2002 21:19:09 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020829111909.GG13358@eye-net.com.au>
References: <Pine.LNX.4.33.0208252223370.730-100000@n1uan.ampr.org> <20020827223629.GC10758@silly.cloud.net.au> <200208271822.51734.w9ya@amsat.org> <0208280548330G.02211@unix.pa3gcu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0208280548330G.02211@unix.pa3gcu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pa3gcu <pa3gcu@zeelandnet.nl>
Cc: w9ya <w9ya@amsat.org>, Hamish Moffatt <hamish@cloud.net.au>, linux-hams@vger.kernel.org

On Wed, Aug 28, 2002 at 05:48:33AM +0000, pa3gcu wrote:
> Looks like i started this thread, what i mean was, why do the ax25lib/apps/ 
> and tools default to /usr/local and place binarys in /usr/local when some 
> programs will "still" look in /etc/ax25 for thier config files instead of 
> /usr/local/etc thats what i mean, seems like a funny way of doing things to 
> me.
Because people build the programs inconsistently.  More specifically
they build the libraries with one set of options and the binaries with
another.

> Yes the program concernd has the -C option, yes there is the 
> ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
> But folks dont read documentation do they and we constanly see this question 
> poping up here on this list simply because one did not read the docs 
> beforehand.
Well, the must be reading it once then forgetting it.  If they do the
same thing then there is no problem.

The ax25 stuff uses standard auto* tools folks, its pretty common out
there and probably the most common sort of build set.

People don't read documentation, I get plenty of emails that are FAQs;
not just in ax25 stuff.

Part of the problem has been dumb error messages that don't say where
they are looking.  I believe that is being fixed now.

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
