From: "Jeff Camp" <jcamp2@cox.net>
Subject: Re: Looking for soundmodem info
Date: Thu, 27 Jan 2005 22:22:55 -0600
Message-ID: <003e01c504f1$0aa804a0$046fa8c0@JLX>
References: <002501c5040c$044708d0$046fa8c0@JLX> <20050127014554.GA8492@n7xy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org

Thanks for the info, Bob.  I spent some time scouring the internet this 
morning looking for soundmodem info.  I downloaded soundmodem-0.9-1.i386.rpm 
and installed it, but now I'm getting the following error message when I try 
to start it up:

[root@n0wjp ax25]# soundmodem -v 9
sm[1855]: x86 CPU capability 0383f9ff, MMX enabled
sm[1855]: mkiss: ifname sm0 mtu 256 hwaddr N0WJP-15 ipaddr 10.0.0.1 netmask 
255.255.255.0 broadcast 10.0.0.255
sm[1855]: audio: starting "/dev/dsp"
sm[1855]: audio: Error, cannot open "/dev/dsp"
sm[1855]: cannot start audio
[root@n0wjp ax25]#


/dev/dsp exists.  The sound card is a sound blaster compatible.  Anyone have 
an idea what these error mean?  I'm not sure exactly where to start on this 
one.

Thanks and 73,
Jeff
N0WJP

----- Original Message ----- 
From: "Bob Nielsen" <nielsen@oz.net>
To: <linux-hams@vger.kernel.org>
Sent: Wednesday, January 26, 2005 7:45 PM
Subject: Re: Looking for soundmodem info


> On Wed, Jan 26, 2005 at 07:03:30PM -0600, Jeff Camp wrote:
>> I'm looking for some resources to help me find out more about using my
>> computer's sound card along with an MFJ-1275 (for keying the radio) so I
>> can replace an aging TNC with something different.  Can anyone point me 
>> to
>> some information on the soundmodem package?  I'm using Red Hat 9.0 with
>> ax25tools, apps, and utils and have all of the ax25 stuff working great.
>>
>> Thanks,
>> Jeff N0WJP
>>
>
> About the only documentation I have been able to find (other than the
> source code and man page) is:
>
> http://www.baycom.org/~tom/ham/dcc2000/soundmodem.pdf
>
> -- 
> Bob Nielsen, N7XY                          n7xy (at) n7xy.net
> Bainbridge Island, WA                      http://www.n7xy.net
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


