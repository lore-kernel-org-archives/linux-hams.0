From: "Wilson G. Hein" <vze2b869@verizon.net>
Subject: RE: Digital BASH Update
Date: Wed, 24 Apr 2002 17:48:52 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCBBKBAJDJIPKFIAFBKLGEFDEFAC.vze2b869@verizon.net>
References: <20020424204343.K1284@mea-ext.zmailer.org>
Reply-To: <wilson.hein@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020424204343.K1284@mea-ext.zmailer.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: Linux-Hams Mailing List <linux-hams@vger.kernel.org>

Well Matti,

My MUA is Outlook 2000, and this only started within the past few months.
It's only happening on copies of emails coming to me from the list. And I'm
sure it must be happening to others.

Here is the full header on the message missing the to and from fields.

Return-Path: <linux-hams-owner@vger.kernel.org>
Delivered-To: wghein@ptd.net
Received: (qmail 3144 invoked from network); 24 Apr 2002 17:45:29 -0000
Received: from smtpj.ha-net.ptd.net ([207.44.96.90]) (envelope-sender <>)
          by mailb.ptd.net (qmail-ldap-1.03) with QMQP
          for <>; 24 Apr 2002 17:45:29 -0000
Delivered-To: CLUSTERHOST smtpj.ha-net.ptd.net wghein@ptd.net
Received: (qmail 6548 invoked by uid 50005); 24 Apr 2002 17:44:49 -0000
Received: from linux-hams-owner@vger.kernel.org by smtpj.ha-net.ptd.net
	 by uid 50002 with qmail-scanner-1.10 (uvscan: v4.1.40/v4197. spamassassin.
Clear:0. Processed in 1.370442 secs); 24 Apr 2002 17:44:49 -0000
Received: from vger.kernel.org ([209.116.70.75]) (envelope-sender
<linux-hams-owner@vger.kernel.org>)
          by smtpj.ha-net.ptd.net (qmail-ldap-1.03) with SMTP
          for <wghein@ptd.net>; 24 Apr 2002 17:44:47 -0000
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id <S312449AbSDXRnu>; Wed, 24 Apr 2002 13:43:50 -0400
Received: (majordomo@vger.kernel.org) by vger.kernel.org
	id <S312453AbSDXRnt>; Wed, 24 Apr 2002 13:43:49 -0400
Received: from [195.163.186.27] ([195.163.186.27]:29572 "EHLO zmailer.org")
	by vger.kernel.org with ESMTP id <S312449AbSDXRns>;
	Wed, 24 Apr 2002 13:43:48 -0400
Received: (mea@mea-ext) by mail.zmailer.org id <S255363AbSDXRnn>;
	Wed, 24 Apr 2002 20:43:43 +0300
X-Mail-Format-Warning: Bad RFC822 header formatting in Date:	Wed, 24 Apr
2002 20:43:43 +0300
X-Mail-Format-Warning: Bad RFC822 header formatting in From:	Matti Aarnio
<matti.aarnio@zmailer.org>
X-Mail-Format-Warning: Bad RFC822 header formatting in To:	"Wilson G. Hein"
<wilson.hein@verizon.net>
X-Mail-Format-Warning: Bad RFC822 header formatting in Cc:	John Ackermann
N8UR <jra@febo.com>,
	Linux-Hams Mailing List <linux-hams@vger.kernel.org>
Subject: Re: Digital BASH Update
Message-ID: <20020424204343.K1284@mea-ext.zmailer.org>
References: <13787905.1019649070@WUSJA129861-8HP>
<NCBBKBAJDJIPKFIAFBKLCEFAEFAC.wilson.hein@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NCBBKBAJDJIPKFIAFBKLCEFAEFAC.wilson.hein@verizon.net>; from
wilson.hein@verizon.net on Wed, Apr 24, 2002 at 12:05:43PM -0400
X-Mail-Format-Warning: Bad RFC822 header formatting in Sender:
linux-hams-owner@vger.kernel.org
Precedence: bulk
X-Mail-Format-Warning: Bad RFC822 header formatting in X-Mailing-List:
linux-hams@vger.kernel.org
X-Spam-Status: No, hits=0.7 required=5.0
tests=IN_REP_TO,FROM_MISSING,DATE_MISSING,MISSING_HEADERS version=2.01

-----Original Message-----
From: Matti Aarnio [mailto:matti.aarnio@zmailer.org]
Sent: Wednesday, April 24, 2002 1:44 PM
To: Wilson G. Hein
Cc: John Ackermann N8UR; Linux-Hams Mailing List
Subject: Re: Digital BASH Update


On Wed, Apr 24, 2002 at 12:05:43PM -0400, Wilson G. Hein wrote:
> I think this explains it all.

    Yes, you have some seriously misbehaving incoming email verifier.
    What the Mulberry does after that (it is a MUA, not MTA..)
    that I don't know.

> X-Mail-Format-Warning: Bad RFC822 header formatting in Sender:
>   linux-hams-owner@vger.kernel.org

    This Sender: is quite correct according to RFC 2822.

> Precedence: bulk
> X-Mail-Format-Warning: Bad RFC822 header formatting in X-Mailing-List:
>   linux-hams@vger.kernel.org

    The X-* headers should NOT be veried, nor used for anything at all.
    They are everyones local stuff, and likely have separate meanings
    for each site's suite of softwares.

> X-Spam-Status: No, hits=0.7 required=5.0
>   tests=IN_REP_TO,FROM_MISSING,DATE_MISSING,MISSING_HEADERS version=2.01
>
> -----Original Message-----
> From: John Ackermann N8UR [mailto:jra@febo.com]
> Sent: Wednesday, April 24, 2002 11:51 AM
> To: wghein@ptd.net; Linux-Hams Mailing List
> Subject: RE: Digital BASH Update

/Matti Aarnio OH2MQK -- co-postmaster of vger.kernel.org

