From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: AX.25 for dummies
Date: Tue, 21 Feb 2006 08:20:36 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0602210817400.27517@eskimo.com>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAABhvz93VzM5Ktcs9EAQKUtMBAAAAAA==@arrl.net>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAABhvz93VzM5Ktcs9EAQKUtMBAAAAAA==@arrl.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Chris Hare, W5CDN" <w5cdn@arrl.net>
Cc: linux-hams@vger.kernel.org

On Sun, 19 Feb 2006, Chris Hare, W5CDN wrote:

> I am looking for some really good instructions on how to set up AX.25,
> configure it and test it as working.  I have found some docs on the net, but
> they are old (pre 2003) and not terribly clear.  I am a reasonably good
> linux guy, but I haven't done AX.25 work on linux before.  I have compiled
> the modules into the kernel and it boots.
>
> Right now the TNCs are NOT in KISS mode until I figure out how to make this
> work and test it.
>
> Any pointers or links would be good

The AX.25 HOWTO has been forever out-of-date.  That's pretty much
the best document to work from though.  I think it's only a few
tweaks from there to get things running.

Your best bet would be to read that document and then latch on to
someone with a working system to ask questions of.

This group should probably set up a Wiki so that the instructions
for AX.25 can be kept up to date by the entire community instead of
by one or a very few.  That would probably help.

One thing to be aware of is that the AX.25 modules must match
certain kernel versions, plus some kernel versions have problems
running AX.25.  There are often patches that go across this list for
the latest kernels.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
