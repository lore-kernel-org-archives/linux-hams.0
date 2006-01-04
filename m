From: Bob Nielsen <nielsen@oz.net>
Subject: Re: 2.6.13 mkiss update?
Date: Wed, 4 Jan 2006 13:19:01 -0800
Message-ID: <F207312C-FF7D-49CD-95AB-BDC8E021EF9C@oz.net>
References: <003301c6114b$180ecb80$680ea8c0@LoJackOne.LoJack.com> <8BD9A378-7AF9-41DB-BE04-1EAD876ECB5D@oz.net> <33725.83.73.68.20.1136407583.squirrel@www.amsat.dk>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <33725.83.73.68.20.1136407583.squirrel@www.amsat.dk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-hams@vger.kernel.org

With any distribution (I think) you do not need to use their kernel  
(although sometimes there desirable patches).  For instance, I am  
running Ubuntu on both my Linux machines, using 2.6.14.2 kernels,  
although Ubuntu 5.10 comes with 2.6.12.  I took the Ubuntu  
config-2.6.12 file and copied it to /usr/src/linux/.config, ran 'make  
menuconfig' and
compiled my new kernels.  I think some of the distributions even  
package up their standard patches, although the stock kernel works  
fine for me (I needed ndiswrapper on one of the machines to use my  
unsupported 802.11g PCI card, but was able to find a Ubuntu package  
which allowed me to create the module with my new kernel).  I have  
been compiling my own kernels for about 11 years (when it was  
necessary to do so in order to  have AX.25 support) and have never  
run into insurmountable problems.

73, Bob N7XY

On Jan 4, 2006, at 12:46 PM, oz6bl@amsat.dk wrote:

> Bob Nielsen wrote:
>> I thought it was the ax25 module that was broken.  In any case,
>> 2.6.14 (and presumably 2.6.15) works, so you could try one of them.
>> If there is some other reason why you need 2.6.13, ...
>
> The 'problem' with Suse is that once they have made a release they  
> stick
> to the kernel version with which the original release was made.  
> They will
> provide security updates but not kernel updates. For this very  
> reason I'm
> seriously considering switching to e.g. Gentoo, because there you can
> update the kernel. I use Gentoo on my router/gateway but am still  
> on Suse
> with my workstation.
>
> Best 73 de Bent/OZ6BL
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

