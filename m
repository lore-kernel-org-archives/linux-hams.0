From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: mkiss kernel driver problems
Date: Thu, 1 Oct 2009 14:58:09 +0300
Message-ID: <20091001115809.GC22922@mea-ext.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Mostly the mkiss line discipline module seems to work, but..

  mkiss: ax0: crc mode is auto.
  mkiss: ax0: Switchting to crc-smack

that typo (extra 't') is obvious, but I am wondering,
why it has growing error counter:

ax0       Link encap:AMPR AX.25  HWaddr OH2MQK-1
          UP BROADCAST RUNNING NOARP  MTU:512  Metric:1
          RX packets:9325 errors:152 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10
          RX bytes:622232 (607.6 KiB)  TX bytes:0 (0.0 b)

I am feeding this interface from my own software via pty interface,
where the client side is turned on to KISS line discipline.

My own software is not complaining about incomplete writes,
thus I wonder what the kernel is doing ?  Also my software
is sending on only AX.25 frames that it considers to be valid.

Does anybody remember how the  mkiss.c  is supposed to work?

  73 de Matti, OH2MQK
