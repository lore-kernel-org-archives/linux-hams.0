From: Dennis Boone <drb@msu.edu>
Subject: Re: XFBB Nightmares!
Date: Tue, 18 Mar 2003 19:21:24 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18vRKe-0002K6-00@yagi.h-net.msu.edu>
References: <3E77B2F2.7030806@kj6eo.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Tue, 18 Mar 2003 15:59:46 PST.)
             <3E77B2F2.7030806@kj6eo.com> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > However ... the result is always the same "Unknown return value 127".
 > I have heard rumors that XFBB has to be compiled.  There are no
 > instructions with my tarball that says it has to be compiled
 > (x700e_full.tgz).  If I am missing the compile step I would appreciate
 > it if someone would point me in the right direction.  Is it possible
 > that I have the wrong tarball?  I have been stuck with the "unknown
 > return value 127" error for ever.  It would be nice to at least move
 > on to the next set of error codes.

Bill:

Looking at the "fbb" script, there's a loop which restarts fbb if it
exits.  Inside this loop, if one of the commands fails somehow, the
script emits the message you report.  Based on the code in the loop,
the code comes from the shell, and the value of 127 means a command
wasn't found.  It looks to me like the xfbbd command is the one which
isn't found.  I suggest you check the definitions at the top of the
fbb script to make sure they are correct.

Dennis Boone
KB8ZQZ
