From: =?ISO-8859-2?Q?Kr=FCpl_Zsolt?= <hg2ecz@ha5kfu.hu>
Subject: Re: Anyone running APRSD on Slackware?
Date: Wed, 24 Mar 2004 21:50:29 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0403242138130.26322@teto.ha5kfu.hu>
References: <001401c411c2$e78de420$1400a8c0@IZ4EFN>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001401c411c2$e78de420$1400a8c0@IZ4EFN>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: IZ4EFN Alessio <iz4efn@libero.it>
Cc: linux-hams@vger.kernel.org


> Seems like an internal compiler error, but i'm using 3.2.3 and he suggest to
> compile from 3.2.

> g++   -Wall -pthread -mcpu=i386    -c servers.cpp
> In file included from /usr/include/c++/3.2.3/backward/strstream:51,
>                  from servers.cpp:61:
> /usr/include/c++/3.2.3/backward/backward_warning.h:32:2: warning: #warning
> This file includes at least one deprecated or antiquated header. Please
> consider using one of the 32 headers found in section 17.4.1.2 of the C++
> standard. Examples include substituting the <X> header for the <X.h> header
> for C++ includes, or <sstream> instead of the deprecated header
> <strstream.h>. To disable this warning use -Wno-deprecated.
> g++: Internal error: Terminated (program cc1plus)

The new (3.x.x or 3.2.x ??) C++ compiler give this error, if we use

   #include <iostream.h> or similar C++ headers.
     (also #include <stdio.h> is good, because it isn't C++ header)

The correct: #include <iostream> , but this can only with the new 3.x.x
compiler to compile. For the older (2.9.x ??) compiler have to give the
full headerfilename.

I corrected this error in other C programsource, and I can that so
compile.

73! hg2ecz, Zsolt
