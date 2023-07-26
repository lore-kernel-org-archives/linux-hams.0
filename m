From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 09/14] ax.25: Update to register_net_sysctl_sz
Date: Wed, 26 Jul 2023 11:00:37 -0700
Message-ID: <ZMFfRR3PftnLHPlT@bombadil.infradead.org>
References: <20230726140635.2059334-1-j.granados@samsung.com>
 <CGME20230726140703eucas1p2786577bcc67d5ae434671dac11870c60@eucas1p2.samsung.com>
 <20230726140635.2059334-10-j.granados@samsung.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=8kddEG975kVOCcVV1oSgI03ZZt3GTFuwKPnsWKV77i8=; b=AuGUX4tO1sI3yG1gnklziBniSy
        vvDoKVKT0gBhsBPz2cyrf8FXdOYUaBllH5H5LKKg57lpiln/ii2ZYkoBHgE/8nxZNOPqMP7XAzlp0
        bI6aEMnFFq4mHkd73HIyAe6IZtl+J0mrMYMeErNhreQhq/eYEkEN997CYNgSRYtFl9bAQiTGNZPkq
        Hz3SoOWG1E8kalIsF1UU3O72+9bJBf5ujZ/LJ3OChJ79fjVmpwe27BkddVmC6bJzhDSsp4fYGShrl
        jUvzgEJaCaL10yjC2qsyP+yssR5F1VXWtXWrKhYwSyKMQtsJjlztSJ/RESkyTLiGOhS/26BBnr6o4
        83tfxB/w==;
Content-Disposition: inline
In-Reply-To: <20230726140635.2059334-10-j.granados@samsung.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Granados <j.granados@samsung.com>
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, willy@infradead.org, keescook@chromium.org, josh@joshtriplett.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 26, 2023 at 04:06:29PM +0200, Joel Granados wrote:
> This is part of the effort to remove the sentinel (last empty) element
> from the ctl_table arrays. We update to the new function and pass it the
> array size.

The commit log does not explain why. It also does not explain if there
is any delta on size at compile or runtime.

  Luis
