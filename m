From: csmall@enc.com.au (Craig Small)
Subject: Re: Running a PERL script from AX25D
Date: Fri, 15 Nov 2002 12:25:25 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021115012525.GA14427@enc.com.au>
References: <200211012128.00330.pdickson@att.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200211012128.00330.pdickson@att.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pd <pdickson@att.net>
Cc: linux-hams@vger.kernel.org

On Fri, Nov 01, 2002 at 09:28:00PM +0000, pd wrote:
> I am trying to run a PERL script as the "server" for some AX25 connections.
> My PERL script works fine when I invoke it from the command line.
> 
> In ax25d.conf I specifiy a bash script to be run as the session command.
> Inside the bash script there is an 'echo' command, which I see when i connect.
> Other commands in that script also work.  But then it runs the PERL script and 
> everything just stalls.

Sounds like a buffering problem to me.  What's that command in perl
again? $| or something.

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.enc.com.au/                <csmall@enc.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
