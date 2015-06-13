From: walter harms <wharms@bfs.de>
Subject: Re: [PATCH v2 08/17] baycom_epp: Replace rdtscl() with native_read_tsc()
Date: Sat, 13 Jun 2015 12:45:04 +0200
Message-ID: <557C09B0.3020301@bfs.de>
References: <cover.1434152603.git.luto@kernel.org> <1195ce0c7f34169ff3006341b77806184a46b9bf.1434152603.git.luto@kernel.org>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1195ce0c7f34169ff3006341b77806184a46b9bf.1434152603.git.luto@kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy Lutomirski <luto@kernel.org>
Cc: x86@kernel.org, Borislav Petkov <bp@suse.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, Huang Rui <ray.huang@amd.com>, Denys Vlasenko <dvlasenk@redhat.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org

Hello,
please add a line what is the difference between V1 and V2.

re,
 wh

Am 13.06.2015 01:44, schrieb Andy Lutomirski:
> This is only used if BAYCOM_DEBUG is defined.
> 
> Cc: Thomas Sailer <t.sailer@alumni.ethz.ch>
> Cc: linux-hams@vger.kernel.org
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  drivers/net/hamradio/baycom_epp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
> index 83c7cce0d172..44e5c3b5e0af 100644
> --- a/drivers/net/hamradio/baycom_epp.c
> +++ b/drivers/net/hamradio/baycom_epp.c
> @@ -638,7 +638,7 @@ static int receive(struct net_device *dev, int cnt)
>  #define GETTICK(x)                                                \
>  ({                                                                \
>  	if (cpu_has_tsc)                                          \
> -		rdtscl(x);                                        \
> +		x = (unsigned int)native_read_tsc();		  \
>  })
>  #else /* __i386__ */
>  #define GETTICK(x)
