From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 13/30] net: netrom: Add missing annotation for
 nr_neigh_stop()
Date: Mon, 24 Feb 2020 13:29:29 -0800 (PST)
Message-ID: <20200224.132929.73427592545605754.davem@davemloft.net>
References: <0/30>
        <20200223231711.157699-1-jbi.octave@gmail.com>
        <20200223231711.157699-14-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200223231711.157699-14-jbi.octave@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jbi.octave@gmail.com
Cc: boqun.feng@gmail.com, linux-kernel@vger.kernel.org, ralf@linux-mips.org, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Jules Irenge <jbi.octave@gmail.com>
Date: Sun, 23 Feb 2020 23:16:54 +0000

> Sparse reports a warning at nr_neigh_stop()
> warning: context imbalance in nr_neigh_stop() - unexpected unlock
> The root cause is the missing annotation at nr_neigh_stop()
> Add the missing __releases(&nr_neigh_list_lock) annotation
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

Applied.
