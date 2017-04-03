From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 16/16] drivers, net, intersil: convert request_context.refcount from atomic_t to refcount_t
Date: Mon, 03 Apr 2017 14:41:08 +0300
Message-ID: <87zifxn2gb.fsf@kamboji.qca.qualcomm.com>
References: <1490691403-4016-1-git-send-email-elena.reshetova@intel.com>
        <1490691403-4016-17-git-send-email-elena.reshetova@intel.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1491219682;
        bh=1ePsLqZjOaHA03/ElZjKfouRxO11xsV8n3MFWHOCzw8=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=dEcaNps065c0KtregXSiqUe28vLJ1xe7HbIbKSXqS9CJL8/g8Ghe6OUrzm/aGNakq
         7R0O3AYFnoZe+GLT4JfzGYE0LhMqoML5JlS4Nu3VU6Xzsh0Vh/1d0kyHwZmkV/X2y4
         lBZrnR4kBGKMFDfCW+P/Kz/E646G+/ZtXRnB6bMc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1491219681;
        bh=1ePsLqZjOaHA03/ElZjKfouRxO11xsV8n3MFWHOCzw8=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=KJxKsrQwQxhY4qH6pqp6toIQUInRLzTO981caicXi4DpKs6Gwu4Uxte+R6dqMutF0
         l1OrZ3daeaQg0Antsf4dhIZdNsZBRq9rCd5Ny9IwwEb/B2mMuLWNGV0rCR23KXb+vi
         Qt7ffqOuXltVF7H1xGO4IbRTAmi+RzXSHymU88lo=
In-Reply-To: <1490691403-4016-17-git-send-email-elena.reshetova@intel.com>
        (Elena Reshetova's message of "Tue, 28 Mar 2017 11:56:43 +0300")
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elena Reshetova <elena.reshetova@intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org, linux-hams@vger.kernel.org, linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org, ganeshgr@chelsio.com, nbd@openwrt.org, blogic@openwrt.org, matthias.bgg@gmail.com, yishaih@mellanox.com, saeedm@mellanox.com, matanb@mellanox.com, leonro@mellanox.com, ajk@comnets.uni-bremen.de, paulus@samba.org, j@w1.fi, peterz@infradead.org, keescook@chromium.org, gregkh@linuxfoundation.org, Hans Liljestrand <ishkamiel@gmail.com>, David Windsor <dwindsor@gmail.com>

Elena Reshetova <elena.reshetova@intel.com> writes:

> refcount_t type and corresponding API should be
> used instead of atomic_t when the variable is used as
> a reference counter. This allows to avoid accidental
> refcounter overflows that might lead to use-after-free
> situations.
>
> Signed-off-by: Elena Reshetova <elena.reshetova@intel.com>
> Signed-off-by: Hans Liljestrand <ishkamiel@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: David Windsor <dwindsor@gmail.com>
> ---
>  drivers/net/wireless/intersil/orinoco/orinoco_usb.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

The prefix should be "orinoco_usb:", I'll fix that.

-- 
Kalle Valo
