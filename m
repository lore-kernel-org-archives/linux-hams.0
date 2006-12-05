From: Jack Heller <kb7no@sbcglobal.net>
Subject: Re: gmfsk - fftw lib not found
Date: Tue, 5 Dec 2006 13:49:27 -0800
Message-ID: <200612051349.27432.kb7no@sbcglobal.net>
References: <200612041412.46659.kb7no@sbcglobal.net> <200612041940.10406.kb7no@sbcglobal.net> <20061205034404.GA15572@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061205034404.GA15572@cloud.net.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Thanks again Hamish,
	I attempted to get/install gmfsk but am using 6.06 Dapper.  Not found error. 

	So, decided to chance the upgrade to 6.10 -- Failed because (I think) the 
Internet connection interrupted.  Have a few corrupt files so the install 
didn't succeed.  Luckily, 6.06 is still working.  (Not noticeably wrecked.)  
Had a much worse experience with Red Hat Fedora a few months ago on upgrade.  
This Ubuntu seems to be more nearly bullet-proof.

	Will try again.  Just wanted you to know I am still trying.  

	Thanks for your input Hamish.

	Jack   KB7NO

On Monday 04 December 2006 19:44, Hamish Moffatt wrote:
> On Mon, Dec 04, 2006 at 07:40:10PM -0800, Jack Heller wrote:
> > Thanks Hamish,
> > 	I am working on getting the dev file.  A small confusion exists.  I will
> > sort out the apt-get commands and get this done.  Found some nice
> > instructions, decided to print them and had to stop and fill print
> > cartridges.  Will persevere.  Thanks a bunch -- Really want to see this
> > work.
>
> By the way Jack, gmfsk is included in Ubuntu and so there's no need to
> compile it yourself (unless you want to).
>
> apt-get install gmfsk
>
> should do the trick as long as you have the "universe" section in your
> sources.list. edgy has 0.7pre1.
>
> Hamish
