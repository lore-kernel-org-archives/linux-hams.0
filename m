From: Phil <phil@spiderweb.com.au>
Subject: soundmodem and kisspkt.c question
Date: Mon, 13 Jan 2003 11:30:17 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200301131130.17451.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello All,

The following errors did not occur in version .5 and I can't immediately see 
why the errors now occur in version .7.

Where should cp, hwaddr and sax25 be declared?

kisspkt.c: In function `p3dreceive':
kisspkt.c:590: warning: unused variable `i'
kisspkt.c: At top level:
kisspkt.c:778: parse error before '*' token
kisspkt.c: In function `parsehw':
kisspkt.c:783: `cp' undeclared (first use in this function)
kisspkt.c:783: (Each undeclared identifier is reported only once
kisspkt.c:783: for each function it appears in.)
kisspkt.c:785: `hwaddr' undeclared (first use in this function)
kisspkt.c: In function `pktinitmkiss':
kisspkt.c:824: storage size of `sax25' isn't known
kisspkt.c:824: warning: unused variable `sax25'

-- 
Regards,
Phil
phil@spiderweb.com.au


