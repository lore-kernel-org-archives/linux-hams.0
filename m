From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net] netrom: fix sleep in atomic context bugs in timer
 handlers
Date: Mon, 25 Jul 2022 19:49:30 -0700
Message-ID: <20220725194930.44ca1518@kernel.org>
References: <20220723035646.29857-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658803771;
        bh=AbX2QCLey1R/5yUdZnU56V8A2R71L0RrpAubeVRBi90=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DT38NbwI/RppGtvW8Lp5toPwEKFfMzYiE/0CBpM87K0VjEZIkPtybp5zfYOk1V76B
         sBNa3NCyy4pRHxAl1wQw79Gb4G1jYRvT8prMGoPIXVVyJTn90XjkdModSmFA/fC34I
         JvpEHgGQwYqmTX6SXTXQ/+82t0PXefftDlFRP1uGjKitAjCTnCJdf+9V+bC//9dFN8
         KCy7Aj+PxpGnaLw9LU4KOTitFL4+Wws4jlhancH7i55HOhO+L5bSwAxL9OCRpnMAlt
         HmdMy0cLPvxZX6RapoYPrsXW+oL+d7+aP3VEn2BJYsCDPW/O/VRq2Yit1qoA28Bdz/
         qpKWnJQ7xRQnw==
In-Reply-To: <20220723035646.29857-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 23 Jul 2022 11:56:46 +0800 Duoming Zhou wrote:
> Fixes: eafff86d3bd8 ("[NETROM]: Use kmemdup")

That's not a correct Fixes tag, acme just swapped kmalloc for kmemdup().
The allocate flags did not change.
