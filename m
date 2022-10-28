From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 01/15] hamradio: baycom: remove BAYCOM_MAGIC
Date: Fri, 28 Oct 2022 08:54:54 +0700
Message-ID: <d3be78c5-dbb0-6419-03ad-8337b46f91a0@gmail.com>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
 <20221026183711.342ae914@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irU9wao3U9xoVcrQJyhza+H5ctRejikSJ6E6Kg/V3MY=;
        b=CWM+n58iZiFaG225OsCmWHZxmK5R48tN5dvlbhaHxGL6zDQz8ikkUPO6pYpORUPjip
         TBwCPWjBSo+lPY8hcQ/r6PO1M8HtjnYaafUDgaIpPXNjtOf7+f/XWawhjEGWj8GlvMmy
         zn3tBnA/O4kiw52fT+8WYh1og+y/20LW2lFhDWakRiTTmRryBaKcOTg68lDo1/Un1KaI
         7+CFmUpqb6N6PcWUBQ+SSXjLkXrxkxEtShz/QWu3xad5yiE+gGtAqQM9DbOVi+hL5mCj
         B+iQApADWVUin1F+MqIVoThiWKPKpsbFJO3Ght1+T6C6/NphYeRpi+D4agCx4Z9saimZ
         jKNA==
Content-Language: en-US
In-Reply-To: <20221026183711.342ae914@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jakub Kicinski <kuba@kernel.org>, =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Thomas Sailer <t.sailer@alumni.ethz.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On 10/27/22 08:37, Jakub Kicinski wrote:
> On Thu, 27 Oct 2022 00:42:37 +0200 наб wrote:
>> Since defanging in v2.6.12-rc1 it's set exactly once per port on probe
>> and checked exactly once per port on unload: it's useless. Kill it.
>>
>> Notably, magic-number.rst has never had the right value for it with the
>> new-in-2.1.105 network-based driver
>>
>> Signed-off-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
> 
> Interesting name :S Just to be clear full legal names are required.
> Not saying that's not your name, just saying I haven't heard it before.
> 
> Plus the From line must be the same, legal name.
> 

You mean From header (email).

In this case, she forgot to add From: tag before the patch description
(which could be easily added with --from option to git-format-patch(1)).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

