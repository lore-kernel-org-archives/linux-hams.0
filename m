From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: ax25
Date: Sun, 22 Sep 2002 18:54:17 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020922185417.B25813@pull.privacy.nb.ca>
References: <001301c26241$cbb617e0$0500a8c0@terrigal.net.au> <Pine.LNX.4.44.0209221831220.17022-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0209221831220.17022-100000@oh2bns.ampr.org>; from tpm@prkele.tky.hut.fi on Sun, Sep 22, 2002 at 06:37:07PM +0300
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Michael Hart <mhart@terrigal.net.au>

On Sun, Sep 22, 2002 at 06:37:07PM +0300, Tomi Manninen wrote:
> On Mon, 23 Sep 2002, Michael Hart wrote:
> 
> > I guess if /dev/bcX is no longer used then I have an old AX25-HowTo.  What I
> > need is a pointer to the latest AX25howto I guess
> 
> What we need is someone writing a new AX25-HOWTO... The one you have is 
> probably the latest there is.

The latest copy is from Sept 2001, and is located at
 http://www.tldp.org/HOWTO/AX25-HOWTO/

One point that was not clear to me, was whether Michael Hart was trying
to use a RedHat distribution kernel (e.g. uname -r returns 2.4.18-5) or a 
custom kernel (recommend getting 2.4.19 from www.au.kernel.org) built 
with AX.25 and Baycom modules enabled. 

Trying to use the RedHat kernel will not work. AFAIK the RedHat kernel has 
no amateur radio device drivers just the ax.25 net/rom and rose protocol 
support.

