From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: New Kernel
Date: Mon, 6 Dec 2004 19:23:21 +0000
Message-ID: <20041206192321.A28889@pull.privacy.nb.ca>
References: <1102337343.3133.2.camel@gb7mbc.spoo.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1102337343.3133.2.camel@gb7mbc.spoo.org>; from ian@gb7mbc.net on Mon, Dec 06, 2004 at 12:49:03PM +0000
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian J Maude <ian@gb7mbc.net>
Cc: Linux-Hams-Owner <linux-hams@vger.kernel.org>

On Mon, Dec 06, 2004 at 12:49:03PM +0000, Ian J Maude wrote:
> Hi all,
> I finally managed to get ax25d and netromd running on kernel 2.6.9 under
> FC3 :-)
> 
> audit(1102337087.341:0): avc:  denied  { read write } for  pid=3887
> exe=/usr/bin/perl path=socket:[36323] dev=sockfs ino=36323
> scontext=user_u:system_r:httpd_sys_script_t
> tcontext=user_u:system_r:httpd_t tclass=unix_stream_socket
> 

I believe that is SELinux output, and since a AX.25 is a not so common
network socket I suspect that the default permissions don't expect to
allow such a connection to be made (the thinking being that anything 
non-standard is malicious).

Of course I am just guessing here.

-ve3tix
