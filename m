From: Riley Williams <rhw@InfraDead.Org>
Subject: Re: make-3.79.1 bug breaks linux-2.5.24/drivers/net/hamradio/soundmodem
Date: Sun, 23 Jun 2002 00:01:54 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0206222329070.15173-100000@Consulate.UFP.CX>
References: <Pine.LNX.4.44.0206221611430.7338-100000@chaos.physics.uiowa.edu>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0206221611430.7338-100000@chaos.physics.uiowa.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
Cc: bug-make@gnu.org, Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Kai.

>>>> $(obj)/sm_tbl_%: $(obj)/gentbl
>>>>         PATH=$(obj):$$PATH $<

>>> That looks like an excessively complicated workaround. Why not just
>>>
>>> $(obj)/sm_tbl_%: $(obj)/gentbl
>>> 	$(obj)/gentbl
>>>
>>> instead ?

> I think I like the latter better as well.

Providing it is always exactly equivalent, I have no problem with it.

To be honest, I have no real interest in this particular issue as the
Linux-Hams package is inherently Linux specific, GNU make is the only
version of make used with Linux (as far as I have seen anyway), and GNU
make (in all versions I have met) correctly expands $(...) as a single
token wherever it is met. The problem I was referring to only relates to
some of the non-GNU make's used - certainly, the early Solaris versions
were known to do just that. I haven't used Solaris since 1999 so don't
feel qualified to comment on recent versions.

> Anyway, $(obj) is just "." currently, so it doesn't have a space in it.

Is that fixed as such for ever?

If so, what is the purpose behind having the definition in the first place?

> For $(src), I'll always use relative paths, so there won't be any
> spaces in them either. I think it's a sensible restriction for
> separate src/obj trees to disallow spaces in the obj tree path, I
> fear it'd cause problems at a huge number of places.

For many packages I've worked on, OBJ is defined as $(SRC)/../obj so if
$(SRC) has a space in it, then $(OBJ) will as well. My preferred version
deals with the entire problem in a different way:

 1. Each subdirectory has a Makefile that begins with...

	BASEDIR=..
	include $(BASEDIR)/Makefile-rules

    ...where the definition of BASEDIR is the relative path from the
    current directory to the base of the source tree for that package.

 2. $(BASEDIR)/Makefile-rules contains the following...

	TOPDIR = $(shell cd $(BASEDIR) ; set -P ; pwd)
	INCDIR = $(BASEDIR)/include
	OBJDIR = $(BASEDIR)/obj

    ...after which TOPDIR is the canonical path to the root directory
    of the package's source, INCDIR is the relative path from the
    current directory to the package include files directory, and
    OBJDIR is the relative path from the current directory to the
    common object directory.

Given those definitions, one can guarantee that problems such as the
above do not occur simply by not using directory names with spaces in
them inside the tree, and it also has the advantage that the resulting
tree is not dependent on where it is placed in the user's system.

In addition, this method guarantees that the commands used to compile
*.c files into *.o files will be exactly the same throughout the source
tree, thus preventing bugs resulting from incompatible optimisations in
different source files. This guarantee arises because the command
sequence to use is only defined in the common $(BASEDIR)/Makefile-rules
file, and not separately in each individual Makefile.

> At least it's certainly acceptable to do "no space" first and then
> see what needs to be done in order to remove that restriction.

The above does all that is necessary.

> I also think the two are functionally equivalent even if $(obj)
> contains a space, but I haven't tried at all.

With all versions of GNU make that I have tried, they are identical but
with some of the other make's out there, they are not, and that is what
causes problems such as the above to surface.

My stance on this is quite simple: If I write a program that isn't
inherently Linux specific, I would prefer for it to work unmodified on
Solaris, AIX and just about any other version of UNIX that may be out
there, so it can just be dropped on a system and the user run something
like `make config install` and ends up with a system on which it works.
Oddities such as relying on GNU make being the version of make installed
on that system are very much unwelcome as a result.

Best wishes from Riley.

