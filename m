From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Listen on a consol
Date: Sat, 3 Jun 2006 17:44:40 -0400
Message-ID: <620c90570606031444m5229588fh2a97ea68f5c8bb70@mail.gmail.com>
References: <620c90570606031248i6b02af9ao4c872b96e53e3359@mail.gmail.com>
	 <014001c68752$5a9f86b0$687ba8c0@COMPAQ>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <014001c68752$5a9f86b0$687ba8c0@COMPAQ>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bud Thompson <budt@cfl.rr.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

On 6/3/06, bud Thompson <budt@cfl.rr.com> wrote:
>
> ----- Original Message -----
> From: "Chuck Hast" <wchast@gmail.com>
> To: "linux-hams" <linux-hams@vger.kernel.org>
> Sent: Saturday, June 03, 2006 15:48
> Subject: Listen on a consol
>
>
> > Folks,
> > I use the listen command at times remotely. When I run it as a terminal
> > window, I notice that I can no longer page back and look at what has
> > scrolled off of the screen. I am trying to figure out what I have missed,
> > but so far am hitting zero.
> >
> > --
> > Chuck Hast  -- KP4DJT --
>
> * * *
> Chuck - I use the following from putty after logging into the Orlando Linux
> FPAC with user/password and the moving to Super User / password and cd to
> the ax25 subdirectory:
>
> root@Orlando:/etc/ax25# listen -artc
>
> That gets me the listen screen and a scroll-back on the right side.
>
> However - I cannot change the size/aspect ratio of that screen once active -
> it drops the putty link if I mess with that.
>
> Once listen -artc is running, I start a 2nd Putty session the same way and
> then:
>
> root@Orlando:/etc/ax25# fpacnode
>
> so i can play as a user!

That is what I am doing, but when I run listen in a consol session on a
linux machine it appears to change the terminal setup and no longer
allow me to view the history of incoming data, this is a listen vs terminal
issue, probably something that I need to set somewhere in the terminal
or the listen attributes. As soon as I start the listen session my history
slider goes away, so it is some interaction with the two apps.

-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
