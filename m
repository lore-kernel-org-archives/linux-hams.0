From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 8 Oct 2007 18:41:06 +1000
Message-ID: <20071008084106.GC24782@cloud.net.au>
References: <47093A4E.5040409@hamradio.hr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47093A4E.5040409@hamradio.hr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Oct 07, 2007 at 09:58:06PM +0200, Tihomir Heidelberg - 9a4gl wrote:
> Hi ax25 developers,
> 
> Using kernel 2.6.21.6 here. If you write to AX.25 socket bytes more then
> MTU, write will return -1 and errno will be set to 90 (EMSGSIZE =
> [Message too long]).
> 
> This happend in net/ax25/af_ax25.c in function ax25_sendmsg at:
> 
>         if (len > ax25->ax25_dev->dev->mtu) {
>                 err = -EMSGSIZE;
>                 goto out;
>         }

The change seems to be requested here:
http://oss.sgi.com/archives/netdev/2004-01/msg00097.html

with the rationale that there is no fragmentation logic, as I suggested
in my other followup (which hasn't arrived back here yet...)


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
