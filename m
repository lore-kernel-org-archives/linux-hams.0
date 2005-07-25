From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: What happened to mkiss module
Date: Mon, 25 Jul 2005 15:39:15 -0400
Message-ID: <20050725193914.GH2814@linux-mips.org>
References: <000c01c59018$a50ec2b0$a4011fac@kb2ear1> <20050724084523.GA3130@linux-mips.org> <000801c590cd$3f3572d0$a4011fac@kb2ear1> <20050725133658.GB2814@linux-mips.org> <007301c5914b$0a226c50$a4011fac@kb2ear1>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <007301c5914b$0a226c50$a4011fac@kb2ear1>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Weis <kb2ear@kb2ear.net>
Cc: linux-hams@vger.kernel.org

On Mon, Jul 25, 2005 at 02:59:52PM -0400, Scott Weis wrote:

> OK now when I run kissattach I get:
> 
> kissattach: SIOCSIFHWADDR: Invalid argument
> 
> and in dmesg:
> unregister_netdevice: device ax%d/c1b95c00 never was registered
> 
> Would all of this go away in 2.6.13.rc4??  Where can I get it.. I can only 
> find rc3

I'm sorry, I meant 2.6.12-rc4 or newer.  You said you were trying to apply
the patch to 2.6.12 but had rejects.  That generally happens with broken
mailers such as Mozilla that garble patches.

  Ralf
