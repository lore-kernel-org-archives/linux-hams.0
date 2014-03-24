From: Stuart Longland <stuartl@longlandclan.yi.org>
Subject: Re: Packet BBSes on ax25d
Date: Mon, 24 Mar 2014 21:27:28 +1000
Message-ID: <0eh50b-t7c.ln1@atomos.longlandclan.yi.org>
References: <i2h20b-t7c.ln1@atomos.longlandclan.yi.org>
	<20140323080815.GA15209@gjcp.net> <532EB3C2.5090803@exemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Sun, 23 Mar 2014 21:13:22 +1100, Ray Wells wrote:

>> I was looking for some too, but couldn't find any and couldn't even 
>> get the old software working well enough to try and characterise how 
>> it worked.
>>
>> Maybe it's time to start from scratch.  What should a packet BBS do?
>
> The xfbb mailing list is still active and might be a good place to ask 
> questions. The maintainer of xfbb is Bernard, F6BVP, who frequents this 
> list, but many xfbb users do not.

Interesting, I've tried again but last time I submitted my email address 
via their subscribe form (Mailman) nothing arrived.

I've tried again, maybe this time it'll work.

> Reflecting back to when I ran xfbb the only configuration for ax25d was 
> for Netrom calls to connect to fpacnode. xfbb did it's own listening 
> for ax25 traffic via kernel ax25 ports.

That's what I figured, but could never get to work.  I could at best get 
it to answer, but then typing commands did absolutely nothing.

xfbbC -c, as per the instructions, just did a poor emulation of /bin/cat, 
and I couldn't figure out how to kill it.  Telnet would talk to me: it'd 
tell me my callsign wasn't registered.

(Not registered with whom I wonder, did it check the ACMA or its own 
password file?)

