From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: ANN: gMFSK v0.6beta1
Date: Sun, 26 Oct 2003 17:53:16 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1067183596.1290.49.camel@oh2bns.ampr.org>
References: <1067119345.1305.73.camel@oh2bns.ampr.org>
	 <200310261112.57045.wjuergens@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200310261112.57045.wjuergens@t-online.de>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Sun, 2003-10-26 at 12:12, Wolf-Ruediger Juergens wrote:

> Only one glitch, changing the feldhell font, I have to restart the program 
> to use the selected font. 

Yes, this is a "feature". You can also switch to another modem and then
back to Feldhell. A restart of the program is not needed, only restart
of the Feldhell modem...

I will have to figure out something for this. (The other modems have
a "restart modem" button in the config dialog. This isn't particularly
cool solution either...)

> >  - The FFT library (FFTW) now uses "wisdom" to optimize CPU consumption.
> >    User will notice that the first time a modem is used, there will be
> >    a few seconds delay.

I forgot to mention that for wisdom saving to work, the user has to
create a directory in his home dir: ~/gMFSK/. Without this, saving the
wisdom fails and the annoying training delay repeats every time you
use the software.

I will probably add a "first use wizard" that asks the user a few
basic questions and makes sure this directory exists.

-- 
Tomi Manninen / OH2BNS / KP20ME04

