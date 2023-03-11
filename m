From: Chris Maness <christopher.maness@gmail.com>
Subject: One Slipped By
Date: Sat, 11 Mar 2023 12:53:34 -0800
Message-ID: <CANnsUMG_aubfxQ4+dmVovrdri46c58ZZ5ky6TseZ4QCKRnOf2Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678568026;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jYqarH6yRmH0LuJ3MMvmnq1A4xlgUvvOnTFpPsJ8tFg=;
        b=pY34aob2YtDbEv3woQG7QVVPoUyEp34GIzMrN2KdA1xmscJPUpvVlOw0LkjFWfZC4p
         paoL+2q14a4V4Df9HW2xG4Swd8b1MKWeYUp78L86jx+TqbcGnxZLrNkmbzTmGub9x46T
         W/tSRJrL6e5VsuvxPoHIfNfd++Ulyvhxfw2e1FfUmsz54fFdjeI3Evv64P7JaSCDqBhj
         YF1O9uLFkkUqlzAEwoOvS/+54B6eDOlOKNCOHXPskG6KfdGDw9YeMiR2kA//I08DSyHg
         tMkgP99FONY3rAgdqGKo1Q3jjW/PpI7GAaNxDRpO25z0EE0JhCpBNIfG175YZcbvJd4u
         YFdw==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Looks like I missed a patch compared to my hand patched kernel, I see:


diff linux-6.2.5/net/ax25/af_ax25.c linux-5.15.89/net/ax25/af_ax25.c
105,106c105
<                               netdev_put(ax25_dev->dev,
<                                          &ax25_dev->dev_tracker);
---
>                               dev_put(ax25_dev->dev);
225c224
< ax25_cb *ax25_find_cb(const ax25_address *src_addr, ax25_address *dest_addr,
---
> ax25_cb *ax25_find_cb(ax25_address *src_addr, ax25_address *dest_addr,
726c725
<       valptr = &val;
---
>       valptr = (void *) &val;
781c780
<                       strscpy(devname, ax25_dev->dev->name, sizeof(devname));
---
>                       strlcpy(devname, ax25_dev->dev->name, sizeof(devname));
788c787
<               valptr = devname;
---
>               valptr = (void *) devname;
1069c1068
<               netdev_put(ax25_dev->dev, &ax25->dev_tracker);
---
>               dev_put(ax25_dev->dev);
1150c1149
<               netdev_hold(ax25_dev->dev, &ax25->dev_tracker, GFP_ATOMIC);
---
>               dev_hold(ax25_dev->dev);
-- 
Thanks,
Chris Maness
