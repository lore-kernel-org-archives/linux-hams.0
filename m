From: Henk Oegema <on4hso@amsat.org>
Subject: KPSK won't 'make'
Date: Tue, 15 Nov 2005 22:59:02 +0100
Message-ID: <200511152259.02918.on4hso@amsat.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

I've downloaded KPSK version 1.0.1

Command ./configure executed OK

Command make gives me following error messages:
logcore.cpp
logcore.cpp: In constructor `logCore::logCore()':
logcore.cpp:33: error: cannot convert `char*' to `DB_TXN*' in argument
passing
logcore.cpp:40: error: cannot convert `char*' to `DB_TXN*' in argument
passing
make[3]: *** [logcore.o] Error 1
make[3]: Leaving directory `/home/henkoegema/ham/kpsk-1.0.1/kpsk'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/henkoegema/ham/kpsk-1.0.1/kpsk'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/henkoegema/ham/kpsk-1.0.1'
make: *** [all] Error 2
henkoegema@linux:~/ham/kpsk-1.0.1>  

I have no idea how to solve these errors.

Help much apprciated.

73, ON4HSO
Henk
http://users.telenet.be/henk.oegema
