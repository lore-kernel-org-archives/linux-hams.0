From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Installing ham packages
Date: Fri, 24 Feb 2006 00:10:20 +1100
Message-ID: <20060223131020.GB8873@cloud.net.au>
References: <Pine.LNX.4.44.0602221009310.13424-100000@srv01.compumont.com> <43FD5C52.8080808@jnos.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43FD5C52.8080808@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, Feb 22, 2006 at 10:55:14PM -0800, Bill Vodall WA7NWP wrote:
> Ok ---  where do they go.
> 
>  conversd goes in /opt/converd/(etc|bin...)
>  aprsd
>  jnos
>  digi_ned
> 
> etc?
[...]
> What's the gospel these days?  Where should we be installing the ham 
> packages and putting their configuration files?

You, as the system admin, are encouraged to install into /usr/local.

/usr is reserved for your distribution to use.
/opt is reserved for third party packages (although your distribution
might use them too). Or you could use it.

/usr/local is definitely reserved for you to install things directly
from source code.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
