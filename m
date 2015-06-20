From: walter harms <wharms@bfs.de>
Subject: Re: [PATCH v3 08/18] baycom_epp: Replace rdtscl() with native_read_tsc()
Date: Sat, 20 Jun 2015 15:54:00 +0200
Message-ID: <55857078.8060504@bfs.de>
References: <cover.1434501120.git.luto@kernel.org> <1195ce0c7f34169ff3006341b77806184a46b9bf.1434501121.git.luto@kernel.org>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1195ce0c7f34169ff3006341b77806184a46b9bf.1434501121.git.luto@kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andy Lutomirski <luto@kernel.org>
Cc: x86@kernel.org, Borislav Petkov <bp@suse.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, Huang Rui <ray.huang@amd.com>, Denys Vlasenko <dvlasenk@redhat.com>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org

Acked-by: walter harms <wharms@bfs.de>

Am 17.06.2015 02:35, schrieb Andy Lutomirski:
> This is only used if BAYCOM_DEBUG is defined.
> 
> Cc: walter harms <wharms@bfs.de>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Thomas Sailer <t.sailer@alumni.ethz.ch>
> Cc: linux-hams@vger.kernel.org
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
> 
> I'm hoping for an ack for this to go through -tip.
> 
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
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
