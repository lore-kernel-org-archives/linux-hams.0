From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Subject: Re: [PATCH v3 08/18] baycom_epp: Replace rdtscl() with native_read_tsc()
Date: Wed, 17 Jun 2015 02:49:29 +0200
Message-ID: <5580C419.8090402@alumni.ethz.ch>
References: <cover.1434501120.git.luto@kernel.org> <1195ce0c7f34169ff3006341b77806184a46b9bf.1434501121.git.luto@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1195ce0c7f34169ff3006341b77806184a46b9bf.1434501121.git.luto@kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andy Lutomirski <luto@kernel.org>, x86@kernel.org
Cc: Borislav Petkov <bp@suse.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, Huang Rui <ray.huang@amd.com>, Denys Vlasenko <dvlasenk@redhat.com>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, walter harms <wharms@bfs.de>, linux-hams@vger.kernel.org

Acked-by: Thomas Sailer <t.sailer@alumni.ethz.ch>

On 06/17/2015 02:35 AM, Andy Lutomirski wrote:
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
>   drivers/net/hamradio/baycom_epp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
> index 83c7cce0d172..44e5c3b5e0af 100644
> --- a/drivers/net/hamradio/baycom_epp.c
> +++ b/drivers/net/hamradio/baycom_epp.c
> @@ -638,7 +638,7 @@ static int receive(struct net_device *dev, int cnt)
>   #define GETTICK(x)                                                \
>   ({                                                                \
>   	if (cpu_has_tsc)                                          \
> -		rdtscl(x);                                        \
> +		x = (unsigned int)native_read_tsc();		  \
>   })
>   #else /* __i386__ */
>   #define GETTICK(x)

