From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 3/3] [NETROM] zero length frame filtering in NetRom
Date: Sat, 21 Mar 2009 13:34:28 -0700 (PDT)
Message-ID: <20090321.133428.05663162.davem@davemloft.net>
References: <1237486732.30285.18.camel@f6bvp-11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1237486732.30285.18.camel@f6bvp-11>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: f6bvp@free.fr
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

From: bernard pidoux <f6bvp@free.fr>
Date: Thu, 19 Mar 2009 19:18:52 +0100

> A zero length frame filter was recently introduced in ROSE protocole.
> Previous commit makes the same at AX25 protocole level.
> This patch has the same purpose for NetRom  protocole.
> The reason is that empty frames have no meaning in NetRom protocole.
> 
> Signed-off-by: Bernard Pidoux <f6bvp@amsat.org>

Applied.
