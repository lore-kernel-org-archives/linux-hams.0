From: Mike Markowski <mm@UDel.Edu>
Subject: Re: soundmodem ptt troubles
Date: Tue, 10 Feb 2004 13:21:13 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040210182113.GD6421@strauss.udel.edu>
References: <200402092225.29942.n7bfs@qwest.net> <20040210154121.GA90446@freebsd.aeminium.pt>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040210154121.GA90446@freebsd.aeminium.pt>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

The fix is archived at

	http://he.fi/archive/linux-hams/200207/0010.html

and is there in soundmodem-0.7...

Mike  AB3AP

On Tue 10-Feb-04 at 1041 EST, Nuno Sucena Almeida wrote:
> 
> Hello,
> 
> 	try to download the source and compile it yourself. I remember that
> I had a problem with an ancient version of soundmodem parport ptt support
> (back in 2002 or 2003). 
> I checked the source and added a small fix to the parport init routine. Check
> the latest source, I hope it's fixed by now. If not, search this list for
> my callsign and you should be able to find my fix.
> 
> 			73,
> 					Nuno
> 
> On Mon, Feb 09, 2004 at 10:25:29PM -0800, Douglas Cole wrote:
> | setup soundmodem.conf for /dev/parport0 it complains "sm[15680]: 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
