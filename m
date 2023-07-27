From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 09/14] ax.25: Update to register_net_sysctl_sz
Date: Thu, 27 Jul 2023 08:44:24 -0700
Message-ID: <ZMKQ2OuFy1deZktP@bombadil.infradead.org>
References: <20230726140635.2059334-1-j.granados@samsung.com>
 <CGME20230726140703eucas1p2786577bcc67d5ae434671dac11870c60@eucas1p2.samsung.com>
 <20230726140635.2059334-10-j.granados@samsung.com>
 <ZMFfRR3PftnLHPlT@bombadil.infradead.org>
 <20230727123112.yhgbxrhznrp6r3jt@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=TaT346lw5jnFD/9d8UrcIfZOx9y69L5ux5x+eVg6WGk=; b=xpk19JDvaeOx0R6oGhZ0MUqP6+
        1jxX1FEXT1HhMPibygqvc0JQsb54A5UCuLCAuyY011AT7yi+s85EcZZw0rwi3d3hLxBLgLJd6G2Nl
        4tLbtJJtSdc3cbfd+QME+EM3HZ0cCLnM0JR5fzJgjo9I/fQjMBez+nGTIO2Ykf36HpkqezLr+eoFL
        42onwG2zrOZByZdIIuf1qXI1+IgvMBLb4F0luerDAOw74RBZKQERsfDaY3Nvfy5NZqQABQVt3/BqE
        Sfirimrdu/w4cq8yByaeB9eEEJvECfRfT/qWY1trj/Spg3E6up6PhSzuYPOBNElOWalmbmNXIr4uU
        LP3YSScw==;
Content-Disposition: inline
In-Reply-To: <20230727123112.yhgbxrhznrp6r3jt@localhost>
Sender: Luis Chamberlain <mcgrof@infradead.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Granados <j.granados@samsung.com>
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, willy@infradead.org, keescook@chromium.org, josh@joshtriplett.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 27, 2023 at 02:31:12PM +0200, Joel Granados wrote:
> There are no deltas in this patch set. We start seeing the deltas when
> we start removing with the next 6 chunks. I'll try to make that more
> clear in the commit message.

Indeed, even if no deltas are created it is importan then to say that.
If there are no deltas the "why" becomes more important. If the why is
to make it easier to apply subsequent patches, that must be said. When
you iterate your new series try to review the patches as if you were not
the person submitting them, and try to think of ways to make it easier
for the patch reviewer to do less work. The less work and easier patch
review is the better for them.

  Luis
