From: Mike Markowski <mm@UDel.Edu>
Subject: gMFSK compile problem
Date: Wed, 28 Jan 2004 15:06:09 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040128200609.GA19299@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

Hi all,

I'm trying to compile gmfsk-0.6beta2 but have run into a problem,
a small one I think.  My config line (on RedHat 9) is

configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-hamlib

and I get 

checking for libgnomeui-2.0 hamlib... Package libgnomeui-2.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `libgnomeui-2.0.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libgnomeui-2.0' found
 
 configure: error: Library requirements (libgnomeui-2.0 hamlib) not met; consider adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a nonstandard prefix so pkg-config can find them.

Anyone have a solution?  I'm not sure what a .pc file is.  Thanks!

	Mike  AB3AP
