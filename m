From: Andrea Borgia <borgia@cs.unibo.it>
Subject: Re: Usermode Soundmodem
Date: Mon, 26 Jul 2004 19:14:33 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <41053BF9.7020401@cs.unibo.it>
References: <20040725183329.90335.qmail@web52604.mail.yahoo.com> <41052A12.7040503@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <41052A12.7040503@utoronto.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Dave Stubbs wrote:


> 2.6.6 and when configuring my kernel I noticed that a new option was 
> available under the ALSA settings - OSS PCM (Digital Audio) API.  This 
> basically gives a /dev/dsp device which plugs right into ALSA.  So far, 
> the usermode soundmodem software is working really well with this setup, 
> on a Soundblaster Live even.  Something worth trying?

If it works, by all means! In my case (laptop with onboard VIA chipset), 
the soundmodem was losing the beginning of each packet using Alsa's OSS 
emulation so I tried the newer soundmodem which has direct Alsa support. 
Unfortunately, that doesn't work either, but I gave up trying because 
packet really isn't that high on my todo list.

B73,
Andrea.

-- 
Homepage: http://andrea.borgia.bo.it     /    Amateur radio: IZ4FHT
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?
