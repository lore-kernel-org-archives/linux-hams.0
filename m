From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: [PATCH] Make mkiss link its ptys in a predictable manner
Date: Tue, 28 Sep 2010 09:48:55 +0200
Message-ID: <20100928074855.GB31242@x-berg.in-berlin.de>
References: <4C9D43E0.2040908@danplanet.com> <20100926222456.GA31242@x-berg.in-berlin.de> <4C9FCE46.8090900@danplanet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C9FCE46.8090900@danplanet.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Smith <dsmith@danplanet.com>
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org

On 2010-09-26 15:50:46 -0700, Dan Smith <dsmith@danplanet.com>
wrote in <4C9FCE46.8090900@danplanet.com>:
> Hi Thomas,
> 
> > Personaly, I don't believe it's good to hardcode every eventuality
> > in C. We're working on unix systems and value our powerful scripting 
> > languages.
> 
> I understand, but in an embedded environment, having to parse output
> like what mkiss provides seems rather silly to me and we may not have
> all the same scripting facilities as a normal machine.  If spawning
> mkiss from a C program, having to parse the output (especially
> multi-line output) is gross.

Well. Embedded systems have their own special peculiarities. I.e.:
root@dem-thomas-sein-linksys:/dev# :>foobar
-sh: cannot create foobar: Permission denied
On that system, the -L approach in writing to /dev/ would have failed.

> Would you accept a patch to make mkiss output only the names of the
> slaves if passed an option, such as --short?

Do you have something like "--slave-symlinkname-prefix /path/filename"
in mind?

How handle the situation if the destination file already exist? Warn and
exit?

> > Imho, your approach has some foibles. 1. mkiss is a kiss multiplexer 
> > in userspace. It does not even need to be run under root rights. By 
> > symlinking to /dev/, users of your new feature need mkiss to run as 
> > root.
> 
> Fair enough, although only supporting -L if running as root (or writing
> the links elsewhere) seems plenty reasonable to me.

Personaly, I see active symlinking as a permanent security problem.
Many unix utilities in the past had problems with it. That's why I prefer
to operate with environment variables, which are only visable between the
father and the son.
There are reasons for allowing a normal user to do symlinks than only root.

> What about a patch
> that makes -L take a directory in which to write the links?

Only specifying directory is not sufficient. See the /dev/ptmx example.
It should be full-path-to-filename.

> > 2. mkiss could not only be used on true tty's but also on pseudo
> > pty's. Modern linuxes prefer unix98 ptys. Unix98-pty's are allocated
> > automaticaly via /dev/ptmx. Imagine you'd try to use two mkiss
> > instances, both called with /dev/ptmx as argument and -L as option.
> > Here the concept completely fails. Apart from this, it's not 
> > permitted to create files in /dev/pts/.
> 
> Does anyone do this?  Regardless, many programs have options and usage
> scenarios that are mutually exclusive.

A good concept would not have such a limitation.

> > Since linux changes so fast, it might be only a matter of time it
> > could be decided that direct operation to /dev/ may not be permitted
> > anymore.
> 
> I think that's rather unlikely given the move from devfs to udev, and
> there are other examples that fit this model (syslogd, lircd, etc).
> Again, since -L is just an optional behavior, it's not like mkiss would
> break entirely if such a change were to be made.

But in this form it would only solve one specific problem (fewer
scripting around the startup process), and it has problems on i.e. many
embedded systems where the filesystem is mounted ro.

> > Your feature could be easily implemented as one-liner in a startup 
> > script (s/echo// - it's an example):
> > 
> > # cd /dev; M=/dev/ptyr9; PTYS=$(mkiss $M /dev/ptmx /dev/ptmx |tail 
> > -1); n=0; for p in $PTYS; do echo ln -fs $p /dev/ptyr9.$n; 
> > n=$(($n+1)); done ln -fs /dev/pts/21 /dev/ptyr9.0 ln -fs /dev/pts/22 
> > /dev/ptyr9.1 #
> 
> Well, note that in the above case, you don't catch an error code if
> mkiss fails to start.

mkiss writes only to stdout if it successfully initialized the ttys.
Because $PTYS then is "", the for loop runs 0 times.

> I can screen-scrape with the best of them too,
> but I really don't think it's a better solution in this case.
> 
> > Only the cleanup must be done by hand. On the other hand, if your 
> > system crashes or mkiss is killed hard, your patch does also is not 
> > able to unlink the symlinks.
> 
> Nearly everything runs a tmpfs on /dev and has for some time now.  That
> means the hard crash doesn't leave anything lying around, but the
> scripted solution above does, when mkiss exits.

Care must always be taken (i.E. during startup) if a symlink was left
behind. A classic is the abnormal termination (segfault, endless loop,
..) of a program.

> Please let me know if you would accept a patch for either of the
> alternate solutions presented above.

For you it's important to have a built-in capability, I think it suffices
as it is.
I'd like to read other comments on this topic. If we do it, I'd prefer
a notation that the commandline argument specifies full-path-and-filename
where the prefix-0, -.1, .. files could be found after successfull
program startup.

vy 73,
	- Thomas  dl9sau

