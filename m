From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: soundmodem/ax25 newbie questions.
Date: Tue, 1 Apr 2003 00:41:56 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0304010034500.1411-100000@oh2bns.ampr.org>
References: <03033119574904.04308@unix.pa3gcu>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <03033119574904.04308@unix.pa3gcu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

On Mon, 31 Mar 2003, pa3gcu wrote:

> On Sunday 30 March 2003 09:18, Aaron May wrote:

> > sm[1187]: ioctl: TIOCSETD: Invalid argument (22).
> 
> I did not reply to this one because i dont use a soundcard at all for packet, 
> however considering i've seen no replys i will tell you what,
> "ioctl: TIOCSETD" normally means, it means that at the time you gave the 
> command no mkiss was found in your kernel or no mkiss module was loaded.
> I hope i am correct here as i dont know what "Invalid argument (22)" is, i 
> did a quick search in the kernel source but it showed nothing.

22 is the error number for EINVAL or "Invalid argument" (in i386 anyway).
See the "errno" manual page and /usr/include/asm/errno.h.

Anyway Richard's diagnose is probably right.

> If your mkiss support is in module form then you need to have the following 
> in your /etc/modules.conf file.
> 
> alias tty-ldisc-5 mkiss 

Also Aaron could try to load it explicitly with "modprobe mkiss".

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

