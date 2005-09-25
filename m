From: Chuck Hast <wchast@gmail.com>
Subject: Re: AX.25 in tcpdump.
Date: Sun, 25 Sep 2005 06:47:01 -0500
Message-ID: <620c9057050925044759f38aa1@mail.gmail.com>
References: <4335D980.503@rns-stearn.demon.co.uk>
	 <620c9057050924172134d0069e@mail.gmail.com>
	 <43367A25.70805@rns-stearn.demon.co.uk>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43367A25.70805@rns-stearn.demon.co.uk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

On 9/25/05, Richard Stearn <richard@rns-stearn.demon.co.uk> wrote:
> Chuck Hast wrote:
> > If you get the info would you do the ROSE stuff (we use FPAC here in FL
> > which is a super set of ROSE which is actually X.25) ?
>
> Chuck
>
> Yes, but a qualified one. Can we establish that it actually needs to be done?
>
> A grep for 8208 turns up:
>
>         print-llc.c:        { LLCSAP_ISO8208,  "ISO8208" },
>
> so I would like to try connecting that in as the print routine and have
> someone test the result before I look at coding a print-rose.c. If the
> 8208 implementation in print-llc is close then I could use that as a starting
> point and just add the extras to create a print-rose or look at extending
> print-llc (which might be be vetoed by the current maintainer).
>
> Told you I was lazy. :-)
>
I have always felt that lazyness was the motor of invention not some other
force... B-] You are just confirming it ... I would do the same, that is why
I mentioned the X.25 stuff. It looks to me like you are on the right track,
ISO8208 is X.25 plp, so if that takes care of it we are in business, so you
see I am as lazy as you are... Nothing wrong with that, it gets the job done.


--
Chuck Hast
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
