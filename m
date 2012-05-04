From: DL1SIG <dl1sig@hw42.dyndns.org>
Subject: Re: Node.js and it's future in debian
Date: Fri, 4 May 2012 14:31:29 +0200
Message-ID: <20120504143129.0d9a7955@hw42.dyndns.org>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com>
	<20120501205524.GI30521@flying-gecko.net>
	<20120501215305.GA1250@burratino>
	<20120501221659.GA11430@flying-gecko.net>
	<20120502065003.GB2410@burratino>
	<20120502165031.GC7390@flying-gecko.net>
	<20120502171349.GA23806@burratino>
	<20120502200426.GF7390@flying-gecko.net>
	<4FA2A557.1080103@trinnet.net>
	<20120503170521.GD19468@flying-gecko.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <pkg-javascript-devel-bounces+glddj-pkg-javascript-devel=m.gmane.org@lists.alioth.debian.org>
In-Reply-To: <20120503170521.GD19468@flying-gecko.net>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <http://lists.alioth.debian.org/cgi-bin/mailman/options/pkg-javascript-devel>,
	<mailto:pkg-javascript-devel-request@lists.alioth.debian.org?subject=unsubscribe>
List-Archive: <http://lists.alioth.debian.org/pipermail/pkg-javascript-devel>
List-Post: <mailto:pkg-javascript-devel@lists.alioth.debian.org>
List-Help: <mailto:pkg-javascript-devel-request@lists.alioth.debian.org?subject=help>
List-Subscribe: <http://lists.alioth.debian.org/cgi-bin/mailman/listinfo/pkg-javascript-devel>,
	<mailto:pkg-javascript-devel-request@lists.alioth.debian.org?subject=subscribe>
Sender: pkg-javascript-devel-bounces+glddj-pkg-javascript-devel=m.gmane.org@lists.alioth.debian.org
Errors-To: pkg-javascript-devel-bounces+glddj-pkg-javascript-devel=m.gmane.org@lists.alioth.debian.org
To: Patrick Ouellette <pouelle@debian.org>
Cc: linux-hams@vger.kernel.org, David Ranch <linux-hams@trinnet.net>, node@packages.debian.org, debian-hams@lists.debian.org, nodejs@packages.debian.org

Hi,

I think using the alternatives system [1] could be a solution. I guess
that node.js and axnode is not often used on the same system. Therefore
in most of the cases the alternatives auto select mechanism will do the
right thing.

In the case that both programs are installed, the node symlink is auto
selected by the priority so I would suggest to set the priority of
axnode higher because it was first there.

Anyone who want to have node.js as node can simply set the alternatives
to manual selection.

This approach can be combined with the long term goal to have no node
binary. You make node a shell script which prints a warning and then
calls the binary selected by the alternatives system.

73 DL1SIG

1. http://wiki.debian.org/DebianAlternatives

Am Thu, 03 May 2012 13:05:21 -0400
schrieb Patrick Ouellette <pouelle@debian.org>:

> Thanks for the comments!
> 
> On Thu, May 03, 2012 at 08:33:43AM -0700, David Ranch wrote:
> > 
> > From my experience, many MANY Linux hams have customized scripts
> > that startup some very elaborate HAM systems.  For many, these
> > scripts weren't written by them and the changing of the node command
> > could be very difficult for some.  The other aspect is if this
> > change came into a package update that could impact production
> > systems in VERY remote sites.  This could cause all kinds ugliness
> > that can be easily avoided.
> > 
> 
> One issue here seems to be a perception problem.  The non-ham folks
> look at the ax25 how to or similar documentation and see that node is
> "usually called from ax25d" or a similar superserver.  This leads them
> to believe that the command is only started from one or two "easily 
> identified and modified" scripts.
> 
> The Node.js side argues that there are many books, tutorials, and
> scripts that tell the user to run "node <script>" and so the
> interaction of the user and node.js' node command is direct and
> uncontrollable.
> 
> > I can appreciate Debian's goal to keep things moving forward but I'd
> > argue that a binary name of "/usr/sbin/nodejs" would be a lot more
> > informative with the two additional characters than just calling it
> > "node" (and disrupting a well known binary name for us Linux packet
> > hams).
> 
> I completely agree, but apparently Node.js' upstream has changed the
> name once previously (apparently from a similar problem) and while
> acknowledging the name is generic and a poor choice refuses to
> consider another change. (According to what I can tell from the
> Debian discussion.  I have not talked to Node.js upstream personally.)
> 
> FWIW, the commands are NOT in the same path.  The ham radio node
> command is /usr/sbin/node and the Node.js command is /usr/bin/node
> 
> Debian does NOT allow binaries with the same name to have different
> functions. Unfortunately "first come, first served" is not the policy
> either.
> 
> 
> Pat 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
