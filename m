From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: RE: insmod mkiss
Date: Mon, 27 May 2002 14:14:35 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0205271336360.2154-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.21.0205270633120.15697-100000@Consulate.UFP.CX>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0205270633120.15697-100000@Consulate.UFP.CX>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams Mailing List <linux-hams@vger.kernel.org>

On Mon, 27 May 2002, Riley Williams wrote:

> > Which brings up another point. Why if I include the
> > ax25/mkiss/netrom modules in /etc/modules.conf don't they appear
> > when running lsmod after boot up?
> 
> /etc/modules.conf only states the options to be applied to modules if
> they get loaded, and not which modules to load. The kernel module daemon
> kmod is supposed to handle that, but it sounds like either it has
> problems with the ax.25 modules or you don't have it loaded.

Of course modules.conf also acts as a "translation table" between stuff
requested by the kernel and module names. So as an example, if you do a
"kissattach" you actually request the kernel to set a special "line
discipline" number 5 to a serial line (tty). The kernel checks if it knows
how to do that and if the mkiss module is not loaded yet it fails. The
kernel then asks kmod to do something. Kmod runs modprobe with suitable
options (something like "modprobe -s -k tty-ldisc-5").

Now it is modprobe that then consults /etc/modules.conf and 
/lib/modules/*/modules.dep to solve what module(s) it should load and with 
what options. And here you must help modprobe. There is no way modprobe 
would know what to do when it is requested to load "tty-ldisc-5" and so 
you must give it a hint:

  alias tty-ldisc-5 mkiss
  alias tty-ldisc-7 6pack

After that it will know to load the mkiss module (or 6pack module if you
are doing a "spattach"). The trick is knowing what to put in modules.conf
as there are various ways the kernel might request the service. You 
might want to have in there:

  alias ax0 ax25
  alias nr0 netrom
  alias rs0 rose

So that a "ifconfig <name>" ends up loading the proper module. Also

  alias net-pf-3 ax25
  alias net-pf-6 netrom
  alias net-pf-11 rose

could be useful so that any protocol family operation loads the correct 
protocol module.

To get all those situations right you will need to examine your system
logs and see if there are messages with "modprobe: Can't locate module
..." and then try to figure out what module would solve that failed
request (/usr/src/linux/Documentation/ _might_ give hints on that).

Also one should read the modprobe(8) and modules.conf(5) manual pages.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

