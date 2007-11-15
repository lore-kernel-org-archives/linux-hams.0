From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: dmascc ?
Date: Thu, 15 Nov 2007 14:01:28 +0100
Message-ID: <473C4328.9020709@ccr.jussieu.fr>
References: <47380198.7020906@ve7hex.ampr.org> <20071115000703.GA30665@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071115000703.GA30665@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Niall Parker <niall@ve7hex.ampr.org>, linux-hams <linux-hams@vger.kernel.org>

Hi,

Is an SMP kernel mandatory for running a multithreaded P4 CPU or 
would'not a single CPU kernel make it  (with a 50% performance reduction) ?

73 de bernard, f6bvp



Ralf Baechle DL5RB wrote:
> On Sun, Nov 11, 2007 at 11:32:40PM -0800, Niall Parker wrote:
> 
>> It's been a while since I've tried a new kernel with my PI2 cards and 
>> just discovered that while the source is still included in 
>> drivers/net/hamradio/dmascc.c , it isn't possible to select via make 
>> menuconfig even when CONFIG_EXPERIMENTAL is set.
>>
>> I hunted through the linux-hams archives and it looks like the code is 
>> still being updated, is there some other reason why dmascc is no longer 
>> a config option ?
> 
> You can only configure the driver when building a uniprocessor kernel for
> an ISA system and AX25 must also be enabled.  Even an oldfashioned
> hyperthreaded P4 needs an SMP kernel these days so this driver is hardly
> being offered anymore and I guess that's the problem you're having.
> 
>   Ralf
> 
> 73 de DL5RB op Ralf
> 
> --
> Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
> Packet: DL5RB@DB0FHN.#BAY.DEU.EU
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
