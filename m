From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Error compiling aprsd-2.2.5-15
Date: Tue, 17 Apr 2007 16:28:35 +0200
Message-ID: <4624D993.1060006@ccr.jussieu.fr>
References: <20070313115537.GA10921@linux-mips.org> <20070324.125436.115921208.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20070324.125436.115921208.davem@davemloft.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-hams@vger.kernel.org

Hi All,

Is aprsd-2.2.5-15.tar.gz the last available source for aprsd ?

I did ./configure without problem but got g++ warning and the following
error :

deprecated header <iostream.h>. To disable this warning use -Wno-deprec=
ated.
aprsString.h:199: error: extra qualification =91aprsd::aprsString::=92 =
on
member =91getMsgText=92

I also tried CVS source tree but got stuck as running autoconf to make =
a
configure file gave error :

configure.ac:8 error: possibly undefined macro: AM_INIT_AUTOMAKE

Can someone help ?

73 de Bernard, f6bvp
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
