From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] [NET] AX.25 Kconfig: Replace HTTP links with HTTPS ones
Date: Mon, 13 Jul 2020 12:34:40 -0700 (PDT)
Message-ID: <20200713.123440.967731339648249346.davem@davemloft.net>
References: <20200713090251.32640-1-grandmaster@al2klimov.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200713090251.32640-1-grandmaster@al2klimov.de>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: grandmaster@al2klimov.de
Cc: ralf@linux-mips.org, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Date: Mon, 13 Jul 2020 11:02:51 +0200

> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Applied.
