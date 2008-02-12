From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: [BUG] [AX25] in libax25
Date: Tue, 12 Feb 2008 13:20:11 +0200
Message-ID: <20080212112011.GC2537@mea-ext.zmailer.org>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr> <20071008134447.GA30451@cloud.net.au> <47B1779B.3000600@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47B1779B.3000600@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux F6BVP <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org

On Tue, Feb 12, 2008 at 11:40:27AM +0100, Bernard Pidoux F6BVP wrote:
> Hi,
>
> I found a bug in libax25./proc/net/rose_neigh "use" field not read by
> read_proc_rs_neigh and was missing in struct declaration.
>
> For ROSE FPAC application development with 2.6 kernel I needed to check 
> 'restart' in rose_neigh and found that it was not correctly read by the 
> library.I was getting 'mode' state instead of 'restart. This was because
> 'use' field was not taken into account. Of course, t0 and tf timers were
> also no read correctly.
>
> Here is an extract of ChangeLog file.
>
> libax25 0.0.11.4
>         * BUG in procutils.h and procutils.c
>           in structure proc_rs_neigh field "use" was missing,
>           in function read_proc_rs_neigh proc_rs_neigh use was not read,
>           corrected.
>
> Patched libax25 package can be downloaded from here :
>
> http://f6bvp.free.fr/logiciels/ax25/libax25-0.0.11.4src_f6bvp.tgz

I merged your fix to my libax25 changes:

  http://ham.zmailer.org/oh2mqk/libax25/libax25-0.0.13-6.tar.gz

the package is buildable in RPM systems with command:

   rpmbuild -tb libax25-0.0.13-6.tar.gz

and something similar in Debian systems.


I did rewrite the  ax25_config_load_ports()  (and nr- and rose-versions too)
so that there is no longer mandatory need to have IP addresses in interfaces,
and those functions still find all AX25/NETROM/ROSE ports that system has.

I have in that same directory also  ax25-tools  where  kissattach does not
mandate IP address, and mkiss has changed radically -- not that I have had
opportunity to test the mkiss properly.  (mkiss uses dynamic pty:s and forks
individual kissattach commands for demuxed sub-interfaces.)

> After compiling new libraries, AX25 applications must be re-compiled too 
> and restarted in order to take into account the newly built libax25.

.. unless they are dynamically linked, where just restart is enough after
rebuilt library is installed.

> 73 de Bernard, f6bvp

73 de Matti, OH2MQK
