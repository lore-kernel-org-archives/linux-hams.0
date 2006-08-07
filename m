From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: AX25 on SUSE 10.0
Date: Mon, 07 Aug 2006 19:04:07 +0200
Message-ID: <44D77287.4080901@ccr.jussieu.fr>
References: <3107.24.17.80.88.1154885072.squirrel@www.jnos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3107.24.17.80.88.1154885072.squirrel@www.jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: wa7nwp@jnos.org
Cc: linux-hams@vger.kernel.org



wa7nwp@jnos.org wrote :
> We tried to turn on AX25 in a SuSE 10.0 system yesterday.  It was an
> educational experience.
> 
> Suse no longer directly supports or includes the AX25 packages.
> 
> AX25 is indirectly supported as a 'project' by one of the SUSE folk.
> 
> That AX25 project is missing one little piece 'libax25.so'
> 
> Even if that all worked, it's using kernel 2.6.13 which I believe is
> broken for MKISS.
> 
> Do anybody have AX25 working on a recent SUSE system?   Is there a
> cookbook checklist of how to install and get it going?
> 
> Is there any Linux distributions today that are AX25 ready without any
> futzing around?  It appears the system we were working on is going to go
> with XP-Pro since it's so much easier to set up and use.

I have been using Mandriva Linux (formerly Mandrake) for a long time and 
recently shifted to 2.6 kernel for my AX25 packet radio.

Mandriva distro include all AX25 drivers and kernels are compiled with 
AX25 option set by default.

2006 official distro has 2.6.12 kernel that is not perfect for AX25.
It can be updated with a more recent kernel like 2.6.17.1 easy to 
install as there is a rpm file available.

I am presently using Mandriva 2006 official and kernel 2.6.16.18 on my 
AX25 BBS/Rose-FPAC/DxNet station.

However, there is a 2007 distro to be released in october that is based 
on kernel 2.6.17 witch includes a number of recent AX25 patchs by Ralf 
DL5RB. The beta 1 version is available for free download on CDs or one 
4,7Gb DVD.

Mandriva has its own live distro on a CD, called Mandriva One. It is in 
beta 1 step of development with 2.6.17 kernel. This live version could 
be used for AX25 as it can be easily installed on HD. Although it does 
not include development software (gcc compiler) it may be interesting to 
experiment with for AX25 installing AX25 libraries and utilities from 
binary executable files. See my ROSE-FPAC Mini Howto.


73 de Bernard, f6bvp.

> 
> Thanks,
> Bill - WA7NWP
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 

73 de Bernard, f6bvp

http://f6bvp.org
http://rose.fpac.free.fr/MINI-HOWTO/
http://rose.fpac.free.fr/MINI-HOWTO-FR/

