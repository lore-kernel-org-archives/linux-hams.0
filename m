From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Error compiling aprsd-2.2.6-4 from CVS
Date: Tue, 17 Apr 2007 10:25:08 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0704171023140.12032@eskimo.com>
References: <20070313115537.GA10921@linux-mips.org>
 <20070324.125436.115921208.davem@davemloft.net> <4624D993.1060006@ccr.jussieu.fr>
 <4624FB5F.1030508@ccr.jussieu.fr>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4624FB5F.1030508@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Tue, 17 Apr 2007, Bernard Pidoux wrote:

> I removed extra ';' on line 185 of src/refcount.hpp
> and also replaced in all concerned files
>
> #include <iostream>
> by
> #include <sstream>

>  aprsd.cpp: In function ?void serverQuit()?:
>  aprsd.cpp:139: error: ?cout? was not declared in this scope

If you look at the header files you'll see that things like "cout"
and "cerr" are defined in iostream and don't exist in sstream.

On my system I'm looking in /usr/include/c++/4.0.2/iostream and
SAMEPATH/sstream.

So...  Replacing the include files as you did appears to have
created a new problem.  Change them back and you'll at least be
closer to succeeding.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
