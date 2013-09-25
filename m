From: Waldek <sp2ong@wp.pl>
Subject: Re: Problem with flexd and Xnet Node
Date: Wed, 25 Sep 2013 10:00:03 +0200
Message-ID: <52429803c62845.80879804@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1380096003; bh=5q/YHr6dEdbALZ1/diYfkH2IlXw0lO/XMr7mTGxS4HA=;
          h=From:To:Cc:Subject;
          b=R8GBwLoWVsrOetQUxsyWqctzD/gl8JyDotBduMwYo+479snAs2YDtZAblNOMflHyF
           XBDHvVvYEqu1zEwXOyF4c7Ot8buWYEHTx9u1Yg8sqPrbjI0dl69G9FFYFv+jBxKoSR
           RgQ2Dv2UUz3i06N0kIlv8ksW5UtfBk7EsHsONlFM=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: marius <marius@yo2loj.ro>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi Marius


> > route sr1bsz polnet axudp d 'XNet Flexnet node'
> >
> 
> You mean
> route sr1dsz polnet axudp d 'XNet Flexnet node'
> (dsz instead of bsz...)

Yes it is my mistake in write in email but in uronode.routes is correct sr1dsz

> C axudp sr1dsz
> 
> If it works, check if it provides flexnet routes using the 'D' command

Yes this connection working with sr1dsz but not provide flexnet routes
sysop sr1dsz setup route flexte to my callsign SP2ONG-11

> This is how your flexd works, so any failure gere will lead to flexd not
> working.

but in my Destiantion lsit is only:
SR1DSZ  3-0      0


73 Waldek sp2ong


