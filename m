From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Linux 2.6.3 ... Where are mkiss and 6pack?
Date: Thu, 19 Feb 2004 12:56:11 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4034B26B.3010903@ccr.jussieu.fr>
References: <200402182229.30123@www.cabodesantapola.org> <20040219003515.K231@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040219003515.K231@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>, Linux-hams List <linux-hams@vger.kernel.org>

Hi,

In my experience mkiss works very fine with kernel 2.6 !
Could you explain what is SMP ?

73 de Bernard, f6bvp

--------

Jeroen Vreeken wrote:
> On 2004.02.18 22:29:29 +0100 Ruben Navarro Huedo wrote:
> 
>>-----BEGIN PGP SIGNED MESSAGE-----
>>Hash: SHA1
>>
>>Hello friends:
>>linux-2.6.3 has been released, but...Where are 6pack and mkiss?
>>I don't find them...
>>I can see bpq, Baycom...etc... but not 6pack or mkiss.
> 
> 
> Somebody decided that they are not SMP safe...
> If you deselect 'Select only drivers expected to compile cleanly' in the
> 'Code maturity level options' you will get the 6pack and mkiss drivers
> back.
> 
> In other words someone has to go over the mkiss and 6pack code and make it
> smp safe.
> 
> btw my last 6pack patch is NOT yet in 2.6.3 so you will have to apply that
> manually.
> 
> Jeroen

