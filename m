From: Andrea Borgia <borgia@cs.unibo.it>
Subject: Re: newbie question - hamlib and gMFSK
Date: Sat, 01 May 2004 17:34:35 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4093C38B.3040303@cs.unibo.it>
References: <1083420366.4194.8.camel@dhcppc3> <4093B61F.6090305@aa6e.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4093B61F.6090305@aa6e.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Martin Ewing wrote:


> I have been using KPSK and gMFSK with some success, and also jLog 
> software (Java).  These are all self-contained packages with their own 
> audio and/or rig interfaces -- no relationship to hamlib.

Hold it, timeout ;-)

gMFSK does indeed use hamlib to display true frequencies in the 
waterfall display and to send accurate qso data to xlog, that also 
supports hamlib.


> I have written some Python-based software to operate the PSKmeter device 
> and for Orion rig control (www.aa6e.net/aa6e), but again no connection 
> with hamlib.

I tried to think of a reason to include this work into hamlib, but I 
guess pretending a PSKmeter is a rig simply won't fly.


> potential users are on Windows.  So, we have MixW, MultiPSK, etc. for 
> Windows and nothing similar AFAIK in Linux.

Try the latest gMFSK: while perhaps not as "spiffy" as MixW, it does 
work quite well, it is free&free (as in, GPL) and its author is very 
responsive to suggestions and bugreports.


B73,
Andrea.

-- 
Homepage: http://andrea.borgia.bo.it     /    Amateur radio: IZ4FHT
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

