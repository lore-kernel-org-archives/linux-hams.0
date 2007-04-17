From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Error compiling aprsd-2.2.6-4 from CVS
Date: Tue, 17 Apr 2007 10:57:52 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0704171055290.12032@eskimo.com>
References: <20070313115537.GA10921@linux-mips.org>
 <20070324.125436.115921208.davem@davemloft.net> <4624D993.1060006@ccr.jussieu.fr>
 <4624FB5F.1030508@ccr.jussieu.fr> <462505B9.3020402@ccr.jussieu.fr>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <462505B9.3020402@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Tue, 17 Apr 2007, Bernard Pidoux wrote:

> I looked at configure.log file and found some error report that could be
> interesting for aprsd developpers.
> I will report here only the errors or warnings lines :

Problem is:  Some of these may be standard tests looking for
different flavors of functions to use, so some errors might be
expected.  I find it's best to ignore most of them in that file
except for the particular problems you're trying to solve.  The rest
are wild goose chases.

For instance in Xastir we look for GraphicsMagick first and then
ImageMagick if GM is not found.  Each one of these might check check
multiple locations for the headers and then the libraries, then some
executables.  Failures at any one of these don't mean that we have a
real error or that the package was not found.  It just means the
attempt failed, but a later one may succeed.

What fun huh?

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
