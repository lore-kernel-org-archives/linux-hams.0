From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: sniffing on a packet radio device
Date: 11 Feb 2003 22:36:07 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1044999367.1248.2.camel@localhost.localdomain>
References: <009e01c2d213$9e858fc0$3640a8c0@boemboem>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <009e01c2d213$9e858fc0$3640a8c0@boemboem>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Folkert van Heusden <folkert@vanheusden.com>
Cc: linux-hams@vger.kernel.org

On Tue, 2003-02-11 at 22:22, Folkert van Heusden wrote:
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
> 
> 
> Thank you.

listen -p bcsh0 -a

--
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu



