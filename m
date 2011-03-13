From: Thomas Osterried <thomas@osterried.de>
Subject: Re: ax25d not hearing incoming connection requests (fwd)
Date: Sun, 13 Mar 2011 20:24:21 +0100
Message-ID: <20110313192421.GF8243@x-berg.in-berlin.de>
References: <alpine.LNX.2.00.1103130843100.7815@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1103130843100.7815@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org

Hello,

On 2011-03-13 08:45:13 -0700, Curt, WE7U <curt.we7u@gmail.com>
wrote in <alpine.LNX.2.00.1103130843100.7815@wapiti.we7u.net>:
> 
> Here's part of the thread from a couple of years ago that went to private e-mail toward the end, so the summarized results didn't go back to the list.  Another message will follow after this one.
> 
> -- 
> Curt, WE7U.        http://www.eskimo.com/~archer
> APRS in Search and Rescue:  http://wetnet.net/~we7u/search_and_rescue.html
> 
> ---------- Forwarded message ----------
> Date: Sat, 17 Jan 2009 19:57:32 -0800 (PST)
> From: "Curt, WE7U" <archer@eskimo.com>
> To: Jon Sowman <jon.sowman@gmail.com>
> Cc: Ken Koster <n7ipb@wetnet.net>, kd7nm@arrl.net, archer@eskimo.com
> Subject: Re: ax25d not hearing incoming connection requests
> 
> 
> Bob, Ken, and I are all talking on the 220 repeater here.
> 
> Bob just connected direct to my system on ax25, going through ax25d
> and axspawn on the way.  The first time I had it set to auto-create
> his user account, and that part of it failed, with "useradd" going
> to 90+ percent until I killed it.  The end result of that connect
> was that it tried to create /home/ax25/kd7.../kd7nm/ directory and
> succeeded, filling it in with a lot of default "dot" files and such.

what did create the load? useradd or ax25d?
If it is ax25d, could you verify if the current cvs version still shows
this behaviour?

73,
	- Thomas  dl9sau
