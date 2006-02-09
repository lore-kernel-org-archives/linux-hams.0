From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: ROSE lockup fix
Date: Thu, 09 Feb 2006 17:25:12 +0100
Message-ID: <43EB6CE8.8030302@ccr.jussieu.fr>
References: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com> <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net> <20060113210925.GB3516@linux-mips.org> <43CD2275.8050602@ccr.jussieu.fr> <20060118010843.GA3312@linux-mips.org> <20060118083816.GA7510@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060118083816.GA7510@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Hi Ralf,

I applied your rose patch to the more recent kernel 2.6.15.2 and it 
seems to work fine as there are no more spinlock recursion related to 
rose when killall during reboot process.

However I observed a new problem only once.

Here is the screen dump copied from a digital photo
(I did not copy the <numbers> but only symbolic names) :

Sending all processes the TERM signal...
BUG: spinlock bad magic on CPU#0, ax25ipd/4703
  lock: ea6b4318, .magic: 00000000, .owner: <none>/-1, .owner_cpu:0
dump_stack
spin_bug
_raw_spin_lock
_spin_lock_irqsave
__wake_up
sock_def_write_space
sock_wfree
__kfree_skb
skb_queue_purge
ax25_clear_queues   [ax25]
ax25_disconnect     [ax25]
ax25_kill_by_device [ax25]
ax25_device_event   [ax25]
notifier_call_chain
dev_close
unregister_netdevice
unregister_netdev
mkiss_close         [mkiss]
release_dev
tty_release
__fput
fput
filp_close
put_files_struct
do_exit
do_group_exit
sys_exit_group
sysenter_past_esp

---------------------------

Ralf Baechle DL5RB wrote :
> On Wed, Jan 18, 2006 at 01:08:43AM +0000, Ralf Baechle DL5RB wrote:
> 
> 
>>Anyway, the problem is pretty obvious in your traceback and I'll cook a
>>patch for you to test.
> 
> 
> Can you test the patch below?
> 
>   Ralf
> 
>  net/rose/rose_route.c |    7 -------
>  1 files changed, 7 deletions(-)
> 
> Index: linux-mips/net/rose/rose_route.c
> ===================================================================
> --- linux-mips.orig/net/rose/rose_route.c
> +++ linux-mips/net/rose/rose_route.c
> @@ -48,8 +48,6 @@ static DEFINE_SPINLOCK(rose_route_list_l
>  
>  struct rose_neigh *rose_loopback_neigh;
>  
> -static void rose_remove_neigh(struct rose_neigh *);
> -
>  /*
>   *	Add a new route to a node, and in the process add the node and the
>   *	neighbour if it is new.
> @@ -235,11 +233,8 @@ static void rose_remove_neigh(struct ros
>  
>  	skb_queue_purge(&rose_neigh->queue);
>  
> -	spin_lock_bh(&rose_neigh_list_lock);
> -
>  	if ((s = rose_neigh_list) == rose_neigh) {
>  		rose_neigh_list = rose_neigh->next;
> -		spin_unlock_bh(&rose_neigh_list_lock);
>  		kfree(rose_neigh->digipeat);
>  		kfree(rose_neigh);
>  		return;
> @@ -248,7 +243,6 @@ static void rose_remove_neigh(struct ros
>  	while (s != NULL && s->next != NULL) {
>  		if (s->next == rose_neigh) {
>  			s->next = rose_neigh->next;
> -			spin_unlock_bh(&rose_neigh_list_lock);
>  			kfree(rose_neigh->digipeat);
>  			kfree(rose_neigh);
>  			return;
> @@ -256,7 +250,6 @@ static void rose_remove_neigh(struct ros
>  
>  		s = s->next;
>  	}
> -	spin_unlock_bh(&rose_neigh_list_lock);
>  }
>  
>  /*
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 

73 de Bernard, f6bvp

http://f6bvp.free.fr
http://f6bvp.org (mirror)
http://rose.fpac.free.fr/
