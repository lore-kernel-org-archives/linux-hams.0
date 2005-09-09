From: jarmo <oh1mrr@nic.fi>
Subject: Something about timers
Date: Fri, 9 Sep 2005 08:34:51 +0300
Message-ID: <200509090834.51941.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org

Hi

Just noticed, that if you compile kernel without looking,
Prosessor type and features -> Timer frequency, default is
250ms, you get quite suprising behaviour with your ax25 stuff,
especially 6pack :)
I'd say quite quick actions and in server case crashes :(. That
mean you have both fbb and cluster running in same computer
with 5 user ports.

So when taking forinstance kernel 2.6.13 in use, select timer as 1000ms,
then your normal ax25 timers should work.

Jarmo
-- 
Linux is the answer.
What was your question?
(Brian Lane)
