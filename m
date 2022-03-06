From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Kernel freeze on killall kissattach
Date: Sun, 6 Mar 2022 09:14:48 -0800
Message-ID: <ca12cec2-3301-2926-f04a-cf8103af72e8@trinnet.net>
References: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <e037cff4-87fa-ce95-438d-66be0754c6b2@blackspace.at>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roland Schwarz <roland.schwarz@blackspace.at>, linux-hams@vger.kernel.org


Hello Roland,

You're correct, a Linux machine should never crash.  Would it be 
possible for you to take a screen capture of the CONSOLE screen of the 
machine you kill kissattach on?  To get to this view (depending on your 
Linux distribution), you would hit the control-alt-F1 key or say 
control-alt-F3 on say Ubuntu 20.04 to see a text only login console 
(VTY).  At that point, remotely log into the machine running kissattach 
via SSH and then kill the kissattach process.

After you can observe the kernel panic screen in the text CLI view, you 
will need to enable kernel panic debugging.  One example of this for 
u20.04 is here:

    https://ubuntu.com/server/docs/kernel-crash-dump

--David
KI6ZHD


On 03/06/2022 06:18 AM, Roland Schwarz wrote:
> Dear All,
>
> please correct me if I am wrong, but as I understand it should not be 
> possible to trigger a kernel freeze by just killing user space processes.
>
> While trying to understand a certain behavior of the ax25 driver I 
> came up with a small test case which I ran in a virtual machine (KVM):
>
> First I tried with a kernel from Linus tree:
>
> uname -r
> 5.17.0-rc6+
>
> cat /etc/ax25/axports
> ax0     OE1RSA-0        115200  255     7       Test A
> ax1     OE1RSA-1        115200  255     7       Test B
>
> sudo kissattach /dev/ptmx ax0
> AX.25 port ax0 bound to device ax0
> Awaiting client connects on
> /dev/pts/1
>
> sudo kissattach /dev/pts/1 ax1
> AX.25 port ax1 bound to device ax1
>
> axcall ax1 OE1RSA-0
>
> Now in a second terminal:
> sudo killall kissattach
>
> First terminal:
> GW4PTS AX.25 Connect v1.11
> Trying...
> *** Connected to OE1RSA-0
> *** Cleared
>
> ==> But: Kernel freezes
>
> I can see this behaviour also in the debian kernel:
>
> uname -r
> 5.10.0-11-amd64
>
> This kernel also freezes. I suspect this to be a bug because if I try 
> to reboot the machine instead of the killall command the machine does 
> not shut off and reboot which is a problem with a remotely installed 
> system.
>
> Any ideas?
>
> 73 de Roland oe1rsa
>

