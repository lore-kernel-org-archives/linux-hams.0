From: Chuck Hast <wchast@gmail.com>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 16:18:59 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <620c90570410151618432401d1@mail.gmail.com>
References: <620c9057041015095771b236e0@mail.gmail.com>
	 <620c9057041014060070eeccf6@mail.gmail.com>
	 <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
	 <200410151737.i9FHbiZW031272@yagi.h-net.msu.edu>
	 <4170100F.F5F43579@free.fr> <1097864803.1290.14.camel@oh2bns.ampr.org>
	 <4323.192.168.0.2.1097865189.squirrel@192.168.0.2>
	 <1097866437.1290.30.camel@oh2bns.ampr.org>
	 <Pine.SUN.4.58.0410151221210.28043@eskimo.com>
	 <620c9057041015125535932b34@mail.gmail.com>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057041015125535932b34@mail.gmail.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

> # Monitor auf Terminal 11 starten
> /usr/bin/listen -artc > /dev/tty11 &
> echo $! > /var/run/listen.pid
> # EndARNM
> 

This may be where I was having a issue, it is bringing up listen on tty 11.
(console 11) once I octothorped it I am even able run run call in a x session.

Now to go in and give the stuff the proper permissions so I do not have to
be root to run it.



-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
