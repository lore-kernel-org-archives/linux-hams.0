From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: [fpac] System Down
Date: Sat, 9 Sep 2006 16:28:08 -0400
Message-ID: <620c90570609091328t57dc2aaekd8a5771213f02034@mail.gmail.com>
References: <44DECB75.1090103@exemail.com.au>
	 <620c90570608130829l12557b3flb6eda0eb358b513@mail.gmail.com>
	 <44DFA2D2.7070501@exemail.com.au> <44E0D402.7060405@ccr.jussieu.fr>
	 <44E3FAC7.5030901@exemail.com.au> <45031057.90103@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <45031057.90103@ccr.jussieu.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

On 9/9/06, Bernard Pidoux <pidoux@ccr.jussieu.fr> wrote:
>
> Ray Wells wrote :
>
> > Bernard Pidoux wrote:
> >> You are perfectly right.
> >> There is a patch for LinFBB and kernel 2.6.
> >> I included it together with some new items into version labelled 7.04l
> >> You may find a reference to it in FPAC MINI HOWTO following this link
> >>
> >> http://rose.fpac.free.fr/MINI-HOWTO/#s102
> >>
> >>
> >> 73 de Bernard, f6bvp
> >>
> >>
> > Bernard,
> >
> > Thanks for the information. I haven't had a chance to get back to it
> > yet, maybe over the next weekend.
> >
> > Do you know if the Rose patch (af_rose.c) for the 2.6.14.4 kernel is
> > already applied in later kernels, specifically 2.6.17.1?
> >
> > Ray
>
> No, af_rose.c patch from Jean-Paul F6FBB has never been applied to
> kernels code although I did submit it more than once to Ralf DLR5RB.
> It corrects an obvious bug, adding a loop allowing rose node to perform
> a scrutation of ALL adjacent neighbour routes until the end of the
> neighbours list.
> A number of stations have experimented it with success.
> And additionally, the patch does not induce any problem into the kernel.
> However I don't know why Ralf did not take it into account. He never
> told me. Maybe he wants to wash out rose code before.
>

I am adding this reply to the linux hams list, perhaps Ralf just missed it in
all of the coming and going of patches ect. We need to get it into the base
code as that is the needed fix to deal with a broken link.

Bernard, how goes it? we figured you were either on holiday or still working
on your flat or like me on holiday AND working on the house/flat.... B-[b

Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
