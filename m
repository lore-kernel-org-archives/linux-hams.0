From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: Announcing Perl module for parsing APRS packets
Date: Thu, 11 Aug 2005 17:34:51 +1200
Message-ID: <200508111734.51742.w.knol@niwa.co.nz>
References: <8ea83f405080514263ae2ec3d@mail.gmail.com> <Pine.SUN.4.58.0508100852220.1839@eskimo.com> <620c905705081009143dc3bcb0@mail.gmail.com>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c905705081009143dc3bcb0@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Thursday 11 August 2005 04:14, Chuck Hast wrote:

> Could this be used to dump APRS data into a db like MySQL? I am
> interested in doing something like that, but have to learn about
> db. I work with them up to a certain point, time to learn the rest
> and getting APRS data into a db would be a neat exersize.

Consider SQLite as a light-weight self-contained DB for this sort of 
thing. It leaves MySQL/Postgres in the dust, and never misses a beat. 
My Perl/Tk realtime logger uses it.

Have a look at the sources for example code (not necessarily state of 
the art ;-)

  http://zl2arn.ath.cx/zl2bsj/qle-0.0.3.tar.gz

HTH...

Wilbert, ZL2BSJ
