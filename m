From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: Re: Status of the stuck sockets bugs.
Date: Thu, 22 Jul 2021 19:42:18 +0200
Message-ID: <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=+N8YmYPoar6hFe1uddqdMQMOyeqRXx62rpuEiXy4Ro8=;
        b=BubD+N1kySHORyVskeaVRkF6CJHoCSwj3G94Jn7d4yWr9KOThySStAnM8nIJ516zJf
         ZxVqFzZw/dhnBUdOE5+SMoq/YSUFtK3FW8v/M2Hzal5ctb/vnc9goj1d6XHXdIkYC36K
         3AyxrYzyY6qr5d6e+SEFx/UDP/auMDITbQV6tQ9nCwte3mCKFHJexn6u88SC35Txcrtt
         MJkmVvGvEfrFyCgxNVqY4LN7vbAOWCvYl2SKsDjuDkjW5x/kmU5XzLauSmBbntv+4ZyC
         MQdMvF3UEuMsiZ0eqQUmsXU5YROn6NVmwDLKI7W9Ay5mQuMLET6k85Z/vyKvIoZs3WgP
         hM9g==
In-Reply-To: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Is anybody able to tell me more / give answers to questions about this issue?

Kind regards,
Dave van der Locht

Op di 29 jun. 2021 om 19:32 schreef Dave van der Locht
<d.vanderlocht@gmail.com>:
>
> Hello,
>
> Is there any news about the well known bug regarding sockets getting
> stuck in LISTENING state?
>
> Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
> ax25_subr.c file which seems to work very well and solves the issue.
> But it's really annoying having to patch the kernel with each update
> again.
>
> What about that patch, I've heard it was rejected several times for
> some reason? But can't find info regarding that.
> What can be done - or who is able - to get rid of this bug and get it
> fixed in the kernel?
>
> Kind regards,
> Dave van der Locht
