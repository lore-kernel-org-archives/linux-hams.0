From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: sniffing on a packet radio device
Date: Wed, 12 Feb 2003 08:39:38 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200302120839.38347.vk3bvp@qsl.net>
References: <009e01c2d213$9e858fc0$3640a8c0@boemboem>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <009e01c2d213$9e858fc0$3640a8c0@boemboem>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Wed, 12 Feb 2003 08:22, Folkert van Heusden wrote:
> Hi,
>
> I have a BayCom modem connected to com1. I've also loaded the module.
> As a test I assigned an ip-address to it and pinged some random ip-
> address. The transceiver (is that the word?) seems to transmit what
> I'm sending. Also, sometimes I see the RX light of the modem blinking
> so someone must be transmitting something. So I tried tcpdump on the
> device (bcsh0) but that failed with a "unknown data link type 3".
> So I was wondering: is there anything out there with which I can
> sniff *everything* that is coming through?

Try /usr/bin/listen.
I like to use "listen -car".
And get a license.

-- 
Shane Deering                   Sent using Kmail v1.4.3
vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 1 hour and 5 minutes 
http://www.qsl.net/vk3bvp/      RH7.2 Up 18 hours and 8 minutes 

