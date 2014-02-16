From: Joe Goforth <joego@mcn.org>
Subject: Re: Linpac on Raspberry Pi
Date: Sat, 15 Feb 2014 16:24:34 -0800
Message-ID: <53000542.9020500@mcn.org>
References: <52FDC2F9.2050804@exemail.com.au> <52FE4D95.2020701@trinnet.net> <52FE8EE2.90501@exemail.com.au> <52FEAC66.1060102@exemail.com.au> <52FEB771.40100@trinnet.net> <52FECC4B.1010108@mcn.org> <52FED52A.3080106@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <52FED52A.3080106@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>, Linux Hams <linux-hams@vger.kernel.org>

Hi David, That fixed the problem for the ax25mail-utils but I think it 
broke the axmail.cc program. Now it complains it can't find vector.h and 
fstream.h. I changed them to use the vector and fstream but that caused 
more problems it couldn't find gets and some other functions then.

Best Regards,
Joe G.

On 2/14/2014 6:47 PM, David Ranch wrote:
>
>
>> Hi David, Gave it a go on the beaglebone but I couldn't get the axmail
>> to compile. It is looking a file called vector.c any clues? I think I
>> remember some email from you or someone else about that file?
>
> Ah.. ok, try this:
>
> cd /tmp
> wget 
> http://iweb.dl.sourceforge.net/project/ax25mail/ax25mail-utils/0.11/ax25mail-utils-0.11.tar.gz
>
> tar xzvf ax25mail-utils-0.11.tar.gz
> cd ax25mail-utils-0.11
>
> wget 
> http://ftp.ubuntu.com/ubuntu/pool/universe/a/ax25mail-utils/ax25mail-utils_0.11-6.1.diff.gz
>
> wget 
> www.trinityos.com/HAM/CentosDigitalModes/usr/src/redhat/SOURCES/ax25mail-utils_0.11-ulistd.diff
>
> gunzip ax25mail-utils_0.11-6.1.diff.gz
>
> patch -p1 < ax25mail-utils_0.11-6.1.diff
> patch -p1 < ax25mail-utils_0.11-ulistd.diff
>
> ./configure
> make
>
> --David
>
>

