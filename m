From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net v2] net: rose: fix UAF bug caused by
 rose_t0timer_expiry
Date: Wed, 6 Jul 2022 19:02:37 -0700
Message-ID: <20220706190237.477f24ee@kernel.org>
References: <20220705125610.77971-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657159359;
        bh=abt2fnMs2RLeFsNRDbZp4ICtDX00jnIhZbJrTMIbwro=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dfkB/ry2ouo+vFAA83fScF1vliSCTQLU9aRmNkJYJZmA01OKIGpBtccjixQeqtZZm
         q8eHDkQStzqYwREHb4NwveofynUWl3jLZubWCENVsJ9B8OQ3uLe1T1wyIph/Z/L+vF
         te/8KVbE6Jv4X6Mmoyg+RgRKYAFwdhM6AolkSRSm6WkR1quhpp2dcbqxJaDkKKwSiP
         n92v24MccNdaPjC9n4XGpFigZlWGMzvr4ljOI7UwChVJm6X7a+NOL2jo1nNPuoP6i+
         yITHWhzmH7xKFRnHrtzIKBt1VwVBkpXsq4rNJdBSgWL/H4/jH+wpYmYHtl7YOWfvd3
         qId/SQrGUtUkg==
In-Reply-To: <20220705125610.77971-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com

On Tue,  5 Jul 2022 20:56:10 +0800 Duoming Zhou wrote:
> +	del_timer_sync(&rose_neigh->t0timer);

/**
 * del_timer_sync - deactivate a timer and wait for the handler to finish.
[...]
 * Synchronization rules: Callers must prevent restarting of the timer,
 * otherwise this function is meaningless.

how is the restarting prevented? If I'm looking right 
rose_t0timer_expiry() rearms the timer.
