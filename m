From: Jarmo <oh1mrr@nic.fi>
Subject: 6pack warning
Date: Wed, 5 Jan 2005 08:16:47 +0200
Message-ID: <200501050816.47950.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

If somebody is going to use kernel 2.6.10-bkX or -mm1,there is bug
in 6pack.
If you somehow loose power from tnc and power it up again,you don't
get 6pack resynced anymore.Have to restart ax's again.
Stable 2.6.10 and -ac patched fids tnc(s) ok after powerdown.

So,before it goes into next stable kernel,person who made patch
for -bk and -mm trees,please at least consider correct that bug,ok?

May source be with you..

Jarmo
-- 
Linux is the answer.
What was your question?
(Brian Lane)
