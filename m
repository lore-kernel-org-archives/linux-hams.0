From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 0/5] Remove dead linux-mips.org references
Date: Mon, 22 Feb 2021 18:56:24 +0100
Message-ID: <CAKXUXMwOpu3Ty4qMWaAjiAWSpdxrwKyJEt8D9wbzJb13-Z3xEg@mail.gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com> <alpine.DEB.2.21.2102221836030.1900@angie.orcam.me.uk>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANOaJ+Dv36acdHUTyk+J+U0eqbyeMKrUZXEtS6SU5zg=;
        b=jh1bDuacVmABTLCM/yav8HOoP+zIh3JBPS5icgc0CmJWIGJT/9LpgnIIQhOBvM7TbI
         N9MBi9aoLkToiNFLaIFl0VGyy0cPlVKqUk52yNw/DcqnZBac4gwt94RYGKNwL2ObQPg/
         mE90zNYZd0vB8yCzomEQfAikk+JIwg/PZTNKH3iJUxa+RAG/tNW3z1uPG8geFs+4wn/d
         QaJNRdAAOwQtBOds/r+0lsYkhRy0ORHhPj2zbEJJOM56rxkgterH9tGxs72z93laSEbk
         VO/h5FXkFsQOh43sPq0EKPRND+5FgGovxUDtZvW+bzJGR2wju5asuz2tmZWokD8PHwVs
         ffeg==
In-Reply-To: <alpine.DEB.2.21.2102221836030.1900@angie.orcam.me.uk>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Feb 22, 2021 at 6:47 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Mon, 22 Feb 2021, Lukas Bulwahn wrote:
>
> > The domain lookup for linux-mips.org fails for quite some time now.
> > Hence, webpages, the patchwork instance and Ralf Baechle's email there is
> > not reachable anymore.
>
>  I have been contacted by Ralf a couple of weeks ago and he told me there
> had been a storage failure with the machine running linux-mips.org.
>
>  Due to a complex situation with linux-mips.org I do not want to dive the
> details of into here recovery of the site caused some trouble, however I
> was told it had been under way now.  So I suggest that we wait a couple of
> weeks yet and see how it goes before going ahead with this series.
>
>  As to Ralf personal commitments WRT maintenance duties I can't speak, but
> I have bcc-ed him on his alternative e-mail address with this message in
> case he wants to speak up.
>

Thanks for the update. Maybe we can then rescue some of the valuable
content from linux-mips.org and mirror it somewhere else as well?

The code mentioned some patch by referring to a linux-mips.org
patchwork id, but without the service running, there is no chance to
understand the comment. So, once linux-mips.org is up and running
again, we might want to recover that referred patch and change the
comment to a lore.kernel.org Link (that may stay with us for longer)
or quickly find out if that comment is obsolete by now.

Lukas
