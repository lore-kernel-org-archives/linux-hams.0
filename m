From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: SPLAT ...
Date: Fri, 28 Jun 2002 00:30:47 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020627143047.GA6878@silly.cloud.net.au>
References: <200206271358.g5RDw3X08658@amsat.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200206271358.g5RDw3X08658@amsat.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Jun 27, 2002 at 06:58:03AM -0700, John A. Magliacane wrote:
> Someone running Red Hat 6.2 had a similar problem with the install scripts.
> It was cured by changing the '==' tests to '='.  I'm not sure why this was
> necessary.

Sounds like a broken shell?

> As far as the bzip2 libraries are concerned, I'm pretty sure you need
> libbz2.so under /usr/lib in addition to libbz2.a.  If you don't have it,
> my suggestion is to install libbz2 from source instead of an RPM.

libbz2.a should be sufficient to link statically.


Cheers,
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
