From: Luc Langehegermann <lx2gt@gmx.net>
Subject: Re: sniffing on a packet radio device
Date: Tue, 11 Feb 2003 22:38:47 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200302112238.48084.lx2gt@gmx.net>
References: <009e01c2d213$9e858fc0$3640a8c0@boemboem>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <009e01c2d213$9e858fc0$3640a8c0@boemboem>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Folkert van Heusden <folkert@vanheusden.com>, linux-hams@vger.kernel.org

On Tuesday 11 February 2003 22:22, Folkert van Heusden wrote:
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

Try 'listen -ac -p <port>'

Luc


>
> Thank you.
>
> Folkert van Heusden
> www.vanheusden.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

