From: Mark Acierno <acierno@pocketdvm.com>
Subject: Re: Linux 2.6.3 ... Where are mkiss and 6pack?
Date: Fri, 20 Feb 2004 00:12:50 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <6E07E022-6363-11D8-B538-000A95DB9E94@pocketdvm.com>
References: <200402182229.30123@www.cabodesantapola.org> <20040219003515.K231@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0 (Apple Message framework v612)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040219003515.K231@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

I have experienced the same problem. When I tried to install Debian on 
my Sparc 20 - no problem. The drivers were clearly listed on the 
install. However....  when I tried to install the same version on my 
Ultra sparc 2,  6pack and mkiss go away..... I don't see on option on 
the install that reads "Select only drivers expected to compile 
cleanly"...... does anyone know where to find this option?


mark

On Feb 18, 2004, at 6:35 PM, Jeroen Vreeken wrote:

> On 2004.02.18 22:29:29 +0100 Ruben Navarro Huedo wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hello friends:
>> linux-2.6.3 has been released, but...Where are 6pack and mkiss?
>> I don't find them...
>> I can see bpq, Baycom...etc... but not 6pack or mkiss.
>
> Somebody decided that they are not SMP safe...
> If you deselect 'Select only drivers expected to compile cleanly' in 
> the
> 'Code maturity level options' you will get the 6pack and mkiss drivers
> back.
>
> In other words someone has to go over the mkiss and 6pack code and 
> make it
> smp safe.
>
> btw my last 6pack patch is NOT yet in 2.6.3 so you will have to apply 
> that
> manually.
>
> Jeroen
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

