From: Martin Ewing <martin@aa6e.net>
Subject: Re: newbie question - hamlib and gMFSK
Date: Sat, 01 May 2004 13:58:33 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4093E549.2090001@aa6e.net>
References: <1083420366.4194.8.camel@dhcppc3> <4093B61F.6090305@aa6e.net> <4093C38B.3040303@cs.unibo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4093C38B.3040303@cs.unibo.it>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrea Borgia <borgia@cs.unibo.it>, linux-hams@vger.kernel.org

Sorry! I wasn't aware of that option in gMFSK. (It's nice to read the 
freq., but not essential.) Hamlib 2.3 apparently doesn't have Orion 
support, which is what I need. I took a quick look at the code to see 
what to do to add a new rig, but it's not completely trivial. I wonder 
if it wouldn't have been possible to implement most of a rig's 
personality in a higher-level way -- in table- or rule-driven form. 
(Like sendmail -- not! :-)

The hamlib / gMFSK / xlog philosophy looks like a good one, as long as 
we are in the "Unix" world. One might wish for a true cross-platform 
solution, but that's harder.

Cheers,
Martin

Andrea Borgia wrote:

> Martin Ewing wrote:
>
>
>> I have been using KPSK and gMFSK with some success, and also jLog 
>> software (Java). These are all self-contained packages with their own 
>> audio and/or rig interfaces -- no relationship to hamlib.
>
>
> Hold it, timeout ;-)
>
> gMFSK does indeed use hamlib to display true frequencies in the 
> waterfall display and to send accurate qso data to xlog, that also 
> supports hamlib.
>

