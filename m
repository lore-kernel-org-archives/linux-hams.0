From: Nate Bargmann <n0nb@n0nb.us>
Subject: Re: AX25 and related software's future in Debian
Date: Wed, 23 May 2012 15:38:35 -0500
Message-ID: <20120523203835.GH4945@n0nb.us>
References: <20120504013200.GB3489@flying-gecko.net>
 <201205231215.27327.wjl@icecavern.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201205231215.27327.wjl@icecavern.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-hams@lists.debian.org, linux-hams@vger.kernel.org

* On 2012 23 May 13:16 -0500, Wesley J. Landaker wrote:
> On Thursday, May 03, 2012 19:32:00 Patrick Ouellette wrote:

> > The question I have for the lists - is there really any interest in
> > having ham radio software, particularly libax25 and the tools/utils in
> > Debian? I know if it disappears from Debian it affects all Debian
> > derived distros (like Ubuntu for instance).
> 
> I do not use any ax25 software at the moment, but I've always had it on my 
> list of interesting things to try: back when I was younger (I wasn't a ham 
> at the time) I helped a friend of mine set up packet radio software on his 
> computer.

Long ago I did experiment with the Linux AX.25 stack.  I have long lived
in an area with no packet radio activity so I do not currently use the
ax25 packages.  I like that they are available quite simply via apt and
friends.

I have read the threads that Patrick references and I think the proposed
solution is wrong headed for a few reasons.  Firstly, the 'node' package
has been in Debian for quite a number of releases and now some new
upstream comes along with a conflicting command name.  That there is a
naming conflict is not the issue, but how should it be resolved.  IMO,
node.js upstream should have been a bit more careful with their choice
of name (I'll admit that I have next to zero knowledge of javascript and
how the name 'node' fits into that but as a packet op long ago, 'node'
in the AX.25 context makes perfect sense), but beyond that, doesn't the
length of time that the ax25 upstream has used 'node' without issue not
count for anything?  For anyone to argue with a straight face that the
ax25 packager and upstream must somehow be accountable for this mess
seems to me preposterous.

Assuming the Debian package is forced to rename the 'node' command to
anything else, Debian will be the odd distribution out as far as hams
are concerned.  Will Ubuntu blindly follow suit?  Will any other
distribution?  To hold both packages culpable for the illinformed choice
of one in the name of "fairness" is silly.  As already mentioned, anyone
trying to similarly force a name change of Emacs, Linux, or any other
popular package would be laughed off the mailing list.  And just what
will the Debian decision makers do when ax25 upstream continues to use
the 'node' command name as before?

I can tell you that as a maintainer and contributor to an upstream
project that if I were told by a single distribution that I'd need to
change any of the command names because some upstart decided to use the
same names I would laugh.  Laugh long and hard.  Of course downstream
packagers can do as they like but our releases are staying put.  I
encourage ax25 upstream to do likewise.

Disclaimer, all of my systems run either Debian or a Ubuntu derivative.

> About ham radio software in general, I do use a lot of other ham radio 
> software packaged in Debian. In general I'm surprised that there isn't more 
> overlap between the ham radio and free/open-source software communities.

I've opined plenty on that topic elsewhere.  Today I shall pass.

73, de Nate >>

-- 

"The optimist proclaims that we live in the best of all
possible worlds.  The pessimist fears this is true."

Ham radio, Linux, bikes, and more: http://www.n0nb.us
