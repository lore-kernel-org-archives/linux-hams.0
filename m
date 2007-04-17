From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Error compiling aprsd-2.2.5-15
Date: Tue, 17 Apr 2007 09:08:20 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0704170841280.12032@eskimo.com>
References: <20070313115537.GA10921@linux-mips.org>
 <20070324.125436.115921208.davem@davemloft.net> <4624D993.1060006@ccr.jussieu.fr>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4624D993.1060006@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Tue, 17 Apr 2007, Bernard Pidoux wrote:

> Is aprsd-2.2.5-15.tar.gz the last available source for aprsd ?

If you're talking SourceForge aprsd, then yes, it appears so.
Others have released aprsd before as well, typically doing so by
adding their callsign into the package name if they did mods.


> I did ./configure without problem but got g++ warning and the following
> error :
>
> deprecated header <iostream.h>. To disable this warning use -Wno-deprecated.
> aprsString.h:199: error: extra qualification ?aprsd::aprsString::? on
> member ?getMsgText?

I'm not a C++ guy so I can't help you there.  If it were me I'd try
looking at the header files and the source code to see where the
mismatch was.


> I also tried CVS source tree but got stuck as running autoconf to make a
> configure file gave error :
>
> configure.ac:8 error: possibly undefined macro: AM_INIT_AUTOMAKE

You might need to update your version of "automake" and "autoconf"
on that box.  Or downgrade them.  Note that they work well as a
pair, so sometimes upgrading/downgrading one will require you to do
the same to the other package to make things work smoothly.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
