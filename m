From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Baycom modem and simple text ui
Date: Tue, 9 Aug 2005 17:44:06 -0700
Message-ID: <20050810004406.GA25600@oz.net>
References: <4076450105080900355ec82283@mail.gmail.com> <20050809165120.GA20715@oz.net> <407645010508091213efc990f@mail.gmail.com> <20050809221825.GA22193@oz.net> <4076450105080915267ba96108@mail.gmail.com> <20050809225635.GA25284@oz.net> <40764501050809164372d02e7d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40764501050809164372d02e7d@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Aug 09, 2005 at 04:43:36PM -0700, Jonathan Lassoff wrote:
> On 09/08/05, Bob Nielsen <nielsen@oz.net> wrote:
> > I'm not sure if tfkiss will do what you want, but possibly it will.  I
> > suspect the compilation problems may relate to it being written for an
> > earlier version of gcc.  You could probably do something with several
> > xterms, one running call, another running listen, etc.  Screen may work
> > if you don't want to use X.
> > 
> > Good luck.
> > 
> > Bob
> 
> Do you have any idea as to why it failed to open the port when I tried
> to run call or listen?

Not really (I use a KISS TNC, not a Baycom modem).  Do you have AX.25 
networking set up and does the interface show up with ifconfig?  Section 
6.1.4 of the AX25-HOWTO (which may not be completely up-to-date for 2.6 
kernels) should be helpful, as well as 'man sethdlc'.

Bob, N7XY
