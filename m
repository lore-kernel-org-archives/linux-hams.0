From: John Ackermann N8UR <jra@febo.com>
Subject: Re: Which laptops are good for linux+packet(sound card) for County
 ARES?
Date: Sat, 19 Oct 2002 07:20:43 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <670000.1035026443@[192.168.1.222]>
References: <Pine.SOL.3.91.1021017133250.10243A-100000@gateway.grumman.com>
 <3DB026AA.9060309@bealenet.com> <20021018212927.GA15679@localhost>
 <3DB07EEE.9080804@bealenet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3DB07EEE.9080804@bealenet.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: tbmoore <tbmoore@bealenet.com>, Nate Bargmann <n0nb@networksplus.net>
Cc: linux-hams@vger.kernel.org

--On Friday, October 18, 2002 17:36:46 -0400 tbmoore <tbmoore@bealenet.com> 
wrote:

> Thanks, Nate.  That's good to know.  Is there a laptop in the $500 range
> that would have a soundmodem compatible sound card under linux?  We may
> be forced to use the TNC - most of my team prefer that anyway. Boyd
>
> --
> T. Boyd Moore
> Zech 4:6  KO4WK@ARRL.NET
>
> Nate Bargmann wrote:
>>
>>
>> While I have had good luck with an aging Thinkpad 760ED, I would
>> recommend anyone considering one of the older TP models first check if
>> it's using the mwave chipset for sound.  Mwave is not supported except
>> by loading a DOS driver and then warm booting into Linux.  Performance
>> is poor and probably not acceptable for any applications using
>> soundmodem or similar.  Some models, notably the 760EL used an ESS
>> chipset and they are supported, but only 8 bit audio.
>>
>> 73, de Nate >>

Nate's right that the mwave audio on the earlier Thinkpads isn't supported. 
One other problem with using Linux on my old 760 is that I haven't figured 
out how to get a text console to use the whole display -- it only uses a 
480x640 chunk in the center.

You asked about a $500 range laptop.  I have a Thinkpad 600E that I just 
bought for a little less than $500 (from secondwindpcs.com), and after 
putting Linux on it I am absolutely in love with it.  I have Debian Woody 
with X windows, KDE, and Openoffice.  It's not the machine I use to make my 
ham-oriented presentations to clubs, etc. and it's neat to tell folks I'm 
using a completely M$-free machine.

Unlike the earlier laptops, there is a Linux driver for the mwave modem in 
the 600 series and it works pretty well.

In a lot of ways, the 600E is the best "feeling" laptop I've ever owned -- 
it's the right size, weight, and feature set, and like all IBM laptops has 
a great keyboard feel.

73,
John
