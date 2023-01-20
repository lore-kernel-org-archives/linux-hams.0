From: Chris Maness <christopher.maness@gmail.com>
Subject: Re: AX.25 Patches and the 5.15.89 Kernel tree?
Date: Thu, 19 Jan 2023 21:42:03 -0800
Message-ID: <CANnsUMF1i+oZ6oGWNkv=LK7HnNm0BtdjCmVF_0B1C977UTtHvw@mail.gmail.com>
References: <CANnsUMFRCJ1rszt-67GywV4_pU0yyW56dis1iSnSO9f23-oa=w@mail.gmail.com>
 <153d9f95-3c7c-1361-49d9-ca7707b93f98@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaOgLjjG/NeNDnxWkKZI3+sO/gO9gejlyZI7M7Hfz4w=;
        b=jHPZjLs0oHrY8hySPq5EZGQb8/bwn15YPRTRgE+JdVgA2dAvjShHB1+456jbUWyt99
         j9ZrLRdT3sseVc1Sf1wLQfPAULya5eotTGY5qK/PU7FO3U5MXx/roUa1gC5i3X689Sx/
         ZbqoC9OLIGbjLpZABakN8DjP0doeGsjWJuysXyukVacY0XNo6uS9cKUkdvH1xAG/SNhF
         YUd5TAY89YQs73X9tqwXuBvo6vGeldjXdmSJmRn2dXn5054WrLS7TcqN6gbRy3FBUqmA
         eMHWmhJzx+rt9jUbR2Le3qOBE1Bh3HMbUWzg1FyTVR+C1HVF8IvmvTzJKbglL/drxHJ0
         1VoQ==
In-Reply-To: <153d9f95-3c7c-1361-49d9-ca7707b93f98@trinnet.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Ranch <dranch@trinnet.net>, linux-hams@vger.kernel.org

They have their kernel on Gethub, and I just reported it as a bug and
posted the patch.  They jumped on that fast!  And it is now in the
current source, so should be in the next binary push.

-Chris KQ6UP

On Thu, Jan 19, 2023 at 8:56 PM David Ranch <dranch@trinnet.net> wrote:
>
>
> Hey Chris,
>
> Thank you for getting those AX.25 fixes backported into the Raspberry Pi =
kernel.  I'm curious, who did you work with to make that happen?  With that=
 said, getting many other Linux distributions to "inherit" the fixes from t=
he
> upstream Linux-next sources ( https://git.kernel.org/pub/scm/linux/kernel=
/git/next/linux-next.git ) is not automatic and some of these distros argua=
bly manage their kernels in a very similar way to how the Raspberry Pi Foun=
dation manages theirs.  This means you might need to start a conversation w=
ith Canonical devs, Redhat devs, Fedora devs, etc.
>
> It's a rather VERY frustrating process to get fixes backported into exist=
ing distro kernel releases via their "bug fix" program.
>
> --David
> KI6ZHD
>
>
>
>
> On 01/19/2023 06:30 PM, Chris Maness wrote:
>
> Thanks for fixing the AX.25 issues, I was able to get them backported
> to the Raspberry Pi source tree for the current version.  However, for
> desktop Linux distros, they are generally running some iteration of
> 5.15 as well.  I pulled the latest from kernel.org and compared it to
> my pi code that has the patches committed, and I see that the latest
> (5.15.89) does not have the patches committed.  Is there any way you
> guys could commit to that tree to?  I have not attempted a checkout
> for kernel code before and feel a tad intimidated to do so.
>
> VY 73 de Chris KQ6UP
>
>


--=20
Thanks,
Chris Maness
