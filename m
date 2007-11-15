From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Soundmedem-.10 file not uncompressing
Date: Thu, 15 Nov 2007 13:58:34 +0100
Message-ID: <473C427A.2090000@ccr.jussieu.fr>
References: <fc22d18f0711100039lcb7dfedv6a540f3561a533c7@mail.gmail.com>	 <C35BB18C.12C93%teners@bh90210.net> <fc22d18f0711101938p7dfe22dfna0e5a519eff44c1b@mail.gmail.com> <4736D508.6070608@bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4736D508.6070608@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: wharms@bfs.de
Cc: linux-hams@vger.kernel.org

Hi,

I found that a simple "tar xvf" usually works, i.e. omitting the zip 
option (z for zip and j for zip2).
So, you don't need to try "tar xvzf" and then "tar xvjf" if the first 
attempt fails.

73 de bernard, f6bvp



walter harms wrote:
> hi all,
> 
> instead of guessing you can identify the file using the 'file' utility.
> eg.
>  file archive.tar.gz
>  archive.tar.gz: gzip compressed data, from Unix
> 
>  file libsx-2.06.tar.bz2
>  libsx-2.06.tar.bz2: bzip2 compressed data, block size = 900k
> 
> 
> it is much more reliable then hoping that the suffix will give a hint.
> e.g. mv foo.tar.gz foo.tar.bz2
> (note: i have seen people doing that)
> 
> re,
>  walter
> 
> 
> Frank Brickle wrote:
>> The convention is, .tgz for .tar.gz and therefore gzip; .tbz for
>> .tar.bz2 and therefore bzip2.
>>
>> 73
>> Frank
>> AB2KT
>>
>> On Nov 10, 2007 10:05 PM, IT2 Stuart Blake Tener, USNR
>> <teners@bh90210.net> wrote:
>>> Mr. Bricle, et alia:
>>>
>>>     Indeed it is particularly instructive to note that the "tar zxvf
>>> name-of-your-gzipped-tarball" is presumptive to the fact that indeed the
>>> tarball has been size reduced with gzip!
>>>
>>>     It is entirely possible to use "j" (vice little "z") for bzip, or even
>>> to use "Z" (big "Z") for compress/uncompress as appropriate.
>>>
>>>
>>> V/R,
>>>
>>> Stuart, N3GWG
>>>
>>>
>>> On 11/10/07 12:39 AM, "Frank Brickle" <brickle@pobox.com> wrote:
>>>
>>>> Did you use the command
>>>>     tar zxvf  name-of-your-gzipped-tarball
>>>> ?
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
