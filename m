From: "IT3 Stuart B. Tener, USNR" <stuart@bh90210.net>
Subject: RE: [pe1rxq@amsat.org: Re: SuSE / RedHat]
Date: Thu, 8 Jan 2004 16:26:15 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAAijlqNgr7rUGc9uCKMGR/uQEAAAAA@bh90210.net>
References: <20040109010356.E203@jeroen.pe1rxq.ampr.org>
Reply-To: <stuart@bh90210.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040109010356.E203@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jeroen Vreeken' <pe1rxq@amsat.org>, linux-hams@vger.kernel.org

Mr. Vreeken:

	Thank you for your most expeditious reply!

	I have posted the issues here before, but I plan on making an
install of SuSE PRO 9, once I receive it from a friend. At that point I am
going to try to install the AX.25 stuff again.

	I also did look on the sourceforge site, and was surprised to not
see any RPMS (though I did see tar files).

	Your idea of not switching all the supplies on at one time, sounds
to me like a good one! I am going to try to design or think of a design for
an enclosure that is rack mountable and can hold several of these supplies.

	What I guess I really need is a large rack mount box, I can
customize to hold a mobile rig, and some PC Supplies and other stuff in it.


Very Respectfully, 

IT3 Stuart Blake Tener, USNR-R 
Beverly Hills, California

USS CURTS / NR FFG-38 1941 (Ship Augmentation Unit)
NMCRC Long Beach, CA

Email: teners@bh90210.net
NIPR : stuart.tener@navy.mil
CNRF : tenersb@hq.cnrf.navy.mil

Amateur/HAM Radio Callsign: N3GWG

west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043 
east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859 
Telecopier: (419)-715-6073 fax to email gateway via www.efax.com

JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL. 

Sunday, September 14, 2003 7:14 AM


-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Jeroen Vreeken
Sent: Thursday, January 08, 2004 4:04 PM
To: linux-hams@vger.kernel.org
Subject: [pe1rxq@amsat.org: Re: SuSE / RedHat]

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

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


