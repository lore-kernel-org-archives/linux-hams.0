From: arnau@gbt.tfo.upm.es
Subject: Frame sequencing problems with soundmodem (0.5 and 0.6) and linux 2.4.18
Date: Tue, 23 Jul 2002 15:07:04 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020723130703.GA5983@dit.upm.es>
Reply-To: Joaquin Seoane <joaquin@dit.upm.es>, arnau@gbt.tfo.upm.es
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: joaquin@dit.upm.es, arnau@gbt.tfo.upm.es

We have checked soundmodem versions 0.5 and 0.6 with kernel 2.4.18 using different modems
and we had always the same kind of problems. The sender seems to repeat frames without
any criterion.

We had not any of these problems with kernel 2.2.19.  
This is a listen trace with window size 4:

sb: fm CALL1 to CALL2B ctl SABM+ 14:05:24
sb: fm CALL2B to CALL1 ctl UA- 14:05:24
sb: fm CALL1 to CALL2B ctl I0-0^ pid=F0(Text) len 256 14:05:29
sb: fm CALL1 to CALL2B ctl I0-1^ pid=F0(Text) len 256 14:05:29
sb: fm CALL1 to CALL2B ctl I0-0^ pid=F0(Text) len 256 14:05:31
sb: fm CALL1 to CALL2B ctl I0-2^ pid=F0(Text) len 256 14:05:31
sb: fm CALL1 to CALL2B ctl I0-3+ pid=F0(Text) len 256 14:05:31
sb: fm CALL1 to CALL2B ctl I0-1^ pid=F0(Text) len 256 14:05:33
sb: fm CALL1 to CALL2B ctl I0-2^ pid=F0(Text) len 256 14:05:35
sb: fm CALL1 to CALL2B ctl I0-3+ pid=F0(Text) len 256 14:05:37
sb: fm CALL2B to CALL1 ctl RR1v 14:05:38
sb: fm CALL1 to CALL2B ctl I0-4+ pid=F0(Text) len 256 14:05:38
sb: fm CALL2B to CALL1 ctl RR2v 14:05:38
sb: fm CALL1 to CALL2B ctl I0-5+ pid=F0(Text) len 256 14:05:38
sb: fm CALL2B to CALL1 ctl RR3v 14:05:38
sb: fm CALL2B to CALL1 ctl RR4- 14:05:38
sb: fm CALL1 to CALL2B ctl I0-6+ pid=F0(Text) len 256 14:05:39
sb: fm CALL1 to CALL2B ctl I0-7+ pid=F0(Text) len 256 14:05:39
sb: fm CALL1 to CALL2B ctl I0-4+ pid=F0(Text) len 256 14:05:41
sb: fm CALL1 to CALL2B ctl I0-5+ pid=F0(Text) len 256 14:05:43
sb: fm CALL1 to CALL2B ctl I0-6+ pid=F0(Text) len 256 14:05:45
sb: fm CALL1 to CALL2B ctl I0-7+ pid=F0(Text) len 256 14:05:46
sb: fm CALL2B to CALL1 ctl RR5- 14:05:47
....

Any ideas?


