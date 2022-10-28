From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH 02/15] hamradio: yam: remove YAM_MAGIC
Date: Fri, 28 Oct 2022 20:19:51 +0700
Message-ID: <4e7726a2-a631-642f-e8f5-c97ff3fc689f@gmail.com>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
 <e12d4648a757b613a2ecf09886116900fba1c154.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOLDcm9SinQdmtgEj1AOeXmTD70A5sOMBvhcqSEa1og=;
        b=PlRi5AaoVDZ+jhS4DO0oAQzAAwpLIc0fKRhtSOLvHVtbGmOvN4N/Y6eq733ZZsWbiI
         m+RBSowqUGxzQHqaqR9M00Drt+fbIypr6eQNgMAX+GYhwl64+FPiQ/IeW4/+170YAWxw
         1I8U/ROvuQy1VQqi5YJl7FmW6vOFu4yZzWjRDspJVvGPCQYNIHVXjt0udZTWYxBLFuIP
         YX1MBDzv1wjdj68c3oFoDVi1Zx++3DKntT4qcqIfwHfvvrqEb15I4sUfN4knAlJVsEzw
         E4DsFhErm2nO3Ko6pAH1d+H6lLGmpnI0GpAEfkdVnSOVz38nku28tra+/3pjBcSbJjsY
         1neg==
Content-Language: en-US
In-Reply-To: <e12d4648a757b613a2ecf09886116900fba1c154.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Jean-Paul Roubelat <jpr@f6fbb.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, =?UTF-8?Q?Jakub_Kici=c5=84ski?= <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On 10/27/22 05:42, наб wrote:
> This is cruft, and we have better debugging tooling nowadays: kill it
> 

That "mature phrase" again? Same reply as [1]. Thanks.

[1]: https://lore.kernel.org/linux-doc/47c2bffb-6bfe-7f5d-0d2d-3cbb99d31019@gmail.com/

-- 
An old man doll... just what I always wanted! - Clara

