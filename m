From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: AX25 in libpcap & wireshark (was ethereal)
Date: Tue, 13 Mar 2007 16:07:14 -0500
Message-ID: <620c90570703131407m6372026fh605a78dcc2ae162c@mail.gmail.com>
References: <45F6FE23.8040306@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=PumLqFfUAXvCWtcZXXqHbIaNVkWHI9Y9KqzDVdk7QefNx8UEu4UEX+wERKJi/KSp2ZTQH375REN4gMouoA2rma1GedSFVPIgdTtJ5dQI6xqzPnS5+JbSw/awXcwW1V9PpCL+Xk8yG1Qmh7KJPriLuDPy96SrIX0icNBdd96pP+E=
In-Reply-To: <45F6FE23.8040306@rns-stearn.demon.co.uk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On 3/13/07, Richard Stearn <richard@rns-stearn.demon.co.uk> wrote:
> It's hands up time!
>
> I have ported my AX.25 dissection patch to wireshark 0.99.5 and added some
> more protocols.
>
> The patch now contains:
>
>      AX.25
>      Netrom
>      Flexnet (well, it recognises Flexnet packets)
>      APRS (according to V1.01 + 1.1 & 1.2 errata)
>      AXIP (untested)
>      BPQ
>      AX.25_ARP
>
> The AX.25 dissector hands off IP to the existing dissectors so IP over AX.25
> is covered.
>
> This patch is getting larger and I am hesitant about posting it to the the list.
>
> So those who wish to play please put your hands up.  I can then distribute the
> patch off list.
>
> Packet captures for Flexnet & AXIP welcome.
>
> --
> Regards
>      Richard

There are those of us who use ROSE/FPAC, did you just forget to
list it or did you leave it out? Listen decodes it, so it should not be
a big deal to add it?


-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
