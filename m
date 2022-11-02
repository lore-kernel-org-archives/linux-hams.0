From: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: drop Liam Mark and Laura Abbott
Date: Wed, 2 Nov 2022 15:16:33 +0300
Message-ID: <Y2JfoWTaAW6QjavL@kadam>
References: <20221029131734.616829-1-bagasdotme@gmail.com>
 <20221029131734.616829-3-bagasdotme@gmail.com>
 <aad04e06-59b0-f630-7cef-fdb557860a56@labbott.name>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9MIQpV6ASdp5EtPUFNwNW4tWoOWg8tJ6K5b3MTsbc3g=;
        b=ajqXyytBL4q+7pjyyyhqP+XOg1aIeC4xjkoTAAYAG9mWwC+RrjG2HUgdZLMbzamOoG
         DuOFX4E4u9k2Ce9Q53fKg/X2RudHp8Bhs4byLBP5PVNHB/BUTIFss1e2wvKafDfIL4Ji
         ZyJDyyYYujIvEZ1xEvfNgTGvdTk6N52z+ZyxXXQ12ioIQdy4dlGM6sDaDE8jGOdcMVOi
         YFOa9G4ts/qScAFc3RojY9AT+FSaY7FNG+BhxkpPOisibYHKX4CC9fKIe3+A8uCTTFOW
         RUAXrwWa615oPXc01U2Q4EzWvNhVWFByUr/lW/pVkl6rHST/Tv9Bzo9ZNTK+bp5r98zA
         xFXg==
Content-Disposition: inline
In-Reply-To: <aad04e06-59b0-f630-7cef-fdb557860a56@labbott.name>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laura Abbott <laura@labbott.name>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-media@vger.kernel.org

On Mon, Oct 31, 2022 at 09:44:56AM -0400, Laura Abbott wrote:
> On 10/29/22 09:17, Bagas Sanjaya wrote:
> > Emails sent to their respective addresses listed bounces (550 error).
> > Their last post on LKML was two years ago ([1] and [2]). Remove them.
> > 
> > Link: https://lore.kernel.org/lkml/alpine.DEB.2.10.2002201508320.1846@lmark-linux.qualcomm.com/ ([1])
> > Link: https://lore.kernel.org/lkml/b85fa669-d3aa-f6c9-9631-988ae47e392c@redhat.com/ ([2])
> > Cc: Laura Abbott <laura@labbott.name>
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > ---
> >   Actually Laura's last post was a year ago from her personal address,
> >   where she announced 2021 LF TAB results [3], so Cc that address.
> > 
> >   [3]: https://lore.kernel.org/lkml/6e307861-3149-a984-cc79-088559caeab2@labbott.name/
> >   MAINTAINERS | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 63a84d3218a7b4..564c3c66077e0b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6221,8 +6221,6 @@ F:	tools/testing/selftests/dma/
> >   DMA-BUF HEAPS FRAMEWORK
> >   M:	Sumit Semwal <sumit.semwal@linaro.org>
> >   R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > -R:	Liam Mark <lmark@codeaurora.org>
> > -R:	Laura Abbott <labbott@redhat.com>
> >   R:	Brian Starkey <Brian.Starkey@arm.com>
> >   R:	John Stultz <jstultz@google.com>
> >   L:	linux-media@vger.kernel.org
> 
> https://lore.kernel.org/all/20200108213055.38449-1-labbott@kernel.org/
> https://lore.kernel.org/all/20211207225458.622282-1-labbott@kernel.org/
> 
> I've sent a request to change this twice and I don't really have the
> energy to continue chasing it down. If you can get the removal merged
> go ahead.

You could send it through Andrew's tree.

Andrew Morton <akpm@linux-foundation.org>

regards,
dan carpenter

