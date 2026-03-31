Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D163D891B
	for <linux-hams@vger.kernel.org>; Tue, 31 Mar 2026 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944402; cv=none; b=aj5PT0dntq6Xja+tndzprzXr8bb+bhWhzE2tHfpttbuA4d3ibUGjwE1UggTLCNj+ic1vuxyhgSQNFS7ufVCpjB+BsPwGKSpAj8cUaRWzxp34TfYMdS0vz7dFxNHtIPcOrY3aU4eNVbPXgjDxBZ4M8aL4PBYP2d5PR8xVjUGEqn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944402; c=relaxed/simple;
	bh=ZEOfx2P2tDjUoMAmpGpl9uqKVP/t0uKbYj/II9oLpto=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Nf+/vznZEONYo4of5wlEDP/lC839qOphXCtBGaKFu5Qh52gVRd+mxDL/w8/pjYtWpESt2+JeL1q3chz68xkTkBhGFupgEDJaQ74Be7jNCOeC8kUKloxNrJ4Cfdznc+EVFKbRlC2at8mGeftCvJqEddQuqgRZnL7jN+Ot18b49b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67e43c3c741so29449eaf.2
        for <linux-hams@vger.kernel.org>; Tue, 31 Mar 2026 01:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944392; x=1775549192;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFnKf8MiHQguXzk0RvM50fspz8lhbT4zdhO0NczJ0+4=;
        b=PBBhiFe9c8J80fxtNpZuViasJBTiePY12XCqlku6Cl5lwguaaWYEFtom50ABEU4yeA
         OkZyml3LKz5Y/sOGk4LOn3u2mdks1+tqgau8SpGDgU//JTirzZ4PpcBZirQmp58qMcv7
         Eg9dCnRZ4tMZ8U4Vqu0caFHmO+7pz+5SmzfqIKp8QnXTs9VWz4bNXmmWE9W571IZ+94i
         NTzk4/c1VOInLj4Yn0RqZM2/93+BNhatg8oA0A5mpE8DGkmJv7PJKbd9+95Rc7ShNtQD
         uJyejAQSGk2/OUbGwB/oOOlEu9Y1oknBu05zbSY7qQYZn1m7G0EWa8yaiHScb+hkyUiC
         5cIQ==
X-Gm-Message-State: AOJu0Yy5vKl6ZGbJgK2Lx/rqm9tbAaCiJshLNJCJ9GGgAHG/gE5zcvar
	iGEVCM5g99bofeienKcRo2uHBe8mh8qr288VICopuykU76hfkeQB1WddllByDwzi2Kf7zN/zD7g
	EvyXV0ygNGUi/jP9/1TWuDg74PTpfkhDn8C6lEXhDNeXL1xIR2tMdbb7/eF8=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2290:b0:67e:212:8254 with SMTP id
 006d021491bc7-67e1870131amr7705094eaf.46.1774944392084; Tue, 31 Mar 2026
 01:06:32 -0700 (PDT)
Date: Tue, 31 Mar 2026 01:06:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69cb8088.a70a0220.128fd0.0048.GAE@google.com>
Subject: [syzbot] Monthly hams report (Mar 2026)
From: syzbot <syzbot+list434e3950c21d666d1105@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 1 new issues were detected and 1 were fixed.
In total, 16 issues are still open and 47 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  15241   Yes   possible deadlock in nr_rt_device_down (3)
                   https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2>  7582    Yes   possible deadlock in nr_rt_ioctl (2)
                   https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
<3>  3507    Yes   WARNING: ODEBUG bug in handle_softirqs
                   https://syzkaller.appspot.com/bug?extid=60db000b8468baeddbb1
<4>  1053    Yes   possible deadlock in nr_remove_neigh (2)
                   https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<5>  672     Yes   WARNING: ODEBUG bug in __run_timers (3)
                   https://syzkaller.appspot.com/bug?extid=7287222a6d88bdb559a7
<6>  169     Yes   possible deadlock in nr_del_node (2)
                   https://syzkaller.appspot.com/bug?extid=6eb7834837cf6a8db75b
<7>  25      Yes   WARNING: refcount bug in ax25_setsockopt
                   https://syzkaller.appspot.com/bug?extid=0ee4da32f91ae2a3f015
<8>  24      Yes   KASAN: slab-use-after-free Read in nr_rt_ioctl
                   https://syzkaller.appspot.com/bug?extid=df52f4216bf7b4d768e7
<9>  16      No    KASAN: slab-use-after-free Read in rose_t0timer_expiry
                   https://syzkaller.appspot.com/bug?extid=44cccec2c6a4501f6a45
<10> 12      Yes   KASAN: slab-use-after-free Read in ax25_find_cb
                   https://syzkaller.appspot.com/bug?extid=caa052a0958a9146870d

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
