From: Jarmo <oh1mrr@nic.fi>
Subject: Compilin ax25-tools
Date: Thu, 12 Feb 2004 17:21:04 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200402121721.04609.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi
I have gcc-3.3.2
linux-2.6.2
In MDK 10-beta

Now I tried to compile ax25-tools-0.0.8,got following errors...

make[2]: Leaving directory `/usr/local/ax25-tools-0.0.8/ax25'
Making all in hdlcutil
make[2]: Entering directory `/usr/local/ax25-tools-0.0.8/hdlcutil'
Making all in fl
make[3]: Entering directory `/usr/local/ax25-tools-0.0.8/hdlcutil/fl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/usr/local/ax25-tools-0.0.8/hdlcutil/fl'
make[3]: Entering directory `/usr/local/ax25-tools-0.0.8/hdlcutil'
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\" 	   
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -c sethdlc.c
In file included from sethdlc.c:46:
hdrvcomm.h:45:30: linux/soundmodem.h: No such file or directory
In file included from sethdlc.c:46:
hdrvcomm.h:107: warning: `struct sm_ioctl' declared inside parameter list
hdrvcomm.h:107: warning: its scope is only this definition or declaration, 
which is probably not what you want
hdrvcomm.h:109: warning: `struct sm_diag_data' declared inside parameter list
sethdlc.c: In function `main':
sethdlc.c:481: error: storage size of `bsi' isn't known
sethdlc.c:551: error: `SMCTL_GETDEBUG' undeclared (first use in this function)
sethdlc.c:551: error: (Each undeclared identifier is reported only once
sethdlc.c:551: error: for each function it appears in.)
sethdlc.c:481: warning: unused variable `bsi'
make[3]: *** [sethdlc.o] Error 1
make[3]: Leaving directory `/usr/local/ax25-tools-0.0.8/hdlcutil'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/usr/local/ax25-tools-0.0.8/hdlcutil'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/local/ax25-tools-0.0.8'
make: *** [all-recursive-am] Error 2
[root@oh1mrr ax25-tools-0.0.8]# 

The sounmodem can't be found,but there is soundcard.h file instead.
But chanching to that does not  help much.

Who can help?

Jarmo

