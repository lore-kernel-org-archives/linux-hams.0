From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH] ttyutils.c: Correct suspected typo in speed_struct
Date: Sat, 31 Dec 2022 14:19:53 +0100
Message-ID: <Y7A2+f7dz/J2pbmz@x-berg.in-berlin.de>
References: <20221229181420.998996-1-n0nb@n0nb.us>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20221229181420.998996-1-n0nb@n0nb.us>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nate Bargmann <n0nb@n0nb.us>
Cc: Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

Thank you Nate.
Sorry for the misktake.

I'll fix this asap.

vy 73,
	- Thomas  dl9sau

On Thu, Dec 29, 2022 at 12:14:20PM -0600, Nate Bargmann wrote:
> Looking over recent commits I noticed what looks to be a typo where
> user_speed did not match termios_speed for the B3500000 declaration.
> 
> Signed-off-by: Nate Bargmann <n0nb@n0nb.us>
> ---
>  ttyutils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/ttyutils.c b/ttyutils.c
> index 6ffd2fb..6bd6b56 100644
> --- a/ttyutils.c
> +++ b/ttyutils.c
> @@ -61,7 +61,7 @@ static struct speed_struct {
>  	{3000000,	B3000000},
>  #endif
>  #ifdef  B3500000
> -	{1000000,	B3500000},
> +	{3500000,	B3500000},
>  #endif
>  #ifdef  B4000000
>  	{4000000,	B4000000},
> -- 
> 2.34.1
> 
> 
