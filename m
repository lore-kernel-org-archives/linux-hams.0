From: pd <pdickson@att.net>
Subject: Re: Running a PERL script from AX25D
Date: Thu, 14 Nov 2002 22:48:09 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200211142248.09358.pdickson@att.net>
References: <200211012128.00330.pdickson@att.net> <20021115012525.GA14427@enc.com.au> <1037325766.26664.14.camel@edith>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1037325766.26664.14.camel@edith>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams mailing list <linux-hams@vger.kernel.org>

Except that on AX25 you *want* it to buffer up the output so the packets are 
larger.  Otherwise the protocol becomes inefficient.

I guess I should try an explicit flush just before asking for input.  
Currently I am running it under axspawn, which works, but I am not sure if it 
is buffering up output either.  And it means I have to have a Linux account 
for each user (though they all are in the same directory).

Part of the problem may be that under ax25d STDIN and STDOUT are packet files, 
not byte stream files.  axspawn deals with this.
