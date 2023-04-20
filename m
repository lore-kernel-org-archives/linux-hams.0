From: Chris Maness <christopher.maness@gmail.com>
Subject: 6PACK Crash
Date: Thu, 20 Apr 2023 13:14:11 -0700
Message-ID: <CANnsUME6LaYohriVo6zMq7SuEB1pbu2EsVVci2jow+gcp1aCog@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682021663; x=1684613663;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCd1mdYXEqgK93odkn99S1OR1zuJDxkEC1hS/WVPxHE=;
        b=UQlZxXZoILSFCQKQX4D+PK45UcnRs/RfSJIzxlak1vaJb70xzdncp3FGcwbH1rHYqs
         zlFyJYYNB5Z5Z/o1F5YFWNFAhGFUxVCO1YLnMmf2M+09b1NR2pdNk9BxiYR0SCMsWWQa
         Ghkqpmu7Hakf6IQSDBHsT+1958Q1nhttZhtBrS7/IyziTiiltrq9BMjHsL3WPZZ2Z+FV
         clq7ONiTv2AGbMu5sRdB1wDt43+SE4GDtBhp9OHbfmt9VHBZg1dPdJ663kk/49bOWLTN
         PC+aYlVPYASGBhrJPfqb5C7ExaWkO4cHGXKpYzSVYFI8BdFt37E4J2MldD0QlCrpVIsm
         YJGw==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I am playing with a 6pack EPROM in a TAPR TNC2 Clone, and I can easily
crash the latest stable kernel in Arch Linux:

This same HW configuration works fine under WindowsXP and The flexnet
kermel + 6PACK driver.

Linux positron 6.2.11-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 13 Apr 2023
16:59:24 +0000 x86_64 GNU/Linux

spattach /dev/ttyS0 vhf
where vhf is defined as:
vhf [tab] KQ6UP-2 [tab] 9600 [tab] 2 [tab] Info

I used:

call vhf KQ6UP-5 and after a little bit of playing around the machine
locked hard. I have no issues with this box other than messing with
AX.25 stuff.

73 de Chris KQ6UP


-- 
Thanks,
Chris Maness
