From: Michael Willems <mvw@mvw.net>
Subject: And another question
Date: Thu, 12 Dec 2002 13:21:57 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212121315220.27325-100000@njord.mvw.net>
References: <1039714569.13779.4.camel@edith>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1039714569.13779.4.camel@edith>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams mailing list <linux-hams@vger.kernel.org>

Good discussion about encryption, please keep it going :)

Meanwhile another question, and I do apologise for all the traffic.

Every time I ping another node it fails the first time, then works the 
2nd time.

E.g. from va3mvw.ampr.org I ping va3oak.ampr.org. Both are on my local 
radio frequency and I have direct routes from one to the other and 
vice-versa.

The first time, instead of a ping (ICMP echo request), my node send a 
packet "from VA3MVW to QST". That results in no replies, so in the shell I 
see "no route to host".

If I ping again immediately, it DOES send the echo request, and gets back 
an echo ack from the other side, and all is OK< the ping works.

What beginner's mistake am I making? DNS sounds likely but no, I am 
pinging IP's, not names. So what else am I overlooking?

Thanks for your indulgence again, and thanks for any help!

Michael VA3MVW



