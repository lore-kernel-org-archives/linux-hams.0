From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: Linux AX.25 Socket programming
Date: Fri, 3 Jan 2003 19:32:03 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301031919090.9645-100000@zl2bsj.ampr.org>
References: <Pine.LNX.4.44.0301020617170.1552-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301020617170.1552-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


On Thu, 2 Jan 2003, Tomi Manninen wrote:

> the same in eg. Perl. There was a thread about Perl and ax25d recently on 
> this list but I have already forgotten what the correct procedure was...

The trick was, to 'unbuffer' the Perl interpreter with:

$|=1;
# or any non-zero value

My Perl Bible says:

 English name: $OUTPUT_AUTOFLUSH

 If set to any non-zero value, forces a flush after every write or 
 print on the currently selected output device


I tried out the recently posted Perl script (having 'unbuffered it 
first...)

It looks as though AX25  scrambles the '\n', because the script keeps 
waiting for input (much 
like a Windows shutdown :-)

When I set $/ to any character, the script then gets past the
$call=(<>);
statement once that character appears on stdin.

How does ax25d present end-of-line?


Wilbert, ZL2BSJ



