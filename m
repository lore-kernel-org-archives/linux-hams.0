From: Andrew Bates <abates@omeganetserv.com>
Subject: Re: Linux AX.25 Socket programming
Date: Wed, 01 Jan 2003 16:00:43 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E13731B.C965C3A7@omeganetserv.com>
References: <onKLlQBZqzE+EwXZ@mechserv.demon.co.uk>
 <1041461308.10491.17.camel@edith>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kelly Black <kelly.black@penguinpackets.com>
Cc: Linux Hams mailing list <linux-hams@vger.kernel.org>

> Excellent!!!  Does anybody know where I can find an example of a script
> that is doing just this read from stdin and write to stdout.
>

Here is a very simply perl script that reads and writes to the stdin/stdout:

#!/usr/bin/perl
# -- beginning of script

# display our message to the stdout
print "Testing ax25d\n";
print "Please enter your callsign: ";

# read input from the command line, until
# a carriage return is received
$call = (<>);

# remove the trailing carriage return
chomp $call;

# display callsign to the stdout
print "Hello ".$call."!\n";

exit;
# -- end of script
hope that helps, more information about perl can be found at www.perl.com...
other scripting languages (like korn shell) have howto's at the linux
documentation project (www.tldp.org).  Any language that can communicate with
*nix's STDIN/STDOUT (C/C++, Java, ksh, sh, bash, perl, etc.) can be used for
AX25d processes.
Andrew

