From: Roger Harris <linham@mybunker.plus.com>
Subject: Re: AX25 Node problem - please help
Date: Sun, 06 Apr 2014 18:44:25 +0100
Message-ID: <53419279.3090804@mybunker.plus.com>
References: <53412F05.4090306@mybunker.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <53412F05.4090306@mybunker.plus.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi again

Many thanks to those who have replied to me personally on this.

It would appear to be a known problem. Brian N1URO has fixed it in 
URONode but I believe that it's still a problem in the original node.

Anyone who notices the node going into a loop and using unnecessary 
resources should consider using URONode instead.

Thanks again

Roger G3ZFR

On 06/04/2014 11:40, Roger Harris wrote:
> Hi
>
> I've been trying to post full details of this problem to the mailing 
> list but my messages don't seem to be getting through. Perhaps there's 
> something in the body of the message that the system doesn't like so 
> here is a summary in the hope that someone may recognise the problem.
>
> I've recently noticed that a particular set of events can cause the 
> node to go into an endless loop. I have noticed this with node-0.3.2-4 
> on Fedora 9 and node-0.3.2-14 on Fedora 20 so I'm assuming that it's a 
> bug which has always been there. Note that these are the distribution 
> (unpatched) versions.
>
> Does this sound familiar to anyone? Has it been reported before and is 
> there a patch available? I'm happy to correspond directly with someone 
> with full details including strace info etc. in order to get this 
> fixed, but I don't know who is looking after the node software these 
> days.
>
> Many thanks
>
> Roger G3ZFR
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

