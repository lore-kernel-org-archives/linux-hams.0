From: Waldek <sp2ong@wp.pl>
Subject: RaspberryPI and soundmodem PTT
Date: Wed, 25 Sep 2013 09:23:17 +0200
Message-ID: <52428f657519e5.11288990@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1380093797; bh=eai30/7U3HNS8KSNXTpgraVug8BeXzQH9IDbvn/XPSE=;
          h=From:To:Subject;
          b=o/unP3bDBiasTcx6NfARg+Icq3YHiC+7jF8qdU6/r9GPlpLM5NiKQrQkLiwUQMLzI
           BzCPRC//HpygkdOH2evsS/JXysLv/WSDe1gw1Msa1ZkmTgbbTIxEiDRM46ovlCpF8x
           mU30TNNqPeT/I1l2lI8Z7pt/Jj4wEgThRqtMJ6Mc=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

 Hi

I have looking solution on RaspberryPI with soundmodem how to do PTT if I don't have in my radio VOX. When I have use soundmodem on my laptop with linux kernel 2.x ten years ago but driver soundmodem support PTT via RS-232 which working very well with my IC-W2A. But I don't know how to do this on RPI ?
 It is need modify soundmodem driver to possible setting the gpio pin for PTT ?? Maybe exist patch for this ? 
 
 73 Waldek sp2ong



