From: Tomi Manninen <tomi.manninen@saunalahti.fi>
Subject: RE: 300bps Packet (and EHAS) - what is pam, psk, and newpsk,
Date: Fri, 26 Nov 2010 14:23:57 +0200 (EET)
Message-ID: <12668780.9773261290774237884.JavaMail.tomi.manninen@saunalahti.fi>
Reply-To: oh2bns@sral.fi
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="Flowed"
To: linux-hams@vger.kernel.org

Tsutsumi Family [oakie@kamakuranet.ne.jp] kirjoitti: 

> Are you the Tomi Manninen who implemented the NEWQPSK protocol to the
> soundmodem?

Yes.

> If so, I wish to hear technical comments on the efforts of EHAS program to
> improve the codes developed by the Tomi described in the following article
> titled "Low cost E-mail over HF with OFDM and turbo coding techniques".
> 
> http://download.ehas.org/misc/articulo_HF.pdf

Yes, back when Arnau was developing this, we did some co-operation.
At the time Arnau contacted me, I had already done some experiments
in improving the framing and FEC. Arnau did a great job implementing
Turbo, soft decision sampling etc. Unfortunately I never had time nor
anyone to test it with on ham bands (Arnau is not a ham and the
general interest on newqpsk and packet had already declined here).

But I think the code is available on a SVN server at EHAS.

/Tomi, oh2bns

