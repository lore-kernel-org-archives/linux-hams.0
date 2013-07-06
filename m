From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: Netrom on kernel version 3.9.6-200
Date: Sat, 06 Jul 2013 11:32:37 -0700
Message-ID: <51D862C5.1010109@junglevision.com>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com> <51D7AC41.6060606@junglevision.com> <51D7AE2B.3070408@junglevision.com> <51D852B6.3060401@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <51D852B6.3060401@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams <linux-hams@vger.kernel.org>

On 7/6/2013 10:24 AM, David Ranch wrote:
>
> Hello Cathryn,
>
> Which AX.25 libs/apps/tools are you using?  If you're using the 
> "official AX.25" ones, you're going to find this and other bugs. I 
> recommend you use VE7FET / F6BVP's version at 
> http://code.google.com/p/linuxax25/ as it has all of the required 
> fixes that I've come across.   You can find .spec files for this code 
> here: 
> http://www.trinityos.com/HAM/CentosDigitalModes/usr/src/redhat/SPECS/ 
> (don't use the ones that have "f6bvp" in the name as they reflect an 
> older version of the libs).

I was using the libraries that are the default in Fedora.  I thought 
maybe I could just install Fedora 18 and be good, but it looks like 
there are a few kinks in the code that comes with this distribution, 
including an odd change that's not from ftp.linux-ax25.org.

Anyway, now that I'm mucking with this stuff, I can give this version a 
shot too.  See how it goes.
