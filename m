From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: MKISS DRIVER PATCH - for layer 3 longword alignment in m68000
Date: Tue, 26 Apr 2005 16:05:54 +0200
Message-ID: <426E4AC2.5060906@amsat.org>
References: <20050424204044.77497.qmail@web21602.mail.yahoo.com> <20050426143333.A5965@pull.privacy.nb.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050426143333.A5965@pull.privacy.nb.ca>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: M Taylor <mctylr@privacy.nb.ca>
Cc: Linux-Hams@vger.kernel.org

M Taylor wrote:

>On Sun, Apr 24, 2005 at 01:40:43PM -0700, Sriram Chadalavada wrote:
>  
>
>> FTP, SSH working over an AX.25 link but faced kernel
>> panics due to memory alignment issues in the mkiss
>> driver, whenever (ICMP, TCP) packets were received
>> on the relevant 'kiss' interface.
>>
>> In consultation with David McCollough
>> (Snapgear/cyberguard.com), I have come up with a
>> patch(see attachment) to solve the above problem in
>> architectures such as m68000 where alignment issues
>> are not handled in hardware. 
>>    
>>
>  
>http://www.privacy.nb.ca/~mctylr/uClinux/mkiss-skb-align.patch
>  
>
It looks ok, but there are some unneeded whitespace changes in your patch...
And on a personal note I like comments in C style more than the C++ 
style you use. /* ... */ instead of // ...
But that might be just me :)

Jeroen

