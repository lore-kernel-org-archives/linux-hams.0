From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: Problems with bpq-interface
Date: Thu, 29 May 2003 00:03:04 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200305290003.04046.vk3bvp@qsl.net>
References: <3ED49335.6050903@linux.local>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3ED49335.6050903@linux.local>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Wed, 28 May 2003 20:45, Florian Zagler wrote:
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
>
> I didn't find a solution in the AX25-HOWTO and the manpages.
>
> Is there a bug or do I use the wrong commands?

The following is what I do to start bpqether on two boxes here.
It works fine. One thing I should do is replace vk3bvp-6 with a bogus 
callsign.

----Mandrake end---
# /etc/ax25/axports
tofbb	vk3bvp-6 	57600	255	6	link to fbb

# This is on the end of rc.local
modprobe bpqether
/sbin/ifconfig bpq0 192.168.1.6 hw ax25 vk3bvp-6 up
echo "bpqether started"

---Redhat end---
# /etc/ax25/axports
ether	eth-0  		10000000	255	6	ethernet port

# In the middle of my ax25 startup script
/sbin/ifconfig bpq0 192.168.1.3 hw ax25 eth-0 up

---Unproto seen on Redhat end---
ether: fm VK3BVP-6 to VK3BVP ctl SABM+ 
ether: fm VK3BVP to VK3BVP-6 ctl UA- 

-- 
Shane Deering                   Sent using Kmail v1.4.3
vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 6 hours and 47 minutes 
http://www.qsl.net/vk3bvp/      RH7.2 Up 5 days, 4 hours and 10 minutes 

