From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Fri, 11 Mar 2011 14:32:40 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103111424460.11898@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de> <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net>
 <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net> <alpine.LNX.2.00.1103090758450.5282@wapiti.we7u.net> <alpine.LNX.2.00.1103091840260.7648@wapiti.we7u.net> <4D7A95EE.9060206@radagast.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=m5sjMULdFv0Dv6GrUY41c9ZjnWu2FExh3d9LAiKmB+M=;
        b=ebAinZ6kQLP+DN366i2RPgjN0nsfcpsstS6swmFfmTWh4vkYnn/e7PTtrLq79K5Au9
         ZAayR6RcVm7coWJ+lUwlG4h2TfHf4v9v9UJpOejYteWhkJTix3iEu4EJvRrv+rVvk43u
         rqNdVbHHMmLJ0g5SogW7SlyHcITFIsw/usLrc=
In-Reply-To: <4D7A95EE.9060206@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org

On Fri, 11 Mar 2011, Dave Platt wrote:

> I wonder... how much of the compatibility problems you're seeing,
> have anything to do with the chip itself (16550 vs. "compatible")
> and how much have to do with the external analog interfaces used
> by the board vendors?

I starting walking down that same path yesterday afternoon!

I figured out how they're doing the synchronous clocking, and it has nothing to do with a 16550.  It's just standard UART stuff.  The only "16550" stuff required is the particular registers at particular addresses, and control of a couple of handshake lines by bit-twiddling.


> A lot of serial ports these days are only "barely RS-232",
> and some don't even comply with the RS-232 spec.

Yep.  The boards with the 9835/9845's on them are doing +11.25 or higher, and -11.25 or lower on the swings.  Measured that last night.

I also measured the good ports and they are the same.  I found one handshake at a different state between the "good" and "bad" interfaces after configuration, then started in to the driver again and found that the two handshakes that were always supposed to be at opposite states (to provide power to the board) weren't being handled that way in the driver.

I haven't gone back to verify the current capability from either interface (spec says should supply 7mA per line at 12V or sink 7mA at -12V if I remember correctly), or that the power supply to the chip remains between 4.75 and 5.25V the entire time.  I need to do so yet.


> Since the YAM is intended to be port-powered, I suspect it
> is going to be very prone to not work correctly when used
> from these wimpy, under-voltaged-and-under-powered ports.
> If the handshaking lines can't pull well above +5 while
> providing enough juice to run the FPGA, the device probably
> will not initialize properly.

Yes, which is why I'd rather power it from my 20A Astron.  That ought to have enough ooomph!


> As I see just now that Ray has suggested, you may be able to
> overcome the RS-232 voltage issues by using a separate (outboard)
> power supply to run the YAM circuitry.  This might provide better
> compatibility with a broad range of modern serial ports, which
> are usually very register-compatible with 16550A UARTs but which
> differ at the electrical level.

Yep.  My thoughts too.  Since I need +12V all over the shack anyway to power darned-near anything, I might as well tap off that and make the YAM more reliable in the process.

Which reminds me:  If a vendor has a deal on a Saratoga powerpole distribution strip tomorrow at the hamfest I'll pick one up.  I already have one in the Jeep to distribute 12V.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS Client Capabilities:  http://www.eskimo.com/~archer/aprs_capabilities.html
