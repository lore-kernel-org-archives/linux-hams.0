From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: netrom
Date: Mon, 15 Apr 2002 19:25:57 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02041519255703.03682@unix.pa3gcu>
References: <Pine.LNX.4.21.0204151842060.365-100000@Consulate.UFP.CX>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0204151842060.365-100000@Consulate.UFP.CX>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Riley Williams <rhw@InfraDead.Org>, Walter R Fletcher <fletcher@uwyo.edu>
Cc: M Taylor <mctylr@privacy.nb.ca>, Shane Deering <vk3bvp@qsl.net>, Linux Ham Radio <linux-hams@vger.kernel.org>

On Monday 15 April 2002 17:55, Riley Williams wrote:

> Not if you use IC24 as your IP - they allocate 10.* addresses to your
> modem and the router at the other end, and their DHCP servers provide
> a routing line that routes ALL 10.* IP addresses across the modem link
> to the router you're dialled up to.

If that provider is using 10.*.*.* numbers across a network then AFAIK that 
is not in accordance with RFC 1918 which states;

  The Internet Assigned Numbers Authority (IANA) has reserved the
  following three blocks of the IP address space for private networks:
 
                10.0.0.0        -   10.255.255.255
                172.16.0.0      -   172.31.255.255
                192.168.0.0     -   192.168.255.255

Now i have little idea where or what this thread started about, however if 
one wants to use 10.0.0.1 for his private network then he/she has "every 
right" to do so, even IF an ISP uses it to do some or other smart tricks with 
period. I wonder if an ISP could even be reprimanded for using an RFC 1918 
address for financial gain, not that it is of concern to me, it is more  a 
question of "rules are rules"... After all what else are all RFC;s for period.

I have not read that RFC rule in full, however reading what i have says to me 
they are "private addresses period".

Anyway my commentry stops here, this is getting way off topic.

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

