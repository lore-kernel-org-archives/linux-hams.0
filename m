From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Port not active?
Date: Sun, 25 Aug 2002 18:26:34 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020825182634.A10799@pull.privacy.nb.ca>
References: <200208250845.59571.pdickson@att.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200208250845.59571.pdickson@att.net>; from pdickson@att.net on Sun, Aug 25, 2002 at 08:45:59AM +0000
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pd <pdickson@att.net>
Cc: linux-hams@vger.kernel.org

On Sun, Aug 25, 2002 at 08:45:59AM +0000, pd wrote:
> I am having the following problem getting AX.25 going on my 2.4.18 RedHat 
> system.  The TNC is connected and in KISS mode.  The kernel modules "ax25" 
> and "mkiss" are loaded.  /etc/ax25/axports has appropriate stuff in it.  I 
> give the kissattach command and it completes ok.  ifconfig shows the port UP 
> and RUNNING in AX25 mode, with the correct HWaddr.
> 
> But when I try to use it, for example with a "call" command, I get the 
> messages:
>   axconfig: port vhf not active
>   call: no AX.25 port data configured

Could you send us your axports file, the kissattach command, and the
actual call command.

E.g.

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
vhf     VE1MCT-8        9600    255     2       144.090 MHz (1200  bps)

root@ve1mct# /usr/sbin/kissattach -m 256 /dev/ttyS0 vhf vhf.ve1mct.ampr.org

ve1mct@ve1mct$ call vhf ve1aeh


