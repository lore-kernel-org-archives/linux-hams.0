From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: Looking for Packet Radio Software
Date: Tue, 17 Aug 2010 08:16:22 +1000
Message-ID: <4C69B8B6.4070703@exemail.com.au>
References: <000001cb3d62$c36ad940$4a408bc0$@com> <4C69A8AE.3030307@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4C69A8AE.3030307@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>
Cc: john paterson <jpaterjr@gmail.com>, linux-hams@vger.kernel.org

All,

I had mixed success with a variety of packet programs under Debian Linux 
v4.3

1. Xarpm - native Linux Winpack look-alike. I found the program slightly 
unstable, incomplete, but looking promising. The installer was, in my 
opinion, very convoluted. The author appears to have done a disappearing 
trick but there is a list on Yahoo.

2. Tsthwin (registered) - had it working under Wine but there were mail 
issues. The author has vanished.

3. TSTHOST (DOS) - had this one working under DOSEMU

4. LinKT - native Linux packet terminal program. Eventually managed to 
get it to compile and it worked ok. There is still reference to it on 
www and the source is still available.

5. Winpack - never managed to sort out the dll's it needed in Wine. Each 
time I imported dll's from Windows, it wanted more. I gave up.

6. Linpac - native Linux terminal program with mail facilities. It's a 
CLI program but runs in a terminal ok. The mail program disconnected 
after the first packet exchange with a bbs. I spent many hours looking 
at source code for answers but I'm not a programmer. Others reported the 
same issue. No support since about 2002 but source still available.

7. TPK - should have worked in DOSEMU but kept failing and I abandoned 
it through lack of time.

8. TNT/DPBOX - native Linux, stable. I looked more at the bbs side as a 
replacement for fbb. Very complicated configuration file, made a little 
worse at times by the German/English conversion and, some use of German 
terminology. That's not a complaint, just an observation. I think the 
TNT/DPBOX combination had more future than any of the others. The 
program offers some advanced features such as broadcast mode for mail 
exchange.

There may have been others but the memory battery went flat a long time ago!

Ray vk2tv


On 17/08/10 07:07, David Ranch wrote:
>
> Hello John,
>
> Depending on your needs, there is a lot of good packet software out 
> there for Linux (a previous post to the linux.au site is great).  With 
> that said, there isn't a native Outlook for Packet application out 
> there like Outpost.  A buddy of mine did get that working under Wine 
> after a bit of work.  If you're interested in finding out what he did 
> to get it working, I can get you in touch with him.   For me, I use a 
> combination of:
>
> Packet TNC
>  - HF: Soundmodem software TNC in KISS mode
>  - VHF: Kenwood D710
>
> Applications:
>  - HF: fldigi / WSJT  (I'm also working on setting up pskmail
>  - VHF packet: Linpac
>
> I have a bit of a hacky Journal following all this that I hope to 
> clean up.  It might be helpful to you..
>
>    http://www.trinityos.com/HAM/index-ham.html#centosdigitalmodes
>
> --David
>
>
>
> john paterson wrote:
>> Hi, all...
>>
>> I just joined the mailing list. I have looked through a lot of the 
>> archives
>> and not found the information I am looking for, so I will try here. I 
>> have a
>> computer running Ubuntu 10.04 and would like to use it for packet 
>> radio. I
>> have tried Airmail and Outpost Packet Manager, both in Wine, but neither
>> works well. Airmail works for one interchange then apparently messes 
>> up the
>> the TNC (a KPC3), so that I have to reset the TNC to use it again on
>> Windows. Outpost PM seems to communicate with the TNC OK, in the serial
>> terminal, but never shows outgoing or incoming characters in the 
>> terminal
>> window, and does not properly communicate with the TNC when trying to
>> send/receive from the packet manager.
>>
>> Can anyone help me with the proper setup for Airmail or Outpost PM, or
>> suggest other terminal software for packet operation with a KPC3 TNC?
>>
>> Thanks in advance..
>>
>> 73 de John, KC5LAA
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

