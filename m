From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: What happened to mkiss module
Date: Mon, 25 Jul 2005 16:38:42 -0400
Message-ID: <20050725203842.GJ2814@linux-mips.org>
References: <000c01c59018$a50ec2b0$a4011fac@kb2ear1> <20050724084523.GA3130@linux-mips.org> <000801c590cd$3f3572d0$a4011fac@kb2ear1> <20050725133658.GB2814@linux-mips.org> <007301c5914b$0a226c50$a4011fac@kb2ear1> <20050725193914.GH2814@linux-mips.org> <000e01c59154$3f29c6b0$a4011fac@kb2ear1>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000e01c59154$3f29c6b0$a4011fac@kb2ear1>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Weis <kb2ear@kb2ear.net>
Cc: linux-hams@vger.kernel.org

On Mon, Jul 25, 2005 at 04:05:46PM -0400, Scott Weis wrote:

> I grabbed the message directly off of the server with VI. I only had one 
> rej..

Okay.  That's more the expected behaviour due to the change in 2.6.12-rc4.

> I applied the last part of the patch by hand.. No problems..  I found 
> references to the SIOCSIFHWADDR: Invalid argument problem on the web and it 
> seems to be a problem with the ax25 module not being seen.  So I was 
> thinking that perhaps there is something missing from the /dev?
> 
> Should  I have any udev config entries??

No.  That should result in a different error message.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
