From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Replacement for linux-ax25.org git?
Date: Tue, 8 Nov 2022 16:14:55 +0100
Message-ID: <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
 <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: linux-hams@vger.kernel.org

On Tue, Nov 08, 2022 at 08:41:22AM -0500, Mike McCarthy, W1NR wrote:
> Does anyone know if the repos at linux-ax25.org
> were archived anywhere before it went offline?

linux-ax25.org domain is dead due to dns fail.

The host running the repos is still in service and
is available under linux-ax25.in-berlin.de.

That dns name is not my favourite choice (see my post on this list about this topic),
but it is future proven, does not depend on a single person, and is under full control.

I hoped linux-ax25.org will come back. Now we have to live with that solution.

vy 73,
  - Thomas  dl9sau


> 
> Mike, W1NR
> 
> On 11/8/2022 7:41 AM, Dave Hibberd wrote:
> > Hi all,
> > 
> > I'm one of the folks in the Debian Hamradio team with an active interest in keeping our packet tooling going.
> > 
> > With the demise of linux-ax25.org and discussions here about change of maintenance, is there a new canonical repo for ax25-tools and similar where these components are held?
> > 
> > Our last upstram mirror was about 3 years ago, we've got it tagged as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed down into Ubuntu, Raspberry Pi OS etc.
> > 
> > If there's currently active work going on with these userland components, where is it happening so we can rebase our packages?
> > If not, I guess this is something we need to make a decision on how to proceed as a community!
> > 
> > 
> > [1]: https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream
> > 
