From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Writing AX.25 Server Progie
Date: Tue, 31 Dec 2002 08:35:02 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212310828290.8587-100000@wapiti.tc.fluke.com>
References: <20021231023139.D24525@pull.privacy.nb.ca>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021231023139.D24525@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: M Taylor <mctylr@privacy.nb.ca>
Cc: Kelly Black <kelly.black@penguinpackets.com>, linux-hams@vger.kernel.org

On Tue, 31 Dec 2002, M Taylor wrote:

> On Sun, Dec 29, 2002 at 12:07:02AM -0600, Kelly Black wrote:
> > I was wondering if anybody could point me to other sources of socket
> > programming for AX.25 that are up to date as far as keeping pace with
> > the libax25 and coding conventions.
> >
> > I have to admit that I have never written a C program that used sockets
> > before, but wish to give it a go.
> >
> > Sketchy details of the end product:
> > Replacement of ARES/Data program used for the Twin Cities Marathon in
> > Minnesota.  I would like to write a program to be more tailored to this
>
> I would look at some of the APRS software, I think there is some simple
> clients/servers which should be less "strange" than the utilities
> and low-level applications than come with the stock ax25-tools and ax25-apps.

Like Xastir?  That's the APRS app that's written in C and runs on
Unix/Linux/Mac OSX (so far).  I think most of the socket stuff is in
interface.c.  I've been told that the way we do an AX.25 receive is
not the most efficient, but it works.  Something about that we can
get all packets for all interfaces from the one call, but the way we
do it we're separating the packets for each interface and throwing
away the rest?  Details are fuzzy.

Anyway, it's working code, and constantly being maintained.

If your application is GPL'ed, you can use pieces of the code
directly:

    http://www.xastir.org

Go to Sourceforge project page/CVS/Browse CVS Repository to get to
the individual files, or snag the whole thing via CVS or a file
download.  Stick to the development releases if you grab a file.
They run MUCH better than the last "stable" release.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

