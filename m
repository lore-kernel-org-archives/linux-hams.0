From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Replacement for linux-ax25.org git?
Date: Tue, 8 Nov 2022 19:10:06 +0100
Message-ID: <Y2qbfrHkKAf44cdK@x-berg.in-berlin.de>
References: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
 <ed2bfaa6-4c68-5743-90aa-0149322e5f94@w1nr.net>
 <Y2pybykD07N1nBG+@x-berg.in-berlin.de>
 <29F7FF8E-64E6-4927-9DE6-23E98C763832@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <29F7FF8E-64E6-4927-9DE6-23E98C763832@gmail.com>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Steven R. Loomis" <srl295@gmail.com>
Cc: "Mike McCarthy, W1NR" <lists@w1nr.net>, linux-hams@vger.kernel.org

Hello Steven,

On Tue, Nov 08, 2022 at 11:50:42AM -0600, Steven R. Loomis wrote:
> Thanks for bringing this back.
> 
> “Latest Versions” on the main page right hand sidebar <http://linux-ax25.in-berlin.de/wiki/Main_Page> still link to the linux-ax25.org <http://linux-ax25.org/> URL and are thus broken.

Thank you.

It's recommended to use the git head anyway.


I'll fix the links in the wiki.
But personaly, I really dislike the "releases"-idea in the days of git.
It's much easier to initiate "git pull" to update a previously checked-out
version.
Furthermore, if we really like to to have something like "release", we need a
mechanism that (semi-)automatically makes a new release some time after
a commit (that has been proven bug-free).
Else there's no benefit of using such a "release" in production, because it
remained old and buggy.

vy 73,
	- Thomas  dl9sau

