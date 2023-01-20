From: Chris Maness <christopher.maness@gmail.com>
Subject: AX.25 Patches and the 5.15.89 Kernel tree?
Date: Thu, 19 Jan 2023 18:30:58 -0800
Message-ID: <CANnsUMFRCJ1rszt-67GywV4_pU0yyW56dis1iSnSO9f23-oa=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tZhOuBL8+I5U6G4zCY0HTFekmLsX7Bp0I1srcnWnQS0=;
        b=OA8F4lIlO9Iz4dcdK8jlcLpBT4tQ6L7EB6Obj/pTBHeW4uqXb8vHOP62IsAEzI1FTT
         DLP3KI3cFaJw6kIFsJV2bJpd1aqlgtVUx/hZP8QVoanyKqjxgs3R5zaYQ0ipy4BL7gKi
         gvJGlAP/Td+g4ImY1WnyeS4nAO0/AGqrZIY5blzFTdwyNIpsKI0gmg6MaSwxRC9ph8ps
         U1GHahhIeEvST4UZvRHhQR4FBTFAKzB/bk3rILjQ/CDj6napbaWj8a3YRnuAvNnBCCIJ
         kj2Sy/mScDce6DPItrXy69n5YtAHJiVLgTvUI+AOTDSV85GQrWqrj9PSatYIEgU29pq6
         gloQ==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>, committer Paolo Abeni <pabeni@redhat.com>, linux-hams@vger.kernel.org

Thanks for fixing the AX.25 issues, I was able to get them backported
to the Raspberry Pi source tree for the current version.  However, for
desktop Linux distros, they are generally running some iteration of
5.15 as well.  I pulled the latest from kernel.org and compared it to
my pi code that has the patches committed, and I see that the latest
(5.15.89) does not have the patches committed.  Is there any way you
guys could commit to that tree to?  I have not attempted a checkout
for kernel code before and feel a tad intimidated to do so.

VY 73 de Chris KQ6UP

-- 
Thanks,
Chris Maness
