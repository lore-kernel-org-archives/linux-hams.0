From: "bud Thompson" <budt@cfl.rr.com>
Subject: Re: Listen on a consol
Date: Sat, 3 Jun 2006 17:11:59 -0400
Message-ID: <014001c68752$5a9f86b0$687ba8c0@COMPAQ>
References: <620c90570606031248i6b02af9ao4c872b96e53e3359@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Chuck Hast <wchast@gmail.com>, linux-hams <linux-hams@vger.kernel.org>


----- Original Message ----- 
From: "Chuck Hast" <wchast@gmail.com>
To: "linux-hams" <linux-hams@vger.kernel.org>
Sent: Saturday, June 03, 2006 15:48
Subject: Listen on a consol


> Folks,
> I use the listen command at times remotely. When I run it as a terminal
> window, I notice that I can no longer page back and look at what has
> scrolled off of the screen. I am trying to figure out what I have missed,
> but so far am hitting zero.
>
> -- 
> Chuck Hast  -- KP4DJT --

* * *
Chuck - I use the following from putty after logging into the Orlando Linux 
FPAC with user/password and the moving to Super User / password and cd to 
the ax25 subdirectory:

root@Orlando:/etc/ax25# listen -artc

That gets me the listen screen and a scroll-back on the right side.

However - I cannot change the size/aspect ratio of that screen once active - 
it drops the putty link if I mess with that.

Once listen -artc is running, I start a 2nd Putty session the same way and 
then:

root@Orlando:/etc/ax25# fpacnode

so i can play as a user!

73,
bud N0IA






