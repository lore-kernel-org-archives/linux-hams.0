From: Bob Nielsen <nielsen@oz.net>
Subject: Re: sm0 and 2.4.18 kernel
Date: Thu, 24 Jun 2004 20:35:55 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040625033555.GB9625@office.n7xy.net>
References: <40D9CDAB.25542.1053DDE@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40D9CDAB.25542.1053DDE@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sir.archibald.sinclair@ntlworld.com
Cc: linux-hams@vger.kernel.org

On Wed, Jun 23, 2004 at 06:36:27PM -0000, sir.archibald.sinclair@ntlworld.com wrote:
> 
> 	I'm wanting to upgrade my kernel to 2.4.18 (from 2.2.16)
> 
> 	I seem to remember reading somewhere that the AX25 
> stuff doesn't run on these more recent kernels. Is this true ?
> 
> 	I've built a 2.4.18 kernel here and tried booting it but it 
> came up with all sorts of errors concerning sm0, and it's so long 
> ago since I installed all this sound modem stuff I can't remember 
> what's responsible for this device.
> 
> 	So two questions..
> 1) Will the Ax25 utils etc run OK on a 2.4.18 kernel
> 2) Why is the kernel complaining about sm0 - it says it can't locate 
> the module sm0 - but the module isn't actually called that from what 
> I remember.
> 
> 	In brief I simply took the old .config file from the running 
> 2.2.16 system, and saved it prior to doing a make dep, etc
> 
> 

I'm not using the soundmodem driver, but that module is sm.o.  I have
seen several suggestions to use the user mode soundmodem binary rather
than the kernel module.  There is probably a link to that at
<http://radio.linux.org.au>.

I believe that AX.25 had some problems with early 2.4.x kernels, but I 
have run 2.4.20 through 2.4.26 with no problems.  I recommend that you 
use 2.4.26, rather than 2.4.18.

When using an old .config file, it is usually a good idea to run 'make 
oldconfig', which will ask you about newer options.

73, Bob N7XY
