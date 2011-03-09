From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Wed, 9 Mar 2011 08:32:42 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103090758450.5282@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de> <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net>
 <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=6VsayFPC6QaknD7oxY81G6rHf3xoWYVZlSWwBL04f4Y=;
        b=iriPmjgtjVvH+nf4bb+Nypw5gGvL0w0UId2fEhlcNBKS1+EDuS7ex2Lsl+UItiYSSb
         4uawf+2J2KfdojfL830QbYG9BZpA4y21FwfFkNE3lNldY4Ene3Zfrivej28/HoOhMNBa
         P/6Sz85gjAqt4EclsYJv70FYTiYYAHcg9Fov0=
In-Reply-To: <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org

On Tue, 8 Mar 2011, Curt, WE7U wrote:

> To recap:  I can make one YAM work on the laptop, but that's not the final 
> destination.  I haven't gotten one to work on the desktop yet, but want to 
> get two YAM's working there as well as a couple of other TNC's.
>
>    Laptop                  Desktop
>    ------                  -------
>    OpenSuSE-11.3 32-bit    OpenSuSE-11.3 64-bit
>    Qty 1 - 16550a          Qty 4 - 16550a
>    I/O: 0x3f8              I/O: 0xdc00 (and others slightly below)
>    irq 4                   irq 17 (shared)
>
> At the point I do an "ifconfig up" on the laptop I see one LED go nuts on the 
> YAM for a few seconds as the Xilinx chip is being loaded.  Last night I was 
> finally able to see that on the desktop, but then the command errored out 
> upon finishing the loading.  This is progress though as I've not seen the 
> Xilinx get loaded via the desktop until last night.

What I found out:  The 16550 interface that I was trying to get running... ain't.  It's a 16550-compatible multi-port card, NOT a card with 16550A's.  I may not be able to get it working, depending on how compatible the chip is and how the board is wired.  It's a Startech 4-port card with a NetMos Technology 9845 chip.

Worse, I examined the 2-port cards I have:  They're also 16550-compatibles (SYBA 2-port PCI cards).  I didn't get a chance last night to swap out the 4-port for one of those to see if they do better talking to the YAM.

In my spare parts I found one PCI card with a real 16550A, a single-port card.  Newegg has LAVA 4-port ($76) and 8-port ($111) cards w/real 16550A's if I want to go that route.  Most of the cards I see offered for sale are 16550 "compatible".  Anything that does faster than 115200 baud appears to be a "compatible" instead of a real 16550A.  Cards with real 16552's or 16554's should work fine assuming all the lines for a DE-9 are wired out to the connector and controllable by the chip.  That LAVA 8-port has the "RI" signal wired out to only the first four ports.

I'm deciding whether to go further down this rabbit-hole attempting to get non-16550A cards to talk to the YAM.  Changes to date are useful to fold back into the mainstream, updating the driver to modern standards and increasing portability.  Additional work to get "compatible" boards to talk to the YAM may not be a good use of my time.

This is the 4-port card, using "lspci -v" to get the info:

     01:06.0 Serial controller: NetMos Technology PCI 9845 Multi-I/O Controller (rev 01) (prog-if 02 [16550])
             Subsystem: LSI Logic / Symbios Logic 0P4S (4 port 16550A serial card)
             Flags: medium devsel, IRQ 17
             I/O ports at dc00 [size=8]
             I/O ports at d880 [size=8]
             I/O ports at d800 [size=8]
             I/O ports at d480 [size=8]
             I/O ports at d400 [size=8]
             I/O ports at d080 [size=16]
             Kernel driver in use: serial

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS:  Where it's at!        http://www.xastir.org
