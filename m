From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: gmfsk - fftw lib not found
Date: Wed, 6 Dec 2006 09:59:48 +1100
Message-ID: <20061205225948.GA10338@cloud.net.au>
References: <200612041412.46659.kb7no@sbcglobal.net> <200612041940.10406.kb7no@sbcglobal.net> <20061205034404.GA15572@cloud.net.au> <200612051349.27432.kb7no@sbcglobal.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200612051349.27432.kb7no@sbcglobal.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi Jack,

You have to edit your sources.list to add the universe section - it is
not a core package. I think Ubuntu may have a tool for configuring your
package sections.

gmfsk is in universe in edgy (6.10) also.

Debian and its derivatives (including Ubuntu) are much more robust with
regard to partial upgrades. No reinstalls required - ever.

cheers
Hamish

On Tue, Dec 05, 2006 at 01:49:27PM -0800, Jack Heller wrote:
> Thanks again Hamish,
> 	I attempted to get/install gmfsk but am using 6.06 Dapper.  Not found error. 
> 
> 	So, decided to chance the upgrade to 6.10 -- Failed because (I think) the 
> Internet connection interrupted.  Have a few corrupt files so the install 
> didn't succeed.  Luckily, 6.06 is still working.  (Not noticeably wrecked.)  
> Had a much worse experience with Red Hat Fedora a few months ago on upgrade.  
> This Ubuntu seems to be more nearly bullet-proof.
> 
> 	Will try again.  Just wanted you to know I am still trying.  
> 
> 	Thanks for your input Hamish.
> 
> 	Jack   KB7NO
> 
> On Monday 04 December 2006 19:44, Hamish Moffatt wrote:
> > On Mon, Dec 04, 2006 at 07:40:10PM -0800, Jack Heller wrote:
> > > Thanks Hamish,
> > > 	I am working on getting the dev file.  A small confusion exists.  I will
> > > sort out the apt-get commands and get this done.  Found some nice
> > > instructions, decided to print them and had to stop and fill print
> > > cartridges.  Will persevere.  Thanks a bunch -- Really want to see this
> > > work.
> >
> > By the way Jack, gmfsk is included in Ubuntu and so there's no need to
> > compile it yourself (unless you want to).
> >
> > apt-get install gmfsk
> >
> > should do the trick as long as you have the "universe" section in your
> > sources.list. edgy has 0.7pre1.
> >
> > Hamish
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
