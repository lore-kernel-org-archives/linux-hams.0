From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Subject: Re: [PATCH] ax25_cb refcounting & waitqueue usage
Date: Mon, 7 Jul 2003 10:37:10 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030707133710.GJ1820@conectiva.com.br>
References: <20030706192734.E4454@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030706192734.E4454@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeroen Vreeken <pe1rxq@amsat.org>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

Em Sun, Jul 06, 2003 at 07:27:34PM +0200, Jeroen Vreeken escreveu:
> Hi,
> 
> Second patch for this weekend...
> This patch does two things, it adds reference counting to the ax25_cb
> structure (until now only the ax25_cb list was protected, not the parts
> using it) and it fixes an oops on interrupted socket syscalls. (e.g.
> pressing Ctrl-C while in the connect function) The waitqueue was not
> removed from the list and caused an oops in the socket release.
> 
> I have had only a quick look at Steven's patch but I don't think the two
> will clash...

Hey, why not use sk->refcnt by means of sock_hold/sock_put? Current sources
even do that implicitely when you do a sk_add_node (sock_hold) and a
sk_del_node{_init} (sock_put)... Now it is just a matter of doing a sock_hold
when searching in some list and then dropping the refcnt when done using the
sock returned by the search function.

- Arnaldo
