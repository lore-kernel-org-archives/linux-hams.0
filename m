From: Bob Morgan <wb5aoh@wb5aoh.dyndns.org>
Subject: Re: soundmodem won't start
Date: Wed, 20 Oct 2004 15:13:06 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <16758.50898.120234.178743@halvor.tensleep.com>
References: <16757.42855.133537.841067@halvor.tensleep.com>
	<Pine.GSO.4.58.0410201245290.28484@kuori.saunalahti.fi>
Reply-To: wb5aoh@wb5aoh.dyndns.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.GSO.4.58.0410201245290.28484@kuori.saunalahti.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomi Manninen <oh2bns@sral.fi>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

Tomi Manninen writes:
 > On Tue, 19 Oct 2004, Bob Morgan wrote:
 > 
 > > sm[pid]: cannot start audio
 > > [program exits]
 > 
 > What version of soundmodem are you using? There used to be
 > a bug in soundmodem hat caused a successfull soundcard open
 > be interpreted as an error and vice versa...
 > 
 > -- 
 > Tomi Manninen / OH2BNS / KP20ME04

Tomi,

This appears to be a SuSE binary from their 7.2 and 8.0
series, of which I am using both.  Looking at the manpage and
documentation filedates of 8.0, they seem to be summer 2000 vintage,
and the installed manpage says version 0.2 at the bottom of the page.
I guess there isn't a -version option, which comes in handy
in times like this, since -v is verbosity.

I have a recent source tarball that I have been looking at
(at home, I am at work now where e-mail is) so I can view
some source.  It might even be current, but anyhow it is
something I have downloaded fairly recently.  I will go home and
see if I can get it to compile, and look over that area of
the code, try it, etc.  From what I see of the strace, the
thing looks like it may be doing just exactly what you are suggesting.
Later,

73 de Bob WB5AOH

