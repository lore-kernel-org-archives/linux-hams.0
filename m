From: "Scott Weis" <kb2ear@kb2ear.net>
Subject: Re: What happened to mkiss module
Date: Mon, 25 Jul 2005 16:05:46 -0400
Message-ID: <000e01c59154$3f29c6b0$a4011fac@kb2ear1>
References: <000c01c59018$a50ec2b0$a4011fac@kb2ear1> <20050724084523.GA3130@linux-mips.org> <000801c590cd$3f3572d0$a4011fac@kb2ear1> <20050725133658.GB2814@linux-mips.org> <007301c5914b$0a226c50$a4011fac@kb2ear1> <20050725193914.GH2814@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

I grabbed the message directly off of the server with VI. I only had one 
rej.. I applied the last part of the patch by hand.. No problems..  I found 
references to the SIOCSIFHWADDR: Invalid argument problem on the web and it 
seems to be a problem with the ax25 module not being seen.  So I was 
thinking that perhaps there is something missing from the /dev?

Should  I have any udev config entries??

Thanks & 73 de
Scott KB2EAR
----- Original Message ----- 
From: "Ralf Baechle DL5RB" <ralf@linux-mips.org>
To: "Scott Weis" <kb2ear@kb2ear.net>
Cc: <linux-hams@vger.kernel.org>
Sent: Monday, July 25, 2005 3:39 PM
Subject: Re: What happened to mkiss module


> On Mon, Jul 25, 2005 at 02:59:52PM -0400, Scott Weis wrote:
>
>> OK now when I run kissattach I get:
>>
>> kissattach: SIOCSIFHWADDR: Invalid argument
>>
>> and in dmesg:
>> unregister_netdevice: device ax%d/c1b95c00 never was registered
>>
>> Would all of this go away in 2.6.13.rc4??  Where can I get it.. I can 
>> only
>> find rc3
>
> I'm sorry, I meant 2.6.12-rc4 or newer.  You said you were trying to apply
> the patch to 2.6.12 but had rejects.  That generally happens with broken
> mailers such as Mozilla that garble patches.
>
>  Ralf
>
> 


