From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Error compiling aprsd-2.2.6-4 from CVS
Date: Wed, 18 Apr 2007 08:14:43 +1000
Message-ID: <20070417221443.GB29489@cloud.net.au>
References: <20070313115537.GA10921@linux-mips.org> <20070324.125436.115921208.davem@davemloft.net> <4624D993.1060006@ccr.jussieu.fr> <4624FB5F.1030508@ccr.jussieu.fr> <462505B9.3020402@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <462505B9.3020402@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Apr 17, 2007 at 07:36:57PM +0200, Bernard Pidoux wrote:
> I looked at configure.log file and found some error report that could be
> interesting for aprsd developpers.
> I will report here only the errors or warnings lines :

That's how autoconf works - it compiles various test programs to see
what header files and libraries are required to access certain OS
functions. Errors are perfectly normal. You only have a problem if
configure ends in failure.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
