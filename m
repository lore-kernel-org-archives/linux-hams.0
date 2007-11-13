From: "Bill Vodall WA7NWP" <wa7nwp@gmail.com>
Subject: KISS packets and NetCat
Date: Tue, 13 Nov 2007 18:50:05 +0000
Message-ID: <5abd436b0711131050o1563c9fh468cb1c1c1660c84@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=dR4c8t8N6bY+xJUvj+jXMhL+qch7bge3XRFSRGh1GFQ=;
        b=Gc30TvG+Y9cRGUI8L5QZKNpAwJJfuWzhXDi/Y+God+0XGHICCNqau+sS10WHNvhcPSd9zveDkbM09h8dZzcNMUsqkOSSuDg3UeQOtk+6MWFo1oZZZV8ZNbmYwRQwfZTY8UZvCLh0z/j7JMBLtBueWlCabti8el1MrR9p2U/zR7U=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Has anybody tried creating a KISS serial stream with NET2KISS and then
exporting that to multiple other systems with NETCAT?

Maybe even doing something similar without AX25 using KISSNET2 to
create multiple serial ports and hooking one of them to NETCAT..

Thanks,
Bill - WA7NWP
