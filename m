From: Dennis Boone <drb@msu.edu>
Subject: Re: KISS Mode
Date: Mon, 23 Feb 2004 11:45:04 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200402231645.i1NGj44L000909@yagi.h-net.msu.edu>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > Is there any program that makes the tnc pass to kiss using the shell,
 > just like KISSER was used in DOS?

The following perl script gets a Kantronics TNC _out_ of KISS mode;
may work for others, I haven't read manuals or tried it.

    #!/usr/bin/perl

    $dev = shift(@ARGV);
    $speed = shift(@ARGV);

    open(DEV, "+<$dev") ||
        die "unable to open $dev: $!";

    print DEV chr(0xc0), chr(0xff), chr(0xc0);

    close(DEV);

Sample usage: kissoff /dev/ttyS0 1200

To get the TNC into KISS mode, you can generally use minicom or kermit
to to connect to the TNC, get it into command mode, then type the
appropriate command.  For a Kantronics unit that would be:

    intface kiss
    reset

which sticks when you turn off the power.  The command may be
different for other brands; I have manuals for the PK-900 and PK-232,
but they are at home right now.

De
