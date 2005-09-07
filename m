From: Dave Stubbs <dave.stubbs@utoronto.ca>
Subject: Re: ax25-howto
Date: Wed, 07 Sep 2005 11:13:19 -0400
Message-ID: <431F038F.6010804@utoronto.ca>
References: <431A83F4.8060206@bigpond.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <431A83F4.8060206@bigpond.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

vk4akm wrote:

> G'day Folks
> This might be a real dumb question but how do I get ax25 to work on a 
> Suse 9.3 PC.
> The AX25-Howto is a little confusing.
> I assumed with a late model Kernel the compiling a Kernel for ax25 is 
> not required.
> So I stepped on to the next stage, downloaded and installed the 
> appropriate rpms for libax25, ax25-tools, ax25-apps and soundmodem.
> What to do next?
>
> I have Gmfsk working fine on the PC so the soundcard radio link etc is 
> working.
>
> Any help to push me in the right direction would be appreciated.

Just for info, you don't need any ax25 support running to use Gmfsk.  
Gmfsk is a terminal program that sends sounds out on your soundcard to 
the radio.  It would actually conflict with ax25 if you were using your 
soundcard as a network interface.

Dave.
VA3BHF
