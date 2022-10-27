From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 01/15] hamradio: baycom: remove BAYCOM_MAGIC
Date: Wed, 26 Oct 2022 18:37:18 -0700
Message-ID: <20221026183711.342ae914@kernel.org>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666834640;
        bh=mpyS3sJDkaKSZRmNmNC0CyMizCFv/rGTfRjX8WnfQf8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HqOxSyTdcT/THuqY0cp8/PKehIK6rzefcwGbU6xB74T5j8T8y3Wih007+6IqFy46n
         QgtGuUaRqlafesSHnYTZZJ/YuaFMUkdFmDESIGDdOkOED13Wl5YFF08S0/DfnZBPRv
         qBerz/s8779GniQNxCcla212w6e08zi9GM8vFIR1i4ZPGkBusTY6/Esab77UmiZV92
         90LcMP2w4sFXs4RW4ykdqObPrEvCd38YwHeCDkmEYEOMuJiKEi/45cWVRWGaTdULto
         Qgswc4vR0m8MWa+Hj3/TchTzXQqTZH7qkL97PkatGQ81NF5sx4iuQzjQ2BfWv6tAYr
         o9UO7jZAUEA5A==
In-Reply-To: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Thomas Sailer <t.sailer@alumni.ethz.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On Thu, 27 Oct 2022 00:42:37 +0200 =D0=BD=D0=B0=D0=B1 wrote:
> Since defanging in v2.6.12-rc1 it's set exactly once per port on probe
> and checked exactly once per port on unload: it's useless. Kill it.
>=20
> Notably, magic-number.rst has never had the right value for it with the
> new-in-2.1.105 network-based driver
>=20
> Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xy=
z>

Interesting name :S Just to be clear full legal names are required.
Not saying that's not your name, just saying I haven't heard it before.

Plus the From line must be the same, legal name.

> Ref: https://lore.kernel.org/linux-doc/YyMlovoskUcHLEb7@kroah.com/

Link: is the tag we use.

Otherwise looks fine.
