From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Problems with bpq-interface
Date: Wed, 28 May 2003 13:15:02 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200305281315.02638.pa3gcu@zeelandnet.nl>
References: <3ED49335.6050903@linux.local>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3ED49335.6050903@linux.local>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Zagler <FlorianZagler@web.de>, linux-hams@vger.kernel.org

On Wednesday 28 May 2003 12:45, Florian Zagler wrote:
> Hi all,
>
> I have problems getting the bpq0 interface work.
> My computers are running Debian Woody (kiss and bpq) and Mandrake 9.1
> (bpq) and the problem is on both.
>
> I use the following command to bring it up:
>
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

Its been a while since i used bpq, but as far as i see it you need to use 
ifconfig as follows.

ifconfig bpq0 IP# hw ax25 DG1CAD-12 up

You also need to tell the interface via bpqparms which computer to listen for;

bpqparms -d mac_of_remote_machine;
bpqparms bpq0 -d 12:34:56:B9:xx

> I didn't find a solution in the AX25-HOWTO and the manpages.
>
> Is there a bug or do I use the wrong commands?

It all used to work fine for me, some commands may have changed some check the 
man pages for bpqparms.

> Regards,
> Florian
>

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/



