From: Dennis Boone <drb@msu.edu>
Subject: Re: listen, permissions
Date: Sat, 14 Dec 2002 11:07:59 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18NEpb-0005io-00@yagi.h-net.msu.edu>
References: <Pine.LNX.4.44.0212140835060.14589-100000@jeeves.mvw.net>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Sat, 14 Dec 2002 10:35:10 EST.)
             <Pine.LNX.4.44.0212140835060.14589-100000@jeeves.mvw.net> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > I see I have to be root to use the "listen" app. Since listen has 755
 > permissions, why can I not run it as a normal user?

Any user can run the program (file permissions), but only root is
allowed to perform the needed network operations (kernel behavior).

 > Also I see some apps have changed since the (excellent) AX25-Howto was
 > written (e.g.  ttylinkd is new). Where's the best place to find new
 > (if there are any!) ham radio Linux software?

Make sure you're looking at this version of the HOWTO:

    http://www.linux.org/docs/ldp/howto/AX25-HOWTO/

There's a much older one still in circulation.

Lots of software isn't in the HOWTO, since it focuses on the basic
transport.  The hamsoft database at radio.linux.org.au list a lot of
stuff, though its links are often out of date.  Google is your friend,
both for finding unlisted stuff, and for re-locating the lost hamstuff
items.  If you're looking for something specific, asking here would be
a good thing to try also.

Dennis Boone
KB8ZQZ
