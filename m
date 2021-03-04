From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 105/141] net: ax25: Fix fall-through warnings for Clang
Date: Thu, 4 Mar 2021 16:54:47 -0600
Message-ID: <20210304225447.GE105908@embeddedor>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <37c8748f80572a08f33e4ce354f93d61ddfd175b.1605896060.git.gustavoars@kernel.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614898490;
        bh=BsH7Rv59ABNnewO3nCz5tB4conpCHIF+Oo1vQDLbjus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LgkOVyNP190SEF80ubQ1nnUovhU3UiNfn51EtugNSZp9c3WgSfEvNQozTHXwD3Fsd
         dwhIkmEeZ0lXpyKN/pjouV+Gu+O17KSnAekbT1D5l6uxv/SEq24AlBjBAujAPYzYrK
         V7YEj96GoOxPv/IjBnvbQy6xIlaPFd76BYyZUhw0xjc+Hpd2xqHPGCWRDCTl07dthf
         dnXYXxumfNRBXVaNrdymrbzq92MI6XVaEJemJxlwrJ7+BxGTUiD22L3JKZZRN3xrbj
         aC+ECblCZEgwIdJc1zW2hgq10qWxE8asmD+HfOmlqaXFiys7ekszpJ1Abj2IWaXvJV
         Tqk1pofAnqUAw==
Content-Disposition: inline
In-Reply-To: <37c8748f80572a08f33e4ce354f93d61ddfd175b.1605896060.git.gustavoars@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org

Hi all,

It's been more than 3 months; who can take this, please? :)

Thanks
--
Gustavo

On Fri, Nov 20, 2020 at 12:37:53PM -0600, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  net/ax25/af_ax25.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> index 269ee89d2c2b..2631efc6e359 100644
> --- a/net/ax25/af_ax25.c
> +++ b/net/ax25/af_ax25.c
> @@ -850,6 +850,7 @@ static int ax25_create(struct net *net, struct socket *sock, int protocol,
>  		case AX25_P_ROSE:
>  			if (ax25_protocol_is_registered(AX25_P_ROSE))
>  				return -ESOCKTNOSUPPORT;
> +			break;
>  #endif
>  		default:
>  			break;
> -- 
> 2.27.0
> 
