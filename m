From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 11/15] hdlcdrv: remove HDLCDRV_MAGIC
Date: Fri, 28 Oct 2022 20:54:40 +0700
Message-ID: <9386b19f-dd99-3601-9e87-3056100dfe53@gmail.com>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
 <ad19b20f5867e845a843884bbb0f107e7ea7e11a.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zAImP6PWJ5WKUhDLfWykBuCXt66Oh0xkfiNtM65y4vc=;
        b=odgyqA70A3ESvmjUlqp5hpilRZmgvLyLT/NCtcrt8ymsLwCJENdZpKZFuSXCBG+AnY
         Q86vMciO80RAUc9b91LXgCHhLD3fLj9NKeBiIlI3CATTCHkZLfgLJZx2UwLTBFJk/GME
         Zk4GvwmIfod3CnXPtr+jRck8cjW2nWNElHM7wK/WyLdpdkH2Xee+QBW02diy9iVkGDVB
         Oy/a/G9W/aIytmcyDgVJ6d0FwtEwmOeyVnDwRQSfgEzx09p4bt6RxuJXvPo5zxfI/OdC
         S7YQ4OhwxQQBNs9ySlo2ARuVeNZQzElfeINCyLkgJ4DZAiHDzbL00ZP62fZyiStptrSv
         CWOQ==
Content-Language: en-US
In-Reply-To: <ad19b20f5867e845a843884bbb0f107e7ea7e11a.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Thomas Sailer <t.sailer@alumni.ethz.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, =?UTF-8?Q?Jakub_Kici=c5=84ski?= <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Kees Cook <keescook@chromium.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, ne

On 10/27/22 05:43, наб wrote:
> We have largely moved away from this approach,
> and we have better debugging instrumentation nowadays: kill it
> 

Same reply as [1].

> Additionally, ~half HDLCDRV_MAGIC checks just early-exit instead
> of noting the bug, so they're detrimental, if anything
> 

"... instead of handling the magic number"?

Thanks.

[1]: https://lore.kernel.org/linux-doc/80c998ec-435f-158c-9b45-4e6844f7861b@gmail.com/

-- 
An old man doll... just what I always wanted! - Clara

