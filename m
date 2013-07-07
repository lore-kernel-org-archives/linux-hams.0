From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: [PATCH] xfbbd: Run the same data files on 64-bit
Date: Sat, 06 Jul 2013 17:15:10 -0700
Message-ID: <51D8B30E.40401@junglevision.com>
References: <4CE0313C.3080804@upmc.fr> <51D738A7.1010505@junglevision.com> <0A70646B-CB6F-4FBE-8D10-767502DD78B6@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0A70646B-CB6F-4FBE-8D10-767502DD78B6@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pidoux <bernard.pidoux@upmc.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>

On 7/6/2013 2:24 PM, Pidoux wrote:
> Hi Cathryn,
>
> Thank you for your message.
> I have been using FBB 7.05e on a 64 bits machine for a while with Mandriva and somce lat year with Mageia Linux distro without problem.
 >However I never tried to import any data from a previous 32 bits 
install for I do not see any necessity to do that.

Yeah, what happened to me was I upgraded and then all my messages/users 
went away because the 64/32 bit issue.  Basically the structures for 
files suck as inf.sys (which contain the user list) use 'long'  which is 
64-bits on 64 bit systems and 32-bits on 32-bit systems.  So when you 
upgrade from 32 to 64 bits all the data is lost.

However, this change would cause issues for anyone now who has been 
64-bit since the change.   I can send again in the correct format but 
with an #ifdef  so that it can only be turned on only for people who 
need it.
