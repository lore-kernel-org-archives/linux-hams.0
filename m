From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] ax25_cb refcounting & waitqueue usage
Date: Mon, 7 Jul 2003 19:23:40 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030707192340.A219@jeroen.pe1rxq.ampr.org>
References: <20030706192734.E4454@jeroen.pe1rxq.ampr.org> <20030707133710.GJ1820@conectiva.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030707133710.GJ1820@conectiva.com.br>; from acme@conectiva.com.br on Mon, Jul 07, 2003 at 15:37:10 +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

On 2003.07.07 15:37:10 +0200 Arnaldo Carvalho de Melo wrote:
> Em Sun, Jul 06, 2003 at 07:27:34PM +0200, Jeroen Vreeken escreveu:
> > Hi,
> > 
> > Second patch for this weekend...
> > This patch does two things, it adds reference counting to the ax25_cb
> > structure (until now only the ax25_cb list was protected, not the parts
> > using it) and it fixes an oops on interrupted socket syscalls. (e.g.
> > pressing Ctrl-C while in the connect function) The waitqueue was not
> > removed from the list and caused an oops in the socket release.
> > 
> > I have had only a quick look at Steven's patch but I don't think the
> two
> > will clash...
> 
> Hey, why not use sk->refcnt by means of sock_hold/sock_put? Current
> sources
> even do that implicitely when you do a sk_add_node (sock_hold) and a
> sk_del_node{_init} (sock_put)... Now it is just a matter of doing a
> sock_hold
> when searching in some list and then dropping the refcnt when done using
> the
> sock returned by the search function.

Unfortunatly the ax25_cbs are not directly related to a sock structure...
Sometimes they don't even have them, e.g. when you do ip in connected mode
or netrom and rose interlinks. In those cases you can even share an ax25_cb
between a socket and those protocols in which case you absolutly need the
refcounting....
Consider the following:

- ip datagram is send to ax25 layer.
- ax25 layer uses a lookup in the ax25_cb list to find an existing
connection
- list code locks, searches, unlocks, returns
***** preempt/interrupt/other processor
- application closes socket
- ax25_cb is removed from the list (again with proper list locking)
- ax25_cb is freed
***** preempt/interrupt/other processor back to ip handling routine
- ip handling routine uses ax25_cb
- BOOM!


Jeroen

