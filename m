From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: Baycom modem and simple text ui
Date: Tue, 9 Aug 2005 22:16:47 -0700
Message-ID: <40764501050809221659a68f79@mail.gmail.com>
References: <4076450105080900355ec82283@mail.gmail.com>
	 <20050809165120.GA20715@oz.net>
	 <407645010508091213efc990f@mail.gmail.com>
	 <20050809221825.GA22193@oz.net>
	 <4076450105080915267ba96108@mail.gmail.com>
	 <20050809225635.GA25284@oz.net>
	 <40764501050809164372d02e7d@mail.gmail.com>
	 <20050810004406.GA25600@oz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050810004406.GA25600@oz.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 09/08/05, Bob Nielsen <nielsen@oz.net> wrote:
> Not really (I use a KISS TNC, not a Baycom modem).  Do you have AX.25
> networking set up and does the interface show up with ifconfig?  Section
> 6.1.4 of the AX25-HOWTO (which may not be completely up-to-date for 2.6
> kernels) should be helpful, as well as 'man sethdlc'.
> 
> Bob, N7XY

Well, now listen seems to be displaying RX packets, but call still
wont work. Here is what ifconfig shows:

bcsh0     Link encap:AMPR AX.25  HWaddr KG6THI-2
          UP RUNNING  MTU:256  Metric:1
          RX packets:9 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:16
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:4 Base address:0x3f8

Cheers,
jonathan - kg6thi
