From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: Linux AX.25 Socket programming
Date: Sat, 4 Jan 2003 09:47:05 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301040925500.9645-100000@zl2bsj.ampr.org>
References: <Pine.HPX.4.10.10301031914210.15434-100000@saturn.trs.ntc.nokia.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.HPX.4.10.10301031914210.15434-100000@saturn.trs.ntc.nokia.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org



> The standard end-of-line in AX.25 related world is CR

Thanks. In that case, in order to make it work with ax25d, Andrew 
Bates's Perl script needs to start off like this:

   #!/usr/bin/perl
   # -- beginning of script
   # Un-buffer STDIN:
   $|=1;
   # Use AX25 EOL:
   # (Check the '$/' paragraph in 'man perlvar')
   $/="\r";

I found that the AX25 socket gets closed as soon as the script runs 
out. The remote end gets a UI disconnect, hot on the heels of the last 
Info frame. The remote user never gets to see the result of the script. 

A graceful closedown by the remote user would fix that:

   print "Hit ENTER to quit:";
   $call = (<>);

   exit;
   # end of script

So, it looks like it _really_ is as easy as advertised by G4KLX! I am 
now scripting a search-my-log gizmo :-)


Wilbert, ZL2BSJ



