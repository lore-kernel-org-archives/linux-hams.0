From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] net: rose: fix unregistered netdevice: waiting for
 rose0 to become free
Date: Fri, 22 Jul 2022 10:37:50 -0700
Message-ID: <20220722103750.1938776d@kernel.org>
References: <20220715154314.510ca2fb@kernel.org>
        <9c033c36-c291-1927-079b-b4aee5f7ac08@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658511471;
        bh=MZHah33Q/RjQJRP+KgiWX1KH7CBqjB5/nEQHt5RSPN4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AMCy899mwwwx38SabBUAi8bJzl1BiwuD+uOSw3Y0O4g0KgpWLFwS1JG2x1GJQX6h5
         o+6cBAiIom26A85U0M8Z5bblaIsSxxOByak/IngpcrmB7VTVWu9u7i95ahqRK/jAID
         8xSYbzbilTJGSEeGuRV54CGSGgFPxEB+4r8PwOCEPJiRAvoaJsxrZL9kNvrNltl0pI
         2RTqO74ew4f3EUpvj20l39S7HRKiT+o8ohTLQMDUjGslO+U12tdA+PUpAk280eFopR
         iNdFQM7sLgfiFln/ct4UQ0teGN+jzPI1sZH0uEUONIDdCNmP+nwlir5obM24If0z/a
         ewic3FRzQOHPg==
In-Reply-To: <9c033c36-c291-1927-079b-b4aee5f7ac08@free.fr>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard f6bvp <f6bvp@free.fr>
Cc: davem@davemloft.net, duoming@zju.edu.cn, edumazet@google.com, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org

On Fri, 22 Jul 2022 18:41:28 +0200 Bernard f6bvp wrote:
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
>  Thunderbird/91.11.0

Still whitespace damaged, can you try git send-email ?
