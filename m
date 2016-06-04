From: Basil Gunn <basil@pacabunga.com>
Subject: Re: Can only connect  to RMS gateway once
Date: Sat, 4 Jun 2016 13:43:48 -0700
Message-ID: <20160604134348.38e3c4dd@brox.localnet>
References: <20160603131613.6037bcd0@brox.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160603131613.6037bcd0@brox.localnet>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

This isn't a final solution but the problem is in:

 sock_set_flag(sk, SOCK_DESTROY);

in routine ax25_release() in file net/ax25/af_ax25.c which does what it
is supposed to do in kernel 4.1.21 but NOT in kernels 4.2.8 & above. It
should destroy & free the socket when disconnecting.

For my 4.2.8 kernel If I add this after the sock_set_flag() call in
ax25_release() then the connection is released after disconnect & I can
reconnect again.

    release_sock(sk);
    ax25_disconnect(ax25, 0);
    lock_sock(sk);
    ax25_destroy_socket(ax25);

From the af_ax25 code in the 4.1.21 kernel, it expects sock_set_flag(sk, SOCK_DESTROY); to
 ax25_destroy_socket
 ax25_free_sock


> /Basil n7nix

