From: "Tom Vavra" <wb8zrl@avalon.net>
Subject: t1-timeout packet question
Date: Tue, 29 Nov 2005 04:18:40 -0000
Message-ID: <000701c5f49c$16737cb0$d84689d8@oem7paq6co5hph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams <linux-hams@vger.kernel.org>

This past weekend I saw some things that I cannot explain.  
I run a DXSpider packetcluster node on a 2.4.20 kernel 
(SuSe 8.2).  Below are two edited extracts from listen
during the CQWW contest.  The port is on a Kantronics
PK-9612 tnc frontended by mkiss.

The first is of unanswered polls to NR0X, which have about 
45 seconds between them.

2m: fm WB8ZRL to NR0X ctl RR0+ 15:40:34
2m: fm WB8ZRL to NR0X ctl RR0+ 15:41:21
2m: fm WB8ZRL to NR0X ctl RR0+ 15:42:32

2m: fm WB8ZRL to NR0X ctl RR0+ 15:55:08
2m: fm WB8ZRL to NR0X ctl RR0+ 15:55:56

2m: fm WB8ZRL to NR0X ctl RR0+ 15:57:05
2m: fm WB8ZRL to NR0X ctl RR0+ 15:57:53

The second extract is of polls to NY0V, some are answered and 
some are not.  But here the polls have only 1 to 2 seconds 
between them.

2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:13
2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:15
2m: fm NY0V to WB8ZRL ctl RR2- 15:42:16
2m: fm WB8ZRL to NY0V ctl I12^ pid=F0(Text) len 78 15:42:16
0000  DX de K3LR:      14034.0  DK3GI                                 
0040        1530Z...
2m: fm WB8ZRL to NY0V ctl I13+ pid=F0(Text) len 78 15:42:16
0000  DX de KT0R:      21050.3  TI5X                                  
0040        1530Z...
2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:17
2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:19
2m: fm NY0V to WB8ZRL ctl RR4- 15:42:19
2m: fm WB8ZRL to NY0V ctl I14^ pid=F0(Text) len 78 15:42:19
0000  DX de W3RJ:      28020.0  TI8CBT                                
0040        1533Z...
2m: fm WB8ZRL to NY0V ctl I15+ pid=F0(Text) len 78 15:42:19
0000  DX de W1AA:      14054.6  M8C                                   
0040        1531Z...
2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:20
2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:21
2m: fm NY0V to WB8ZRL ctl RR6- 15:42:23
2m: fm WB8ZRL to NY0V ctl I16^ pid=F0(Text) len 78 15:42:23
0000  DX de N4WBS:     14037.2  OE2S                                  
0040        1530Z...
2m: fm WB8ZRL to NY0V ctl I17+ pid=F0(Text) len 78 15:42:23
0000  DX de K3ZV:      14073.2  C6AWS                                 
0040        1531Z...
2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:24
2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:25
2m: fm WB8ZRL to NY0V ctl RR1+ 15:42:28

My t1-timeout for this port is set to 6 seconds.  Can someone 
help me understand why one user is polled every second or two
and another is polled with almost a minute between polls?

   tnx   Tom   WB8ZRL
