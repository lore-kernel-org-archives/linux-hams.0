From: "Tomohiro Nishikawa" <jn3aou@jarl.com>
Subject: Wonder protocol
Date: Tue, 25 Feb 2003 15:40:01 +0900
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <006d01c2dc98$b91efa30$0401a8c0@SOTECG4170AV>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello all,
I found some wonder working on Linux2.4.20+libax25-0.0.10 and ax25-tool-0.0.9.

ax3: fm JN3AOU to JK3TAJ ctl I41^ pid=F0(Text) len 240 14:43:50
0000  .Some datas..............................................
0040  .........................................................
ax3: fm JN3AOU to JK3TAJ ctl I42+ pid=F0(Text) len 240 14:43:50
0000..Some datas..............................................
0040 .........................................................
ax3: fm JK3TAJ to JN3AOU ctl RR2v 14:43:55
ax3: fm JN3AOU to JK3TAJ ctl I43+ pid=F0(Text) len 240 14:43:55
0000 ..........................................................
0040 ..........................................................
ax3: fm JK3TAJ to JN3AOU ctl REJ2- 14:43:58

In AX.25 protocol,Frame(I43+) should not be sent after "RR2v" because
JK3TAJ does not reply for "I42+" which have POLE(Marked Plus+).

In this case on the other TNC,
it remembers that frames until "I41" are sent sucessful and
doesn't reply it.(sent RR4+ when t1_timeout of I42 is over.)

Is this a common action?
I am afraid that it makes "throughput" slow.

I'm not programmer and sorry to write without skill.
(I'm a student of school.)

Best Regards,
Tomohiro Nishikawa JN3AOU
Sysop of JN3AOU-0(XFBB) and JN3AOU-9(DXSpider).
