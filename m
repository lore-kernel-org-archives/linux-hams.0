From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Linux 2.6.3 ... Where are mkiss and 6pack?
Date: Thu, 19 Feb 2004 20:44:55 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040219204455.A231@jeroen.pe1rxq.ampr.org>
References: <200402182229.30123@www.cabodesantapola.org> <20040219003515.K231@jeroen.pe1rxq.ampr.org> <4034B26B.3010903@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4034B26B.3010903@ccr.jussieu.fr>; from pidoux@ccr.jussieu.fr on Thu, Feb 19, 2004 at 13:56:11 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>, Linux-hams List <linux-hams@vger.kernel.org>

On 2004.02.19 13:56:11 +0100 Bernard Pidoux wrote:
> Hi,
> 
> In my experience mkiss works very fine with kernel 2.6 !
> Could you explain what is SMP ?

As long as you use a single processor system they indeed work fine....
And the nasty thing is that they will probably appear to work fine on an
multiprocessor system to. Except for the fact that it will probably have
some misterious lockup once every few weeks :)

Somebody has looked at the code and decided that it probably has some race
conditions. (which might go wrong or might go right depending on the phase
of the moon)
Someone would have to go over the code and make sure it uses the propper
locking mechanisms.

Jeroen

