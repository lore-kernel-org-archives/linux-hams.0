From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [pe1rxq@amsat.org: Re: SuSE / RedHat]
Date: Fri, 9 Jan 2004 01:03:56 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040109010356.E203@jeroen.pe1rxq.ampr.org>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAAjAlFKD8vcUyu/awUkdzfUQEAAAAA@bh90210.net> <20040109010302.C203@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040109010302.C203@jeroen.pe1rxq.ampr.org>; from pe1rxq@amsat.org on Fri, Jan 09, 2004 at 01:03:02 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 2004.01.09 00:25:51 +0100 "IT3 Stuart B. Tener, USNR" wrote:
> Listmembers:
> 
> 	I to have tried MULTIPLE times in the past to get the packet
> stuff
> for Linux working to ZERO avail. I am curious about a few things:

Works for me... its pretty much a useless statement, what exactly went
wrong?
 
> 	(a) Are the "extra" packages available in RPM binary/source
> format
> for use on RedHat 9.0 or SuSE Pro 9.0?

At ax25.sourceforge.net you can find libax25, ax25 tools and ax25 apps.

> 	(b) Can someone send me a list of what kernel options need to be
> on
> to have use of the sound based packet modems (for a 2.4.x kernel)?

The ax.25 stack and the mkiss driver.
Use the userland soundmodem its much easier and should work on pretty much
any audio device.
 
> 	(c) I am looking at implementing 2.6.x soon, what caveats are
> there
> in performing such an implementation relative to amateur radio usage?

You need atleast 2.6.1-rc2 otherwise go for it, its better.

> 	Out of curiosity, I am interested in upgrading my KAM PLUS and
> what
> do you know Kantronics doesn't give a rats rectum about customers with
> that
> TNC anymore.
> 
> 	(a) What is the latest firmware?
> 	(b) What upgrades were (or might still) be available for it?
> 	(c) Any one know what type of molex connector is on the back of
> one
> of the DVR2-2 radios (Kantronics also)?
> 	(d) How many amps does the DVR2-2 and KAM PLUS require in 12V
> power
> to use them?
> 
> 	Does anyone see an issue with using an olde PC Supply (+12V@8
> amps)
> to power these devices? I must admit, I have recently become a fan of
> using
> the surplus PC supplies for HAM use! Many can supply as much as 15 AMPS!
> 
> 	Any comments and ideas on this:
> 
> 	I am considering to build a small "box" to hold several PC
> Supplies
> in order to have one master power switch, and to be able to rack mount
> them.
> If someone knows where I can buy such a box, wonderful, or has anyone
> seen
> this type of thing built before?
> 
> 

You might want to switch them on in a sequence rather then all at once
since starting switchmodesupplies can make quite a dent on the power
system.
Be carefull that they don't generate unwanted RF interference or audible
whistles on the supply. They seem to work just fine mostly.

Jeroen

