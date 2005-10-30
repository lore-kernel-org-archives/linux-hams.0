From: "Henk Oegema" <henk@oegema.com>
Subject: RE: KPSK install problem
Date: Sun, 30 Oct 2005 14:29:08 +0100
Message-ID: <MBEEJPNKIJCJGNMGGBLBAEJHCFAA.henk@oegema.com>
References: <20051029201532.GE6653@linux-mips.org>
Reply-To: <henk@oegema.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051029201532.GE6653@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org



-----Oorspronkelijk bericht-----
Van: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org]Namens Ralf Baechle DL5RB
Verzonden: zaterdag 29 oktober 2005 22:16
Aan: Henk Oegema
CC: linux-hams@vger.kernel.org
Onderwerp: Re: FW: KPSK install problem


On Sat, Oct 29, 2005 at 09:40:26PM +0200, Henk Oegema wrote:

> However, I still get the same errors as before:
> (./configure was ok)
>
> logcore.h::::27:16 db.h: No such file or directory
> logcore.h:115: error: syntax error before '*' token
> logcore.h:116: error: syntax error before '*' token
> logcore.h:117: error: 'DBT' was not declared in this scope
> logcore.h:117: error: 'data' was not declared in this scope
> logcore.h:117: error: 'DBT' was not declared in this scope
> logcore.h:117: error: 'key'was not declared in this scope
> make[3]: ***[kpskmeter.o] Error 1
> make[3]: ***[all-recursive] Error 1
> make: *** [all] Error 2
> henkoegema@linux:~/kpsk-1.0.1>
>
> Any other clue ??

db.h is really /usr/include/db.h.  On FC4 that file shipes in separate
from the db4 runtime package in db4-devel.  Debian keeps them in a package
named like libdb4.3-devel or so.  I guess you only have the runtime but
development files installed.

  Ralf


You are correct Ralf. I didn't have development files installed.
I've done that now.
It looks already better, but I'm still getting some errors.(less then first
time):

logcore.cpp: In constructor 'logCore::logCore()' (in blue color)
logcore.cpp:33: error: cannot convert 'char*'to 'DB_TXN*'in argument passing
(in red color)
logcore.cpp:40: error: cannot convert 'char*'to 'DB_TXN*'in argument passing
(in red color)
make[3]: *** [logcore.o] Error 1




