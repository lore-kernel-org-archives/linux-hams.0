From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Xastir.lsm ?; was Re: Writing AX.25 Server Progie
Date: Thu, 2 Jan 2003 13:59:18 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0301021349170.19643-100000@wapiti.tc.fluke.com>
References: <3E14B157.9B1C1CD6@gelm.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E14B157.9B1C1CD6@gelm.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Gelm <nc8q@gelm.net>
Cc: linux-hams@vger.kernel.org

On Thu, 2 Jan 2003, Chuck Gelm wrote:

>  Heh, heh, heh.  You think you can trick me into
> debugging someone's software. ?  Think again. ;-)

That's pretty good!  I might have to borrow that sometime in the
future...


>  So, now I need RCS too!  :-(
> I think that RCS is Revision Control System.
> Why would I need to keep track of someone else's revisions?

Think of RCS as being able to tell you what has changed in _one_
file between revisions.  Think of CVS as the same thing but able to
do it on an entire tree of files instead of just one.  That's the
basic idea.

If you have a large tree of files (like Xastir) and want to check
the status of your tree against the development tree, you issue one
command and it will tell you which files have changed.  Issue
another command against a particular file and it will show you the
diff's.  Issue another command ("cvs update") and it will make your
tree be in sync with the development tree.  It's all pretty slick.
Just don't mess with the "CVS" directories and the bookkeeping files
contained within, or CVS will get lost.  Easy enough to delete the
entire thing and bring down a fresh tree though in that case.

For the developers it's even slicker, as we can be committing
changes to different parts of the tree at the same time.  Trying to
change the same file at the same time gets tricky, as the first one
there gets the lock, and the 2nd is refused.  #2 gets to figure out
how to merge his changes in with the first guy's before CVS will let
him check his stuff in.  A race to the finish!

I've been in races with a developer in Germany before in just this
scenario.  Sometimes he wins, sometimes I do.  And you thought
software coding was just an armchair sport...  ;-)


> Is there a Xastir.lsm ?

Don't see one anywhere.  We have an xastir.1 and an xastir.spec
though!

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

