From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: ax25 kernel problem sometimes accur
Date: Thu, 5 Dec 2002 01:16:41 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021205011641.A18121@pull.privacy.nb.ca>
References: <Pine.LNX.4.44.0212041148210.23313-100000@off1.audion.com> <19470@9A0TCP>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <19470@9A0TCP>; from 9a4gl@9a0tcp.ampr.org on Wed, Dec 04, 2002 at 09:20:09PM +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tihomir Heidelberg <9a4gl@9a0tcp.ampr.org>
Cc: linux-hams@vger.kernel.org

On Wed, Dec 04, 2002 at 09:20:09PM +0100, Tihomir Heidelberg wrote:
> 
> so, the ax25_free_sock function should look:     
> static void ax25_free_sock(struct sock *sk)
> {
>         ax25_free_cb(sk->protinfo.ax25);
>         sk->protinfo.ax25->sk=NULL;
> }
> 
> of course, then you should do make modules;make modules_install
> if you use ax25 in module or make install if you have it compiled
> in kernel.
> 
> this should not do anything harmfull in kernel, I am quite sure :)

Well, it could crash your system. sk->protinfo.ax25 is kfree'ed in 
the line before it, so you are accessing invalid data...

Your suggestion wants to be equalivent to sk = NULL;,
so you should at least change it to use a valid statement.
Though I wonder if you meant sk->protinfo.ax25 = NULL;

Best Regards,
 ve1mct
