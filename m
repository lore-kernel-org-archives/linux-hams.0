From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: different AX25.H files with same names
Date: Thu, 18 May 2006 11:06:39 -0400
Message-ID: <002a01c67a8c$aa2417a0$690ea8c0@LoJackOne.LoJack.com>
References: <20060506223800.GA4419@linux-mips.org> <4465D18F.5070405@ccr.jussieu.fr> <20060513144258.GA3640@linux-mips.org> <44670260.2050105@ccr.jussieu.fr> <20060518144954.GA1063@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Ralf Baechle <ralf@linux-mips.org>, Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

If you really want to get confused, check out how many different versions of 
netrom.h are laying around.

/usr/include/linux/netrom.h
/usr/include/netax25/kernel_netrom.h
/usr/include/netrom/netrom.h
/usr/src/linux/include/linux/netrom.h
/usr/src/linux/include/net/netrom.h

The bottom line is you should never have the /usr/src/linux kernel includes 
in your build path if you are building applications.

Mike, W1NR

----- Original Message ----- 
From: "Ralf Baechle" <ralf@linux-mips.org>
To: "Bernard Pidoux" <pidoux@ccr.jussieu.fr>
Cc: <linux-hams@vger.kernel.org>
Sent: Thursday, May 18, 2006 10:49 AM
Subject: Re: different AX25.H files with same names


> On Sun, May 14, 2006 at 12:11:44PM +0200, Bernard Pidoux wrote:
>
>> Ralf Baechle DL5RB wrote :
>> >On Sat, May 13, 2006 at 02:31:11PM +0200, Bernard Pidoux wrote:
>> >
>> >>By the way, its a long time since I want to ask if there is any reason
>> >>to keep the same name for different ax25.h include files.
>> >>
>> >>/usr/include/netax25/ax25.h
>> >>/usr/src/linux/include/linux/ax25.h
>> >>/usr/src/linux/include/net/ax25.h
>> >>
>> >>Somehow it may be confusing.
>> >
>> >One for building applications, one for the kernel itself.
>> >
>> >73 de DL5RB op Ralf
>> >
>> >--
>> >Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
>>
>> I understand that these files have different usage.
>> This is why I think that they should have different names.
>
>> So why not rename it ax25_kernel.h
>
> I just don't see a convcingint reason for it.  If it aint broke don't
> fix it.  Chances are renaming will break some software which against
> good advice is using the kernel header file anyway.
>
>  Ralf
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

