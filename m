From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next] net: rose: Remove NULL check before dev_{put,
 hold}
Date: Mon, 27 Feb 2023 18:33:49 -0800
Message-ID: <20230227183349.68409721@kernel.org>
References: <20230228005217.105058-1-yang.lee@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677551631;
        bh=p9MnJLALjiAb0WzYLv062jQYB+MMJnehQOB2xpAqptI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P1sw0c3w83X8wXJxQkSDbdnCQbLE9mLfwVr5Z1PTjjFIq10eQsq6HOT22pGWf65xV
         w1G6IZMzyJgQWQYXdtrWjePl22hgBCiVEqHU/cwRQcufTUweZ5tWrwMWCJbDe8YC5Z
         cCsZ83kIpkz01NLrM3uTEguHsFGUyicSxGbaNPkQS6gGLdpWdofPKdbLhOzyekJJZt
         6AcE3V2WzTfr7reFZF3j1zxUnPiuXcx84J7sEnSvrxZtiMwYMmlvMgSU8CAmpNu1G2
         c5hE7gtHIe9qAKXReoh5EXSuaMGtIzWp4h98nIMN/f0NWeJI95e9abtRI0WhAS0gIG
         fC5/CuuaTrriA==
In-Reply-To: <20230228005217.105058-1-yang.lee@linux.alibaba.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: davem@davemloft.net, ralf@linux-mips.org, edumazet@google.com, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>

On Tue, 28 Feb 2023 08:52:17 +0800 Yang Li wrote:
> The call netdev_{put, hold} of dev_{put, hold} will check NULL,
> so there is no need to check before using dev_{put, hold},
> remove it to silence the warning=EF=BC=9A
>=20
> ./net/rose/rose_route.c:619:2-10: WARNING: NULL check before dev_{put, ho=
ld} functions is not needed.

# Form letter - net-next is closed

The merge window for v6.3 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Mar 6th.

RFC patches sent for review only are obviously welcome at any time.
