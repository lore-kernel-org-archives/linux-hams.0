From: Stephane Fillod <f8cfe@free.fr>
Subject: Re: Yaesu CAT issues
Date: Sat, 17 Jan 2004 00:18:16 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040116231816.GP1054@charybde.local>
References: <20031227131724.WWFM19387.mta05-svc.ntlworld.com@[10.137.100.72]>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20031227131724.WWFM19387.mta05-svc.ntlworld.com@[10.137.100.72]>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxham@ntlworld.com
Cc: linux-hams@vger.kernel.org, Hamlib developers <hamlib-developer@lists.sourceforge.net>

Hi Steve,

It seems your issue is related to Hamlib, so I cross-post also to
hamlib-developer mailing list.

On Sat, Dec 27, 2003, linuxham@ntlworld.com wrote:
> I have an issue using my FT817 on my linux box. Initially I was using mserver to share the serial port to allow remote access from a windows PC. This didn't function properly with the 817 but worked fine with my Icom PCR1000. To eliminate any issues with the mserver installation I've installed hamlib and used the control control within that.

I've never heard about mserver, but it looks interesting.
What is it exactly? The home site of c-mserver looks down.

> On the pcr1000 it works fine:-
> 
> ./rigctl -vvvvv -s 9600 -r /dev/ttyS5 -m 401
> rigctl, Hamlib version 1.1.4
[...]

> But the 817 doesn't:-
> 
> ./rigctl -vvvvv -s 4800 -r /dev/ttyS4 -m 120
> rigctl, Hamlib version 1.1.4
[...]
> Rig command: f
> TX 5 bytes
> 0000     00 00 00 00 03 .....
> RX 5 bytes
> 0000     80 80 80 80 10 .....
> Frequency: 808080800

This is really odd. 

By any chance, is your CAT interface powered by the serial port?
In such a case, you may have to force RTS/DTR signal from rigctl.
This is explained in http://hamlib.org/faq.html

Some work has been done on the ft817 backend lately. You may want to try the
hamlib-1.1.5pre2 and help make sure the forthcoming 1.1.5 release is
working fine with your radio. The tar ball is at http://hamlib.org/bleeding-edge/

Reports to the hamlib-developer mailing list are very welcome.

> ----
> 
> FWIW the 817 works fine on my laptop running windows. I've also tried different serial speeds (changing the relevant speed on the radio too). I've also tried ttyS1, ttyS4 and ttyS5 to eliminate any issues with a specific serial port. I have several serial devices connected to the machine (modem, pcr1000, ups) and these all function perfectly.

What kind of system are your running? Which Linux distro? Any exotic 
laptop manufacturer? USB port?

> I've had the 817 working on the this machine with exactly the same hardware config before now. The only thing which has changed recently is I've upgraded the kernel to 2.6.0 - I've yet to try downgrading back to 2.4 but it seems unlikely this is the problem given everything else works fine.

Did the 2.4 downgrading changed behaviour?

> 73
> 
> Steve G8ZQO


Cheers,

Stephane F8CFE
