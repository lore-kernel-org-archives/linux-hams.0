From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: gMFSK compile problem
Date: Wed, 28 Jan 2004 22:13:29 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1075320809.2433.16.camel@oh2bns.ampr.org>
References: <20040128200609.GA19299@strauss.udel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040128200609.GA19299@strauss.udel.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Markowski <mm@UDel.Edu>
Cc: Linux Hams <linux-hams@vger.kernel.org>

On Wed, 2004-01-28 at 22:06, Mike Markowski wrote:

> checking for libgnomeui-2.0 hamlib... Package libgnomeui-2.0 was not found in the pkg-config search path.
> Perhaps you should add the directory containing `libgnomeui-2.0.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'libgnomeui-2.0' found
>  
>  configure: error: Library requirements (libgnomeui-2.0 hamlib) not met; consider adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a nonstandard prefix so pkg-config can find them.
> 
> Anyone have a solution?  I'm not sure what a .pc file is.  Thanks!

You need to install the libgnomeui-devel package. It contains the .pc
and other files needed when compiling gMFSK.

-- 
Tomi Manninen / OH2BNS / KP20ME04

