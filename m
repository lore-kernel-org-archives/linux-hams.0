From: Bill Walton <kj6eo@kj6eo.com>
Subject: AX25 and FBB!
Date: Sat, 15 Mar 2003 10:54:02 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E7376CA.9040100@kj6eo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

Hello -

Thank you for taking time to read my message.  I started fooling around 
with AX25 about
6 months ago and just finally got it working this weekend.  What kept 
the whole thing from
working was some "syntax" errors in the "node.conf" file.  Some of the 
parameter values
needed to have some of the letters capitalized ie "ConnTimeout" instead 
of "conntimeout"
and so on.  Those errors were present as examples of what working files 
should look
like.  Since I am new to Linux AX25 it was impossible to recognize those 
mistakes in
advance.  My configuration is still a little screwed up but AX25 and the 
Linuxnode both
are working!  I now need to move on to XFBB.

I know that this mailing list is not really intended for FBB questions 
but I am in hopes that
you will just "look the other way" and answer my simple question if you 
can.  I want to
install the full X-Windows vershion of Linux FBB.  The tarball that I 
have is:

x700e_full.tgz

The README file gives some simple instructions on how to install it ie:

1)    Un-tar it in a specific place.
2)    Instructions on how to install it ... "run ./install.sh" and 
answer the questions.
3)    Edit the init.srv and port.sys files .... etc.
4)    Then run it with the "./xfbb.sh" command.

What I get is that stupid "Unknown return value 127" error.  I have been 
told that XFBB
has to be compiled.  If so there is no makefile that comes with it, or 
any instructions on
how to compile it.

Any suggestions that you might have to point me in the right direction 
would be greatly
appreciated.  If my questions are stupid, then please excuse me for 
being stupid.  I just
need to get beyond this FBB problem and get my stuff online!

Regards,

Bill KJ6EO


