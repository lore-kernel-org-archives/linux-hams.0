From: Chuck Gelm <nc8q@gelm.net>
Subject: Re: Xastir.lsm ?
Date: Thu, 02 Jan 2003 17:30:36 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E14BD8C.1DF51A36@gelm.net>
References: <Pine.LNX.4.33.0301021349170.19643-100000@wapiti.tc.fluke.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Cc: linux-hams@vger.kernel.org

Hi, Curt:

Thanks.

 However, my main issue is that I do not want to keep track of
development revisions.  My main issue is that I want the 'stable'
version release and the 'stable' files.  My original
opinion that I posted here, was that Xastir is developmental
code.  Your posts seem to confirm this opinion.

:-|

Happy New Year, Chuck

"Curt Mills, WE7U" wrote:
> 
> On Thu, 2 Jan 2003, Chuck Gelm wrote:
> 
> >  Heh, heh, heh.  You think you can trick me into
> > debugging someone's software. ?  Think again. ;-)
> 
> That's pretty good!  I might have to borrow that sometime in the
> future...
> 
> >  So, now I need RCS too!  :-(
> > I think that RCS is Revision Control System.
> > Why would I need to keep track of someone else's revisions?
> 
> Think of RCS as being able to tell you what has changed in _one_
> file between revisions.  Think of CVS as the same thing but able to
> do it on an entire tree of files instead of just one.  That's the
> basic idea.
> 
> If you have a large tree of files (like Xastir) and want to check
> the status of your tree against the development tree, you issue one
> command and it will tell you which files have changed.  Issue
> another command against a particular file and it will show you the
> diff's.  Issue another command ("cvs update") and it will make your
> tree be in sync with the development tree.  It's all pretty slick.
> Just don't mess with the "CVS" directories and the bookkeeping files
> contained within, or CVS will get lost.  Easy enough to delete the
> entire thing and bring down a fresh tree though in that case.
> 
> For the developers it's even slicker, as we can be committing
> changes to different parts of the tree at the same time.  Trying to
> change the same file at the same time gets tricky, as the first one
> there gets the lock, and the 2nd is refused.  #2 gets to figure out
> how to merge his changes in with the first guy's before CVS will let
> him check his stuff in.  A race to the finish!
> 
> I've been in races with a developer in Germany before in just this
> scenario.  Sometimes he wins, sometimes I do.  And you thought
> software coding was just an armchair sport...  ;-)
> 
> > Is there a Xastir.lsm ?
> 
> Don't see one anywhere.  We have an xastir.1 and an xastir.spec
> though!
> 
> --
> Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
> Senior Methods Engineer/SysAdmin
> "Lotto:    A tax on people who are bad at math!"
> "Windows:  Microsoft's tax on computer illiterates!" -- WE7U
> "The world DOES revolve around me:  I picked the coordinate system!"
