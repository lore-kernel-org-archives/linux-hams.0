From: Chris Maness <christopher.maness@gmail.com>
Subject: Backport to LTR?
Date: Sat, 11 Mar 2023 12:48:54 -0800
Message-ID: <CANnsUMExojiA6ZNyH=_zjO44N4hR0ytqj-BWrRjO0L6Ox=MjsA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678567747;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2kGUq7Kdmy3YCIq2jBACr2A/la99uzNeOtVsLF2JIb8=;
        b=X0NFg2SgE8PPDcO+TK7qUadmlEKvdeK1c5ZhJ2IGmaPO64dbx7Xi2fyB+83NN746O9
         McuM6ThKG/VhTFrpSzOQmf6jnlXf5PnGvEC4dSXe35BdsdkLeQGXLW4+Lk07wRziS26Z
         sc3doWLdseHhkuyXsXI88PMgYFAeaqxoXe2hMq7D6jgCdmicP0ewXW1OGfuoYpIfAzJ7
         feIDOGjAe56UQjieUKf0L6rmXYj9+a+yFyetiqvg6BwNRD6yXpy+k9TfmMFlomfCpnPb
         eXRNQ4ZTB/9XtIv95Lh8p2jj7l6P8YoY9Ndcb4dRcCl3DmZahGZ3uO9aDW2yfx/04c6z
         iqjw==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

I am wondering what the process is to get maintainers to backport
AX.25 fixes to LTS kernels.  Any suggestions?  This is a diff I pulled
off the latest LTS kernel, so unfortunately it still has not been
committed.

diff linux-5.15.100/net/ax25/af_ax25.c linux-5.15.89/net/ax25/af_ax25.c
(I patched 5.15.89 by hand, and it has been working solid on both
x86_64 and also 64 bit Pi.

I am going to the latest release branch and see if runs my
Slackware-15 ok.  I will keep my stuff as a fallback.

64a65
>       spin_lock_bh(&ax25_list_lock);
66d66
<               spin_lock_bh(&ax25_list_lock);
68d67
<               spin_unlock_bh(&ax25_list_lock);
70a70
>       spin_unlock_bh(&ax25_list_lock);
83a84
>       ax25_dev->device_up = false;
93a95
>                               ax25_cb_del(s);
105a108
>                       ax25_cb_del(s);
998,1000c1001,1005
<                       release_sock(sk);
<                       ax25_disconnect(ax25, 0);
<                       lock_sock(sk);
---
>                       if (!sock_flag(ax25->sk, SOCK_DEAD)) {
>                               release_sock(sk);
>                               ax25_disconnect(ax25, 0);
>                               lock_sock(sk);
>                       }
1056,1060c1061,1067
<               del_timer_sync(&ax25->timer);
<               del_timer_sync(&ax25->t1timer);
<               del_timer_sync(&ax25->t2timer);
<               del_timer_sync(&ax25->t3timer);
<               del_timer_sync(&ax25->idletimer);
---
>               if (!ax25_dev->device_up) {
>                       del_timer_sync(&ax25->timer);
>                       del_timer_sync(&ax25->t1timer);
>                       del_timer_sync(&ax25->t2timer);
>                       del_timer_sync(&ax25->t3timer);
>                       del_timer_sync(&ax25->idletimer);
>               }



-- 
Thanks,
Chris Maness
