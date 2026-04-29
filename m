Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B133D40DFA4
	for <linux-hams@vger.kernel.org>; Wed, 29 Apr 2026 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494759; cv=none; b=OUj0G8i+jypNsAgPC/CxOb0IkYvznw5X/xHZNtz+LfvK0/ZDKLhYZMjeoKzmT8vNiJz8BHy2lEyPCMWkXMkWC9qUP/DNgGBjnOsXHtUWqkvXlm/we1pjEBX54vUyUDCgEIW3RGuoG1pIsfwnz+HhaGN91dcEMep8Hyyio8lp0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494759; c=relaxed/simple;
	bh=T7uCuNOAogKBgl0xkoImLPWCwsELhH6WDqd5AWGGc8g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dTT8iRxmVHf5uCq9Sx15c+8Jud55jzxsbu5iXnt93+oAVi42XCeNBx42WsXYTYX319qFrcQt5dAFlweg1sE7U0+Cc0fDlMUSiUTe24F4y/vCJXUeW5mLIwTlKHuUvGSlj1jjTH5AV+AHBs+GngH0wgRMpq8iC2pqj6V6brd7ec8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-42fb0f12b10so352016fac.2
        for <linux-hams@vger.kernel.org>; Wed, 29 Apr 2026 13:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777494757; x=1778099557;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFLXSf0MhhT3Nv6MnzhC1U2ntLwmkSQrplCJ27OaT98=;
        b=jeGCxl9HouHbkh0Z1iOAnPvcwqJbMaSzb+o0Pv4zGew35hM1lHb0RWoYbguxATtox9
         uGbB2K0h9vpVcRYczw4LkD8UMu3nsHr+N0VswvOw6J8vQEnCyqP4fMIgDfT4Bj2iBpAu
         nHksLmyjeN102uKPrzOoQrqnkWMRZZ5xwrjPMWbTwrC+KzcYIcURQokE5hRj7VPCOZbu
         YHD6lGsXEde95scd7v7re3QSVoxjjG8eiUgS6ArWJeNoGZCggcY2LYn1EakzyeBA43JC
         1Mp4GtyY/JD7pSojcEtXo6ZehiwJ0SrwWyJactr394jyNhR88TTV7YYocfhUZdamm1+I
         bNSw==
X-Gm-Message-State: AOJu0YzCgVLKknON7AxEz4gUO/q2WAvI6jifmeyVwGN+ONlc3yNQZNq5
	jv6lAC3lo6bU/QXxrV9nJRYuQEmGPJiE5DbHx8EmzQbbJ9342WoVBP+BxsUf7D+g+OV17D37bJb
	0b98bLNkDRnCFwb/scu/6pH5wCrCGj/g+l9w912M35n40zaGrPsQ4zvQPPLM=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:134b:b0:696:7697:6469 with SMTP id
 006d021491bc7-6967a510533mr103473eaf.17.1777494756761; Wed, 29 Apr 2026
 13:32:36 -0700 (PDT)
Date: Wed, 29 Apr 2026 13:32:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69f26ae4.170a0220.3c4978.0007.GAE@google.com>
Subject: [syzbot] Monthly hams report (Apr 2026)
From: syzbot <syzbot+listb0e725a1df57c9e37f56@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 3 new issues were detected and 1 were fixed.
In total, 20 issues are still open and 48 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  16483   Yes   possible deadlock in nr_rt_device_down (3)
                   https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2>  8461    Yes   possible deadlock in nr_rt_ioctl (2)
                   https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
<3>  4371    Yes   WARNING: ODEBUG bug in handle_softirqs
                   https://syzkaller.appspot.com/bug?extid=60db000b8468baeddbb1
<4>  1122    Yes   possible deadlock in nr_remove_neigh (2)
                   https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<5>  803     Yes   WARNING: ODEBUG bug in __run_timers (3)
                   https://syzkaller.appspot.com/bug?extid=7287222a6d88bdb559a7
<6>  188     Yes   possible deadlock in nr_del_node (2)
                   https://syzkaller.appspot.com/bug?extid=6eb7834837cf6a8db75b
<7>  32      Yes   WARNING: refcount bug in ax25_setsockopt
                   https://syzkaller.appspot.com/bug?extid=0ee4da32f91ae2a3f015
<8>  26      No    KASAN: slab-use-after-free Write in rose_send_frame
                   https://syzkaller.appspot.com/bug?extid=9cc08d5dcb1fc8feee76
<9>  24      Yes   KASAN: slab-use-after-free Read in nr_rt_ioctl
                   https://syzkaller.appspot.com/bug?extid=df52f4216bf7b4d768e7
<10> 23      No    KASAN: slab-use-after-free Read in rose_t0timer_expiry
                   https://syzkaller.appspot.com/bug?extid=44cccec2c6a4501f6a45

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
