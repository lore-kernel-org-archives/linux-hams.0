From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] net/rose: remove redundant assignment to variable failed
Date: Tue, 7 Jan 2020 19:18:27 +0300
Message-ID: <20200107161827.GO3911@kadam>
References: <20200107152415.106353-1-colin.king@canonical.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=LrUamD+V8wbn5/d7X40R8tpABzP39MyqAKN7D5HtWXc=;
 b=YPAXbqoVr3cTDeqFBB4Nz6GhRhpaQiNLlaj1xNdMcLkBtF0ngywq9yRXvYToJ9bViSA3
 Esgaj70CkduG48RRyZ8pMtLe0W1Qii8EstRPyJZI81+nUqgdIFg7HvwUiIFN/rlWQTWL
 gsNlTsrEzmjCVnF35m/S36gxeU/WUdINnH3X8tobEmYliVHEEPH3flnvGYND2rIt4NqW
 jx2eHScgjPX7Lv4mW7xSe6Z6vdZR/8cxFwJ4l3vX3R29LCuRElqVmasJ+hV7VUBaSQmB
 7HZ4TlPVYtZAC1fO77g61AgMpk02MuUTWXXblHDkH8aAMxqbu2dcX+TENZLPPPKPXUT7 rQ== 
Content-Disposition: inline
In-Reply-To: <20200107152415.106353-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "David S . Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 07, 2020 at 03:24:15PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable failed is being assigned a value that is never read, the
> following goto statement jumps to the end of the function and variable
> failed is not referenced at all.  Remove the redundant assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/rose/rose_route.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index c53307623236..5277631fa14c 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -696,7 +696,6 @@ struct rose_neigh *rose_get_neigh(rose_address *addr, unsigned char *cause,
>  				for (i = 0; i < node->count; i++) {
>  					if (!rose_ftimer_running(node->neighbour[i])) {
>  						res = node->neighbour[i];
> -						failed = 0;
>  						goto out;
>  					}
>  					failed = 1;

I don't know the code, but I would have expected the out label to come
earlier:


        }
        if (!route_frame) { /* connect request */
                for (node = rose_node_list; node != NULL; node = node->next) {
                        if (rosecmpm(addr, &node->address, node->mask) == 0) {
                                for (i = 0; i < node->count; i++) {
                                        if (!rose_ftimer_running(node->neighbour[i])) {
                                                res = node->neighbour[i];
                                                failed = 0;
                                                goto out;
                                        }
                                        failed = 1;
                                }
                        }
                }
        }

<--------***********  I would have expected it to be right here.
        if (failed) {
                *cause      = ROSE_OUT_OF_ORDER;
                *diagnostic = 0;
        } else {
                *cause      = ROSE_NOT_OBTAINABLE;
                *diagnostic = 0;
        }

out:
        if (!route_frame) spin_unlock_bh(&rose_node_list_lock);
        return res;

regards,
dan carpenter

