From: Kjell Jarl <K-Jarl@algonet.se>
Subject: Re: linux crashes
Date: Mon, 10 Jan 2005 08:32:36 +0100
Message-ID: <41E22F94.5050707@algonet.se>
References: <000501c4f68e$5457b6c0$3d4689d8@oem7paq6co5hph> <opskcy9egselwowa@post.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <opskcy9egselwowa@post.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi, is this the netrom-bug?
Since I applied 9a4gl patch to my 2.4.21 kernel it has been fine.
73
Kjell, sm7gvf


Ian Haver wrote:
> On Sun, 9 Jan 2005 20:59:51 -0000, Tom Vavra <wb8zrl@avalon.net> wrote:
> 
>> In mid December I replaced my DOS based packetcluster system with a Linux
>> based DXSpider system.  Since that time I have had 5 system crashes.  I
>> think all are the same.  Enclosed at the end is the transcribed crash
>> screen.  I tried to proof it, but I would not bet too much that I got it
>> correct.
>>
>> I am running RedHat 9.0 with a 2.4.20 kernel.  The netrom/ax25 
>> packages  are:
>>
>>   ax25-apps-0.0.6
>>   ax25-tools-0.0.8
>>   libax25-0.0.11
>>   node-0.3.1
>>
>> I am using three serial ports to drive tncs.  Two of the tncs are tapr-2
>> (MFJ-1270b) with BPQKISS eproms, and the other tnc is a two port  
>> KPC-9612,
>> using both ports.  So I am driving all three ports with mkiss, 
>> followed  by
>> kissattach.  Two netrom ports are defined.  And I am running mheardd.
>>
>> The cpu is a 450mhz pentium that idles at less than 2%, and there is  
>> 256Mb
>> of memory so swap is almost nonexistant.
>>
>> Anyone have any ideas about what I need to do to eliminate the crashes?
>>
>>              Tom  WB8ZRL
>>
> 
> HI Tom
> I had similar problem with my suse distro.
> I had to download a new kernel and patch it up.
> The files can be found on my server here at YFS but i dont have the  
> fastest ADSL link.
> You are more than welcome to download them.
> they can be found at:
> http://gb7yfs.org.uk/public/linux/new_kernel_bits/
> 
> also in that directory is all the ax25 bits i used here.
> When i was running 2.4.20 i could average around 10 days uptime, since 
> i  upgraded it runs and runs and runs till i reboot it. LOL
> 
> Hope this helps a little
> 
> Best Regards
> Ian
> G6VEY
> SYSOP GB7YFS
> Author Xarpm Plus
> 
> 

