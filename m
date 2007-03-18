From: don <don_reid@comcast.net>
Subject: Re: soundmodem problem with ./configure
Date: Sun, 18 Mar 2007 09:03:50 -0700
Message-ID: <20070318160350.GA19979@reid1.localdomain>
References: <45FD2F4F.5060302@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45FD2F4F.5060302@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Sun, Mar 18, 2007 at 01:23:43PM +0100, Bernard Pidoux wrote:
> Hi,
> 
> An OM from a RadioClub had some warning when doing ./configure
> before compiling soundmodem.

For now this is just a warning, it should still compile.  In the long
run someone needs to fix the packages configure script.  The last line
you posted "checking for linux/ax25.h... yes" shows that it is still
acting like it was happy with this file (for now).

The configure script builds a small c program that includes the
file to be tested and sees if there are errors when it is compiled.
Apparently this test program isn't good enough for that file (on your
system).

Look in "config.log".  That will show the test program, the command used
and the results.  

For example I see the same error with "if.h" and see this in config.log:

------------------------------------
configure:7197: checking linux/if.h usability
configure:7209: gcc -c -g -O2  conftest.c >&5
In file included from conftest.c:72:
/usr/include/linux/if.h:162: error: field 'ifru_addr' has incomplete type
/usr/include/linux/if.h:163: error: field 'ifru_dstaddr' has incomplete type
/usr/include/linux/if.h:164: error: field 'ifru_broadaddr' has incomplete type
/usr/include/linux/if.h:165: error: field 'ifru_netmask' has incomplete type
/usr/include/linux/if.h:166: error: field 'ifru_hwaddr' has incomplete type
configure:7215: $? = 1
configure: failed program was:
| /* confdefs.h.  */
...
| #include <linux/if.h>
configure:7238: result: no
configure:7242: checking linux/if.h presence
configure:7252: gcc -E  conftest.c
configure:7258: $? = 0
configure:7278: result: yes
configure:7291: WARNING: linux/if.h: present but cannot be compiled
configure:7293: WARNING: linux/if.h:     check for missing prerequisite headers?
configure:7295: WARNING: linux/if.h: see the Autoconf documentation
configure:7297: WARNING: linux/if.h:     section "Present But Cannot Be Compiled"
configure:7299: WARNING: linux/if.h: proceeding with the preprocessor's result
configure:7301: WARNING: linux/if.h: in the future, the compiler will take precedence
configure:7313: checking for linux/if.h
configure:7320: result: yes
------------------------------------

Yet soundmodem compiles just fine (although there are far too many
warnings).

Don - W7DMR
