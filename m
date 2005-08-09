From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Baycom modem and simple text ui
Date: Tue, 9 Aug 2005 15:56:35 -0700
Message-ID: <20050809225635.GA25284@oz.net>
References: <4076450105080900355ec82283@mail.gmail.com> <20050809165120.GA20715@oz.net> <407645010508091213efc990f@mail.gmail.com> <20050809221825.GA22193@oz.net> <4076450105080915267ba96108@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4076450105080915267ba96108@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Aug 09, 2005 at 03:26:12PM -0700, Jonathan Lassoff wrote:
> Well, I'll still take a look around and see what I can't do. I would
> really like to run tfkiss because it sounds like exactly what I want
> to do, but just can't get it to compile. Essentially I want to have my
> computer be at least a minimal tnc console with my "dumb" modem. I
> just want the software to send and receive the proper AX.25 frames
> with the text body attached in the packet.

I'm not sure if tfkiss will do what you want, but possibly it will.  I 
suspect the compilation problems may relate to it being written for an 
earlier version of gcc.  You could probably do something with several 
xterms, one running call, another running listen, etc.  Screen may work 
if you don't want to use X.

> As for the SSH, I just wanted to control the packet station over my
> home network over SSH so that I don't have to be at the radio. I don't
> want to encapsulate SSH over AX.25 links. That would be illegal in my
> jurisdiction.

That is how I access the packet computer in my shack from inside 
my house and should work fine.  

Good luck.  

Bob

-- 
Bob Nielsen, N7XY                          n7xy (at) n7xy.net
Bainbridge Island, WA                      http://www.n7xy.net
 
