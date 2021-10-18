From: patchwork-bot+netdevbpf@kernel.org
Subject: Re: [PATCH net] hamradio: baycom_epp: fix build for UML
Date: Mon, 18 Oct 2021 12:00:06 +0000
Message-ID: <163455840685.2577.7817040614905305666.git-patchwork-notify@kernel.org>
References: <20211015021804.17005-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634558406;
        bh=gtGtOrvrLSJKUmHl3YuUlIXzUghrjnKyvXs2fn+o7HA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ndZeUT8EOqUS0YeJAgul/hD1fu0qI++QfZTFp7BCXRu8g7cbR6k/oA6xh3Y4zBjxJ
         wmPoS92WkEoYqVSgIm+MGZwdVBu2XsbDAzpA6cmCdUiI+kzI7TsO89Hx7kqf3C8SL4
         0VvOlVZWhpiD39AVIb2gPD43fdbIT/lU0NTcmGz7CPFc71n5sL4w9LUfLStAGR/tJb
         OPIJ5pfahjKvaPRc40gQt9JaFtBorJHBGI0KwF3WWE0dX+ISGFGZ5vlVd4ByKMRC5U
         CXvdaBymBVMFQteRpl6KnIzBHNwlsr85MF7rGHT4wgx6AS1qZ5fvGOROV0+iGjhmZ6
         DJ5zUUEoV1VSA==
In-Reply-To: <20211015021804.17005-1-rdunlap@infradead.org>
List-ID: <linux-hams.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org, jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, davem@davemloft.net, kuba@kernel.org, t.sailer@alumni.ethz.ch, linux-hams@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 14 Oct 2021 19:18:04 -0700 you wrote:
> On i386, the baycom_epp driver wants to inspect X86 CPU features (TSC)
> and then act on that data, but that info is not available when running
> on UML, so prevent that test and do the default action.
> 
> Prevents this build error on UML + i386:
> 
> ../drivers/net/hamradio/baycom_epp.c: In function ‘epp_bh’:
> ../drivers/net/hamradio/baycom_epp.c:630:6: error: implicit declaration of function ‘boot_cpu_has’; did you mean ‘get_cpu_mask’? [-Werror=implicit-function-declaration]
>   if (boot_cpu_has(X86_FEATURE_TSC))   \
>       ^
> ../drivers/net/hamradio/baycom_epp.c:658:2: note: in expansion of macro ‘GETTICK’
>   GETTICK(time1);
> 
> [...]

Here is the summary with links:
  - [net] hamradio: baycom_epp: fix build for UML
    https://git.kernel.org/netdev/net/c/0a9bb11a5e29

You are awesome, thank you!
