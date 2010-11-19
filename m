From: Gordon JC Pearce <gordonjcp@gjcp.net>
Subject: Re: Problems with system lockup
Date: Fri, 19 Nov 2010 14:50:07 +0000
Message-ID: <1290178207.21069.25.camel@localhost.localdomain>
References: <189256004-1290173541-cardhu_decombobulator_blackberry.rim.net-1112465315-@bda381.bisx.prod.on.blackberry>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <189256004-1290173541-cardhu_decombobulator_blackberry.rim.net-1112465315-@bda381.bisx.prod.on.blackberry>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Fri, 2010-11-19 at 13:32 +0000, kd1zd@rtcubed.org wrote:
> Thanks for all the responses.  After reading them, I realized I've seen more crashes in the last week, when I added a usb hard drive enclosure to the system.  I removed it to see igf the crashes are less frequent.
> 
> Also, I do run one of thr TNCs off of a USB to serial dongle, maybe that also has something to do with it.

Shouldn't make a difference, although some USB interfaces don't drive
the RS-232 side hard enough for some older TNCs to work.

> I will at some point give the memory test a try.  That may also help pinpoint if there are other things that are problems.

It's definitely worth doing sooner rather than later.

> Can any of you recommend a watchdog card?

Not really, no.  If your machine keeps locking up, it's because it's
faulty.  Treat the fault, not the symptom.

Gordon MM0YEQ

