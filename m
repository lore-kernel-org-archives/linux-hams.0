Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC59242D98
	for <linux-hams@vger.kernel.org>; Thu, 26 Feb 2026 12:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772110717; cv=none; b=CCf5dOyy5hYahOLNR7iZTxQTavZ3OY/bQa2M3XLaHxRbBGPk1QmFEcMSiGQ3Nz2Gl5uEWsd68Im8XeCN7Y/xqt5wfs5gngn0I00Pn2b/tBj/sZyXbGmuyT0Fxz4B4j0hIyhytTudGirImDETZkYF6rkFJwXUyha25HUbxejF+mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772110717; c=relaxed/simple;
	bh=jgTMHcWDHylG0I0dXdBiZGDrftWEX9QlvkG1P7mnCho=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ecl8GOhOSt46nZsVxj+O2uwv0hfUU6w5kn0LX5M5cetl4wA3VmBnb4F8LBOuNTLLbnPxduFJKZ0PIV29jIX5oSyp0+am4WI78XBy3Xr0XKHo6LJVq3JE2ioFebLNWsP7dQL7JpK7CV+1V52fHcNU1TSxji/trNTHcW4YcJ2QRD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679a409a175so17673919eaf.1
        for <linux-hams@vger.kernel.org>; Thu, 26 Feb 2026 04:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772110715; x=1772715515;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8k5Nu+4WdoFwZvOfUmhYahsobY/Ezi5a3CfLGRDfYM=;
        b=YIJu9aTLxAJXEOrcqVvXh54311aVPwbgqS8BQO1HZQOvA1N6Mo6SUdPaqmqB6RrQNZ
         EsHHkIDjLPFBEVDHgkpGYr2bx+PDOFIHjlqsVlaNvF021c2jEt2+SIFuPEA2tPHUFCto
         YendDPvex60/ELLTzAaWmlgwRjvFBb2ZEVJN6+UdVvqEc572U1/Z3r/d2b2SRiryd9Fi
         EYBWoFMIMmZjFUJU9vBgPvryYnTZj5hELIzE6nyxBvzgcUiqOZYS7ID9aRhOclT0iva5
         X316O5/EwHDYcRj+aLsvvcE8eCPByX8cTfNE8m6X+HnkqlDTvYMHlA4jq6rV6MtNA3r1
         elQg==
X-Gm-Message-State: AOJu0Yye6OkZQWqWV6R8gPTrN9PHWbxtskwLgLdud07MTEvoOyknYyA+
	NfEkLWPp9O1xLLx85/ZN2/czCmC3RPi+Sv0zq7RPRsFrcbQElc8WyZK0AI7TzqZQZUpDA1AfF/6
	ts8w43xrSo8BOoTFPCbMPzWGKUeMLY+GzRWDHk1u22B7khrdBeLysBEvMhj4=
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:999:b0:679:f08b:5382 with SMTP id
 006d021491bc7-679f08b5ebemr2171559eaf.11.1772110715212; Thu, 26 Feb 2026
 04:58:35 -0800 (PST)
Date: Thu, 26 Feb 2026 04:58:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69a0437b.a00a0220.21906d.00e6.GAE@google.com>
Subject: [syzbot] Monthly hams report (Feb 2026)
From: syzbot <syzbot+liste72a2905ed88c1b0dc99@syzkaller.appspotmail.com>
To: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hams maintainers/developers,

This is a 31-day syzbot report for the hams subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hams

During the period, 2 new issues were detected and 0 were fixed.
In total, 16 issues are still open and 46 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  13802   Yes   possible deadlock in nr_rt_device_down (3)
                   https://syzkaller.appspot.com/bug?extid=ccdfb85a561b973219c7
<2>  6378    Yes   possible deadlock in nr_rt_ioctl (2)
                   https://syzkaller.appspot.com/bug?extid=14afda08dc3484d5db82
<3>  2258    Yes   WARNING: ODEBUG bug in handle_softirqs
                   https://syzkaller.appspot.com/bug?extid=60db000b8468baeddbb1
<4>  1878    Yes   general protection fault in rose_transmit_link (4)
                   https://syzkaller.appspot.com/bug?extid=d00f90e0af54102fb271
<5>  1005    Yes   possible deadlock in nr_remove_neigh (2)
                   https://syzkaller.appspot.com/bug?extid=8863ad36d31449b4dc17
<6>  162     Yes   possible deadlock in nr_del_node (2)
                   https://syzkaller.appspot.com/bug?extid=6eb7834837cf6a8db75b
<7>  24      Yes   WARNING: refcount bug in ax25_setsockopt
                   https://syzkaller.appspot.com/bug?extid=0ee4da32f91ae2a3f015
<8>  23      Yes   KASAN: slab-use-after-free Read in nr_rt_ioctl
                   https://syzkaller.appspot.com/bug?extid=df52f4216bf7b4d768e7
<9>  10      Yes   KASAN: slab-use-after-free Read in ax25_find_cb
                   https://syzkaller.appspot.com/bug?extid=caa052a0958a9146870d
<10> 6       No    KASAN: slab-use-after-free Read in rose_t0timer_expiry
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
