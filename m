From: adam.vazquez@gmail.com
Subject: Re: Cloning Hard drives
Date: Sun, 9 Dec 2007 19:35:38 -0500
Message-ID: <71b434da0712091635x7cc85973xc9b6e81d1e77a825@mail.gmail.com>
References: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
	 <e524c5320712091630p4edcf35fg52059f4b9ed11678@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=XiQkvLj18x3nSIPugM5nx7odygwQZ2xMyv5t/RXidm0=;
        b=njIT3hCA2N6R0u1FAvmkOJagGfSvBrcVB8v2pImu6huAtsZqr/DfVOYDjEPH0OigVX2S/KdNGsPC3xuxWNxgoJjX1uO/sP7kBbJtS4L3p4/PqTriDFRtDrTew2KaiN7LFQXapWvCg3et6AEOgGn4UK81S/5zcyseQXDJTGzM8WY=
In-Reply-To: <e524c5320712091630p4edcf35fg52059f4b9ed11678@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jim Bayer <kc9aop@gmail.com>
Cc: Doug <appld@sasktel.net>, linux-hams@vger.kernel.org

Hello from Adam kb2jpd

Google ddcopy instead. It is text mode and it is by far superior to dd
and if you have bad sectors it will recover the data using a narrowing
window algorithm.

It works great for good and dying drives .

On 12/9/07, Jim Bayer <kc9aop@gmail.com> wrote:
> You could also use cpio as follows:
>
> 1. Cd to the target you want to copy to
> 2. The command is:  find -depth <source path> | cpio -pvdum  .
>
> This will pass through the file tree from the find and pre-build the
> entire structure for the target. cpio does a block and sector copy so
> you need a file system target at least as large as the source.
>
> Another suggestion that may work is to use mkisofs and create an iso
> image of the source, which will also grab the boot sectors.
>
> If I think of any more I'll pipe up again.
>
>
> On 12/9/07, Doug <appld@sasktel.net> wrote:
> > Is there a way to clone or ghost a Linux hard drive??
> >
> > Doug VE5DA
> >
> >
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
