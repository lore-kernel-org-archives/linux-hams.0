From: pd <pdickson@att.net>
Subject: Running a PERL script from AX25D
Date: Fri, 1 Nov 2002 21:28:00 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200211012128.00330.pdickson@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I am trying to run a PERL script as the "server" for some AX25 connections.
My PERL script works fine when I invoke it from the command line.

In ax25d.conf I specifiy a bash script to be run as the session command.
Inside the bash script there is an 'echo' command, which I see when i connect.
Other commands in that script also work.  But then it runs the PERL script and 
everything just stalls.

Here is the bash script:

#!/bin/bash
echo 'wait...'
HOME=/home/bbs
echo 'HOME set'
cd /home/bbs
pwd
perl t.pl

and here is the PERL script:

#!/usr/bin/perl
print "Hi\n";
print "Enter a number\n";
$buf = <STDIN>;
$n = $buf * 2;
print "Twice that is $n\n";
print "bye!\n";

Any suggestions?

KB1EHD

