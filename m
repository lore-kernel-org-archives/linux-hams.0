From: Kelly Black <kelly.black@penguinpackets.com>
Subject: Re: Running a PERL script from AX25D
Date: 14 Nov 2002 20:02:46 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1037325766.26664.14.camel@edith>
References: <200211012128.00330.pdickson@att.net> 
	<20021115012525.GA14427@enc.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021115012525.GA14427@enc.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams mailing list <linux-hams@vger.kernel.org>

On Thu, 2002-11-14 at 19:25, Craig Small wrote:
> On Fri, Nov 01, 2002 at 09:28:00PM +0000, pd wrote:
> > I am trying to run a PERL script as the "server" for some AX25 connections.
> > My PERL script works fine when I invoke it from the command line.
> > 
> > In ax25d.conf I specifiy a bash script to be run as the session command.
> > Inside the bash script there is an 'echo' command, which I see when i connect.
> > Other commands in that script also work.  But then it runs the PERL script and 
> > everything just stalls.
> 
> Sounds like a buffering problem to me.  What's that command in perl
> again? $| or something.
> 
>   - Craig

I feel so stupid.  Posting to Majordomo address, Ugh!

Anyway here is what I meant to send to the list, and not to the
subscription bot:

Sounds right.  I have it as:

$| = 1;
(or any non-zero value)
This should unbuffer your script's output.  Without this, your output to
STDOUT is buffered and only sent when a certain block size is reached,
or when the script exits with a less than full buffer.

Kelly Black
KB0GBJ



