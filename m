From: Andrea Borgia <borgia@cs.unibo.it>
Subject: Re: Usermode Soundmodem
Date: Tue, 27 Jul 2004 17:04:22 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <41066EF6.9000200@cs.unibo.it>
References: <E1BpBxl-0007Fp-00@penngrove.fdns.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <E1BpBxl-0007Fp-00@penngrove.fdns.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

John Mock wrote:

> But 'multimon' can at least decode 1.2kb AFSK.  It's currently hardwared to
> 22.05 KHz, not a great sample rate for a AC97, but it works.  So why can't 
> the usermode version of soundmodem[config] at least do this much???

Exactly my point: this laptop's transmitted packets are received just 
fine on the other end, it's the replies that are getting missed by the 
decoder so the chipset is not too badly broken, apparently.

Unfortunately, I am not really a DSP expert, so there might be deeper 
reasons why the soundmodem is using a specific sample rate rather than 
the one most convenient to the hardware, especially considering that 
quite a few recent chipsets only offer a limited selection of rates.

B73,
Andrea.

-- 
Homepage: http://andrea.borgia.bo.it     /    Amateur radio: IZ4FHT
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?
