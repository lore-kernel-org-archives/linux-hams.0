From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: Port not active?
Date: Sun, 25 Aug 2002 15:57:33 +0200 (CEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0208251555240.3854-100000@zoef.pe1icq.ampr.org>
References: <200208250845.59571.pdickson@att.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200208250845.59571.pdickson@att.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pd <pdickson@att.net>
Cc: linux-hams@vger.kernel.org

On Sun, 25 Aug 2002, pd wrote:

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
>
> Am I missing a step somewhere?

Did you assign an IP address to the port? You need to give it an IP
address, even if you don't use IP.
You could use 10.0.0.1 if you don't have an IP address assign to you.

73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org


