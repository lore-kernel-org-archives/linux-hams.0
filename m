From: "Douglas Cole" <n7bfs@qwest.net>
Subject: Re: soundmodem ptt troubles
Date: Sat, 14 Feb 2004 11:44:52 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200402141144.52854.n7bfs@qwest.net>
References: <200402092225.29942.n7bfs@qwest.net> <20040210154121.GA90446@freebsd.aeminium.pt>
Reply-To: n7bfs@qwest.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040210154121.GA90446@freebsd.aeminium.pt>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nuno Sucena Almeida <slug@aeminium.org>, Linux Hams <linux-hams@vger.kernel.org>

On Tuesday 10 February 2004 07:41, Nuno Sucena Almeida wrote:
> Hello,
>
> 	try to download the source and compile it yourself. I remember that
> I had a problem with an ancient version of soundmodem parport ptt support
> (back in 2002 or 2003).
> I checked the source and added a small fix to the parport init routine.
> Check the latest source, I hope it's fixed by now. If not, search this list
> for my callsign and you should be able to find my fix.
>
> 			73,
> 					Nuno
>
> On Mon, Feb 09, 2004 at 10:25:29PM -0800, Douglas Cole wrote:
> | setup soundmodem.conf for /dev/parport0 it complains "sm[15680]:
>


Thankyou Nuno, yes this did the trick :)

I removed the SuSE installed binary and compiled from source the 0.7 version 
and after having to install a couple of libraries to make "configure" happy, 
it compiled and installed and I am now able to enable ptt on the parallel 
port pin two on the db25 connector ! :)
It goes high (appx. +3.3vdc)  when ptt is asserted.

So, now to build a small interface for the many different radios that I will 
be using ...

Next on my list is HDSSTV or RDFT as it is now called ;^}

Thanks to all those that have put hard work into allowing linux hams to play 
packet on their sound cards !  

73


Douglas Cole
N7BFS
Registered Linux user # 188922
Spokane IRLP node 3250 owner
