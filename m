From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 01/15] hamradio: baycom: remove BAYCOM_MAGIC
Date: Fri, 28 Oct 2022 20:13:49 +0700
Message-ID: <47c2bffb-6bfe-7f5d-0d2d-3cbb99d31019@gmail.com>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RdwGDChygcbuv7ncAXaIEDQUdOkATGiqCP5G7LmTETU=;
        b=OGV0n8XdxQLrjYQerDgQmrWWTcgpZNfXK7TFxWE2ozN61Bz75q40ALh2STA49sbirq
         ctYJvbNnH1YINiWgvLPazHGs1BE5Y4KbZmFlQaCxw8rQyTALlQjOqXDYgIZIe61yYgey
         2e2vHYXseeNq2Qy06WRpBJ2lxWeNNfGRlsmjHFCoggA01gF2CnCOSGQ+r0PuJ5JNjuDH
         ADd1MuVKCrerCkOC/jUy82iFfRbqbD/0LThpvh/ZmflFcgG1kKCuJj4+8gXhZ+A3q1AJ
         rNlhQi30/Q6TqyPld9jke1/40q5rVTV8xXxTJ0xMXy3RMX64hrfas0M8SusTWD3MD4IH
         hCeA==
Content-Language: en-US
In-Reply-To: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Thomas Sailer <t.sailer@alumni.ethz.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, =?UTF-8?Q?Jakub_Kici=c5=84ski?= <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On 10/27/22 05:42, наб wrote:
> Since defanging in v2.6.12-rc1 it's set exactly once per port on probe
> and checked exactly once per port on unload: it's useless. Kill it.
> 

What do you mean by defanging in that release?

Also, s/Kill it/Remove BAYCOM_MAGIC from magic numbers table/ (your
wording is kinda mature).

> Notably, magic-number.rst has never had the right value for it with the
> new-in-2.1.105 network-based driver
> 
> Signed-off-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
> Ref: https://lore.kernel.org/linux-doc/YyMlovoskUcHLEb7@kroah.com/

Use Link: tag instead.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

