From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: ax25ipd
Date: Wed, 28 Aug 2002 08:36:29 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020827223629.GC10758@silly.cloud.net.au>
References: <Pine.LNX.4.33.0208252223370.730-100000@n1uan.ampr.org> <200208262147.08027.w9ya@amsat.org> <20020827120547.GA17396@silly.cloud.net.au> <200208270950.31042.w9ya@amsat.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200208270950.31042.w9ya@amsat.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Aug 27, 2002 at 09:50:31AM +0000, w9ya wrote:
> On Tuesday 27 August 2002 12:05 pm, Hamish Moffatt wrote:
> > The distributions (Red Hat, Debian, SuSE, Mandrake etc) shouldn't put
> > anything in /usr/local, but if you are installing something outside of
> > the packaging system then /usr/local is the recommended place.
> 
> Yes, and no. If your packaging system installs source, then it shouldn't go 
> into ./usr/local. The quote above was followed by another paragraph in the 
> original message that specifically indicated this.

That's right - I don't think what I said conflicts with this. Anything
you install yourself should go into /usr/local. The vendor (Sun, Red
Hat, Debian etc) can overwrite anything except /usr/local. Debian also
leaves all of /opt for the local administrator.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
