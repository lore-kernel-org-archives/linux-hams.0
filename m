From: Cathryn Mataga <cathrynm@junglevision.com>
Subject: Re: IMPORTANT: LinuxNode v0.3.2
Date: Tue, 09 Sep 2003 05:49:22 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F5DCC52.7040505@junglevision.com>
References: <1061923547.1292.66.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1061923547.1292.66.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org



Tomi Manninen wrote:
> Hello all,
> 
> I just uploaded a new version of LinuxNode to:
> 
>   http://hes.iki.fi/pub/ham/unix/linux/ax25/
> 
> You'll find a source tar.gz, a source RPM and a binary RPM
> (compiled on RedHat 9).
> 
> This version contains fixes for *SERIOUS* security flaws (read
> "remote root"). Upgrading all systems immediately is highly
> recommended!!!
> 
> Thanks to Morgan, SM6TKY for pointing out the flaws and helping
> in fixing them!
> 

I'm trying to compile 0.3.2 on Redhat 6.2.  I get this error.

/usr/local/include/netax25/axlib.h:49: parse error before `null_ax25_address'
/usr/local/include/netax25/axlib.h:49: warning: data definition has no type or storage class
/usr/local/include/netax25/axlib.h:67: warning: `struct full_sockaddr_ax25' declared inside parameter list
/usr/local/include/netax25/axlib.h:67: warning: its scope is only this definition or declaration,
/usr/local/include/netax25/axlib.h:67: warning: which is probably not what you want.
/usr/local/include/netax25/axlib.h:74: warning: `struct full_sockaddr_ax25' declared inside parameter list
/usr/local/include/netax25/axlib.h:88: parse error before `*'
/usr/local/include/netax25/axlib.h:95: parse error before `*'
/usr/local/include/netax25/axlib.h:101: parse error before `*'
/usr/local/include/netax25/axlib.h:107: parse error before `*'



