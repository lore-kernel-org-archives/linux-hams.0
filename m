From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: IMPORTANT: LinuxNode v0.3.2
Date: Tue, 9 Sep 2003 15:25:25 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030909152525.A15220@pull.privacy.nb.ca>
References: <1061923547.1292.66.camel@oh2bns.ampr.org> <3F5DCC52.7040505@junglevision.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3F5DCC52.7040505@junglevision.com>; from cathrynm@junglevision.com on Tue, Sep 09, 2003 at 05:49:22AM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cathryn Mataga <cathrynm@junglevision.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Tue, Sep 09, 2003 at 05:49:22AM -0700, Cathryn Mataga wrote:
> 
> 
> Tomi Manninen wrote:
> > I just uploaded a new version of LinuxNode to:
> > 
> >   http://hes.iki.fi/pub/ham/unix/linux/ax25/
> > 
> > You'll find a source tar.gz, a source RPM and a binary RPM
> > (compiled on RedHat 9).
> 
> I'm trying to compile 0.3.2 on Redhat 6.2.  I get this error.
> 
> /usr/local/include/netax25/axlib.h:49: parse error before `null_ax25_address'
> /usr/local/include/netax25/axlib.h:49: warning: data definition has no type or storage class
> /usr/local/include/netax25/axlib.h:67: warning: `struct full_sockaddr_ax25' declared inside parameter list
...

You are using a 2.2.x kernel correct? What version of libax25? 

I suspect you may need to upgrade to libax25 0.0.11. I have no idea
if this compiles under Red Hat Linux 6.2, or works with the AX.25 in
the linux kernel 2.2.x.


