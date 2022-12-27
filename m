From: Chris Maness <christopher.maness@gmail.com>
Subject: Patching the Raspberry Pi OS Kernel for AX.25?
Date: Mon, 26 Dec 2022 22:10:11 -0800
Message-ID: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dT50w44llys+/mkAc+IG8pekgIv3FZODTSCtmgN4+DA=;
        b=iaVU+QymokBTwsPYPMPSu3YAMs9054gAbeb4ic48laBCMDDwegeZnL7dHiia4puYTc
         DRUSSvmByT8m4GXIlXsY5B/kDgCQk/GFJsWGCeEb45ls6U6dAvmkS05DmSQ4LWEMrJ8s
         HwO3v3kRyA9rTRdJV45oYBmFyMC3FNQ+EEIQMJKcaxm6JwhSubuDR7jQbJ90Kdoyf9+D
         DUWmHJpfnPlKvpWubSFm4uf/JWvCqpvd4U3SVY+RrFO7Qqkf5v5WLfS01plsopZoWTgF
         qf0NHUPmrwkQadbi6Doei532FstnfM8cGdjR9o5FGE7IuFwqK6EdqESPxSzOru6vAMJt
         9kXg==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I would like to try to patch the current 5.15 kernel for the Pi to
bring it up to the ax.25 code that is in 5.19.  I believe in that
version some of the issues have been fixed, but the current kernel
version for the Pi is 5.15.  I have never patched the kernel source
before and I am not sure how to proceed.  I have built them before
many moons ago.

-KQ6UP

-- 
Thanks,
Chris Maness
