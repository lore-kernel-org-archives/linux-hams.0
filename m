From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: ax25 and direct sound card connection
Date: Fri, 19 Nov 2010 10:15:59 -0500
Message-ID: <4CE694AF.1080705@w1nr.net>
References: <AANLkTin1oHrKcyytk2Tg72ZdJi7TXBM+QPUjCiDaK_Nm@mail.gmail.com> <1290178294.21069.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1290178294.21069.27.camel@localhost.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 11/19/2010 09:51 AM, Gordon JC Pearce wrote:
> On Fri, 2010-11-19 at 12:38 -0200, Eduardo wrote:
>   
>> Hi,
>>
>> I have another fairly basic question. Before buying an actual radio, I
>> thought I can get some know how about using ax25 by connecting two
>> sound cards directly. Is that possible?
>>
>> I mean to connect two linux boxes by their sound cards directly and
>> use soundmodem (no radio between them)? Has anyone tried that? Can I
>> just connect the mic of the box1 to the speaker of box2 and the other
>> way around?
>>     
> It certainly is possible.  You won't even need to worry about a PTT
> line, either.  With a direct connection like that you ought to be able
> to get at least 19.2kbps using G3RUH mode.  Using the mike and earpiece
> sockets of unmodified walkie-talkies you will only be able to use
> 1200bps AFSK.
>
> Gordon MM0YEQ
>
>   

If both systems have line-in/line-out, then that would be preferred for
matching. Otherwise, mic and speaker ports usually have differing
impedances that could make for signal level and integrity problems
without matching transformers. Same holds true when interfacing to the
radio.

Mike, W1NR

