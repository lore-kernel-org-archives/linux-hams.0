From: Cathryn Mataga <cathrynm@junglevision.com>
Subject: Re: kissattach/kissnetd versus ptyq ttyq and ptmx/pts
Date: Thu, 06 Jul 2006 13:33:32 -0700
Message-ID: <44AD739C.1060203@junglevision.com>
References: <001801c6a10f$c33b1b90$2800a8c0@office>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001801c6a10f$c33b1b90$2800a8c0@office>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Robert Jenkins wrote:
> I'm running AX25 on a Centos 4.3 system with kernel 2.6.16 and it works
> well.
>
> You can enable the pty devices in the kernel config under 
> Device Drivers > Character Devices > Legacy (BSD) PTY Support

Yeah, this was the problem.  I missed this option I guess.  Thanks for 
the replies
from everyone.  I recompiled and now kissattach is behaving well.   I 
just went in
the kernel and turned on ham radio, oops.  Maybe I'll make some notes on 
my website, how
"Legacy PTY" is needed. 

I guess as long as this Legacy PTY stuff is still around this isn't a 
huge problem.
Am going to now move on to the rest of the setup.


