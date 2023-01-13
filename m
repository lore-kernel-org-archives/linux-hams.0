From: Lorenzo Simoncello <lorenzo.simoncello@gmail.com>
Subject: Re: Patching the Raspberry Pi OS Kernel for AX.25?
Date: Fri, 13 Jan 2023 15:20:25 +0100
Message-ID: <CAA+Jh9wEr7b68C16d6xMc8yeYco-hdFWaw0Qe+tx8t9EFh1o+w@mail.gmail.com>
References: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vp7WJEQeqfECJPHW0AuERFkvo4NbV7HrEE/sJXMZfd8=;
        b=QjPHGx5LVyYTukYBgvYG6wBr0ccvf8dR7Cy7FM1R8d51Jghstjrr6KNpTaZleU9LAx
         uk9bQV5CL5l8hnTo9et/SFi0hvUb35+u1AkxduiiBySDBQ0vk2kJ07W4IBz5caJU75KD
         YjUYPMItFMpdxjP1EnmECk1OGYKfo3SpeolHy87kLU1VEWuanwMfocF8mVChKTEFlN1Y
         xpAle2PihTrgkxM2Uta9HrranVk0sAFdoAtOQlwUtvxXswy5+FaGxmLTRFdvb/eQr2+P
         tOsn19bvi/sOTWX4snnMyXcKe1daVP3g9yQB34gEmfGKKqO7PJiViqsand+vTazpgkzV
         S4bQ==
In-Reply-To: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Happy to know that some issues have been fixed :)
I think we can find some plus info here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/?h=linux-5.19.y&qt=grep&q=ax25

We can switch the kernel branches and check which ones have been
applied... so the problem is which branch is the better at now? :)
If anyone checked it will be much appreciated

Thanks
Lorenzo Simoncello IW3HER


Il giorno mar 27 dic 2022 alle ore 07:34 Chris Maness
<christopher.maness@gmail.com> ha scritto:
>
> I would like to try to patch the current 5.15 kernel for the Pi to
> bring it up to the ax.25 code that is in 5.19.  I believe in that
> version some of the issues have been fixed, but the current kernel
> version for the Pi is 5.15.  I have never patched the kernel source
> before and I am not sure how to proceed.  I have built them before
> many moons ago.
>
> -KQ6UP
>
> --
> Thanks,
> Chris Maness
