From: Jarmo <oh1mrr@nic.fi>
Subject: AX25-tools-0.0.8
Date: Mon, 17 May 2004 17:47:04 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200405171747.04709.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi

I have asked this propably before,but again then..
Anyaone else tried to compile tools 0.0.8 with
2.6.X kernels?
If I try I get:

make[3]: Entering directory `/usr/local/ax25-tools-0.0.8/hdlcutil'
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=\""/usr/local/etc/ax25/"\" 	
   -DAX25_LOCALSTATEDIR=\""/usr/local/var/ax25/"\"     -g -O2 -Wall -c 
sethdlc.cIn file included from sethdlc.c:46:
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

First what I noticed,there is NOT such a file as soundmodem.h...
Left away in purpose or is it same as souncard.h?

But seems anyway,that hdlcutils are buggy...

Anyone could help?

Jeroen McGyver?...;-)

Jarmo
