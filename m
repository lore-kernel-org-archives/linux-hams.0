From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: IP over Packet Ham Radio
Date: Fri, 11 Oct 2002 21:20:07 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0210112114030.7136-100000@zl2bsj.ampr.org>
References: <a05111b01b9cb55f871e3@[10.10.1.6]>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <a05111b01b9cb55f871e3@[10.10.1.6]>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Reynolds <creyn@wi.rr.com>
Cc: linux-hams@vger.kernel.org

On Thu, 10 Oct 2002, Christian Reynolds wrote:

> Question:  The HOWTO suggests that I should be able to ping along the 
> radio network.  I am using IP numbers on the air of 192.168.100.30 
> and 192.168.100.40.   The ping requests are transmitted, and the 
> other computer does not respond.

I am pretty sure 192.168.xxx.xxx is deemed to be a private network, which
gets ignored on other (sub)-nets.

You should apply for a 44-net IP and try that. Also, you should probably 
be on the same sub-net as your direct neighbours for the ping to work.

Use ping -c5 -i10 to avoid flooding the network ('man ping')

Hope this helps...

Wilbert, ZL2BSJ


