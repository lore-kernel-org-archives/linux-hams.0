From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: [aprssig] Experimental D-PRS -> APRS gateway at Aprx-2 software
 (fwd)
Date: Wed, 9 Jun 2010 10:52:15 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1006091052050.1796@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:user-agent:mime-version:content-type;
        bh=MY11eatmwQAt1+1FNFF1cZmsCSNZEgjLoU6GlxyxgaY=;
        b=gazbf4OHppgu70j2TvSgtCED08SRJG2aarhCWDpm+fs/FPMlaexYYKrNQHsvFjCERx
         XxP+kiMBAnHoztF3bWSyWovlquSdmrP0zCz0ed9EMPku0ewo7JXeXD67iQcQEUacsUZj
         YxDSAD98NX9DlN44KwSgQSn62if7gFS0srj2o=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


FYI.

---------- Forwarded message ----------
Date: Wed, 9 Jun 2010 15:16:23 +0300
From: Matti Aarnio <oh2mqk@sral.fi>
Reply-To: TAPR APRS Mailing List <aprssig@tapr.org>
To: TAPR APRS Mailing List <aprssig@tapr.org>
Subject: [aprssig] Experimental D-PRS -> APRS gateway at Aprx-2 software

Recently we developed at first a full bidirectional APRS iGate for
the Aprx series 2 software.

Now our OH3RNE test team has reported that also the DPRS-Rx-iGate
and DPRS-to-APRS RF-gate work.

I am soliciting beta-testers for this D-PRS code.
(And why not for primary APRS codes as well.)


At present this software is available only on serveral types of UNIX
and UNIX like platforms, which includes Apple OS/X, Linux, Solaris,
OpenWRT, uCLinux, and many others.

Some have ready made binaries, others need to use source code, and
compile.

Windows port does not exist so far, and its likely form will be "Service"
which means there will be no "user interface" at all.
But then there is no user interface on UNIX platforms for this software
either.  This is infrastructure software.


   http://ham.zmailer.org/oh2mqk/aprx/

So far the primary version number is 1.99, I need to get more
user feedback to bump it up the last 0.01.

73 de Matti, OH2MQK

_______________________________________________
aprssig mailing list
aprssig@tapr.org
https://www.tapr.org/cgi-bin/mailman/listinfo/aprssig
