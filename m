From: "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] Get rid of sk_protinfo use in rose
Date: Wed, 23 Mar 2005 11:17:53 -0800
Message-ID: <20050323111753.5bb1f619.davem@davemloft.net>
References: <20050321095037.GA10220@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050321095037.GA10220@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: netdev@oss.sgi.com, linux-hams@vger.kernel.org

On Mon, 21 Mar 2005 09:50:37 +0000
Ralf Baechle DL5RB <ralf@linux-mips.org> wrote:

> Below patch puts struct sock into rose_cb to get rid of the need for the
> use of sk_protinfo in rose_sk().  While we're touching the data structure
> convert it from a typedef into a struct.

Also applied, thanks Ralf.
