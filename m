From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Multicast AX.25?
Date: Sat, 08 Mar 2014 08:44:41 -0800
Message-ID: <531B48F9.7010002@trinnet.net>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Stuart,

Interesting idea though what is the plan to support "subscriptions" to 
this traffic?  Will all stations with your new patch just accept the 
traffic?  In the IP world, we have IGMP to support join/leaves and 
pragmatic general multicast (PGM) to support selective re-transmits for 
reliable transport.  Definitely some interesting stuff can be done with 
MC but it can be a challenge to operate in the real world!

Ps.  Any plans to submit your patch to the upstream repositories like:

     AX.25 repo: http://www.linux-ax25.org/wiki/CVS
     VE7FET's more current repo: http://code.google.com/p/linuxax25/

--David
KI6ZHD
