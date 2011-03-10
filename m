From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Wed, 9 Mar 2011 19:07:50 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103091840260.7648@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de> <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net>
 <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net> <alpine.LNX.2.00.1103090758450.5282@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=oJ1WqmrCfvt612L7Arh6aAPygNn3/Mobyu7kEQuXr0A=;
        b=JJkkxu0O/5MiaklETrVEkYLndL/iezi/ObBZzEIDqSDnNdAvqcwwp+81iIvhE5mqyu
         kQi5dvtFxpKwFpfIlqus9Q+YDsLEoOpMhEgfa12STwB/PjGi912bT6JEdvTBSESXdyxG
         jW1gnFPJ/4Gq8tcTrd2WkFtdhiVNmkvtCJFsE=
In-Reply-To: <alpine.LNX.2.00.1103090758450.5282@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org

On Wed, 9 Mar 2011, Curt, WE7U wrote:

> What I found out:  The 16550 interface that I was trying to get running... 
> ain't.  It's a 16550-compatible multi-port card, NOT a card with 16550A's.

> Worse, I examined the 2-port cards I have:  They're also 16550-compatibles 
> (SYBA 2-port PCI cards).

> In my spare parts I found one PCI card with a real 16550A, a single-port 
> card.

The motherboard also has one serial port but the 10-pin ribbon w/attached DE-9 and bracket didn't come with it.  I went hunting tonight to find one that would work and just tested out that port also.

Latest finds:
-------------

*) NO-WORKY:  SYBA SD-PCI-2S 2-port serial PCI cards (NetMos Technology MCS9835CV chip).  I have two of these cards.  They claim to be 16550A-compatible.

*) NO-WORKY:  Startech PCI-4S-550N 4-port serial PCI cards with the NetMos Technology MCS9845 chip.  I have one of these cards.  They claim to be 16550A-compatible.

*) WORKS:  SIIG FastSerial IO1829 16550A 1-port serial PCI card.  If I had a lot of PCI slots I'd just buy a bunch of these as they're very cheap on Ebay right now ($5).

*) WORKS:  ASUS M3N78-VM motherboard serial port (16550A-compatible, integrated inside the NVidia chipset on the motherboard).

I needed my tweaks to the yam driver in order to use the SIIG card, as it showed up at a high interrupt and with high I/O addresses.  It worked fine talking to the YAM from my OpenSUSE-11.3 64-bit system, as did the motherboard serial port.  These experiments lay to rest the 32-bit vs. 64-bit issue as I've successfully configured a YAM modem on both 32-bit and 64-bit Linuxes now.

The remaining question:  Is it possible to get the NetMos chips to configure the YAM's?

There must be a difference in the chips "loopback" mode between the above cards.  The driver takes the chip into loopback mode, then bit-twiddles two lines (TXD and RTS) to create the synchronous CLOCK and DATA lines for loading the Xilinx chip.  Real 16550's and the one inside the motherboard chipset are able to do this, but the NetMos Technology 9835/9845 chips cannot.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
Additional pages:  http://wetnet.net/~we7u
