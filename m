From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next] ax25: merge repeat codes in
 ax25_dev_device_down()
Date: Thu, 26 May 2022 20:49:41 -0700
Message-ID: <20220526204941.0a56bf5d@kernel.org>
References: <20220516062804.254742-1-luwei32@huawei.com>
        <YoQj7eND7/2KSBFs@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653623382;
        bh=D3GZP6fleTWhoFCBrTzOU6j74QipwUFxxLvVwr0pU/0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tJYPOCiwACHoA6gz2mr86oT4blc545XfmkckujqLvZZxC77zEMLzeH3PWJhMyd0aH
         El1JGn7e16gh2ymjCcTCfLVRHobvGN6C3/Kb5K3JoZ9QUVNkmJWX7R0TySjsLu8p6S
         tstrp0aLNOHigSU7TeBgKbGkPvQlxxsJqENYcGJBs8psmhkNOJq8d1OZdnQzFq8Lio
         nJqc1TC2G+/H5QWMJWSG4q79d6a4Q/W4893B/TIl8AiJkmEoDwV1mPYIzzPpjZrhzH
         AzO0wzzbUGGz34KkoYbQi1AlT6bDEHeCVA3wqixuy7cuN3LdhvMHUyFlBUgOLic5EZ
         svVn5zKj6cIrw==
In-Reply-To: <YoQj7eND7/2KSBFs@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Osterried <thomas@osterried.de>
Cc: Lu Wei <luwei32@huawei.com>, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 18 May 2022 00:38:37 +0200 Thomas Osterried wrote:
> 1. We need time for questions and discussions
> 
> In the past, we had several problems with patches that went upstream which
> obviously not have been tested.
> We have several requests by our community at linux-hams, that we need
> to have a chance to read a patch proposal, and have time to test it,
> before things become worse.

Any input on:

https://patchwork.kernel.org/project/netdevbpf/patch/20220525112850.102363-1-duoming@zju.edu.cn/

?
