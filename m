From: "Tsutsumi Family" <oakie@kamakuranet.ne.jp>
Subject: RE: 300bps Packet (and EHAS) - what is pam, psk, and newpsk,
Date: Sat, 27 Nov 2010 12:58:03 +0900
Message-ID: <CF91227F50F7420F948E1208EBF93909@LIVINGROOM>
References: <12668780.9773261290774237884.JavaMail.tomi.manninen@saunalahti.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <12668780.9773261290774237884.JavaMail.tomi.manninen@saunalahti.fi>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: oh2bns@sral.fi, linux-hams@vger.kernel.org

Tomi,

I am glad and honored to have the conversation with the author of NEWQPSK
codes of the soundmodem.

I have the impression after reading the article that they will fit the
demands of low speed multi-media data stream transmission with the
equivalent performance of SSB voice (See Fig. 16 & 17) and can extend their
throughput by multi-bits modulation scheme for rural/naval terrestrial and
satellite radio amateur segments. Naturally, I believe there is not strong
benefits for the short packet application such as APRS and chats.

I had thought that the radio amateurs and EHAS program would be closely
coupled for the development but your story tells me that they just borrowed
your achievements for their own project. Now, am I correct we, Linux radio
amateurs, have the privilege, especially by your efforts, to try their codes
and improve for us?

Any comments?

Regards,

take

de JA5AEA
-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Tomi Manninen
Sent: Friday, November 26, 2010 9:24 PM
To: linux-hams@vger.kernel.org
Subject: RE: 300bps Packet (and EHAS) - what is pam, psk, and newpsk,

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

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

