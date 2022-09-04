From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH 1/1] [PATCH] net: rose: fix unregistered netdevice:
 waiting for rose0 to become free
Date: Mon, 5 Sep 2022 00:48:58 +0200
Message-ID: <4cb974e2-d5ba-d610-7fe8-4089256a9854@free.fr>
References: <CANn89i+FBa-KLJz5xPvk3jO3Miww4Vs+qw4nPf_9SPwiWpyTWw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CANn89i+FBa-KLJz5xPvk3jO3Miww4Vs+qw4nPf_9SPwiWpyTWw@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: edumazet@google.com
Cc: davem@davemloft.net, duoming@zju.edu.cn, f6bvp@free.fr, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org

Linux bernard-f6bvp 6.0.0-rc3-DEBUG+ #6 SMP PREEMPT_DYNAMIC Sun Sep 4 
19:40:14 CEST 2022 x86_64 x86_64 x86_64 GNU/Linux


Trying to removing rose module when it is no more in use is still impossible

# lsmod

Module                  Size  Used by

rose                   53248  -1

ax25                   65536  1 rose



#dmesg
..........
[17199.188170] NET: Unregistered PF_ROSE protocol family

[17209.327901] unregister_netdevice: waiting for rose0 to become free. 
Usage count = 17

[17209.327910] leaked reference.

[17209.327913]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.327923]  rose_route_frame+0x287/0x740 [rose]

[17209.327928]  ax25_rx_iframe.part.0+0x8a/0x340 [ax25]

[17209.327936]  ax25_rx_iframe+0x13/0x20 [ax25]

[17209.327942]  ax25_std_frame_in+0x7ae/0x810 [ax25]

[17209.327948]  ax25_rcv.constprop.0+0x5ee/0x880 [ax25]

[17209.327953]  ax25_kiss_rcv+0x6c/0x90 [ax25]

[17209.327959]  __netif_receive_skb_one_core+0x91/0xa0

[17209.327964]  __netif_receive_skb+0x15/0x60

[17209.327968]  process_backlog+0x96/0x140

[17209.327971]  __napi_poll+0x33/0x190

[17209.327974]  net_rx_action+0x19f/0x300

[17209.327977]  __do_softirq+0x103/0x366

[17209.327983] leaked reference.

[17209.327985]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.327990]  rose_loopback_timer+0xa3/0x1c0 [rose]

[17209.327995]  call_timer_fn+0x2c/0x150

[17209.328000]  __run_timers.part.0+0x1d9/0x280

[17209.328003]  run_timer_softirq+0x3f/0xa0

[17209.328007]  __do_softirq+0x103/0x366

[17209.328011] leaked reference.

[17209.328013]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.328018]  rose_route_frame+0x287/0x740 [rose]

[17209.328023]  ax25_rx_iframe.part.0+0x8a/0x340 [ax25]

[17209.328028]  ax25_rx_iframe+0x13/0x20 [ax25]

[17209.328034]  ax25_std_frame_in+0x7ae/0x810 [ax25]

[17209.328040]  ax25_rcv.constprop.0+0x5ee/0x880 [ax25]

[17209.328045]  ax25_kiss_rcv+0x6c/0x90 [ax25]

[17209.328050]  __netif_receive_skb_one_core+0x91/0xa0

[17209.328054]  __netif_receive_skb+0x15/0x60

[17209.328057]  process_backlog+0x96/0x140

[17209.328060]  __napi_poll+0x33/0x190

[17209.328063]  net_rx_action+0x19f/0x300

[17209.328067]  __do_softirq+0x103/0x366

[17209.328071] leaked reference.

[17209.328072]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.328077]  rose_loopback_timer+0xa3/0x1c0 [rose]

[17209.328082]  call_timer_fn+0x2c/0x150

[17209.328085]  __run_timers.part.0+0x1d9/0x280

[17209.328089]  run_timer_softirq+0x3f/0xa0

[17209.328092]  __do_softirq+0x103/0x366

[17209.328096] leaked reference.

[17209.328098]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.328103]  rose_loopback_timer+0xa3/0x1c0 [rose]

[17209.328107]  call_timer_fn+0x2c/0x150

[17209.328111]  __run_timers.part.0+0x1d9/0x280

[17209.328114]  run_timer_softirq+0x3f/0xa0

[17209.328117]  __do_softirq+0x103/0x366

[17209.328121] leaked reference.

[17209.328123]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.328128]  rose_route_frame+0x287/0x740 [rose]

[17209.328133]  ax25_rx_iframe.part.0+0x8a/0x340 [ax25]

[17209.328138]  ax25_rx_iframe+0x13/0x20 [ax25]

[17209.328144]  ax25_std_frame_in+0x7ae/0x810 [ax25]

[17209.328150]  ax25_rcv.constprop.0+0x5ee/0x880 [ax25]

[17209.328155]  ax25_kiss_rcv+0x6c/0x90 [ax25]

[17209.328160]  __netif_receive_skb_one_core+0x91/0xa0

[17209.328164]  __netif_receive_skb+0x15/0x60

[17209.328167]  process_backlog+0x96/0x140

[17209.328170]  __napi_poll+0x33/0x190

[17209.328173]  net_rx_action+0x19f/0x300

[17209.328176]  __do_softirq+0x103/0x366

[17209.328180] leaked reference.

[17209.328182]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.328187]  rose_loopback_timer+0xa3/0x1c0 [rose]

[17209.328192]  call_timer_fn+0x2c/0x150

[17209.328195]  __run_timers.part.0+0x1d9/0x280

[17209.328198]  run_timer_softirq+0x3f/0xa0

[17209.328202]  __do_softirq+0x103/0x366

[17209.328206] leaked reference.

[17209.328208]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.328212]  rose_loopback_timer+0xa3/0x1c0 [rose]

[17209.328217]  call_timer_fn+0x2c/0x150

[17209.328220]  __run_timers.part.0+0x1d9/0x280

[17209.328223]  run_timer_softirq+0x3f/0xa0

[17209.328227]  __do_softirq+0x103/0x366

[17209.328231] leaked reference.

[17209.328232]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.328237]  rose_loopback_timer+0xa3/0x1c0 [rose]

[17209.328242]  call_timer_fn+0x2c/0x150

[17209.328245]  __run_timers.part.0+0x1d9/0x280

[17209.328248]  run_timer_softirq+0x3f/0xa0

[17209.328252]  __do_softirq+0x103/0x366

[17209.328256] leaked reference.

[17209.328258]  rose_rx_call_request+0x334/0x7b0 [rose]

[17209.328262]  rose_loopback_timer+0xa3/0x1c0 [rose]

[17209.328267]  call_timer_fn+0x2c/0x150

[17209.328270]  __run_timers.part.0+0x1d9/0x280

[17209.328273]  run_timer_softirq+0x3f/0xa0

[17209.328277]  __do_softirq+0x103/0x366








