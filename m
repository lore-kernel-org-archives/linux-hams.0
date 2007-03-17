From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Document request - ROSE protocol specification
Date: Fri, 16 Mar 2007 22:35:03 -0400
Message-ID: <620c90570703161935w55a341d9y740bd2f6eec264d5@mail.gmail.com>
References: <45F87682.8010206@rns-stearn.demon.co.uk>
	 <620c90570703141711v444bd67dqd9cf8e86a6fc1b54@mail.gmail.com>
	 <45F92C62.2030707@ccr.jussieu.fr>
	 <620c90570703150642q76cfb326scdca89934a9593a1@mail.gmail.com>
	 <45FB0130.6080206@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=dQni9nPHEgzqi1H1cgjC4k8FlahBvdebEqoLrvAnlLm0TwCZGkSTB5UHjAnQa2BWRbJ9AkeenABInXBmIdREKTTYNj5m+2clwJXgKTuXuZc3GVnjRVeaevYUQJThF9QzAvet2lcbDew4N4LOvAFvU00jLNhQd764/WFKMxLDeQ4=
In-Reply-To: <45FB0130.6080206@rns-stearn.demon.co.uk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On 3/16/07, Richard Stearn <richard@rns-stearn.demon.co.uk> wrote:
> Chuck Hast wrote:
> > See, I told you that Bernard would have some good stuff... What listen does
> > not show is the GFI, it does show the LCI and in the call request packet
> > the
> > random number  (NbAlea) which is used to assign the LCI. Nor does it show
> > the cause/diag code data when there is a error or a disconnect.
> >
> > So any work you do in this direction will be a big help for us.
>
> Chuck
>
> There is an X.25 dissector in wireshark, I am looking at either calling or
> cloning the relevant parts.  The good news from your perspective is that it
> appears to be a comprehensive dissection.
>
That is good, Tom Moulton who did the original ROSE code wrote X.25
PLP commercially, so he knew well the whole stack. Indeed he used to
write code for X.25 pad devices, and was a stickler for staying as near to
the protocol as possible. I would suspect that you will find that except for
the extensions to handle callsigns there is not that much difference but
for the commercial pieces which are not used.

If you want to set up a FPAC site there to test with, we can also help you
with that, particularly if you use axip to link to the rest of the network. Then
you will have a real live one to monitor.

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
