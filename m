From: Pierre-Philippe Coupard <pcoupard@easyconnect.fr>
Subject: Re: Usermode Soundmodem
Date: Mon, 26 Jul 2004 21:33:59 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <41055CA7.2020904@easyconnect.fr>
References: <20040725183329.90335.qmail@web52604.mail.yahoo.com> <41052A12.7040503@utoronto.ca> <41053BF9.7020401@cs.unibo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <41053BF9.7020401@cs.unibo.it>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Andrea Borgia wrote:
> If it works, by all means! In my case (laptop with onboard VIA chipset), 
> the soundmodem was losing the beginning of each packet using Alsa's OSS

I think the source of your problem is contained in your statement: VIA
chipset. Almost all odd sound or timing problem reports I get for my
software can be traced back to a VIA, AC97, or I8x0 sound chip. It's
unfortunate that you're kind of stuck with it on a laptop...

73 de Pierre F8EJF
