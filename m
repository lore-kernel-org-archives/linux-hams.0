From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: kissattach and kernel 2.6
Date: Sat, 4 Jun 2005 23:58:17 +0100
Message-ID: <20050604235817.A20050@pull.privacy.nb.ca>
References: <32946.83.73.68.20.1117910443.squirrel@www.amsat.dk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <32946.83.73.68.20.1117910443.squirrel@www.amsat.dk>; from oz6bl@amsat.dk on Sat, Jun 04, 2005 at 06:40:43PM -0000
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oz6bl@amsat.dk
Cc: linux-hams@vger.kernel.org

On Sat, Jun 04, 2005 at 06:40:43PM -0000, oz6bl@amsat.dk wrote:
> 
> What I have is this: My distribution is SUSE 9.2 with a 2.6.8 kernel. The
> AX.25 tools are version 0.0.8 and the AX.25-apps are 0.0.6. My modem is a
> DSP-12 in kiss mode attached to /dev/ttyS0. My PC has a Pentium 4 and I
> normally run a SMP version, but since I learned that e.g. mkiss doesn't
> work with SMP, I use a mono-CPU version ('default' in SUSE terms). I can
> configue an ax0 interface with kissattach ('kissattach -l /dev/ttyS0 asy
> 44.145.40.3'), but I can't get listen to display any packets, in fact
> 'ifconfig' doesn't show any packets received. I have seen some patches
> mentioned, but they appear to apply to mkiss in userland so I am really at
> a loss as to what to do.

I would suggest using the ax25 packages from CVS, there are some small
fixes for linux 2.6.x. Admitly, I've not done much to test it since I don't 
have a running packet station since my last move.

Hope that helps.
-ve3tix (formerly ve1mct)
