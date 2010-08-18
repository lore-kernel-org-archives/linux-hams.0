From: Kristoff Bonne <kristoff.bonne@skypro.be>
Subject: Re: problem serial/USB stick and Xaster
Date: Wed, 18 Aug 2010 20:39:31 +0200
Message-ID: <4C6C28E3.3000809@skypro.be>
References: <4C61C34F.7050704@skypro.be> <alpine.LNX.2.00.1008161213400.19029@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1008161213400.19029@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi Curt (and all others that have replied offline).


First of all.
I'm sorry for the late reply. I just got back from a week abroad.



>> I do not know if this is the correct ML for this, so feel free to let 
>> me know if there is a better place for this.
>
>     Try the Xastir mailing list at www.xastir.org
I've just reasked the question overthere.

But I was actually more thinking in a line of problems of (say) 
differences in the "ioctl" commands when using the xastir and minicom; 
so perhaps something more system-level and not related to one particular 
program.



>> It shows itself as "/dev/ttyUSB0" on my box (ubuntu 10.06 netbook 
>> release).
>
> Have you verified that you're a member of the group for
> /dev/ttyUSB0?  If you just added yourself to that group for testing,
> log out/log in again to gain those new permissions.  Make sure that
> group permissions are rw also on that port.
>
> Alternatively:
>
>     sudo chmod 4755 /usr/local/bin/xastir

Well, I also have the same problem as root (with sudo) so I do not think 
it's a problem of rights.
That would probably have resulted in Xastir not receiving anything at 
all. Here I do receive something but it's 'kind of" mixed up. (not 
completely, some words do are OK, like a "OFF" and "ON" or some digits)




>> - minicom works OK (both with the normal serial port and with the 
>> USB-stick)
>> - Xastir with the USB-stick gives rubish
>> - Xastir with normal serial port works OK.
>> Is anybody familiar with a "known issue" with Xastir about this?
>
> Nope.
Oh. Something else I forgot to mention.

Sending does work. When I start up Xastir or issue a "Transmit now!" (in 
the "interfaces" menu) the tranceiver does send, so I guess we van 
conclude from that the USB-port does send valid commands to the TNC.
(the messages I received at startup seams to indicate the same thing).


Cheerio! Kr. Bonne. ON5ARF (ex. ON1ARF)
