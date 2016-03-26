From: Nate Bargmann <n0nb@n0nb.us>
Subject: Re: Hamlib 3.0 release announcement
Date: Sat, 26 Mar 2016 08:26:03 -0500
Message-ID: <20160326132603.GL21590@n0nb.us>
References: <20150919142829.GS3787@n0nb.us>
 <56F683FB.3080702@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <hamlib-developer-bounces@lists.sourceforge.net>
Content-Disposition: inline
In-Reply-To: <56F683FB.3080702@debian.org>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=hamlib-developer>
List-Post: <mailto:hamlib-developer@lists.sourceforge.net>
List-Help: <mailto:hamlib-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: hamlib-developer-bounces@lists.sourceforge.net
To: debian-hams@lists.debian.org, Hamlib Developers <hamlib-developer@lists.sourceforge.net>, Linux Hams <linux-hams@vger.kernel.org>, Ubuntu Hams Group <ubuntu-hams@lists.launchpad.net>

* On 2016 26 Mar 07:46 -0500, Colin Tuckley wrote:
> On 19/09/15 15:28, Nate Bargmann wrote:
> 
> > The Hamlib Group is pleased to announce the release of Hamlib 3.0.
> 
> <big snip>
> 
> > TODO:
> 
> > Due to the apparent lack of a libusb package for Windows 64 bit, trial
> > builds of the current Hamlib for W64 lack support for the USB backends.
> > The project should transition these backends to the newer libusb 1.0
> > series.  Target: 3.1.
> 
> We have a Debian bug about this:
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=810423
> 
> Is there any progress?

Yes, the forthcoming 3.1 now uses libusb 1.0.  I just merged the changes
into the master branch this past week.

73, Nate

-- 

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us

------------------------------------------------------------------------------
Transform Data into Opportunity.
Accelerate data analysis in your applications with
Intel Data Analytics Acceleration Library.
Click to learn more.
http://pubads.g.doubleclick.net/gampad/clk?id=278785351&iu=/4140
