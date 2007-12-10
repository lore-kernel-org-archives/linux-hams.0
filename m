From: "Jim Bayer" <kc9aop@gmail.com>
Subject: Re: Cloning Hard drives
Date: Sun, 9 Dec 2007 18:30:18 -0600
Message-ID: <e524c5320712091630p4edcf35fg52059f4b9ed11678@mail.gmail.com>
References: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=KkuEVENaP3GShQwa99iZ2XGUkj2wmyXke5BGrA4pbao=;
        b=ZTtJdv3zlbTaZCsCB2teHkPovIxOQ7rhOMvf3iVlmGQzivIxEj+91bAu/sCQMKsy4dO9xjL1v8VLj6JkCeP3hKV+6914TMAGSOvSlfC+dkNYp18WYdlh7GOFtEQ1QmzBkE8iEi/QvMYyXIzwRCFK3MZ8eeID6uuFmfLwWycwio4=
In-Reply-To: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doug <appld@sasktel.net>, linux-hams@vger.kernel.org

You could also use cpio as follows:

1. Cd to the target you want to copy to
2. The command is:  find -depth <source path> | cpio -pvdum  .

This will pass through the file tree from the find and pre-build the
entire structure for the target. cpio does a block and sector copy so
you need a file system target at least as large as the source.

Another suggestion that may work is to use mkisofs and create an iso
image of the source, which will also grab the boot sectors.

If I think of any more I'll pipe up again.


On 12/9/07, Doug <appld@sasktel.net> wrote:
> Is there a way to clone or ghost a Linux hard drive??
>
> Doug VE5DA
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
