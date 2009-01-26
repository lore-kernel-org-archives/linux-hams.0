From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: ax25-tools and apps
Date: Mon, 26 Jan 2009 17:02:21 +1100
Message-ID: <497D51ED.40909@exemail.com.au>
References: <200901181350.36246.n7ipb@wetnet.net> <20090126001955.GA78660@mctaylor.blacknosugar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20090126001955.GA78660@mctaylor.blacknosugar.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Taylor <mctaylor@mctaylor.com>
Cc: linux-hams@vger.kernel.org

Michael Taylor wrote:
> On Sun, Jan 18, 2009 at 01:50:34PM -0800, Ken Koster wrote:
>   
>> So just where are the official sources for ax25-tools and ax25-apps?
>>     
>  
> As a previous developer (that is a minor contributor) for the linux
> ax25 software, I am sorry that the issue has been more confusing than
> it ought to be. I have not been running any AX.25 software since about
> 2003 and don't have an active station to test and evaluate development 
> and patch submissions.
>
> Hopefully we can all contribute to moving the linux-ax25 software and
> community forward in a productive manner.
>
> Michael, VE3TIX (ex-VE1MCT)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
If I may be permitted to make a comment or two as a long time ax25 user. 
My bbs has been using ax25 continuously since 1999. I still have six 
ax25 radio ports, use axudp links, and handle telnet, rose, netrom and 
garden variety ax25 on a system that has a bbs, node, and aprs HF and 
VHF Igate. By today's packet standards it is a big system.

As a user rather than a programmer or developer, I consider myself 
unqualified to lodge bug reports because my in-depth knowledge of the 
"inner workings" is insufficient for me to reach a logical conclusion. 
What may appear as a bug may be operator error. I always compile kernel 
ax25, but I know my limitations, even though I push them.

As a user of ax25, however, I am not alone, being one of a considerable 
number of bbs stations in France, the United States and Australia. There 
may be others outside of "my" circle. Every bbs with which I forward 
uses ax25. We all use fpacnode (from f6fbb) which is based on Linuxnode, 
but containing considerable improvements for handling Rose protocol. 
fpacnode also handles Netrom in an almost identical manner to Linuxnode.

What started out as an fpac mailing list seems to have collapsed to just 
four of us exchanging emails.

Bernard f6bvp has taken over ongoing maintenance of xfbb (minor fixes) 
and fpac (good improvements and fixes). Bernard has also released 
patches for kernel ax25 and kernel Rose. The email group of four 
previously mentioned, tend to be beta testers for Bernard's work.

I wonder how many ax25 users (and potential users) there are who aren't 
in the know, and who plod away with broken code, or just give up?

As old as ax25 is, I remain optimistic that it will still be in use for 
many years to come, and I would like to see a return to a coordinated 
approach to maintaining the code.

Am I of any value as a beta tester beyond my current circle for those 
developers who don't have test facilities? I don't know, but I do run a 
number of Linux systems with kernel ax25, so setting up for testing 
something I currently don't use ( axspawn, e.g.) is totally possible, if 
it's of any use and it advances the cause.

Ray vk2tv
