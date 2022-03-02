From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH V2] net: hamradio: use time_is_after_jiffies() instead
 of open coding it
Date: Tue, 1 Mar 2022 18:18:01 -0800
Message-ID: <20220301181801.20ea9451@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
References: <1646137579-74993-1-git-send-email-wangqing@vivo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646187483;
        bh=0UAVaLD5wqBI1sqre5WfIpb45/ZkcP8Z8YK1KArm64o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DVB/ujafrSKrwEdXrqu7DfYs7aXJjAkySyUcyLIS+dVXz70Qxae1M2Ga8/deKYBAf
         wbdeai+ADboMtryM8y1YJMnlpIpGc52qHzH2ayNJVAOV6BZQomHxbyJfZP1mUlRyK6
         NKaMWUk7RQXdcv3u4nd9rI7n844jfIx/7JBr/vV63MmPD/NlWgwik2PZj5HhgbKgde
         awkUnLIm5m9rVXtZAY9J6qOVUGhZm357FlHgotvS5SWAmMVq0j5k0d3GepcDycXMW5
         yuq8sARnF1b6k3UX1T9PXnVM/G0cwcwwuA8zfduCQxa+1V5bJDvrI35V7AQxMjXdjZ
         ydch+JSVHvU9A==
In-Reply-To: <1646137579-74993-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Qing Wang <wangqing@vivo.com>
Cc: Joerg Reuter <jreuter@yaina.de>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue,  1 Mar 2022 04:26:16 -0800 Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.

Please include a change log if you're sending next versions of the same
patch. I can't tell what changed here, and the previous version had
already been applied.
