From: Andrea Borgia <borgia@cs.unibo.it>
Subject: Re: Configuring SoundModem with a PCI sound card
Date: Sun, 23 May 2004 11:13:56 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40B05D44.6010301@cs.unibo.it>
References: <40AFFB0D.3010101@ftc-i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40AFFB0D.3010101@ftc-i.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Gale D. Wilkinson wrote:

> I have been looking at the info in the AX25 HowTo for setting up a sound 
> card modem but am running into problems as the documentation seems to 
> only cover the old ISA sound cards. setcrystal in particular is where I 
> am having problems.  Are there any newer docs/howto's that would give 
> the proper setup procedures for configuring soundmodem with these newer 

 From your reference to setcrystal, I gather you're trying to use the 
older soundmodem, the in-kernel version. I suggest that you try the 
newer userspace program: all you need is OSS/ALSA drivers for your card, 
a mixer (aumix will do nicely) and this package, which also includes a 
nice GUI for generating a config file.

HTH,
Andrea.

-- 
Homepage: http://andrea.borgia.bo.it     /    Amateur radio: IZ4FHT
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?
