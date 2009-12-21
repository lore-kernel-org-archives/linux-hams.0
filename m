From: Alexander Strakh <strakh@ispras.ru>
Subject: BUG null dereference in driver ./drivers/net/hamradio/yam.c
Date: Mon, 21 Dec 2009 20:13:01 +0000
Message-ID: <200912212013.01887.strakh@ispras.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Frederic Rible <frible@teaser.fr>, Thomas Sailer <sailer@ife.ee.ethz.ch>, Jean-Paul Roubelat <jpr@f6fbb.org>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

        KERNEL_VERSION: 2.6.32
        SUBJECT: null derefernce in function __init yam_init_driver
        SUBSCRIBE:
        In driver drivers/net/hamradio/yam.c in function __init 
yam_init_driver:

1. If in line 1153 dev = NULL then we goto line 1154
2. In line 1155 we have null dereference of "dev->name"

1153                 if (!dev) {
1154                         printk(KERN_ERR "yam: cannot allocate net device 
%s\n",
1155                                dev->name);
1156                         err = -ENOMEM;
1157                         goto error;
1158                 }

Found by Linux Device Drivers Verification Project (Svace Detector)
