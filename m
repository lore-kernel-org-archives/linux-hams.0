From: Wilbert Knol <zl2bsj@zl2tze.myip.org>
Subject: Re: FETCHMAIL over AX25?
Date: Fri, 3 May 2002 00:39:51 +1200 (NZST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0205030022550.8514-100000@zl2bsj.ampr.org>
References: <3CCFC65F.13679.2E7BEDD9@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3CCFC65F.13679.2E7BEDD9@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>


Well, it's working now. I cannibalised the ax25_call.c code, which is now 
being used as the FETCHMAIL plugin. It sets up the AX25 session to the 
XROUTER node, and, from there, telnets into the POP3 server.

Result: better through-put (40 bytes more pay-load in each AX25 packet), 
no fragmentation, no hassles with TCP/IP timers defeating the AX25 ones. And
free E-mail.

Wilbert, ZL2BSJ


