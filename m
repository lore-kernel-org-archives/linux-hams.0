From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Document request - ROSE protocol specification
Date: Thu, 15 Mar 2007 09:42:32 -0400
Message-ID: <620c90570703150642q76cfb326scdca89934a9593a1@mail.gmail.com>
References: <45F87682.8010206@rns-stearn.demon.co.uk>
	 <620c90570703141711v444bd67dqd9cf8e86a6fc1b54@mail.gmail.com>
	 <45F92C62.2030707@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=W7CZy+AjmBdSidC5Lrru2DwehBsJ7c54znLaVkGYhhChX/ncqzMXRGbOyoK1bseIGX0Amz1MlBhkii3ITRMxegmtrzF9+62NiKKn1tXFRRnbVeM6IIzqiqKm3Y2UXiLj09d2cdpiGdK0gUIlT6DNtAAF8OFFyda8COVCtylaffo=
In-Reply-To: <45F92C62.2030707@ccr.jussieu.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Richard Stearn <richard@rns-stearn.demon.co.uk>, linux-hams@vger.kernel.org

On 3/15/07, Bernard Pidoux <pidoux@ccr.jussieu.fr> wrote:
>
> Chuck Hast wrote:
> > On 3/14/07, Richard Stearn <richard@rns-stearn.demon.co.uk> wrote:
> >> Greeting all
> >>
> >> I am attempting to add ROSE to wireshark (ethereal).  My preference is
> >> to code the protocol analyser from the specification document rather
> >> than reverse engineer an existing driver stack.
> >>
> >> The RATS web site www.rats.org now goes to a holding site.  Does anyone
> >> have either an electronic copy of the ROSE spec or a URL to a current
> >> copy?
> >>
> >
> > Richard,
> > I googled on X.25 PLP and found that most of the descriptors pretty much
> > follow what I recall from Brian Lantz decoding of ROSE in TNOS. Listen
> > does not show the GFI just the LCN. Here is a good website for the X.25
> > PLP breakout:
> >
> > http://www.techfest.com/networking/wan/x25plp.htm
> >
> > Also perhaps Bernard F6BVP can provide you information or Jean-Paul
> > F6FBB, Bernard is actively working on FPAC (the set of tools and wrapper
> > that makes ROSE easy to use under Linux and also allows for integration
> > of IP and NetRom under a single system).
> >
> > Back to X.25 PLP, there is a lot of info out there and again as far as I
> > can remember, the only things that may not have been always visible
> > were all of the different cause diagnostic codes because there are a
> > lot of them that deal with commercial operations.
> >
>
> ROSE has been described by Tom Moulton W2VY in different ARRL Computer
> Networking Conference proceedings available on CDs (google ROSE W2VY).
> Sorry I only have 3rd (1984), 9th (1990) and 13th (1994) books
>                                                      without ROSE
> protocole descripion.
>
>
>
>
>
>
>
>
> ROSE adressing follows the X.121 specs and uses 14 digits.
>
> There is a good description here :
> http://www.rhyshaden.com/x25.htm
>
> Linux kernel source provides diagnostic codes and specs.
> For example in /linux/include/net/rose.h :
>
>
> #define ROSE_ADDR_LEN                   5
>
> #define ROSE_MIN_LEN                    3
>
> #define ROSE_GFI                        0x10
> #define ROSE_Q_BIT                      0x80
> #define ROSE_D_BIT                      0x40
> #define ROSE_M_BIT                      0x10
>
> #define ROSE_CALL_REQUEST               0x0B
> #define ROSE_CALL_ACCEPTED              0x0F
> #define ROSE_CLEAR_REQUEST              0x13
> #define ROSE_CLEAR_CONFIRMATION         0x17
> #define ROSE_DATA                       0x00
> #define ROSE_INTERRUPT                  0x23
> #define ROSE_INTERRUPT_CONFIRMATION     0x27
> #define ROSE_RR                         0x01
> #define ROSE_RNR                        0x05
> #define ROSE_REJ                        0x09
> #define ROSE_RESET_REQUEST              0x1B
> #define ROSE_RESET_CONFIRMATION         0x1F
> #define ROSE_REGISTRATION_REQUEST       0xF3
> #define ROSE_REGISTRATION_CONFIRMATION  0xF7
> #define ROSE_RESTART_REQUEST            0xFB
> #define ROSE_RESTART_CONFIRMATION       0xFF
> #define ROSE_DIAGNOSTIC                 0xF1
> #define ROSE_ILLEGAL                    0xFD
>
>
> ROSE packets identified by listen have PID=1(X.25)
>
> Here is a sample screen dump from F6BVP FPAC node F6BVP-11 :
>
> 0: fm KP4DJT-9 to F6BVP-11 ctl I27^ pid=1(X.25) len 3
> X.25: LCI 032 : RR R7
> 0: fm KP4DJT-9 to F6BVP-11 ctl RR3+
> 0: fm F1MVP-5 to F6BVP-11 ctl SABM+
> 0: fm F1MVP-5 to F6BVP-11 ctl I00+ pid=1(X.25) len 5
> X.25: LCI 000 : RESTART REQUEST - Cause DTE Originated - Diag 0
> 0: fm VK2TV-2 to F6BVP-11 ctl RR0v
> 0: fm F5KBW-9 to F6BVP-11 ctl SABM+
> 0: fm F5KBW-9 to F6BVP-11 ctl I00^ pid=1(X.25) len 5
> X.25: LCI 000 : RESTART REQUEST - Cause DTE Originated - Diag 0
> 0: fm F5KBW-9 to F6BVP-11 ctl I11^ pid=1(X.25) len 60
> X.25: LCI 064 : CALL REQUEST - NbAlea: B464
> fm F5KBW-3   @2080,833501
> to F6BVP-3   @2080,175502
>
See, I told you that Bernard would have some good stuff... What listen does
not show is the GFI, it does show the LCI and in the call request packet the
random number  (NbAlea) which is used to assign the LCI. Nor does it show
the cause/diag code data when there is a error or a disconnect.

So any work you do in this direction will be a big help for us.


-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
