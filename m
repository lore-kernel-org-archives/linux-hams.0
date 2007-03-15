From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Document request - ROSE protocol specification
Date: Wed, 14 Mar 2007 19:11:12 -0500
Message-ID: <620c90570703141711v444bd67dqd9cf8e86a6fc1b54@mail.gmail.com>
References: <45F87682.8010206@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=hM5/GcFsNkTwrG4kDFFBd4/ThftYlGklyhAFkCHe/HNHM2gOn88DW1ABM6q+uWdBWwZrYOTwx+CXtZWz9cC3hS6mof1rZBKultVNHKFIAy2su26BhhKAV9BVrBFWpEMikW2spl9NhAN2loS2mkxUltBmaY2lvpfVhFQKzJR2aI8=
In-Reply-To: <45F87682.8010206@rns-stearn.demon.co.uk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On 3/14/07, Richard Stearn <richard@rns-stearn.demon.co.uk> wrote:
> Greeting all
>
> I am attempting to add ROSE to wireshark (ethereal).  My preference is
> to code the protocol analyser from the specification document rather
> than reverse engineer an existing driver stack.
>
> The RATS web site www.rats.org now goes to a holding site.  Does anyone
> have either an electronic copy of the ROSE spec or a URL to a current
> copy?
>

Richard,
I googled on X.25 PLP and found that most of the descriptors pretty much
follow what I recall from Brian Lantz decoding of ROSE in TNOS. Listen
does not show the GFI just the LCN. Here is a good website for the X.25
PLP breakout:

http://www.techfest.com/networking/wan/x25plp.htm

Also perhaps Bernard F6BVP can provide you information or Jean-Paul
F6FBB, Bernard is actively working on FPAC (the set of tools and wrapper
that makes ROSE easy to use under Linux and also allows for integration
of IP and NetRom under a single system).

Back to X.25 PLP, there is a lot of info out there and again as far as I
can remember, the only things that may not have been always visible
were all of the different cause diagnostic codes because there are a
lot of them that deal with commercial operations.

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
