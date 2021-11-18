From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: Re: NET/ROM bug fix from YO2LOJ?
Date: Thu, 18 Nov 2021 20:30:27 +0100
Message-ID: <CAH4uzPM9YzJPzLRCLSRWf17vim9ADmAiLM_G+yTDWDuXgzLhAA@mail.gmail.com>
References: <27764.1637253551@yamaloka.gajendra.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6qPu2e9SxeG5fZDkP5SYiCui5HTlYMfcveay6DoCtE8=;
        b=gzS4W9IKTkSagDcaAJdcj8vQ7SDr0v+zK3U7G49rRyS/qCQXZTiHUy52f5akq08uTi
         mztRfWvnY5DmPyLnyoj2o5MerhSpDzsy4ceZnUClatDOUhVP6iyrkIanLoX9wzUrieeB
         SZESGxj6PjVfygR2xo/rLfoSy1a3yTy79+G15dLyC/4+Q2joHq6mg80kECEQ5Tz7fbYs
         CHhrFso02/LFFY3Wai2M0nv4rsLkHnzLxDrWG7a+2i9wy2bpBosZta+ziw+MJrSC09cB
         kJlw19rhkV9WBMJfGGaeItd5hvaTnKqBxVjquz25tLm17FS+WVGFP1L9sRpOuULC3DNu
         sigw==
In-Reply-To: <27764.1637253551@yamaloka.gajendra.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Cross <crossd@gmail.com>
Cc: linux-hams@vger.kernel.org

The patch itself made it to this list several times as far as I know.
I also had some conversation here with the maintainer (Ralf) where
it's mentioned including what YO2LOJ did in his patch.
Roland Schwarz posted the patch too on 31th July 2021 with subject:
[PATCH] apply YO2LOJ's changes for proper connection cleanup.

I'm curious too if someone is tracking the issue, any status requests
remain unanswered. It won't be because there's no additional context
provided. There's lots of provided... Which can be found in the
archive.

Maybe it isn't the _right_ fix, but it seems to work pretty well for
everyone using it. And if it isn't the _right_ fix, what is...

The same seems to happen with a serious security issue I reported
where random fragments of data from memory is leaking into NETROM
frames with kernel 5.4 and up.
Unfortunately I'm not very capable of debugging the kernel stuff
myself. After some conversations with the maintainer, and providing
more info and a dump regarding that, there's silence too without any
response to status requests from anyone.

73! Dave

Op do 18 nov. 2021 om 19:37 schreef Dan Cross <crossd@gmail.com>:
>
> On October 26 2021, N1URO sent a message to this list asking
> about getting "the NetRom status bug" fixed.  There was no
> additional context, so perhaps it's unsurprising that no one
> responded.
>
> However, his message appears to refer to a legitimate bug in
> which NET/ROM sockets can be left in an invalid state after
> closing.  Marius Petrescu, YO2LOJ, has a small patch for this
> on his web site, but from my searching, I can't find any record
> that it ever made it to either this list or the LKML.
>
> Marius's fix is short (slightly reformatted for kernels style):
>
> --- ../reference/linux/net/ax25/ax25_subr.c     Thu Nov 18 15:33:53 2021
> +++ ax25_subr.c Thu Nov 18 16:05:36 2021
> @@ -284,5 +284,8 @@
>                 }
>                 bh_unlock_sock(ax25->sk);
>                 local_bh_enable();
> +       } else {
> +               // YO2LOJ: this is needed for proper NETROM connection cleanup on timeout
> +               ax25_destroy_socket(ax25);
>         }
>  }
>
> I do not know whether this is the _right_ fix for this issue,
> but it seems that additional context towards getting it fixed
> would be helpful, hence this message.
>
> Is anyone tracking this issue?
>
> Thanks and 73,
>
>         - Dan C.
>           (KZ2X)
>
