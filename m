From: Chris Maness <christopher.maness@gmail.com>
Subject: Re: Patching the Raspberry Pi OS Kernel for AX.25?
Date: Mon, 26 Dec 2022 22:31:50 -0800
Message-ID: <CANnsUMFvEy6TkwdVitOpRs_HhxLmt8=FKbe2=RDK3190syN9Zg@mail.gmail.com>
References: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDuZtTCdaoZpABUCV3eFMxfDqpHbcZJ2HeqwvXLq9zc=;
        b=aseaYhM/HETcN+yqszOm3eqDGPPJbLadLFPAPUDxSUpRZkWMw+vjC4fCrePew0z8Xy
         HyG4tNQE+o5kmoHBxkiHPEl20RoGtKgmJOlDRxFc6St7enTNMjncDUAfNvFTg2ku9YBS
         OAu9kggebQBmYiTU8QmPsIDkuOltDlSSvX/qKXqYylZbNt6SrLKgbLm5DxVAhU3exZCW
         H9QFpjXN89KBplIvIh4KSGmRCAGkYqlAigakStBrSekyIHWheUlp9l8iR5GGFjKsZwW3
         fm0Dx3XTMYfok6fMANv3T6yzz5oLn+Vq6k5/df85grbT+auVcq0OXE4pmPcDmJA8XaPM
         zaEw==
In-Reply-To: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

This looks like the patch.

https://lore.kernel.org/all/20220530152158.108619-1-duoming@zju.edu.cn/

On Mon, Dec 26, 2022 at 10:10 PM Chris Maness
<christopher.maness@gmail.com> wrote:
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



-- 
Thanks,
Chris Maness
