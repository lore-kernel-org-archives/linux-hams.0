From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: shared IP
Date: Tue, 10 Dec 2002 21:21:50 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02121021215000.00388@unix.pa3gcu>
References: <20021210220622.5b72434c.eb3czs@qsl.net>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021210220622.5b72434c.eb3czs@qsl.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: EB3CZS Xavier Crehueras <eb3czs@qsl.net>, linux-hams@vger.kernel.org

On Tuesday 10 December 2002 21:06, EB3CZS Xavier Crehueras wrote:
> I read in the AX25-HOWTO that it is possible to have the same IP address in
> all the radio ports but routing must be carefully configured. I have a
> machine with 4 radio ports sharing an IP address. Has anyone tried
> something like this? Can anyone give me some advice to configure routing?
>
> Thank you

I never have used more than one IP on my machine, all interfaces ececpt one 
have my 44.ampr.org address, one nic gets assigned via dhcp.

Examples for routing, that is not a wise thing to do without knowing what you 
want, however lets say you have 2 different subnets on 2 different interfaces.

ax0 = 44.111.123.0
ax1 = 44.111.321.0

route add -net 44.111.123.0 netmask 255.255.255.0 ax0
route add -net 44.111.321.0 netmask 255.255.255.0 ax1

Take a look at my web site, there are some example there i am sure could help.

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

