From: "Jeremy Utley" <jerutley@gmail.com>
Subject: Re: AX.25 for dummies
Date: Tue, 21 Feb 2006 09:28:19 -0800
Message-ID: <d5d4185b0602210928t35fb3b38i7d2da67b5c86fc2@mail.gmail.com>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAABhvz93VzM5Ktcs9EAQKUtMBAAAAAA==@arrl.net>
	 <Pine.SUN.4.58.0602210817400.27517@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0602210817400.27517@eskimo.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 2/21/06, Curt, WE7U <archer@eskimo.com> wrote:
> On Sun, 19 Feb 2006, Chris Hare, W5CDN wrote:
>
> > I am looking for some really good instructions on how to set up AX.25,
> > configure it and test it as working.  I have found some docs on the net, but
> > they are old (pre 2003) and not terribly clear.  I am a reasonably good
> > linux guy, but I haven't done AX.25 work on linux before.  I have compiled
> > the modules into the kernel and it boots.
> >
> > Right now the TNCs are NOT in KISS mode until I figure out how to make this
> > work and test it.
> >
> > Any pointers or links would be good
>
> The AX.25 HOWTO has been forever out-of-date.  That's pretty much
> the best document to work from though.  I think it's only a few
> tweaks from there to get things running.

While it is true that the AX.25 HOWTO has not been updated in many
many years, the process for setting up AX.25 interfaces really hasn't
changed much since the 2.2.x kernel series, so those same basic
instructions will work on the latest 2.6.15 kernel as did a 2.2.10 :) 
There can sometimes be a couple of gotchas related to
multiple-interface TNC's, the use of mkiss, and modern linux
distributions which use udev, but those are easy to work around as
well.  Best thing you can do is work thru the howto, and come to the
list here to ask questions - someone will gladly help you out.

Jeremy, NW7JU
