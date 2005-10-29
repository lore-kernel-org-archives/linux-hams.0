From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: FW: KPSK install problem
Date: Sat, 29 Oct 2005 21:15:32 +0100
Message-ID: <20051029201532.GE6653@linux-mips.org>
References: <MBEEJPNKIJCJGNMGGBLBCEJECFAA.henk@oegema.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <MBEEJPNKIJCJGNMGGBLBCEJECFAA.henk@oegema.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henk Oegema <henk@oegema.com>
Cc: linux-hams@vger.kernel.org

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
