From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Problems with bpq-interface
Date: Wed, 28 May 2003 13:17:09 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030528111709.GA5056@osterried.de>
References: <3ED49335.6050903@linux.local>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3ED49335.6050903@linux.local>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Zagler <FlorianZagler@web.de>
Cc: linux-hams@vger.kernel.org

> ifconfig bpq0 hw ax25 DG1CAD-12 up
> 
> In the /etc/axports file I have the following entries:
> 
> kiss    DG1CAD-10       19200   255     7       KISS TNC
> ether   DG1CAD-12       100000  255     7       BPQ/ethernet
> 
> But I get the following message everytime I try to access this interface:
> 
> ----    snip    ----
> gateway:~# axparms -route add ether dg1cad-12
> axconfig: port ether not active
> axparms: invalid port name - ether
> gateway:~#
> ----    snip    ----

bpq needs an IP address to run.
this should be enough:
ifconfig bpq0 44.130.x.y up
                     ^(your ampr IP. because it's internal, i suggest 44.128.0.2) 
axparms -setcall bpq0 DG1CAD-12

"ether" in axports: bpq0 is referenced as "bpq0". afaik, nameif (interface
naming) on bpqether interfaces is -unfortunately- not supported.

you should change it to
kiss    DG1CAD-10       19200   255     7       KISS TNC
bpq0   DG1CAD-12       100000  255     7       BPQ/ethernet

73,
	- thomas  dl9sau

