From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Error compiling aprsd-2.2.5-15
Date: Wed, 18 Apr 2007 08:13:25 +1000
Message-ID: <20070417221325.GA29489@cloud.net.au>
References: <20070313115537.GA10921@linux-mips.org> <20070324.125436.115921208.davem@davemloft.net> <4624D993.1060006@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4624D993.1060006@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Apr 17, 2007 at 04:28:35PM +0200, Bernard Pidoux wrote:
> Is aprsd-2.2.5-15.tar.gz the last available source for aprsd ?
> 
> I did ./configure without problem but got g++ warning and the following
> error :
> 
> deprecated header <iostream.h>. To disable this warning use -Wno-deprecated.

That's a separate warning.

> aprsString.h:199: error: extra qualification ?aprsd::aprsString::? on
> member ?getMsgText?

That's probably caused by

   void aprsString::getMsgText(string& msg);

in aprsString.h within the class definition. Remove the 'aprsString::'
prefix from that line and it should work. There are probably others
around the source tree too.



Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
