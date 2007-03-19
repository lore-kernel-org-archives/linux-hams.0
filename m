From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: soundmodem problem with ./configure
Date: Mon, 19 Mar 2007 09:45:31 +0100
Message-ID: <45FE4DAB.90405@ccr.jussieu.fr>
References: <45FD2F4F.5060302@ccr.jussieu.fr> <20070318160350.GA19979@reid1.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20070318160350.GA19979@reid1.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: don <don_reid@comcast.net>
Cc: linux-hams <linux-hams@vger.kernel.org>


don wrote:
> On Sun, Mar 18, 2007 at 01:23:43PM +0100, Bernard Pidoux wrote:
>> Hi,
>>
>> An OM from a RadioClub had some warning when doing ./configure
>> before compiling soundmodem.
> 
> For now this is just a warning, it should still compile.  In the long
> run someone needs to fix the packages configure script.  The last line
> you posted "checking for linux/ax25.h... yes" shows that it is still
> acting like it was happy with this file (for now).
> 
> The configure script builds a small c program that includes the
> file to be tested and sees if there are errors when it is compiled.
> Apparently this test program isn't good enough for that file (on your
> system).
> 
> Look in "config.log".  That will show the test program, the command used
> and the results.  
> 
> For example I see the same error with "if.h" and see this in config.log:
> 
> ------------------------------------
> configure:7197: checking linux/if.h usability
> configure:7209: gcc -c -g -O2  conftest.c >&5
> In file included from conftest.c:72:
> /usr/include/linux/if.h:162: error: field 'ifru_addr' has incomplete type
> /usr/include/linux/if.h:163: error: field 'ifru_dstaddr' has incomplete type
> /usr/include/linux/if.h:164: error: field 'ifru_broadaddr' has incomplete type
> /usr/include/linux/if.h:165: error: field 'ifru_netmask' has incomplete type
> /usr/include/linux/if.h:166: error: field 'ifru_hwaddr' has incomplete type
> configure:7215: $? = 1
> configure: failed program was:
> | /* confdefs.h.  */
> ...
> | #include <linux/if.h>
> configure:7238: result: no
> configure:7242: checking linux/if.h presence
> configure:7252: gcc -E  conftest.c
> configure:7258: $? = 0
> configure:7278: result: yes
> configure:7291: WARNING: linux/if.h: present but cannot be compiled
> configure:7293: WARNING: linux/if.h:     check for missing prerequisite headers?
> configure:7295: WARNING: linux/if.h: see the Autoconf documentation
> configure:7297: WARNING: linux/if.h:     section "Present But Cannot Be Compiled"
> configure:7299: WARNING: linux/if.h: proceeding with the preprocessor's result
> configure:7301: WARNING: linux/if.h: in the future, the compiler will take precedence
> configure:7313: checking for linux/if.h
> configure:7320: result: yes
> ------------------------------------
> 
> Yet soundmodem compiles just fine (although there are far too many
> warnings).
> 
> Don - W7DMR


Thank you for providing the above explanations.
Actually, configure fails for it is looking for GTK and it is not
installed on my system.

------------------------------
checking for gtk-config... no
checking for GTK - version >= 1.2.0... no
*** The gtk-config script installed by GTK could not be found
*** If GTK was installed in PREFIX, make sure PREFIX/bin is in
*** your path, or set the GTK_CONFIG environment variable to the
*** full path to gtk-config.
configure: error: Cannot find GTK: Is gtk-config in path?
-------------------------------

Is there any mean to avoid this error ?
Looking at configure script, GTK seems to be optional, but I did not
find how to disable it in configure ?

./configure --disable-gtktest

did not make it.


73 de Bernard, f6bvp

