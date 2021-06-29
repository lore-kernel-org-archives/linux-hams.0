From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: Status of the stuck sockets bugs.
Date: Tue, 29 Jun 2021 19:32:07 +0200
Message-ID: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=tvLENEQlIdoAzwVjqF8KDJPrXGYjd92ajdYPOKXYkaE=;
        b=bVseTxONpcO9M/m5KZEnnrsAk9FZKJlxdz+wNBTfkoYc8GTMjKiiaJ2eUG9Kldbbtx
         7Dk4+MjBOZE+dYXQHUpW5yzIRhkQEluEBppvXIpkR5jzSykiQm/0RrIDLZbsEuzJdF7b
         DyJvf7/6OVoRYhJroGuWIBywoVB5CiJ4qfkdbT2nYqjS6fDnybGhEcH4qCA6jaLfHaA7
         8dD5sq3iqBK9UY/3QgSv3gERSfy7qnZ5zsF0eUCepfbBJHFmkdt8wlObQk9Y9jDrWJhM
         VndBa52ZKVJbETGP8qLLBoV9FdRx1z+svMeocXLxFHcAXM6bv29lzi75g2g9OUssiH74
         7EEA==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

Is there any news about the well known bug regarding sockets getting
stuck in LISTENING state?

Some years ago (already) Marius Petrescu YO2LOJ wrote a patch for the
ax25_subr.c file which seems to work very well and solves the issue.
But it's really annoying having to patch the kernel with each update
again.

What about that patch, I've heard it was rejected several times for
some reason? But can't find info regarding that.
What can be done - or who is able - to get rid of this bug and get it
fixed in the kernel?

Kind regards,
Dave van der Locht
